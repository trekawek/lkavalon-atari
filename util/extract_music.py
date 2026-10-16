#!/usr/bin/env python3
"""Export current music inputs; optionally compare them with the releases.

Outputs go to ignored build/music directories. Only Python's standard library
is required. CMC files retain their original Atari segment headers; Wladcy's
restored gameplay CMC includes six bytes from its runtime memory layout.
AD2044's native custom sound bank is wrapped in SAP containers.
The pure extraction helpers also support optional forensic reference disks.
"""

import argparse
import array
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import wave

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "ad2044/tools"))
import music_sap
import forth_assets
from reference_media import read_reference

REFERENCES = {
    "ad2044": (
        "ad2044-side1.atr",
        "0dc417788632b58822eefb25d50557465220870a15c984f2dd54e6a1591b445f",
    ),
    "klatwa": (
        "klatwa-v1.atr",
        "d28d336e4be5cd48d9bf03fac7d487e7a0cb69cc744e282cfe1eba1a0b6d7a95",
    ),
    "wladcy-ciemnosci": (
        "wladcy-ciemnosci.atr",
        "2e609a1514a05993f2b3daa6bf72273cb39a40afdaac49e917b09197eddd84c5",
    ),
}

# Offset includes the 16-byte ATR header. Resource length is the enclosing
# GAM record size, not necessarily the size in its embedded CMC header.
CMC_RECORDS = {
    "klatwa": (
        ("gameplay.cmc", 0xD98A, 0x690, 0x86B8, 0x8D3C, 2),
        ("title.cmc", 0xE01C, 0x6FE, 0x8D52, 0x9443, 4),
    ),
    "wladcy-ciemnosci": (
        ("gameplay.cmc", 0xD403, 0x76B, 0x854D, 0x8CB7, 2),
        ("title.cmc", 0xDB70, 0x69A, 0x8CB9, 0x92A8, 1),
    ),
}
CMC_SIGNATURE = bytes(c | 0x80 for c in b" cmc data file ")


def digest(data):
    return hashlib.sha256(data).hexdigest()


def extract_cmc(atr, filename, offset, resource_size, load, end, songs):
    """Extract a known GAM resource, rejecting unexpected headers or bounds."""
    if offset < 2 or offset + resource_size > len(atr):
        raise ValueError("CMC resource extends outside its disk")
    if int.from_bytes(atr[offset - 2 : offset], "little") != resource_size:
        raise ValueError("Unexpected GAM resource length")
    header = b"\xff\xff" + load.to_bytes(2, "little") + end.to_bytes(2, "little")
    if atr[offset : offset + 6] != header:
        raise ValueError("Unexpected CMC segment header")
    if atr[offset + 6 : offset + 21] != CMC_SIGNATURE:
        raise ValueError("Missing CMC signature")
    declared_size = end - load + 7
    copied = min(declared_size, resource_size)
    data = atr[offset : offset + copied]
    restoration = []
    if declared_size > resource_size:
        # Wladcy copies resource 12 to $8547..$8CB1. The last used pattern
        # continues through untouched $8CB2=$00 and $8CB3=$FF. The latter
        # is the first byte of the title file, still resident at $8CB3.
        # Original-player tracing confirms both bytes are read in song 1;
        # zero-filling instead changes the rendered audio. Retain the original
        # end address by restoring all six bytes observed in runtime RAM.
        if (offset, resource_size, load, end) != (0xD403, 0x76B, 0x854D, 0x8CB7):
            raise ValueError("Unsupported truncated CMC resource")
        title_header = atr[0xDB70:0xDB76]
        if title_header != bytes.fromhex("FFFFB98CA892"):
            raise ValueError("Missing adjacent title CMC header")
        data += b"\x00" + title_header[:5]
        restoration = [
            {
                "output_offset": copied,
                "ram_start": 0x8CB2,
                "hex": "00FFFFB98CA8",
                "provenance": (
                    "First byte is zero in both title and gameplay RAM captures; "
                    "next five are the retained title header from ATR offset $DB70. "
                    "Original player reads $8CB2=$00 and $8CB3=$FF in song 1."
                ),
            }
        ]
    if len(data) != declared_size:
        raise ValueError("CMC output does not match its segment header")
    return data, {
        "file": filename,
        "format": "CMC",
        "atr_offset": offset,
        "resource_length_offset": offset - 2,
        "resource_size": resource_size,
        "copied_bytes": copied,
        "excluded_resource_tail_bytes": resource_size - copied,
        "original_header_hex": header.hex().upper(),
        "load_address": load,
        "end_address_inclusive": end,
        "songs": songs,
        "subsong_indices": list(range(songs)),
        "restoration": restoration,
    }


def extract_game(game, atr):
    source_name, expected_hash = REFERENCES[game]
    if digest(atr) != expected_hash:
        raise ValueError(
            f"Unexpected reference disk for {game}: extraction is release-specific"
        )
    if game == "ad2044":
        files, details = music_sap.extract(atr)
        tracks = [
            {"file": "title.sap", "format": "SAP", "songs": 1},
            {"file": "game-over.sap", "format": "SAP", "songs": 1},
            {"file": "sound-effects.sap", "format": "SAP", "songs": 20},
            {"file": "sound-bank.bin", "format": "raw custom sound bank"},
        ]
    else:
        files, tracks = {}, []
        for record in CMC_RECORDS[game]:
            data, metadata = extract_cmc(atr, *record)
            files[record[0]] = data
            tracks.append(metadata)
        details = {
            "player_command_entry": 0x3003,
            "player_frame_entry": 0x3006,
            "timing": "PAL, one call per video frame",
            "initialization": "A=$70, X/Y=data address; then A=$00, X=subsong index",
            "note": "Subsong counts independently verified with ASAP 8.0.0",
        }
    for track in tracks:
        track["size"] = len(files[track["file"]])
        track["sha256"] = digest(files[track["file"]])
    manifest = {
        "game": game,
        "source": f"reference/{source_name}",
        "source_sha256": expected_hash,
        "offset_convention": "Zero-based file offsets include the 16-byte ATR header",
        "files": tracks,
        "details": details,
    }
    files["extraction.json"] = (json.dumps(manifest, indent=2) + "\n").encode("ascii")
    return files, manifest


def validate_asap(executable, files, manifest):
    """Have an independent player load and render every exported subsong.

    Three minutes cover every CMC loop in these games (the longest is 103s).
    Effects need only 12s. Rendered audio is temporary, never checked in.
    """
    with tempfile.TemporaryDirectory(prefix="atari-music-") as directory:
        temp = Path(directory)
        for track in manifest["files"]:
            if track["format"] not in ("CMC", "SAP"):
                continue
            filename = track["file"]
            source = temp / filename
            source.write_bytes(files[filename])
            if track["format"] == "CMC":
                sap = temp / (source.stem + "-converted.sap")
                subprocess.run([executable, "-o", str(sap), str(source)], check=True)
                header = sap.read_bytes().split(b"\xff\xff", 1)[0]
            else:
                header = files[filename].split(b"\xff\xff", 1)[0]
            songs = next(
                (
                    int(line[6:])
                    for line in header.splitlines()
                    if line.startswith(b"SONGS ")
                ),
                1,
            )
            if songs != track["songs"]:
                raise ValueError(
                    f"{filename}: expected {track['songs']} songs, ASAP found {songs}"
                )
            pattern = temp / (source.stem + "-%s.wav")
            duration = "00:12" if filename == "sound-effects.sap" else "03:00"
            subprocess.run(
                [
                    executable,
                    "-o",
                    str(pattern),
                    "-t",
                    duration,
                    "-R",
                    "8000",
                    str(source),
                ],
                check=True,
            )
            rendered = sorted(temp.glob(source.stem + "-*.wav"))
            if len(rendered) != songs:
                raise ValueError(f"{filename}: not all subsongs were rendered")
            for output in rendered:
                with wave.open(str(output), "rb") as wav:
                    if wav.getsampwidth() != 2 or wav.getnframes() == 0:
                        raise ValueError(
                            f"{output.name}: unexpected or empty PCM output"
                        )
                    samples = array.array("h", wav.readframes(wav.getnframes()))
                if sys.byteorder != "little":
                    samples.byteswap()
                if max(samples) - min(samples) < 100:
                    raise ValueError(f"{output.name}: silent output")
                output.unlink()
            print(f"ASAP: {manifest['game']}/{filename}: {songs} subsong(s) rendered")


def build_music(game):
    """Generate listening/export files from the current editable inputs."""
    root = ROOT / game
    if game == "ad2044":
        bank = forth_assets.read_asset(root, "music/ad2044.snd")
        effects = [command for command, _ in music_sap.COMMANDS if command not in (0x19, 0x50)]
        files = {
            "sound-bank.bin": bank,
            "title.sap": music_sap._sap(bank, [0x50], "A.D. 2044 - title and ending"),
            "game-over.sap": music_sap._sap(bank, [0x19], "A.D. 2044 - game over"),
            "sound-effects.sap": music_sap._sap(bank, effects, "A.D. 2044 - sound effects"),
        }
        manifest = {
            "game": game,
            "build_inputs": ["music/ad2044.snd"],
            "files": [
                {"file": "title.sap", "format": "SAP", "songs": 1},
                {"file": "game-over.sap", "format": "SAP", "songs": 1},
                {"file": "sound-effects.sap", "format": "SAP", "songs": len(effects)},
                {"file": "sound-bank.bin", "format": "raw custom sound bank"},
            ],
        }
    else:
        manifest = json.loads((root / "music/extraction.json").read_text("ascii"))
        files = {name: (root / "music" / name).read_bytes()
                 for name, *_ in CMC_RECORDS[game]}
        manifest["provenance_note"] = "Source disk fields describe the historical release; file hashes describe the current build inputs."
        manifest["build_inputs"] = ["music/" + name for name in files]
    for track in manifest["files"]:
        track["size"] = len(files[track["file"]])
        track["sha256"] = digest(files[track["file"]])
    files["extraction.json"] = (json.dumps(manifest, indent=2) + "\n").encode("ascii")
    return files, manifest


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--game", choices=tuple(REFERENCES), help="default: all three games"
    )
    parser.add_argument(
        "--check", action="store_true", help="compare exports without writing"
    )
    parser.add_argument(
        "--asapconv", help="optionally validate with this ASAP converter executable"
    )
    args = parser.parse_args()
    for game in ([args.game] if args.game else REFERENCES):
        source = ROOT / game / "reference" / REFERENCES[game][0]
        files, manifest = build_music(game)
        output = ROOT / game / "build/music"
        if args.check:
            original, _ = extract_game(game, read_reference(source))
            for filename, data in original.items():
                if game == "ad2044" and filename == "extraction.json":
                    continue
                actual = ((ROOT / game / "music/extraction.json").read_bytes()
                          if filename == "extraction.json" else files[filename])
                if actual != data:
                    raise SystemExit(f"Encoded music differs from original: {game}/{filename}")
        else:
            output.mkdir(parents=True, exist_ok=True)
        for filename, data in files.items():
            target = output / filename
            if not args.check:
                target.write_bytes(data)
        print(
            f"{game}: {'checked' if args.check else 'exported'} {len(files) - 1} music/bank files"
        )
        if args.asapconv:
            validate_asap(args.asapconv, files, manifest)


if __name__ == "__main__":
    main()
