#!/usr/bin/env python3
"""Verify the executable and freshly authored resources, without original ATRs.

The released executable occupies 33959 physical bytes, including the boot
loader's duplicated continuation window. Its digest deliberately excludes all
resource sectors, disk padding and retired editor material. Authored resources
are checked against a fresh content build, never against a historical image.
"""

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROGRAM_START = 16
PROGRAM_END = 0x84B7
PROGRAM_BYTES = PROGRAM_END - PROGRAM_START
# Supplied AD2044 v1 side-one executable, including its initial boot-copy patches.
PROGRAM_SHA256 = "a2cc4ea23f7898a12a94930a38850b3d188e3755ff62b5b6daca20fbd0c07041"
ATR_SIZE = 16 + 1040 * 128


def validate_atr(image):
    if len(image) != ATR_SIZE or image[:6] != bytes.fromhex("960280208000"):
        raise ValueError("Expected a 1040-sector, 128-byte-sector game ATR")


def verify_program(image, expected_digest=PROGRAM_SHA256):
    """Check only executable bytes; changed asset layout/padding is permitted."""
    validate_atr(image)
    actual = hashlib.sha256(image[PROGRAM_START:PROGRAM_END]).hexdigest()
    if actual != expected_digest:
        raise ValueError(f"The {PROGRAM_BYTES}-byte executable changed: {actual}")
    return actual


def program_memory(image):
    """Map a verified built executable as the actual two-stage loader does."""
    verify_program(image)
    memory = bytearray(65536)
    memory[0x0E80:0x8D80] = image[16:0x7F10]
    memory[0x8CA0:0x9247] = image[0x7F10:PROGRAM_END]
    return memory


def verify_resources(compiled, side2, template, expected_side2):
    """Check compiled media against current source-generated resource images."""
    for image in (compiled, side2, template, expected_side2):
        validate_atr(image)
    if any(template[PROGRAM_START:PROGRAM_END]):
        raise ValueError("The resource template contains executable bytes")
    if compiled[:16] != template[:16] or compiled[PROGRAM_END:] != template[PROGRAM_END:]:
        raise ValueError("Compiled side one differs from its authored resource template")
    if side2 != expected_side2:
        raise ValueError("Built side two differs from the current authored resources")
    if compiled[15] or side2[15]:
        raise ValueError("Built game disks must be writable for saved games")


def verify(root=ROOT):
    root = Path(root)
    manifest = json.loads((root / "sources.json").read_text("ascii"))
    for name in manifest["sources"]:
        source = (root / name).read_bytes()
        source.decode("ascii")
        if any(len(line) > 64 for line in source.splitlines()):
            raise ValueError(f"Forth source exceeds 64 columns: {name}")
    # Import only when verifying a full build; pure executable tests need no
    # asset parser, decompiler, extracted catalog or historical disk fixture.
    import content
    expected = content.build_disks(root)
    compiled = (root / "build/ad2044-side1.atr").read_bytes()
    side2 = (root / "build/ad2044-side2.atr").read_bytes()
    template = (root / "build/assets-side1.atr").read_bytes()
    if template != expected["build/assets-side1.atr"]:
        raise ValueError("Resource template is stale; rebuild the authored content")
    verify_program(compiled)
    verify_resources(compiled, side2, template, expected["build/ad2044-side2.atr"])
    report_path = root / "build/program/compile-report.json"
    if report_path.exists():
        report = json.loads(report_path.read_text("ascii"))
        if report["sector_writes"] != 266:
            raise ValueError(f"Unexpected number of compiler sector writes: {report['sector_writes']}")
    return {"program_bytes": PROGRAM_BYTES, "program_sha256": PROGRAM_SHA256,
            "resources_match_authored_inputs": True}


def main():
    verify()
    print(f"PASS: ASCII Forth sources and all {PROGRAM_BYTES} original executable bytes.")
    print("PASS: both disks contain the current authored resources; program template is blank.")


if __name__ == "__main__":
    main()
