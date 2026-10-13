#!/usr/bin/env python3
"""Run the original APX fig-Forth compiler on a 6502 to build ATRs.

Only Atari OS CIO and SIO calls are emulated. The original Forth dictionary
parses every ASCII line and executes the metacompiler from src/. No host
Forth parser, target assembler, or binary-copy shortcut is used.
Standalone INCBIN directives first expand to ASCII BYTES source; APX then
parses and emits each native asset byte through the same metacompiler.
"""

from __future__ import annotations

import argparse
import collections
import json
import struct
import sys
import time
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference

try:
    from py65.devices.mpu6502 import MPU
except ImportError as exc:
    raise SystemExit("py65 is required: python3 -m pip install py65") from exc

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT.parent / "util"))
from forth_assets import AssetError, source_lines


class CompileError(RuntimeError):
    pass


class SourceFinished(Exception):
    pass


def atr(payload: bytes, template_header: bytes | None = None) -> bytes:
    if len(payload) % 128:
        raise CompileError("output length is not a multiple of 128 bytes")
    paragraphs = len(payload) // 16
    header = bytearray(template_header if template_header is not None else bytes(16))
    if len(header) != 16:
        raise CompileError("ATR header must contain exactly 16 bytes")
    struct.pack_into("<HHH", header, 0, 0x0296, paragraphs & 0xFFFF, 128)
    header[6] = (paragraphs >> 16) & 0xFF
    return bytes(header) + payload


class ForthMachine:
    def __init__(
        self,
        reference: Path,
        lines: list[tuple[str, int, str]],
        max_steps: int = 2_000_000_000,
        progress: bool = False,
    ):
        self.cpu = MPU()
        self.mem = self.cpu.memory
        raw = read_reference(reference)
        if raw[:2] != b"\x96\x02" or raw[4:6] != b"\x80\x00":
            raise CompileError("reference must be a 128-byte-sector ATR")
        payload = raw[16:]
        base = int.from_bytes(payload[2:4], "little")
        count = payload[1]
        if base != 0x0E80 or payload[4:6] != b"\xeb\x1e":
            raise CompileError("expected APX Extended fig-Forth 1.1 disk")
        self.mem[base : base + count * 128] = payload[: count * 128]
        self.input_disks = {1: payload}
        self.disk_headers: dict[int, bytes] = {1: raw[:16]}
        self.output_disks: dict[int, bytearray] = {}
        self.lines = collections.deque(lines)
        self.total_lines = len(lines)
        self.progress = progress
        self.next_progress = 50_000_000
        self.current = ("<boot>", 0, "")
        self.output = bytearray()
        self.max_steps = max_steps
        self.steps = 0
        self.lines_read = 0
        self.write_count = 0
        self.cpu.pc = 0x1EF5  # COLD: unmodified code from the reference disk.
        self.cpu.sp = 0xFF
        self.put16(0x02E5, 0xBC20)  # OS MEMTOP, as on a 48K Atari.
        self.mem[0x53] = 40  # editor right margin, used by EXPECT.
        self.mem[0x02FC] = 0xFF  # CH: no unsolicited keyboard key.
        self.mem[0x0300] = 0x31
        self.mem[0x0306] = 7
        self.put16(0x0308, 128)

    def get16(self, addr: int) -> int:
        return self.mem[addr] | self.mem[addr + 1] << 8

    def put16(self, addr: int, value: int) -> None:
        self.mem[addr] = value & 0xFF
        self.mem[addr + 1] = (value >> 8) & 0xFF

    def mount_disk(self, drive: int, path: Path) -> None:
        raw = path.read_bytes()
        if raw[:2] != b"\x96\x02" or raw[4:6] != b"\x80\x00":
            raise CompileError(f"D{drive} template must be a 128-byte-sector ATR")
        if (len(raw) - 16) % 128:
            raise CompileError(f"D{drive} template has a partial sector")
        self.input_disks[drive] = raw[16:]
        self.disk_headers[drive] = raw[:16]

    def host_word(self, name: str) -> tuple[int, int] | None:
        """Locate a host definition without interpreting or modifying it."""
        user = self.get16(0xCF)
        # CURRENT is an APX USER word; its PFA contains the user-area offset.
        nfa = self.get16(self.get16(user + self.mem[0x15C2]))
        seen = set()
        while nfa and nfa not in seen:
            seen.add(nfa)
            end = nfa + 1
            while end < min(nfa + 34, 0xFFFF) and self.mem[end] < 128:
                end += 1
            if end >= min(nfa + 34, 0xFFFF):
                raise CompileError("corrupt host dictionary name")
            actual = bytes(b & 127 for b in self.mem[nfa + 1 : end + 1]).rstrip(b" ")
            if actual == name.encode("ascii"):
                return self.get16(end + 3), end + 5
            nfa = self.get16(end + 1)
        return None

    def rts(self) -> None:
        self.cpu.sp = (self.cpu.sp + 1) & 0xFF
        low = self.mem[0x100 + self.cpu.sp]
        self.cpu.sp = (self.cpu.sp + 1) & 0xFF
        high = self.mem[0x100 + self.cpu.sp]
        self.cpu.pc = ((low | high << 8) + 1) & 0xFFFF

    def success(self) -> None:
        self.cpu.y = 1
        self.cpu.p &= ~0x80

    def cio(self) -> None:
        iocb = 0x0340 + self.cpu.x
        cmd = self.mem[iocb + 2]
        addr = self.get16(iocb + 4)
        size = self.get16(iocb + 8)
        if cmd == 3 or cmd == 12:  # OPEN / CLOSE
            pass
        elif cmd == 5:  # GET RECORD: source line via the stock EXPECT word.
            if not self.lines:
                raise SourceFinished
            self.current = self.lines.popleft()
            self.lines_read += 1
            if self.progress and self.lines_read % 500 == 0:
                self.show_progress()
            data = self.current[2].encode("ascii") + b"\x9b"
            if len(data) > size:
                raise CompileError(f"source line exceeds APX input limit {size - 1}")
            self.mem[addr : addr + len(data)] = data
            self.put16(iocb + 8, len(data))
        elif cmd in (9, 11):  # PUT RECORD / PUT CHARACTERS
            data = bytes(self.mem[addr : addr + size]) if size else bytes([self.cpu.a])
            self.output.extend(data)
        elif cmd == 7:
            raise CompileError("unexpected interactive KEY request")
        else:
            raise CompileError(f"unsupported CIO command ${cmd:02x}")
        self.mem[iocb + 3] = 1
        self.success()
        self.rts()

    def sio(self) -> None:
        drive = self.mem[0x0301]
        cmd = self.mem[0x0302]
        addr = self.get16(0x0304)
        size = self.get16(0x0308)
        sector = self.get16(0x030A)
        if not 1 <= sector <= 65535 or size != 128:
            raise CompileError(
                f"unsupported SIO transfer: sector={sector}, size={size}"
            )
        offset = (sector - 1) * 128
        if cmd == ord("R"):
            disk = self.output_disks.get(drive, self.input_disks.get(drive))
            if disk is None or offset + size > len(disk):
                raise CompileError(
                    f"read outside mounted disk D{drive}: sector {sector}"
                )
            self.mem[addr : addr + size] = disk[offset : offset + size]
        elif cmd in (ord("W"), ord("P")):
            if drive not in (3, 4):
                raise CompileError(f"refusing output write to D{drive}:")
            if drive not in self.output_disks:
                self.output_disks[drive] = bytearray(self.input_disks.get(drive, b""))
            disk = self.output_disks[drive]
            if offset + size > len(disk):
                disk.extend(b"\0" * (offset + size - len(disk)))
            disk[offset : offset + size] = bytes(self.mem[addr : addr + size])
            self.write_count += 1
        else:
            raise CompileError(f"unsupported SIO command ${cmd:02x}")
        self.mem[0x0303] = 1
        self.success()
        self.rts()

    def show_progress(self) -> None:
        filename, lineno, _ = self.current
        print(
            f"APX: {self.lines_read}/{self.total_lines} lines, "
            f"{self.steps:,} instructions, {self.write_count} sectors; "
            f"{Path(filename).name}:{lineno}",
            file=sys.stderr,
            flush=True,
        )

    def run(self) -> dict:
        started = time.monotonic()
        try:
            while self.steps < self.max_steps:
                pc = self.cpu.pc
                if pc == 0xE456:
                    self.cio()
                elif pc in (0xE453, 0xE459):
                    self.sio()
                elif pc == 0x1441 and self.get16(0xCD) in (0x1C4F, 0x1EC4):
                    raise CompileError("Forth ERROR or ABORT")
                elif self.mem[pc] == 0:
                    raise CompileError(f"unexpected BRK at ${pc:04x}")
                else:
                    self.cpu.step()
                self.steps += 1
                if self.progress and self.steps >= self.next_progress:
                    self.show_progress()
                    self.next_progress += 50_000_000
            raise CompileError(f"6502 instruction limit ({self.max_steps}) reached")
        except SourceFinished:
            # QUERY is reached only after the original INTERPRET consumed a line.
            # EXPECT has already pushed its address and length, so compare S0-4.
            expected_x = (self.get16(0x0F12) - 4) & 0xFF
            user = self.get16(0xCF)
            if self.get16(user + self.mem[0x15CD]):
                raise CompileError(
                    "source ended inside an unfinished Forth definition (STATE is nonzero)"
                )
            if self.cpu.x != 0x20:
                raise CompileError("source ended outside EXPECT")
            saved_x = self.mem[0xC4]
            if saved_x != expected_x:
                raise CompileError(
                    f"unbalanced Forth stack: X=${saved_x:02x}, expected ${expected_x:02x}"
                )
            if self.get16(0x0F10) != self.get16(0xCF):
                raise CompileError("Forth user-area pointer was corrupted")
            position = self.host_word("T-POS")
            if (
                position is not None
                and position[0] == 0x1499
                and self.get16(position[1])
            ):
                raise CompileError(
                    "target output has an unfinished sector; call T-FINISH"
                )
        except CompileError as exc:
            filename, lineno, line = self.current
            transcript = self.output.decode("ascii", errors="replace").replace(
                "\ufffd", "\\x9b"
            )[-600:]
            raise CompileError(
                f"{exc}\n{filename}:{lineno}: {line}\nForth output: {transcript}"
            ) from exc
        return {
            "source_lines": self.lines_read,
            "instructions": self.steps,
            "sector_writes": self.write_count,
            "seconds": round(time.monotonic() - started, 3),
            "output_bytes": {str(k): len(v) for k, v in self.output_disks.items()},
        }


def read_sources(paths: list[Path], game_root: Path | None = None) -> list[tuple[str, int, str]]:
    lines = []
    game_root = ROOT if game_root is None else game_root
    for path in paths:
        for filename, no, line in source_lines(path, game_root):
            if len(line) > 79:
                raise CompileError(f"{path}:{no}: line longer than 79 characters")
            if line.strip():
                lines.append((filename, no, line))
    return lines


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("sources", type=Path, nargs="*")
    parser.add_argument(
        "--reference", type=Path, default=ROOT / "reference/figforth.atr"
    )
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--output-dir", type=Path, default=ROOT / "build")
    parser.add_argument(
        "--disk3-template",
        type=Path,
        help="mount existing game disk/asset sectors as D3:",
    )
    parser.add_argument("--max-steps", type=int, default=2_000_000_000)
    parser.add_argument(
        "--progress",
        action="store_true",
        help="report progress to stderr every 500 lines / 50M instructions",
    )
    args = parser.parse_args()
    paths = args.sources
    if args.manifest:
        manifest = json.loads(args.manifest.read_text())
        paths += [args.manifest.parent / p for p in manifest["sources"]]
    if not paths:
        parser.error("provide ASCII Forth source paths or --manifest")
    try:
        lines = read_sources(paths, args.manifest.parent if args.manifest else ROOT)
        machine = ForthMachine(args.reference, lines, args.max_steps, args.progress)
        if args.disk3_template:
            machine.mount_disk(3, args.disk3_template)
        report = machine.run()
        args.output_dir.mkdir(parents=True, exist_ok=True)
        for drive, payload in sorted(machine.output_disks.items()):
            path = args.output_dir / f"wladcy-ciemnosci.atr"
            path.write_bytes(atr(bytes(payload), machine.disk_headers.get(drive)))
        (args.output_dir / "compile-report.json").write_text(
            json.dumps(report, indent=2) + "\n"
        )
        print(json.dumps(report, indent=2))
    except (CompileError, AssetError, UnicodeError) as exc:
        raise SystemExit(str(exc)) from exc


if __name__ == "__main__":
    main()
