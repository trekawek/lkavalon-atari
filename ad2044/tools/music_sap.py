#!/usr/bin/env python3
"""Extract AD2044's original custom sound engine and wrap it for SAP players.

This game does not use the CMC player found in the later games. The saved
Forth variable at CFA $5DB3 contains a command-stream player, instruments,
music and effects. The engine's public base is $5E00 and its containing
definition ends at $6C2F. All bytes come from side one's contiguous boot image.

``extract(atr)`` returns output files and JSON-compatible provenance metadata.
The raw bank is unchanged. SAP copies change only the old-OS VBI tail jump
at $62E1 into RTS and add an independent initialization stub at $5000.
"""

import argparse
import json
import sys
from pathlib import Path

GAME = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(GAME.parent / "util"))
from reference_media import read_reference

LOAD_ADDRESS = 0x5E00
END_ADDRESS = 0x6C2F  # Exclusive: next saved Forth dictionary header.
FILE_START = LOAD_ADDRESS - 0x0E80 + 16
FILE_END = END_ADDRESS - 0x0E80 + 16
INITIALIZER = 0x5000
COMMAND_TABLE = 0x5020
PLAYER = 0x5F6F
VBI_TAIL = 0x62E1
DISPATCH = 0x6698
COMMANDS = (
    (0x01, 0x6717),
    (0x02, 0x6734),
    (0x07, 0x6751),
    (0x08, 0x676B),
    (0x0A, 0x6786),
    (0x0B, 0x67C7),
    (0x0C, 0x67A6),
    (0x0E, 0x6734),
    (0x0F, 0x67FA),
    (0x10, 0x6717),
    (0x13, 0x6845),
    (0x14, 0x6859),
    (0x15, 0x6872),
    (0x16, 0x688C),
    (0x19, 0x6935),
    (0x1C, 0x68A0),
    (0x1F, 0x68B4),
    (0x20, 0x68CF),
    (0x21, 0x68EA),
    (0x23, 0x690E),
    (0x28, 0x67E2),
    (0x50, 0x69CC),
)


def _segment(address, data):
    return (
        address.to_bytes(2, "little")
        + (address + len(data) - 1).to_bytes(2, "little")
        + data
    )


def _initializer(commands):
    # SAP TYPE B supplies a zero-based song index in A. Preserve it across
    # the original reset at $652F, which changes A, X, and Y. Reset the
    # self-modifying stream pointer at $6035/$6036 to the command dispatcher,
    # select the command only after reset, and clear the sound-stop flag.
    # $6552, the original OS VBI installer and busy wait, is unnecessary here.
    code = bytes.fromhex(
        "48"  # PHA
        "A9988D3560"  # LDA #<$6698 / STA $6035
        "A9668D3660"  # LDA #>$6698 / STA $6036
        "202F65"  # JSR $652F
        "68AA"  # PLA / TAX
        "BD2050"  # LDA $5020,X
        "8D275E"  # STA $5E27, original sound command
        "A9008D1E5E"  # LDA #0 / STA $5E1E, resume sound
        "60"  # RTS
    )
    return code + bytes(COMMAND_TABLE - INITIALIZER - len(code)) + bytes(commands)


def _sap(bank, commands, title):
    copy = bytearray(bank)
    copy[VBI_TAIL - LOAD_ADDRESS] = 0x60
    # The original player itself writes SKCTL=$03 and AUDCTL=$00 each tick
    # at $6293. No POKEY setup from Atari OS or game code is required.
    header = [
        "SAP",
        'AUTHOR "Leszek Holda"',
        f'NAME "{title}"',
        'DATE "1991"',
        "TYPE B",
    ]
    if len(commands) > 1:
        header.append(f"SONGS {len(commands)}")
    header += [f"INIT {INITIALIZER:04X}", f"PLAYER {PLAYER:04X}"]
    return (
        ("\r\n".join(header) + "\r\n").encode("ascii")
        + b"\xff\xff"
        + _segment(INITIALIZER, _initializer(commands))
        + _segment(LOAD_ADDRESS, bytes(copy))
    )


def extract(atr):
    """Return ``(files, metadata)`` from the supplied original side-one ATR.

    Addresses and instruction checks intentionally select the known version.
    A mismatching disk fails rather than producing a misleading music file.
    ``sound-effects.sap`` has twenty subsongs in the metadata's listed order.
    The two music commands are separate SAPs; their raw bytes remain in the
    shared unchanged ``sound-bank.bin`` along with every sound-effect command.
    """
    if len(atr) != 133136 or atr[:6] != bytes.fromhex("960280208000"):
        raise ValueError("Expected AD2044 side one, 1040 sectors of 128 bytes")
    bank = bytes(atr[FILE_START:FILE_END])

    def require(address, expected, description):
        offset = address - LOAD_ADDRESS
        if bank[offset : offset + len(expected)] != expected:
            raise ValueError(f"Unexpected {description} at ${address:04X}")

    require(
        0x5E09,
        bytes.fromhex("A9988D3560A9668D3660202F654C5265"),
        "original sound initializer",
    )
    require(PLAYER, bytes.fromhex("AD1E5EF0034CE162"), "sound frame entry")
    require(VBI_TAIL, bytes.fromhex("4C8AC2"), "old-OS VBI chain")
    for index, (command, target) in enumerate(COMMANDS):
        require(
            0x66A5 + 5 * index,
            bytes((0x21, 0, command)) + target.to_bytes(2, "little"),
            "sound command dispatch",
        )
    require(0x6713, bytes.fromhex("109866"), "command dispatcher loop")
    # The music attribution and year are present in the disk's intro pages.
    if atr[0x9B3C:0x9B48] != b"LESZEK HOlDA" or atr[0x9A31:0x9A35] != b"1991":
        raise ValueError("Expected original intro credit and copyright year")

    effects = [command for command, _ in COMMANDS if command not in (0x19, 0x50)]
    files = {
        "sound-bank.bin": bank,
        "title.sap": _sap(bank, [0x50], "A.D. 2044 - title and ending"),
        "game-over.sap": _sap(bank, [0x19], "A.D. 2044 - game over"),
        "sound-effects.sap": _sap(bank, effects, "A.D. 2044 - sound effects"),
    }
    metadata = {
        "format": "custom command-stream player, not CMC",
        "source": "reference/ad2044-side1.atr",
        "file_start": FILE_START,
        "file_end_exclusive": FILE_END,
        "load_address": LOAD_ADDRESS,
        "end_address_exclusive": END_ADDRESS,
        "raw_size": len(bank),
        "dictionary_cfa": 0x5DB3,
        "author": "Leszek Holda",
        "credit_evidence": {
            "atr_offset": 0x9B3C,
            "raw_ascii": "LESZEK HOlDA",
            "preceding_music_label_offset": 0x9B0D,
        },
        "year_evidence": {"atr_offset": 0x9A31, "raw_ascii": "1991"},
        "sap": {
            "type": "B",
            "init": INITIALIZER,
            "player": PLAYER,
            "timing": "one original deferred VBI tick per PAL frame",
            "patches": [
                {
                    "address": VBI_TAIL,
                    "original_hex": "4C",
                    "replacement_hex": "60",
                    "reason": "Return from frame routine instead of chaining Atari OS VBI",
                }
            ],
            "initializer_hex": _initializer([0x50])[:28].hex().upper(),
            "command_table_address": COMMAND_TABLE,
        },
        "music": [
            {
                "file": "title.sap",
                "command": 0x50,
                "stream_address": 0x69CC,
                "usage": "Title intro and ending; selected by Forth CFAs $919F and $8D4A",
                "looping": True,
            },
            {
                "file": "game-over.sap",
                "command": 0x19,
                "stream_address": 0x6935,
                "usage": "Game-over cue selected by HANDLE-GAME-INPUT at CFA $7934",
                "looping": False,
            },
        ],
        "sound_effects": {"file": "sound-effects.sap", "subsong_commands": effects},
        "dispatch": [
            {"command": command, "stream_address": target}
            for command, target in COMMANDS
        ],
    }
    return files, metadata


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "atr", type=Path, nargs="?",
        default=GAME / "reference/ad2044-side1.atr",
        help="original AD2044 side-one disk (default: verified reference)",
    )
    parser.add_argument(
        "output", type=Path, nargs="?", default=GAME / "build/music",
        help="output folder (default: ad2044/build/music)",
    )
    args = parser.parse_args()
    files, metadata = extract(read_reference(args.atr))
    args.output.mkdir(parents=True, exist_ok=True)
    for filename, data in files.items():
        (args.output / filename).write_bytes(data)
    (args.output / "extraction.json").write_text(
        json.dumps(metadata, indent=2, ensure_ascii=True) + "\n", encoding="ascii"
    )
    print(f"Extracted {len(files)} files into {args.output}")


if __name__ == "__main__":
    main()
