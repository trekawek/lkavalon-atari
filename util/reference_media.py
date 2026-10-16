"""Resolve optional forensic media without making binary snapshots build inputs.

The compiler is rebuilt from util/figforth text when its generated ATR is absent.
Game comparisons prefer an optional build/reference fixture. Without one, an
older complete reconstruction is usable only after matching historical SHA-256;
AD2044's writable ATR flag is normalized for this comparison. Modified builds
therefore cannot silently serve as their own correctness oracle. Current builds
generate fresh resource allocation and require original fixtures for forensics.
"""

import hashlib
import json
from pathlib import Path

import build_figforth

GAMES = {'ad2044', 'klatwa', 'wladcy-ciemnosci'}
OUTPUT_NAMES = {'klatwa-v1.atr': 'klatwa.atr'}


def read_reference(path):
    """Read an explicit path, optional original, or independently verified build.

    Project reference paths must have the form GAME/reference/NAME. Arbitrary
    explicit paths remain useful for command-line imports and synthetic tests.
    No branch downloads media or falls back to an unchecked game build.
    """
    path = Path(path)
    if path.parent.name != 'reference':
        return path.read_bytes()
    game_root = path.parent.parent
    if game_root.name not in GAMES:
        return path.read_bytes()
    if path.name == 'figforth.atr':
        return path.read_bytes() if path.exists() else build_figforth.build()
    manifest_path = game_root / 'reference/sources.json'
    if not manifest_path.exists() and path.exists():
        # An explicitly supplied forensic file in a temporary import tree.
        return path.read_bytes()
    manifest = json.loads(manifest_path.read_text('ascii'))
    matches = [entry for entry in manifest['references'] if entry['file'] == path.name]
    if len(matches) != 1:
        raise ValueError(f'No unique historical reference metadata for {path.name}')
    entry = matches[0]
    fixture = game_root / 'build/reference' / path.name
    built = game_root / 'build' / OUTPUT_NAMES.get(path.name, path.name)
    if path.exists():
        selected = path
    elif fixture.exists():
        selected = fixture
    elif built.exists():
        selected = built
    else:
        raise FileNotFoundError(
            f'{path.name}: supply optional original fixture {fixture}; current fresh disks are not historical references'
        )
    raw = selected.read_bytes()
    if selected == built and game_root.name == 'ad2044' and len(raw) >= 16:
        normalized = bytearray(raw)
        normalized[15] = 1  # Original historical ATR marked both sides protected.
        raw = bytes(normalized)
    if len(raw) != entry['size'] or hashlib.sha256(raw).hexdigest() != entry['sha256']:
        raise ValueError(
            f'{selected}: does not match historical reference; edited builds require an original fixture'
        )
    return raw
