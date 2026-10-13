#!/usr/bin/env python3
"""Checks for bounded string decoding and faithful dictionary annotations.

Run with ``python3 ad2044/tools/test_text_records.py``. The fixture tests read
the three supplied game disks; no Atari emulation or Forth compilation is needed.
"""

import codecs
import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "util"))
from reference_media import read_reference
import unittest
from unittest.mock import patch

TOOLS = Path(__file__).resolve().parent
sys.path.insert(0, str(TOOLS))
import decompile
import text_records


class CountedLinesTests(unittest.TestCase):
    def test_lines_use_declared_bounds_and_preserve_empty_and_nul(self):
        payload = b"\x03\x03ABC\x00\x02D\x00"
        data = b"prefix" + payload + b"outside"
        lines = text_records.counted_lines(data, 6, 6 + len(payload))
        self.assertEqual(
            [data[r["address"] : r["end"]] for r in lines], [b"ABC", b"", b"D\x00"]
        )
        self.assertEqual([r["length"] for r in lines], [3, 0, 2])
        self.assertEqual([r["index"] for r in lines], [0, 1, 2])
        self.assertEqual(lines[-1]["end"], 6 + len(payload))

    def test_zero_line_message_consumes_only_its_count(self):
        self.assertEqual(text_records.counted_lines(b"\x00", 0, 1), [])
        with self.assertRaises(ValueError):
            text_records.counted_lines(b"\x00unused", 0, 7)

    def test_rejects_missing_and_truncated_records(self):
        cases = [
            (b"", 0, 0),
            (b"\x01", 0, 1),
            (b"\x01\x03AB", 0, 4),
            (b"\x00", -1, 1),
            (b"\x00", 0, 2),
        ]
        for data, start, end in cases:
            with self.subTest(data=data, start=start, end=end):
                with self.assertRaises(ValueError):
                    text_records.counted_lines(data, start, end)

    def test_cannot_read_past_message_into_next_definition(self):
        with self.assertRaises(ValueError):
            text_records.counted_lines(b"\x01\x03ABC", 0, 4)

    def test_rejects_unconsumed_bytes_inside_message(self):
        with self.assertRaises(ValueError):
            text_records.counted_lines(b"\x01\x01AEXTRA", 0, 8)


class VectorTests(unittest.TestCase):
    def test_known_count_stops_before_unused_capacity(self):
        data = b"!\x03\x00ABC\x01\x00Z\xff\xffgarbage"
        entries, live_end = text_records.vector_records(data, 1, len(data), 2)
        self.assertEqual(
            [data[r["address"] : r["end"]] for r in entries], [b"ABC", b"Z"]
        )
        self.assertEqual(live_end, 9)
        self.assertEqual(data[live_end:], b"\xff\xffgarbage")

    def test_zero_entries_need_no_length_prefix(self):
        self.assertEqual(text_records.vector_records(b"X", 1, 1, 0), ([], 1))

    def test_exact_boundary_is_valid_but_next_record_is_not(self):
        data = b"\x01\x00A\x01\x00B"
        entries, end = text_records.vector_records(data, 0, 3, 1)
        self.assertEqual(entries[0]["end"], 3)
        self.assertEqual(end, 3)
        with self.assertRaises(ValueError):
            text_records.vector_records(data, 0, 3, 2)

    def test_rejects_empty_truncated_and_out_of_bounds_records(self):
        cases = [
            (b"\x01", 0, 1, 1),
            (b"\x00\x00", 0, 2, 1),
            (b"\x03\x00AB", 0, 4, 1),
            (b"\x01\x00A", 0, 2, 1),
            (b"", 0, 0, -1),
            (b"X", -1, 1, 0),
            (b"X", 0, 2, 0),
            (b"X", 1, 0, 0),
        ]
        for data, start, end, count in cases:
            with self.subTest(data=data, start=start, end=end, count=count):
                with self.assertRaises(ValueError):
                    text_records.vector_records(data, start, end, count)


class EncodingTests(unittest.TestCase):
    def test_polish_game_font_transliteration(self):
        examples = {
            b"ZEMDLAlEs=Z=GlODU": "ZEMDLALES Z GLODU",
            b"CZUJESZ=SSANIE=W=zOlaDKU": "CZUJESZ SSANIE W ZOLADKU",
            b"WlaCZYlEs=STACJe?": "WLACZYLES STACJE?",
            b"KUP=I=ZAPlAc": "KUP I ZAPLAC",
            b"acelnosz": "ACELNOSZ",
        }
        for raw, expected in examples.items():
            with self.subTest(raw=raw):
                self.assertEqual(text_records.display_text(raw), expected)

    def test_inverse_characters_use_the_same_font_mapping(self):
        inverse = bytes(b | 128 for b in b"IDz=W=TYl")
        self.assertEqual(text_records.display_text(inverse), "IDZ W TYL")

    def test_unknown_glyphs_keep_original_byte_values(self):
        self.assertEqual(
            text_records.display_text(b"\x00\x9bvx\xf6"), "[00][9B][76][78][F6]"
        )

    def test_font_tiles_are_not_guessed_from_ascii_punctuation(self):
        raw = b"!%*+-():' ,.?"
        self.assertEqual(
            text_records.display_text(raw), "[21][25][2A][2B][2D][28][29][3A][27] ,.?"
        )
        self.assertEqual(text_records.display_text(raw, "atascii"), raw.decode("ascii"))

    def test_atascii_preserves_case_equals_and_backslash(self):
        raw = b"Error: x=y (test)\\\x00\x9b\xc1"
        self.assertEqual(
            text_records.display_text(raw, "atascii"), "Error: x=y (test)\\[00][9B][C1]"
        )

    def test_screen_tiles_are_not_mistaken_for_ascii_prose(self):
        self.assertEqual(
            text_records.display_text(b"ABC=\x00", "screen-codes"),
            "[41][42][43][3D][00]",
        )

    def test_invalid_encoding_is_rejected(self):
        with self.assertRaises(ValueError):
            text_records.display_text(b"TEXT", "guessed-font")

    def test_encoded_text_round_trips_every_byte(self):
        raw = bytes(range(256))
        encoded = text_records.encoded_text(raw)
        encoded.encode("ascii")
        self.assertEqual(codecs.decode(encoded, "unicode_escape").encode("latin1"), raw)

    def test_literal_escape_sequences_are_not_reinterpreted(self):
        raw = b"\\x41\\n\\\x00\x9b"
        encoded = text_records.encoded_text(raw)
        self.assertEqual(encoded, r"\x5Cx41\x5Cn\x5C\x00\x9B")
        self.assertEqual(codecs.decode(encoded, "unicode_escape").encode("latin1"), raw)


class DictionaryCatalogTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data = decompile.memory(
            read_reference(decompile.ROOT / "reference/ad2044-side1.atr")
        )
        cls.words = decompile.dictionary(cls.data)
        names = json.loads((TOOLS / "names.json").read_text())
        decompile.identifiers(cls.words, names)
        cls.catalog = cls.make_catalog(cls.data)

    @classmethod
    def make_catalog(cls, data, words=None):
        return text_records.Catalog(
            "ad2044", data, cls.words if words is None else words, decompile.decode
        )

    def test_known_message_and_hunger_vector(self):
        message = self.catalog.by_word[0x7BBB]["records"]
        self.assertEqual(len(message), 1)
        self.assertEqual(message[0]["address"], 0x7BC1)
        self.assertEqual(message[0]["encoded"], "NIE=UNIESIESZ")
        self.assertEqual(message[0]["text"], "NIE UNIESIESZ")
        self.assertEqual(
            [r["text"] for r in self.catalog.by_word[0x6D0A]["records"]],
            [
                "ZEMDLALES Z GLODU",
                "JESTES BARDZO GLODNY",
                "CZUJESZ GLOD",
                "CZUJESZ SSANIE W ZOLADKU",
            ],
        )

    def test_direction_styles_and_non_record_capacity(self):
        definition = self.catalog.by_word[0x6FC7]
        records = definition["records"]
        self.assertEqual(
            [r["text"] for r in records], ["PROSTO", "W PRAWO", "W TYL", "W LEWO"]
        )
        self.assertEqual(records[1]["inverse_positions"], [0, 2, 3, 4, 5, 6])
        self.assertEqual(definition["unused_tail_hex"], "D9")
        self.assertEqual(definition["payload_end"], definition["capacity_end"] - 1)

    def test_action_alias_is_one_index_byte_not_a_literal_string(self):
        records = self.catalog.by_word[0x72E2]["records"]
        self.assertEqual(len(records), 76)
        alias = records[13]
        self.assertEqual(alias["kind"], "alias")
        self.assertEqual(alias["raw_hex"], "06")
        self.assertEqual(alias["target_index"], 6)
        self.assertEqual(alias["target_address"], records[6]["address"])
        self.assertEqual(alias["text"], "IDZ")

    def test_unresolvable_aliases_are_flagged_without_following(self):
        alias = self.catalog.by_word[0x72E2]["records"][13]
        for bad_index in [76, 17, 13]:
            with self.subTest(index=bad_index):
                data = bytearray(self.data)
                data[alias["address"]] = bad_index
                changed = self.make_catalog(data).by_word[0x72E2]["records"][13]
                self.assertFalse(changed["resolved"])
                self.assertEqual(changed["target_index"], bad_index)
                self.assertEqual(bytes.fromhex(changed["raw_hex"]), bytes([bad_index]))
                self.assertTrue(changed["text"].startswith("["))

    def test_unused_action_capacity_is_not_decoded_as_more_text(self):
        definition = self.catalog.by_word[0x72E2]
        data = bytearray(self.data)
        # Retain the two-byte terminator, then plant a plausible extra record.
        start = definition["payload_end"] + 2
        extra = b"\x08\x00NOT=LIVE"
        self.assertLessEqual(start + len(extra), definition["capacity_end"])
        data[start : start + len(extra)] = extra
        changed = self.make_catalog(data).by_word[0x72E2]
        self.assertEqual(changed["records"], definition["records"])
        self.assertIn(extra.hex().upper(), changed["unused_tail_hex"])

    def test_action_vector_requires_its_terminator(self):
        data = bytearray(self.data)
        data[self.catalog.by_word[0x72E2]["payload_end"]] = 1
        with self.assertRaisesRegex(ValueError, "terminator"):
            self.make_catalog(data)

    def test_inline_font_override_and_retired_banner_are_explicit(self):
        records = [r for d in self.catalog.definitions for r in d["records"]]
        percentage = next(r for r in records if r["address"] == 0x7828)
        self.assertEqual(percentage["encoding"], "game-font")
        self.assertEqual(percentage["text"], "[1E] PROCENT MISJI")
        banner = next(r for r in records if r["address"] == 0x1ED1)
        self.assertEqual(banner["label"], "retired startup banner")
        self.assertEqual(banner["encoding"], "atascii")
        self.assertIn("fig-FORTH", banner["text"])
        self.assertEqual(banner["length"], 20)

    def test_all_catalog_records_describe_the_original_bytes(self):
        before = bytes(self.data)
        catalog = self.make_catalog(self.data)
        self.assertEqual(bytes(self.data), before)
        by_cfa = {word["cfa"]: word for word in self.words}
        for definition in catalog.definitions:
            word = by_cfa[definition["cfa"]]
            for record in definition["records"]:
                with self.subTest(cfa=word["cfa"], address=record["address"]):
                    start, end = record["address"], record["end"]
                    self.assertGreaterEqual(start, word["pfa"])
                    self.assertLessEqual(end, word["end"])
                    raw = bytes(self.data[start:end])
                    self.assertEqual(record["length"], len(raw))
                    self.assertEqual(bytes.fromhex(record["raw_hex"]), raw)
                    if record["kind"] == "string":
                        recovered = codecs.decode(record["encoded"], "unicode_escape")
                        self.assertEqual(recovered.encode("latin1"), raw)

    def test_wrong_message_kind_and_short_capacity_are_rejected(self):
        for cfa, field, value in [(0x7BBB, "code", 0x1441), (0x6FC7, "end", 0x6FE0)]:
            words = [dict(word) for word in self.words]
            next(word for word in words if word["cfa"] == cfa)[field] = value
            with self.subTest(cfa=cfa, field=field):
                with self.assertRaises(ValueError):
                    self.make_catalog(self.data, words)

    def test_missing_profiled_definition_is_rejected(self):
        words = [word for word in self.words if word["cfa"] != 0x7BBB]
        with self.assertRaisesRegex(
            ValueError, r"Missing profiled text definitions: \$7BBB"
        ):
            self.make_catalog(self.data, words)

    def test_message_parentheses_cannot_escape_forth_comments(self):
        cfa = 0x7BBB
        raw = b") t.DROP ("
        message = bytes([1, len(raw)]) + raw
        data = bytearray(65536)
        pfa = cfa + 2
        data[pfa : pfa + 2] = len(message).to_bytes(2, "little")
        data[pfa + 2 : pfa + 2 + len(message)] = message
        word = dict(
            cfa=cfa, pfa=pfa, end=pfa + 2 + len(message), code=0x1499, id="fixture"
        )
        profile = dict(text_records.PROFILES["ad2044"], messages=(cfa,), vectors={})
        with patch.dict(text_records.PROFILES, {"ad2044": profile}):
            catalog = self.make_catalog(data, [word])
        out = decompile.Listing()
        catalog.annotate(out, word)
        out.flush()
        self.assertTrue(out.lines)
        for line in out.lines:
            line.encode("ascii")
            self.assertTrue(line.startswith("( ") and line.endswith(" )"))
            self.assertEqual(line.count("("), 1)
            self.assertEqual(line.count(")"), 1)
            self.assertLessEqual(len(line), 64)


class OtherGameProfilesTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.fixtures = {}
        root = decompile.ROOT.parent
        for game, filename in [
            ("klatwa", "klatwa-v1.atr"),
            ("wladcy-ciemnosci", "wladcy-ciemnosci.atr"),
        ]:
            folder = root / game
            disk = read_reference(folder / "reference" / filename)
            data = bytearray(65536)
            # These images have a contiguous saved dictionary plus retired
            # dictionary residue in the first 250 sectors, unlike AD's overlap.
            data[0x0E80:0x8B80] = disk[16:32016]
            words = json.loads((folder / "dictionary.json").read_text())["words"]
            # Exercise the shared data-record profiles directly. The saved
            # catalog check below also covers each game's real inline decoder.
            catalog = text_records.Catalog(game, data, words, lambda *args: ([], 0))
            cls.fixtures[game] = dict(
                folder=folder, data=data, words=words, catalog=catalog
            )

    def test_encoded_messages_preserve_raw_bytes_and_decode_only_25(self):
        for game, cfa, expected in [
            ("klatwa", 0x7845, "CHCESZ GRAC[2A]KUPUJ ORYGINAL"),
            ("wladcy-ciemnosci", 0x722D, "CHCESZ GRAC KUPUJ ORYGINAL"),
        ]:
            with self.subTest(game=game):
                fixture = self.fixtures[game]
                record = fixture["catalog"].by_word[cfa]["records"][0]
                raw = bytes.fromhex(record["raw_hex"])
                self.assertEqual(
                    raw, bytes(fixture["data"][record["address"] : record["end"]])
                )
                decoded = bytes.fromhex(record["decoded_hex"])
                self.assertEqual(
                    decoded[:25], bytes((b + 0x26) & 255 for b in raw[:25])
                )
                self.assertEqual(decoded[25:], raw[25:])
                self.assertEqual(record["text"], expected)
                self.assertEqual(
                    codecs.decode(record["encoded"], "unicode_escape").encode("latin1"),
                    decoded,
                )

    def test_encoded_prefix_wraps_bytes_but_does_not_transform_suffix(self):
        cfa, pfa = 0x7845, 0x7847
        for raw in [b"\xff" * 25 + b"END", b"\xff" * 24]:
            with self.subTest(length=len(raw)):
                message = bytes([1, len(raw)]) + raw
                data = bytearray(65536)
                data[pfa : pfa + 2] = len(message).to_bytes(2, "little")
                data[pfa + 2 : pfa + 2 + len(message)] = message
                word = dict(
                    cfa=cfa,
                    pfa=pfa,
                    end=pfa + 2 + len(message),
                    code=0x1499,
                    id="encoded-fixture",
                )
                profile = dict(
                    text_records.PROFILES["klatwa"], messages=(cfa,), vectors={}
                )
                with patch.dict(text_records.PROFILES, {"klatwa": profile}):
                    if len(raw) < 25:
                        with self.assertRaisesRegex(ValueError, "encoded message"):
                            text_records.Catalog(
                                "klatwa", data, [word], lambda *args: ([], 0)
                            )
                    else:
                        catalog = text_records.Catalog(
                            "klatwa", data, [word], lambda *args: ([], 0)
                        )
                        record = catalog.by_word[cfa]["records"][0]
                        self.assertEqual(bytes.fromhex(record["raw_hex"]), raw)
                        self.assertEqual(
                            bytes.fromhex(record["decoded_hex"]), b"%" * 25 + b"END"
                        )

    def test_known_incomplete_messages_remain_bounded_placeholders(self):
        for game, cfa in [("klatwa", 0x61A0), ("wladcy-ciemnosci", 0x6142)]:
            with self.subTest(game=game):
                fixture = self.fixtures[game]
                records = fixture["catalog"].by_word[cfa]["records"]
                placeholder = next(r for r in records if r["kind"] == "placeholder")
                self.assertEqual(placeholder["raw_hex"], "01")
                self.assertEqual(placeholder["length"], 1)
                data = bytearray(fixture["data"])
                data[placeholder["address"]] = 0
                with self.assertRaisesRegex(ValueError, "placeholder"):
                    text_records.Catalog(
                        game, data, fixture["words"], lambda *args: ([], 0)
                    )

    def test_spell_and_power_slots_exclude_three_state_bytes(self):
        for game, cfa, count in [
            ("klatwa", 0x5577, 10),
            ("wladcy-ciemnosci", 0x5517, 8),
        ]:
            with self.subTest(game=game):
                fixture = self.fixtures[game]
                records = fixture["catalog"].by_word[cfa]["records"]
                self.assertEqual(len(records), count)
                for record in records:
                    self.assertEqual(record["length"], 13)
                    self.assertEqual(record["address"], record["length_address"] + 5)
                    state = bytes(
                        fixture["data"][record["address"] - 3 : record["address"]]
                    )
                    self.assertEqual(bytes.fromhex(record["state_hex"]), state)

    def test_saved_catalogs_match_reference_bytes_including_inline_records(self):
        for game, fixture in self.fixtures.items():
            report = json.loads((fixture["folder"] / "strings.json").read_text())
            self.assertEqual(report["game"], game)
            by_cfa = {word["cfa"]: word for word in fixture["words"]}
            for definition in report["definitions"]:
                word = by_cfa[definition["cfa"]]
                for record in definition["records"]:
                    with self.subTest(game=game, address=record["address"]):
                        start, end = record["address"], record["end"]
                        self.assertGreaterEqual(start, word["pfa"])
                        self.assertLessEqual(end, word["end"])
                        raw = bytes(fixture["data"][start:end])
                        self.assertEqual(bytes.fromhex(record["raw_hex"]), raw)
                        self.assertEqual(record["length"], len(raw))
                        if record["kind"] == "string":
                            decoded = bytes.fromhex(
                                record.get("decoded_hex", record["raw_hex"])
                            )
                            self.assertEqual(
                                codecs.decode(
                                    record["encoded"], "unicode_escape"
                                ).encode("latin1"),
                                decoded,
                            )


if __name__ == "__main__":
    unittest.main()
