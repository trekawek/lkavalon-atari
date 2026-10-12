#!/usr/bin/env python3
"""Verify Wladcy's extracted CMC against its original 6502 player.

The fixture reconstructs the two resource copies in game order from the ATR.
It does not use the extractor or an emulator RAM snapshot. Zero-initialized
RAM reproduces the one-byte gap before the title header; that zero was also
observed independently in real Atari title and first-room memory captures.

Install py65 to run this optional playback regression.
"""

from pathlib import Path
import unittest

try:
    from py65.devices.mpu6502 import MPU
except ImportError:
    MPU = None


ROOT = Path(__file__).resolve().parents[1]
GAME = ROOT / "wladcy-ciemnosci"
TAIL_START, TAIL_END = 0x8CB2, 0x8CB8


class TracedMemory(list):
    """Record only player reads of the restored tail and POKEY writes."""

    def __init__(self, data):
        super().__init__(data)
        self.tail_reads = []
        self.pokey_writes = []
        self.frame = -1
        self.pc = 0

    def __getitem__(self, address):
        value = super().__getitem__(address)
        if isinstance(address, int) and TAIL_START <= address < TAIL_END:
            self.tail_reads.append((self.frame, self.pc, address, value))
        return value

    def __setitem__(self, address, value):
        super().__setitem__(address, value)
        if isinstance(address, int) and 0xD200 <= address <= 0xD208:
            self.pokey_writes.append((self.frame, address, value))


def dictionary_ram(atr):
    ram = bytearray(65536)
    ram[0x0E80:0x8B80] = atr[16:0x7D10]
    return ram


def copy_resource(ram, atr, file_offset, destination):
    length = int.from_bytes(atr[file_offset - 2 : file_offset], "little")
    ram[destination : destination + length] = atr[file_offset : file_offset + length]


def playback(ram):
    memory = TracedMemory(ram)
    cpu = MPU(memory=memory)

    def call(address, accumulator=0, x=0, y=0):
        cpu.sp = 0xFF
        cpu.a, cpu.x, cpu.y = accumulator, x, y
        cpu.stPushWord(0xEFFF)
        cpu.pc = address
        for _ in range(100000):
            if cpu.pc == 0xF000:
                return
            memory.pc = cpu.pc
            cpu.step()
        raise AssertionError(f"Original music player did not return: ${cpu.pc:04X}")

    call(0x3003, 0x70, 0x4D, 0x85)  # Initialize module at $854D.
    call(0x3003, 0, 1)  # Ending sequence, zero-based subsong 1.
    for frame in range(1000):
        memory.frame = frame
        call(0x3006)
    return memory


@unittest.skipIf(MPU is None, "Optional playback regression requires py65")
class CmcPlaybackTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        atr = (GAME / "reference/wladcy-ciemnosci.atr").read_bytes()
        if len(atr) != 133136:
            raise AssertionError("Unexpected Wladcy v1 ATR geometry")
        original = dictionary_ram(atr)
        copy_resource(original, atr, 0xDB70, 0x8CB3)  # Title is loaded first.
        copy_resource(original, atr, 0xD403, 0x8547)  # Gameplay replaces its buffer.
        cls.original_tail = bytes(original[TAIL_START:TAIL_END])

        module = (GAME / "music/gameplay.cmc").read_bytes()
        if module[:6] != bytes.fromhex("FFFF4D85B78C") or len(module) != 1905:
            raise AssertionError("Unexpected exported gameplay CMC segment")
        exported = dictionary_ram(atr)
        exported[0x854D:0x8CB8] = module[6:]

        missing_tail = bytearray(original)
        missing_tail[TAIL_START:TAIL_END] = bytes(TAIL_END - TAIL_START)
        cls.original_trace = playback(original)
        cls.exported_trace = playback(exported)
        cls.missing_trace = playback(missing_tail)

    def test_export_preserves_original_pokey_trace(self):
        self.assertGreater(len(self.original_trace.pokey_writes), 1000)
        self.assertEqual(
            self.original_trace.pokey_writes, self.exported_trace.pokey_writes
        )

    def test_original_player_consumes_restored_terminator(self):
        self.assertEqual(self.original_tail, bytes.fromhex("00FFFFB98CA8"))
        reads = self.original_trace.tail_reads
        self.assertTrue(reads, "The ending must exercise the resource boundary")
        self.assertEqual(
            {(a, value) for _, _, a, value in reads}, {(0x8CB2, 0), (0x8CB3, 0xFF)}
        )
        self.assertEqual(reads, self.exported_trace.tail_reads)

    def test_omitting_tail_changes_music(self):
        original = self.original_trace.pokey_writes
        shortened = self.missing_trace.pokey_writes
        self.assertNotEqual(original, shortened)
        differences = [(a, b) for a, b in zip(original, shortened) if a != b]
        self.assertTrue(differences)
        first_difference_frame = differences[0][0][0]
        first_tail_read_frame = self.original_trace.tail_reads[0][0]
        self.assertGreaterEqual(first_difference_frame, first_tail_read_frame)


if __name__ == "__main__":
    unittest.main()
