#!/usr/bin/env python3
"""Independent structural checks for the extracted native music files."""

from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
from reference_media import read_reference
import unittest
import tempfile
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parent))
import extract_music


def inspect_cmc(module):
    """Check every pattern referenced by the CMC sequence table.

    Layout and event semantics follow ASAP 8.0.0's 6502/cmc.asx:
    two 64-byte pattern-pointer tables at data offsets $14/$54, followed
    by three 85-position sequence columns at $200/$255/$2AA. A column
    value $FE skips a position; channel-one command records are not
    pattern IDs. Pattern streams use instruments $00-$3F, notes $40-$7F,
    rests $80-$BF, and a final $FF in these four modules.

    This checks the data the player will read, independently of the
    extractor's hard-coded resource addresses and subsong counts.
    """
    if len(module) < 0x306 or module[:2] != b"\xff\xff":
        raise ValueError("Missing CMC header or fixed tables")
    load = int.from_bytes(module[2:4], "little")
    end = int.from_bytes(module[4:6], "little")
    if len(module) != end - load + 7:
        raise ValueError("CMC segment size mismatch")
    data = module[6:]
    patterns = set()
    sequence = [
        tuple(data[0x200 + position + 85 * channel] for channel in range(3))
        for position in range(85)
    ]
    for channels in sequence:
        if 0xFE in channels:
            continue
        if channels[0] >= 0x80 and channels[0] != 0xFF:
            continue
        patterns.update(value for value in channels if value < 64)
    for pattern in patterns:
        address = data[0x14 + pattern] | (data[0x54 + pattern] << 8)
        offset = address - load
        if not 0x300 <= offset < len(data):
            raise ValueError(f"Pattern {pattern} points outside CMC data")
        terminator = data.find(b"\xff", offset)
        if terminator < 0 or terminator - offset >= 128:
            raise ValueError(f"Pattern {pattern} has no bounded terminator")

    # Match ASAPInfo_ParseCmc's rule: ignore trailing empty positions and
    # count separators only before the last meaningful position.
    last = 83
    while last >= 0:
        first, second, third = sequence[last]
        if first < 0xB0 or second < 0x40 or third < 0x40:
            break
        last -= 1
    songs = 1 + sum(
        sequence[position][0] in (0x8F, 0xEF) for position in range(max(last, 0))
    )
    return songs, len(patterns)


class MusicExtractionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.disks = {}
        cls.exports = {}
        for game, (filename, _) in extract_music.REFERENCES.items():
            disk = read_reference(extract_music.ROOT / game / "reference" / filename)
            cls.disks[game] = disk
            cls.exports[game] = extract_music.extract_game(game, disk)

    def test_checked_in_exports_regenerate_exactly(self):
        for game, (files, _) in self.exports.items():
            for filename, data in files.items():
                with self.subTest(game=game, file=filename):
                    if filename == "extraction.json":
                        continue  # Provenance catalogs are generated, not inputs.
                    else:
                        generated, _ = extract_music.build_music(game)
                        self.assertEqual(generated[filename], data)

    def test_cmc_exports_need_only_the_two_native_modules(self):
        for game in ("klatwa", "wladcy-ciemnosci"):
            with self.subTest(game=game), tempfile.TemporaryDirectory() as tmp:
                root = Path(tmp)
                music = root / game / "music"
                music.mkdir(parents=True)
                for filename in ("gameplay.cmc", "title.cmc"):
                    (music / filename).write_bytes(self.exports[game][0][filename])
                with patch.object(extract_music, "ROOT", root):
                    files, manifest = extract_music.build_music(game)
                    self.assertEqual(manifest["build_inputs"], ["music/gameplay.cmc", "music/title.cmc"])
                    changed = bytearray((music / "title.cmc").read_bytes())
                    changed[100] ^= 1
                    (music / "title.cmc").write_bytes(changed)
                    edited, _ = extract_music.build_music(game)
                    self.assertEqual(edited["title.cmc"], changed)
                    self.assertEqual(edited["gameplay.cmc"], files["gameplay.cmc"])
                    (music / "title.cmc").write_bytes(changed[:-1])
                    with self.assertRaisesRegex(ValueError, "segment size"):
                        extract_music.build_music(game)

    def test_ad_music_uses_only_native_bank_and_regenerates_listening_exports(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            music = root / "ad2044/music"
            music.mkdir(parents=True)
            bank = self.exports["ad2044"][0]["sound-bank.bin"]
            (music / "ad2044.snd").write_bytes(bank)
            with patch.object(extract_music, "ROOT", root):
                before, manifest = extract_music.build_music("ad2044")
                self.assertEqual(manifest["build_inputs"], ["music/ad2044.snd"])
                changed = bytearray(bank)
                changed[0x27] ^= 1
                (music / "ad2044.snd").write_bytes(changed)
                after, _ = extract_music.build_music("ad2044")
                self.assertEqual(after["sound-bank.bin"], changed)
                for filename in ("title.sap", "game-over.sap", "sound-effects.sap"):
                    self.assertNotEqual(before[filename], after[filename])
                (music / "ad2044.snd").write_bytes(bank[:-1])
                with self.assertRaisesRegex(ValueError, "expected 3631"):
                    extract_music.build_music("ad2044")

    def test_cmc_sequences_reference_complete_patterns(self):
        expected = {
            ("klatwa", "gameplay.cmc"): (2, 15),
            ("klatwa", "title.cmc"): (4, 17),
            ("wladcy-ciemnosci", "gameplay.cmc"): (2, 25),
            ("wladcy-ciemnosci", "title.cmc"): (1, 15),
        }
        for (game, filename), structure in expected.items():
            with self.subTest(game=game, file=filename):
                self.assertEqual(
                    inspect_cmc(self.exports[game][0][filename]), structure
                )

    def test_wladcy_restores_only_the_six_runtime_bytes(self):
        disk = self.disks["wladcy-ciemnosci"]
        module = self.exports["wladcy-ciemnosci"][0]["gameplay.cmc"]
        original = disk[0xD403:0xDB6E]
        self.assertEqual(module[: len(original)], original)
        self.assertEqual(module[len(original) :], bytes.fromhex("00FFFFB98CA8"))
        self.assertEqual(len(module), 1905)
        self.assertEqual(module[4:6], bytes.fromhex("B78C"))

        # Merely shrinking the header to fit the disk record would produce
        # a formally sized file whose final referenced pattern is truncated.
        shortened = bytearray(original)
        shortened[4:6] = bytes.fromhex("B18C")
        with self.assertRaisesRegex(ValueError, "Pattern 8 has no bounded terminator"):
            inspect_cmc(shortened)

    def test_resource_padding_is_not_exported(self):
        expected_lengths = {
            ("klatwa", "gameplay.cmc"): 1675,
            ("klatwa", "title.cmc"): 1784,
            ("wladcy-ciemnosci", "title.cmc"): 1526,
        }
        for (game, filename), length in expected_lengths.items():
            with self.subTest(game=game, file=filename):
                self.assertEqual(len(self.exports[game][0][filename]), length)

    def test_rejects_changed_or_truncated_reference_disks(self):
        for game, disk in self.disks.items():
            with self.subTest(game=game, change="truncated"):
                with self.assertRaisesRegex(ValueError, "Unexpected reference disk"):
                    extract_music.extract_game(game, disk[:-1])
            changed = bytearray(disk)
            changed[-1] ^= 1
            with self.subTest(game=game, change="modified"):
                with self.assertRaisesRegex(ValueError, "Unexpected reference disk"):
                    extract_music.extract_game(game, changed)

    def test_cmc_resource_guards_reject_bad_boundaries_and_headers(self):
        disk = self.disks["klatwa"]
        record = extract_music.CMC_RECORDS["klatwa"][0]
        offset, size = record[1:3]
        with self.assertRaisesRegex(ValueError, "outside its disk"):
            extract_music.extract_cmc(disk[: offset + size - 1], *record)
        for address, error in (
            (offset - 2, "resource length"),
            (offset, "segment header"),
            (offset + 6, "CMC signature"),
        ):
            with self.subTest(address=address):
                changed = bytearray(disk)
                changed[address] ^= 1
                with self.assertRaisesRegex(ValueError, error):
                    extract_music.extract_cmc(changed, *record)

    def test_restoration_requires_the_original_title_header(self):
        disk = bytearray(self.disks["wladcy-ciemnosci"])
        disk[0xDB70] ^= 1
        record = extract_music.CMC_RECORDS["wladcy-ciemnosci"][0]
        with self.assertRaisesRegex(ValueError, "adjacent title CMC header"):
            extract_music.extract_cmc(disk, *record)


if __name__ == "__main__":
    unittest.main()
