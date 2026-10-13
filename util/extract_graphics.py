#!/usr/bin/env python3
"""Recover graphics assets and PNG previews from the three Forth game releases.

Extraction uses Python's standard library. The per-game helpers document the
actual resource and compression formats; no emulator or external image tool
is required to reproduce the exports. Generated exports go to build/graphics;
canonical graphics and structured sources are never overwritten.
"""

import argparse
import hashlib
import html
import importlib.util
import json
from pathlib import Path

import graphics_common
import pack_assets
import structured_assets
from reference_media import read_reference

ROOT = Path(__file__).resolve().parents[1]
REFERENCES = {
    "ad2044": (
        (
            "ad2044-side1.atr",
            "0dc417788632b58822eefb25d50557465220870a15c984f2dd54e6a1591b445f",
        ),
        (
            "ad2044-side2.atr",
            "62bdb56d34961021a0e458b0829b75e97c455f0fa31bfa391cbae28913cbb6fd",
        ),
    ),
    "klatwa": (
        (
            "klatwa-v1.atr",
            "d28d336e4be5cd48d9bf03fac7d487e7a0cb69cc744e282cfe1eba1a0b6d7a95",
        ),
    ),
    "wladcy-ciemnosci": (
        (
            "wladcy-ciemnosci.atr",
            "2e609a1514a05993f2b3daa6bf72273cb39a40afdaac49e917b09197eddd84c5",
        ),
    ),
}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def load_helper(game):
    spec = importlib.util.spec_from_file_location(
        game.replace("-", "_") + "_graphics", ROOT / game / "tools/graphics.py"
    )
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def gallery(game, previews):
    cards = []
    for filename in previews:
        label = html.escape(filename)
        url = html.escape(filename, quote=True)
        cards.append(
            f'<figure><a href="{url}"><img loading="lazy" src="{url}" alt="{label}"></a>'
            f'<figcaption><a href="{url}">{label}</a></figcaption></figure>'
        )
    return (
        '<!doctype html>\n<html lang="en"><meta charset="utf-8">'
        '<meta name="viewport" content="width=device-width,initial-scale=1">'
        f"<title>{html.escape(game)} extracted graphics</title>"
        "<style>body{font:16px system-ui,sans-serif;background:#17191d;color:#eee;margin:24px}"
        "a{color:#a7caff}main{display:grid;grid-template-columns:repeat(auto-fill,minmax(330px,1fr));gap:16px}"
        "figure{margin:0;padding:12px;background:#24262a;overflow-wrap:anywhere}"
        "img{image-rendering:pixelated;max-width:100%;height:auto;min-height:24px}"
        "figcaption{margin-top:12px;font-size:13px}</style>"
        f"<h1>{html.escape(game)} graphics</h1>"
        "<p>Extracted assets and static scene previews. Atari bitmap pixels are displayed at their "
        "original wide-pixel aspect. Grayscale assets have no independently established palette; "
        "see each asset's metadata. Scenes show the base room state, before runtime changes.</p>"
        '<p><a href="extraction.json">Formats, source offsets, palette evidence and file checksums</a></p>'
        "<main>" + "\n".join(cards) + "</main></html>\n"
    ).encode("utf-8")


def extract_game(game, disks):
    if len(disks) != len(REFERENCES[game]):
        raise ValueError(f"Wrong number of reference disks for {game}")
    sources = []
    for (name, expected), disk in zip(REFERENCES[game], disks):
        if digest(disk) != expected:
            raise ValueError(
                f"Unexpected reference disk {name}: extraction is release-specific"
            )
        sources.append({"file": f"reference/{name}", "sha256": expected})
    files, details = load_helper(game).extract(*disks)
    for filename in files:
        path = Path(filename)
        if path.is_absolute() or ".." in path.parts:
            raise ValueError(f"Invalid export path: {filename}")

    def preview_order(name):
        if name == "title.png":
            return 0, name
        if name.startswith(("rooms/", "scenes/")):
            return 1, name
        if name.startswith("fonts/"):
            return 2, name
        return 3, name

    previews = sorted(
        (name for name in files if name.endswith(".png")), key=preview_order
    )
    # Paginate so a game with hundreds of small overlays remains browsable.
    sheets = []
    for start in range(0, len(previews), 60):
        selected = previews[start : start + 60]
        filename = f"contact-sheets/{start // 60 + 1:02d}.png"
        files[filename] = graphics_common.contact_sheet(
            [files[name] for name in selected]
        )
        sheets.append({"file": filename, "previews_in_reading_order": selected})
    scenes = [name for name in previews if name.startswith(("rooms/", "scenes/"))]
    if scenes:
        files["rooms-overview.png"] = graphics_common.contact_sheet(
            [files[name] for name in scenes], cell_height=72
        )
        sheets.insert(
            0, {"file": "rooms-overview.png", "previews_in_reading_order": scenes}
        )
    files["index.html"] = gallery(game, previews)
    manifest = {
        "game": game,
        "sources": sources,
        "offset_convention": "Zero-based ATR file offsets include the 16-byte header",
        "preview_palette": {
            "file": "../../util/atari800-pal.pal",
            "source": "Full PLTE from all three existing Atari800 5.2.0 PAL first-room screenshots",
            "sha256": digest((ROOT / "util/atari800-pal.pal").read_bytes()),
            "note": "Original GTIA register values are preserved separately; RGB colors are an emulator approximation",
        },
        "details": details,
        "contact_sheets": sheets,
        "files": [
            {"file": name, "size": len(data), "sha256": digest(data)}
            for name, data in sorted(files.items())
        ],
    }
    files["extraction.json"] = (
        json.dumps(manifest, indent=2, ensure_ascii=True) + "\n"
    ).encode("ascii")
    return files, manifest


def check_exports(game, files, disks):
    """Check retained views and the structured replacements of old exports.

    Removed raw hit maps and duplicate group containers are checked through
    their complete re-encoded disk spans. They must be explicitly accounted
    for in the migration catalog, so a missing genuine graphic still fails.
    """
    root = ROOT / game
    catalog = root / "assets/binary-migration.json"
    migrations = json.loads(catalog.read_text("ascii"))["files"] if catalog.exists() else {}
    for filename, data in files.items():
        relative = "graphics/" + filename
        target = root / relative
        if target.is_file():
            if target.read_bytes() != data:
                raise ValueError(f"Export differs: {target}")
            continue
        entry = migrations.get(relative)
        if not entry:
            raise ValueError(f"Export is missing and has no replacement: {target}")
        source = root / entry["source"]
        if not source.exists():
            raise ValueError(f"Migration source is missing: {source}")
        if entry["disposition"] in ("structured-source", "renamed-font", "duplicate-font"):
            encoded = structured_assets.encode_file(root, entry["source"])
            if encoded != data:
                raise ValueError(f"Structured export differs: {source}")
    layout = pack_assets.load_manifest(root)
    templates = pack_assets.build_disks(root, layout)
    for spec, disk in zip(layout["disks"], disks, strict=True):
        start = 16 + spec["compiled_prefix_bytes"]
        if templates[spec["output"]][start:] != disk[start:]:
            raise ValueError(f"Structured graphics/data differ from release disk: {game}/{spec['output']}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--game", choices=tuple(REFERENCES), help="default: all three games"
    )
    parser.add_argument(
        "--check", action="store_true", help="compare existing exports without writing"
    )
    args = parser.parse_args()
    for game in ([args.game] if args.game else REFERENCES):
        disks = [
            read_reference(ROOT / game / "reference" / name)
            for name, _ in REFERENCES[game]
        ]
        files, _ = extract_game(game, disks)
        output = ROOT / game / "build/graphics"
        if args.check:
            check_exports(game, files, disks)
        for filename, data in files.items():
            target = output / filename
            if not args.check:
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(data)
        previews = sum(
            name.endswith(".png") and not name.startswith("contact-sheets/")
            for name in files
        )
        print(
            f"{game}: {'checked' if args.check else 'extracted'} {previews} previews, {len(files)} files"
        )


if __name__ == "__main__":
    main()
