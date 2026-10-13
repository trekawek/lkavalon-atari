#!/usr/bin/env python3
"""Regression checks for the compiler built entirely from readable sources."""

import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import shutil
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build_figforth as builder

ROOT = Path(__file__).resolve().parents[2]
HAS_PY65 = importlib.util.find_spec('py65') is not None


class SourceTests(unittest.TestCase):
    def test_original_header_and_all_58_boot_sectors_are_exact(self):
        provenance = json.loads((builder.SOURCE / 'provenance.json').read_text('ascii'))
        disk = builder.build()
        self.assertEqual(len(disk), provenance['original_size'])
        self.assertEqual(hashlib.sha256(disk[:16]).hexdigest(), provenance['header_sha256'])
        self.assertEqual(hashlib.sha256(disk[16:16 + 58 * 128]).hexdigest(),
                         provenance['boot_sha256'])

    def test_every_dependency_is_readable_text(self):
        dependencies = builder.dependencies()
        self.assertEqual(len(dependencies), len(set(dependencies)))
        for path in dependencies:
            with self.subTest(path=path):
                self.assertTrue(path.is_absolute())
                self.assertIn(path.suffix, {'.json', '.py', '.fth'})
                self.assertNotIn('\x00', path.read_text('ascii'))

    def test_error_screens_and_optional_source_are_packed_at_original_numbers(self):
        disk = builder.build()
        layout = json.loads((builder.SOURCE / 'disk.json').read_text('ascii'))
        self.assertEqual(len(layout['screens']), 77)
        for entry in layout['screens']:
            lines = (builder.SOURCE / entry['file']).read_text('ascii').splitlines()
            expected = ''.join(line.ljust(64) for line in lines).encode('ascii')
            offset = 16 + entry['number'] * 1024
            self.assertEqual(disk[offset:offset + 1024], expected)
        self.assertIn(b'Stack empty', disk[16 + 14 * 1024:16 + 15 * 1024])
        self.assertIn(b'Conditionals not paired', disk[16 + 15 * 1024:16 + 16 * 1024])
        self.assertEqual(disk[16 + 58 * 128:16 + 11 * 1024],
                         b' ' * (11 * 1024 - 58 * 128))
        self.assertEqual(disk[16 + 45 * 1024:16 + 46 * 1024], b' ' * 1024)

    def test_native_source_edit_changes_encoded_instruction_only(self):
        source = json.loads((builder.SOURCE / 'compiler.json').read_text('ascii'))
        original = builder.encode_compiler(source)
        edited = copy.deepcopy(source)
        self.assertEqual(edited['prefix'][1]['asm'][1], 'LDA.# 00')
        edited['prefix'][1]['asm'][1] = 'LDA.# 01'
        result = builder.encode_compiler(edited)
        changes = [(i, old, new) for i, (old, new) in enumerate(zip(original, result)) if old != new]
        self.assertEqual(changes, [(0x0E8A - 0x0E80, 0, 1)])

    def test_bad_names_addresses_and_thread_references_fail(self):
        source = json.loads((builder.SOURCE / 'compiler.json').read_text('ascii'))
        cases = []
        wrong_address = copy.deepcopy(source)
        wrong_address['definitions'][0]['cfa'] = '0F2E'
        cases.append(wrong_address)
        wrong_flags = copy.deepcopy(source)
        wrong_flags['definitions'][0]['flags'] = '84'
        cases.append(wrong_flags)
        wrong_call = copy.deepcopy(source)
        word = next(word for word in wrong_call['definitions'] if word['runtime'] == 'DOCOL')
        word['body'][0]['thread'][0] = 'NONEXISTENT'
        cases.append(wrong_call)
        for edited in cases:
            with self.subTest(case=cases.index(edited)), self.assertRaises(ValueError):
                builder.encode_compiler(edited)

    def test_missing_source_and_screen_overlap_fail_without_cached_fallback(self):
        with tempfile.TemporaryDirectory() as directory:
            source = Path(directory) / 'source'
            shutil.copytree(builder.SOURCE, source, ignore=shutil.ignore_patterns('__pycache__'))
            layout = json.loads((source / 'disk.json').read_text('ascii'))
            layout['screens'][0]['number'] = 0
            (source / 'disk.json').write_text(json.dumps(layout), 'ascii')
            with self.assertRaisesRegex(ValueError, 'overlapping'):
                builder.build(source)
            (source / 'compiler.json').unlink()
            with self.assertRaises(FileNotFoundError):
                builder.build(source)


@unittest.skipUnless(HAS_PY65, 'py65 required for authentic APX execution')
class ExecutionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        spec = importlib.util.spec_from_file_location('bootstrap_apx', ROOT / 'ad2044/tools/compile.py')
        cls.compiler = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.compiler)

    def test_generated_compiler_cold_start_and_target_emission(self):
        with tempfile.TemporaryDirectory() as directory:
            disk = Path(directory) / 'compiler.atr'
            disk.write_bytes(builder.build())
            lines = self.compiler.read_sources([ROOT / 'ad2044/src/metacompiler.fth',
                                                ROOT / 'ad2044/src/05-emission.fth'])
            lines += [('<probe>', 1, ': DOUBLE DUP + ;'),
                      ('<probe>', 2, ': CHECK 1234 DOUBLE 2468 = 0= IF ABORT THEN ; CHECK'),
                      ('<probe>', 3, '3 T-DISK E80 T-ORG CELL 1234 LIT8 56 LIT16 789A'),
                      ('<probe>', 4, 'AT E89 T-FINISH')]
            machine = self.compiler.ForthMachine(disk, lines, 20_000_000)
            machine.run()
            self.assertEqual(bytes(machine.output_disks[3][:9]), bytes.fromhex('3412670F562D0F9A78'))

    def test_generated_compiler_loads_real_disk_source_screen(self):
        with tempfile.TemporaryDirectory() as directory:
            disk = Path(directory) / 'compiler.atr'
            disk.write_bytes(builder.build())
            lines = [('<bootstrap>', 1, 'HEX 1000 2463 ! 1000 OFFSET ! 1 LOAD')]
            machine = self.compiler.ForthMachine(disk, lines, 20_000_000)
            source = [': TWICE DUP + ;',
                      ': CHECK 1234 TWICE 2468 = 0= IF ABORT THEN ; CHECK']
            payload = bytearray(b' ' * 2048)
            for i, line in enumerate(source):
                payload[1024 + i * 64:1024 + (i + 1) * 64] = line.ljust(64).encode('ascii')
            machine.input_disks[2] = payload
            machine.run()
            self.assertIsNotNone(machine.host_word('TWICE'))
            self.assertIsNotNone(machine.host_word('CHECK'))


if __name__ == '__main__':
    unittest.main()
