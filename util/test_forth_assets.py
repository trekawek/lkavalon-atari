#!/usr/bin/env python3
"""Native inputs must reach both APX compilation paths without reference ATRs.

The optional regeneration checks use forensic game references only to ensure
that decompilation preserves INCBIN directives and existing edited assets.
"""

import contextlib
import importlib.util
import io
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

import forth_assets as assets
from reference_media import read_reference

ROOT = Path(__file__).resolve().parents[1]
HAS_PY65 = importlib.util.find_spec('py65') is not None
REFERENCES = {'ad2044': 'ad2044-side1.atr', 'klatwa': 'klatwa-v1.atr',
              'wladcy-ciemnosci': 'wladcy-ciemnosci.atr'}


def includes(game):
    return tuple(item['path'] for item in assets.ASSETS_BY_GAME[game])


def module(game, filename):
    spec = importlib.util.spec_from_file_location(
        'asset_test_' + game.replace('-', '_') + '_' + filename,
        ROOT / game / 'tools' / (filename + '.py'))
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def write_native(root, game, salt=0):
    result = []
    for item in assets.ASSETS_BY_GAME[game]:
        path = root / item['path']
        path.parent.mkdir(parents=True, exist_ok=True)
        if item['path'] == 'world/initial.txt':
            import gam_world
            for original in gam_world.dependencies(ROOT / game):
                target = root / original.relative_to(ROOT / game)
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(original, target)
            puzzle = root / 'world/puzzles.txt'
            rows = puzzle.read_text().splitlines()
            for index, row in enumerate(rows):
                data, separator, comment = row.partition('#')
                if data.split()[:1] == ['00']:
                    rows[index] = f'00 {salt}' + (' # ' + comment.strip() if separator else '')
                    break
            else:
                raise AssertionError('Puzzle fixture has no cell 00')
            puzzle.write_text('\n'.join(rows) + '\n')
            data = gam_world.encode_world(root)
        else:
            data = bytes((i * 73 + salt) & 255 for i in range(item['size']))
            path.write_bytes(data)
        result.append(data)
    return result


class ExpansionTests(unittest.TestCase):
    def test_binary_bytes_ascii_width_and_source_locations(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            original = write_native(root, 'ad2044')
            source = root / 'fixture.fth'
            source.write_text('( INCBIN is a build directive )\nHEX\n' +
                              '\n'.join('INCBIN ' + path for path in
                                        includes('ad2044')) + '\n', 'ascii')
            lines = list(assets.source_lines(source, root))
            self.assertEqual(lines[:2], [(str(source), 1, '( INCBIN is a build directive )'),
                                       (str(source), 2, 'HEX')])
            for number, expected in zip((3, 4), original):
                expanded = [line for _, no, line in lines if no == number]
                self.assertEqual(b''.join(bytes.fromhex(line[6:]) for line in expanded),
                                 expected)
                self.assertTrue(all(line.startswith('BYTES ') and len(line) <= 63
                                    and line.isascii() for line in expanded))

    def test_missing_resized_unsupported_and_malformed_inputs_fail(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / 'fixture.fth'
            name = includes('klatwa')[0]
            source.write_text('INCBIN ' + name + '\n', 'ascii')
            with self.assertRaisesRegex(assets.AssetError, 'cannot read'):
                list(assets.source_lines(source, root))
            write_native(root, 'klatwa')
            for size in (0, 38, 40):
                (root / name).write_bytes(b'\x00' * size)
                with self.subTest(size=size), self.assertRaisesRegex(
                        assets.AssetError, 'expected 39 bytes'):
                    list(assets.source_lines(source, root))
            for line in ('INCBIN', 'INCBIN a b', 'INCBIN ../secret', 'INCBIN unknown.bin'):
                source.write_text(line + '\n', 'ascii')
                with self.subTest(line=line), self.assertRaises(assets.AssetError):
                    list(assets.source_lines(source, root))

    def test_asset_symlink_cannot_escape_game_directory(self):
        with tempfile.TemporaryDirectory() as directory:
            base = Path(directory)
            root = base / 'game'
            path = root / includes('klatwa')[0]
            path.parent.mkdir(parents=True)
            outside = base / 'outside.bin'
            outside.write_bytes(bytes(39))
            path.symlink_to(outside)
            with self.assertRaisesRegex(assets.AssetError, 'escapes game directory'):
                assets.read_asset(root, includes('klatwa')[0])

    def test_dependency_cli_matches_declared_native_inputs(self):
        for game in assets.ASSETS_BY_GAME:
            result = subprocess.run([sys.executable, str(ROOT / 'util/forth_assets.py'),
                                     '--game', game, '--dependencies'],
                                    check=True, text=True, capture_output=True)
            self.assertEqual(result.stdout.split(), list(assets.dependencies(game)))


class ConsumerTests(unittest.TestCase):
    def test_each_packer_expands_current_asset_and_rejects_missing_input(self):
        for game in assets.ASSETS_BY_GAME:
            with self.subTest(game=game), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                packer = module(game, 'pack_sources')
                (root / 'sources.json').write_text(json.dumps({'sources': ['fixture.fth']}))
                (root / 'fixture.fth').write_text('HEX\n' + '\n'.join(
                    'INCBIN ' + path for path in includes(game)) + '\n', 'ascii')
                previous = None
                for salt in (0, 1):
                    expected_bytes = write_native(root, game, salt)
                    with patch.object(packer, 'ROOT', root), contextlib.redirect_stdout(io.StringIO()):
                        packer.main()
                    disk = (root / 'build/sources.atr').read_bytes()
                    mapping = json.loads((root / 'build/source-screens.json').read_text())
                    actual = []
                    for number in range(1, len(mapping) + 1):
                        screen = disk[16 + number * 1024:16 + (number + 1) * 1024]
                        self.assertTrue(all(screen[i] == 32 for i in range(63, 1024, 64)))
                        words = screen.decode('ascii').split()
                        actual += words[:-1] if number < len(mapping) else words[:-6]
                    expected = ['HEX']
                    for data in expected_bytes:
                        for line in assets.bytes_lines(data):
                            expected += line.split()
                    self.assertEqual(actual, expected)
                    self.assertNotIn('INCBIN', actual)
                    if previous is not None:
                        self.assertNotEqual(disk, previous)
                    previous = disk
                # Existing packed output must never become a missing-input fallback.
                (root / includes(game)[0]).unlink()
                with patch.object(packer, 'ROOT', root), self.assertRaises(assets.AssetError):
                    packer.main()

    @unittest.skipUnless(HAS_PY65, 'py65 required for authentic APX execution')
    def test_edited_assets_compile_through_original_apx_for_all_games(self):
        for game in assets.ASSETS_BY_GAME:
            # Klatwa deliberately shares the AD compiler through its wrapper.
            compiler = module('ad2044', 'compile')
            with self.subTest(game=game), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                data = write_native(root, game, salt=91)
                source = root / 'fixture.fth'
                cursor = 0x4000
                lines = ['3 T-DISK 4000 T-ORG']
                expected = b''
                for path, raw in zip(includes(game), data):
                    cursor += len(raw)
                    lines += ['INCBIN ' + path, f'AT {cursor:04X}', 'BYTES 7712']
                    cursor += 2
                    expected += raw + bytes.fromhex('7712')
                lines += [f'AT {cursor:04X}', 'T-FINISH']
                source.write_text('\n'.join(lines) + '\n', 'ascii')
                inputs = compiler.read_sources(
                    [ROOT / game / 'src/metacompiler.fth',
                     ROOT / game / 'src/05-emission.fth', source], game_root=root)
                machine = compiler.ForthMachine(ROOT / game / 'build/figforth.atr',
                                                inputs, 30_000_000)
                machine.run()
                self.assertEqual(bytes(machine.output_disks[3][:len(expected)]), expected)
                self.assertEqual(bytes(machine.output_disks[3][len(expected):]),
                                 bytes((-len(expected)) % 128))


class RegenerationTests(unittest.TestCase):
    def test_address_aware_emission_preserves_includes_and_adjacent_bytes(self):
        decompiler = module('ad2044', 'decompile')
        for game, items in assets.ASSETS_BY_GAME.items():
            for item in items:
                with self.subTest(game=game, asset=item['path']):
                    start, end = item['start'], item['start'] + item['size']
                    memory = bytearray(65536)
                    memory[start - 1] = 0xA5
                    memory[end:end + 2] = bytes.fromhex('7712')
                    listing = decompiler.Listing(game)
                    listing.raw_region(memory, start - 1, end + 2)
                    self.assertEqual(listing.lines, ['BYTES A5', 'INCBIN ' + item['path'],
                                                    'BYTES 7712'])
                    for lo, hi in ((start + 1, end), (start, end - 1)):
                        with self.assertRaisesRegex(ValueError, 'Partial native asset span'):
                            decompiler.Listing(game).raw_region(memory, lo, hi)

    @unittest.skipUnless(HAS_PY65, 'py65 required for forensic regeneration')
    def test_all_regenerators_keep_edited_assets_without_recreating_opaque_tails(self):
        with tempfile.TemporaryDirectory() as directory:
            repo = Path(directory)
            (repo / 'util').mkdir()
            shutil.copytree(ROOT / 'util', repo / 'util', dirs_exist_ok=True,
                            ignore=shutil.ignore_patterns('__pycache__'))
            for game, reference in REFERENCES.items():
                root = repo / game
                shutil.copytree(ROOT / game / 'tools', root / 'tools',
                                ignore=shutil.ignore_patterns('__pycache__'))
                (root / 'reference').mkdir()
                (root / 'reference' / reference).write_bytes(
                    read_reference(ROOT / game / 'reference' / reference))
                if game != 'ad2044':
                    (root / 'build').mkdir()
                    shutil.copyfile(ROOT / game / f'build/{game}.atr',
                                    root / f'build/{game}.atr')
                edited = write_native(root, game, salt=31)
                if game != 'ad2044':
                    # Recovery reads the current compiled world. Keep this
                    # fixture consistent with its deliberately edited input.
                    image_path = root / f'build/{game}.atr'
                    image = bytearray(image_path.read_bytes())
                    for item, data in zip(assets.ASSETS_BY_GAME[game], edited):
                        if item['path'] == 'world/initial.txt':
                            offset = 16 + item['start'] - 0x0E80
                            image[offset:offset + len(data)] = data
                    image_path.write_bytes(image)
                (root / 'assets').mkdir()
            for game in assets.ASSETS_BY_GAME:
                root = repo / game
                expected = {path: (root / path).read_bytes()
                            for path in includes(game)}
                env = dict(os.environ)
                env['PYTHONPATH'] = os.pathsep.join(sys.path)
                for iteration in range(2):
                    result = subprocess.run([sys.executable, str(root / 'tools/decompile.py')],
                                            cwd=repo, env=env, capture_output=True, text=True)
                    self.assertEqual(result.returncode, 0, result.stderr)
                    source = (root / 'src/20-framework.fth').read_text('ascii')
                    for path, original in expected.items():
                        self.assertEqual(source.count('INCBIN ' + path + '\n'), 1)
                        self.assertEqual((root / path).read_bytes(), original)
                        if 'cursor' in path:
                            self.assertIn('INCBIN ' + path + '\nBYTES 7712\n', source)
                    self.assertEqual(list((root / 'assets').iterdir()), [])


if __name__ == '__main__':
    unittest.main()
