"""Read compact, name-free dictionary signatures for forensic cross-game matching.

These retain exactly the fields used by the GAM recovery sequence matcher.
Names and their evidence remain in each game's tools/names.json. No generated
full dictionary catalog or original game image is needed to read signatures.
"""

from pathlib import Path


def read(path):
    """Return dictionary-shaped records accepted by the existing signature helper."""
    rows = []
    header = False
    previous = -1
    for number, line in enumerate(Path(path).read_text("ascii").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        if not header:
            if line != "cfa\tflags\tsuffix\tcode\tbody_bytes":
                raise ValueError(f"{path}:{number}: invalid signature header")
            header = True
            continue
        try:
            cfa, flags, suffix, code, size = line.split("\t")
            cfa, flags, code, size = int(cfa, 16), int(flags, 16), int(code, 16), int(size)
            suffix = "" if suffix == "--" else chr(int(suffix, 16))
            if (not previous < cfa <= 65533 or not 0 <= flags <= 255
                    or not 0 <= code <= 65535 or not 0 <= size <= 65536 - cfa - 2
                    or suffix and not 0 <= ord(suffix) < 128):
                raise ValueError("signature fields out of range or CFAs not increasing")
        except (ValueError, OverflowError) as exc:
            raise ValueError(f"{path}:{number}: invalid runtime signature: {exc}") from exc
        rows.append({"cfa": cfa, "pfa": cfa + 2, "end": cfa + 2 + size,
                     "flags": flags, "suffix": suffix, "code": code})
        previous = cfa
    if not header or not rows:
        raise ValueError(f"{path}: empty runtime signature table")
    return rows
