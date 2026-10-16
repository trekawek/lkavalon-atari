"""The boot-loaded executables of Klatwa and Wladcy Ciemnosci.

The historical disks saved 250 program sectors, but the Atari loader reads
only 244 / 242. The remaining retired definitions are not build inputs.
These digests cover every loaded byte, including the final sector's padding;
resource locations, free sectors and saved games are deliberately excluded.
"""

import hashlib
import struct

ORIGIN = 0x0E80
ATR_SIZE = 16 + 1040 * 128
PROGRAMS = {
    "klatwa": (244, "2b3c6e12f8e5a6063337eb08a0a9cd32187f85b57d438a518731e386cede5fb1"),
    "wladcy-ciemnosci": (242, "dfd31db565887ed710980397d3e0b05a3cb1233ab9f9cf5bd5aba0e16923e629"),
}
# Target address, extent, and digest of the remaining loaded program bytes.
# These omit only the authored initial-world span, including its generated
# dictionary headers; the span itself must still match its current sources.
WORLDS = {
    "klatwa": (0x5562, 881, "af8f70f3e8ef51ee5b3a6e4653b1ea6ca891065490630acd2a78cfa693828e90"),
    "wladcy-ciemnosci": (0x5502, 888, "33862d9ecd1530dfad8eacbbca69bc120773fef2b1cfaa8332cde5cc7b961e0f"),
}


def empty_disk():
    image = bytearray(ATR_SIZE)
    struct.pack_into("<HHH", image, 0, 0x296, 1040 * 8, 128)
    return bytes(image)


def boot_bytes(game):
    return PROGRAMS[game][0] * 128


def validate_atr(image):
    if len(image) != ATR_SIZE or image[:6] != bytes.fromhex("960280208000"):
        raise ValueError("Expected a 1040-sector, 128-byte-sector game ATR")


def verify_program(image, game, expected_world=None):
    validate_atr(image)
    program = image[16:16 + boot_bytes(game)]
    actual = hashlib.sha256(program).hexdigest()
    if expected_world is None:
        if actual != PROGRAMS[game][1]:
            raise ValueError(f"{game}: the {boot_bytes(game)}-byte executable changed: {actual}")
    else:
        address, size, code_digest = WORLDS[game]
        start = address - ORIGIN
        if len(expected_world) != size or program[start:start + size] != expected_world:
            raise ValueError(f"{game}: compiled initial world differs from its authored sources")
        code = program[:start] + program[start + size:]
        if hashlib.sha256(code).hexdigest() != code_digest:
            raise ValueError(f"{game}: executable code outside the initial world changed")
    return actual


def verify_authored_program(image, root):
    from pathlib import Path
    from gam_world import encode_world

    root = Path(root)
    return verify_program(image, root.name, encode_world(root))


def program_memory(image, game, expected_world=None):
    """Map the verified program exactly as the Atari boot loader does."""
    verify_program(image, game, expected_world)
    memory = bytearray(65536)
    memory[ORIGIN:ORIGIN + boot_bytes(game)] = image[16:16 + boot_bytes(game)]
    return memory


if __name__ == "__main__":
    import argparse
    from pathlib import Path

    parser = argparse.ArgumentParser(description="Create a blank target disk for the Forth compiler.")
    parser.add_argument("--empty-disk", type=Path, required=True)
    destination = parser.parse_args().empty_disk
    destination.parent.mkdir(parents=True, exist_ok=True)
    data = empty_disk()
    if not destination.exists() or destination.read_bytes() != data:
        destination.write_bytes(data)
