#!/usr/bin/env python3
"""Forensic fallback must be independent of optional historical binaries."""

import hashlib
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import reference_media


class ReferenceTests(unittest.TestCase):
    def fixture(self, base, game='ad2044'):
        root = Path(base) / game
        (root / 'reference').mkdir(parents=True)
        original = bytearray(range(32))
        original[15] = 1 if game == 'ad2044' else 0
        name = 'ad2044-side1.atr' if game == 'ad2044' else 'klatwa-v1.atr'
        metadata = {'references': [{'file': name, 'size': len(original),
                                   'sha256': hashlib.sha256(original).hexdigest()}]}
        (root / 'reference/sources.json').write_text(json.dumps(metadata), 'ascii')
        return root, name, bytes(original)

    def test_missing_compiler_uses_readable_builder_even_with_archived_original(self):
        with tempfile.TemporaryDirectory() as base:
            root, _, _ = self.fixture(base)
            archive = root / 'build/reference/figforth.atr'
            archive.parent.mkdir(parents=True)
            archive.write_bytes(b'old compiler fixture must not be a build dependency')
            with patch.object(reference_media.build_figforth, 'build', return_value=b'text build') as build:
                self.assertEqual(reference_media.read_reference(root / 'reference/figforth.atr'), b'text build')
                build.assert_called_once_with()

    def test_original_fixture_precedes_a_modified_build(self):
        with tempfile.TemporaryDirectory() as base:
            root, name, original = self.fixture(base)
            archive = root / 'build/reference' / name
            archive.parent.mkdir(parents=True)
            archive.write_bytes(original)
            (root / 'build' / name).write_bytes(b'modified game')
            self.assertEqual(reference_media.read_reference(root / 'reference' / name), original)

    def test_ad_built_fallback_restores_only_header_protection_flag(self):
        with tempfile.TemporaryDirectory() as base:
            root, name, original = self.fixture(base)
            built = bytearray(original)
            built[15] = 0
            (root / 'build').mkdir()
            output = root / 'build' / name
            output.write_bytes(built)
            self.assertEqual(reference_media.read_reference(root / 'reference' / name), original)
            built[-1] ^= 1
            output.write_bytes(built)
            with self.assertRaisesRegex(ValueError, 'edited builds require an original fixture'):
                reference_media.read_reference(root / 'reference' / name)

    def test_klatwa_fallback_uses_output_filename_without_v1_suffix(self):
        with tempfile.TemporaryDirectory() as base:
            root, name, original = self.fixture(base, 'klatwa')
            (root / 'build').mkdir()
            (root / 'build/klatwa.atr').write_bytes(original)
            self.assertEqual(reference_media.read_reference(root / 'reference' / name), original)

    def test_corrupt_original_is_not_ignored_in_favor_of_valid_build(self):
        with tempfile.TemporaryDirectory() as base:
            root, name, original = self.fixture(base)
            archive = root / 'build/reference' / name
            archive.parent.mkdir(parents=True)
            archive.write_bytes(b'corrupt')
            (root / 'build' / name).write_bytes(original)
            with self.assertRaisesRegex(ValueError, 'does not match historical reference'):
                reference_media.read_reference(root / 'reference' / name)

    def test_missing_reference_has_explicit_fixture_or_build_error(self):
        with tempfile.TemporaryDirectory() as base:
            root, name, _ = self.fixture(base)
            with self.assertRaisesRegex(FileNotFoundError, 'supply optional'):
                reference_media.read_reference(root / 'reference' / name)

    def test_explicit_external_file_remains_supported(self):
        with tempfile.TemporaryDirectory() as base:
            path = Path(base) / 'experiment.atr'
            path.write_bytes(b'explicit user-supplied import')
            self.assertEqual(reference_media.read_reference(path), path.read_bytes())


if __name__ == '__main__':
    unittest.main()
