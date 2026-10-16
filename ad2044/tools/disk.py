#!/usr/bin/env python3
"""Allocate AD2044 GAM groups into fresh writable Atari disk images.

Only group numbers are part of the executable's disk interface. Resource groups
are placed consecutively and rounded to sectors; physical sector500 contains
the generated directory and is skipped by every group. Boot groups stay fixed
because READ-BOOT-TAIL uses physical sectors255..266 directly.
"""

from collections.abc import Mapping
import struct

SECTOR_SIZE = 128
SECTOR_COUNT = 1040
DIRECTORY_SECTOR = 500
COMPILED_PREFIX_BYTES = 33959
GROUP_COUNTS = {1: 25, 2: 23}
OUTPUTS = {1: "build/assets-side1.atr", 2: "build/ad2044-side2.atr"}
FIXED_COUNTS = {(1, 1): 255, (1, 2): 25}
FIXED_DATA_LENGTHS = {(1, 19): 896, (1, 20): 896,
                      (1, 21): 4608, (1, 23): 4608}
# BLOAD's nominal 80-sector limit exceeds the actual live workspaces. During
# gameplay COMPOSE-PICTURE-OVERLAY ($52A1) expands each overlay at $A4E8 while
# the resource collection must remain intact for later images and actions.
# CLEAR-RESOURCE-BUFFER clears through $A8FC, but that is not usable asset space.
# The title has no overlay composition: its bitmap expands directly to ADGR.
OVERLAY_BASE = 0xA4E8
TITLE_RESOURCE_END = 0xA8FC
TITLE_BASE = 0x96C8
GAME_BASE = 0x9150


def allocations(groups):
    """Validate supplied group bodies and derive their physical-sector placement.

    Missing nonboot entries are empty one-sector groups, retaining every numeric
    index. The content builder supplies both state images and inventory copies;
    provided state/cache bodies must have the executable's exact transfer sizes.
    """
    if not isinstance(groups, Mapping):
        raise ValueError("Expected group bodies keyed by (side, group)")
    for key, data in groups.items():
        if (not isinstance(key, tuple) or len(key) != 2
                or any(type(n) is not int for n in key)):
            raise ValueError(f"Invalid group key {key!r}")
        side, number = key
        if side not in GROUP_COUNTS or not 1 <= number <= GROUP_COUNTS[side]:
            raise ValueError(f"Unsupported disk/group {key!r}")
        if key in FIXED_COUNTS:
            raise ValueError("The Forth compiler owns side-one boot groups1/2")
        if not isinstance(data, (bytes, bytearray)):
            raise ValueError(f"Group {key}: expected encoded bytes")
        if key in FIXED_DATA_LENGTHS and len(data) != FIXED_DATA_LENGTHS[key]:
            raise ValueError(f"Group {key}: expected exactly {FIXED_DATA_LENGTHS[key]} bytes")
    result = []
    for side, last_group in GROUP_COUNTS.items():
        logical = 1
        for number in range(1, last_group + 1):
            key = side, number
            data = bytes(groups.get(key, b""))
            count = FIXED_COUNTS.get(key, max(1, (len(data) + SECTOR_SIZE - 1) // SECTOR_SIZE))
            if count > 255:
                raise ValueError(f"Group {key}: directory count exceeds255 sectors")
            if key not in FIXED_COUNTS:
                if key == (1, 3):
                    base, end = TITLE_BASE, TITLE_RESOURCE_END
                else:
                    base, end = GAME_BASE, OVERLAY_BASE
                limit = (end - base) // SECTOR_SIZE
                if count > limit:
                    raise ValueError(f"Group {key}: {count} sectors exceeds the {limit}-sector RAM workspace")
            sectors = [n + (n >= DIRECTORY_SECTOR) for n in range(logical, logical + count)]
            if sectors[-1] > SECTOR_COUNT:
                raise ValueError(f"Side {side}: resource groups exceed {SECTOR_COUNT} sectors")
            result.append({"side": side, "group": number, "data": data,
                           "sector_count": count, "sectors": sectors})
            logical += count
    return result


def build_disks(groups):
    """Return two full ATR images with blank program space and generated padding."""
    layout = allocations(groups)
    result = {}
    for side, output in OUTPUTS.items():
        image = bytearray(16 + SECTOR_SIZE * SECTOR_COUNT)
        struct.pack_into("<HHH", image, 0, 0x0296, SECTOR_SIZE * SECTOR_COUNT // 16, SECTOR_SIZE)
        directory = 16 + (DIRECTORY_SECTOR - 1) * SECTOR_SIZE
        image[directory] = side
        for group in (entry for entry in layout if entry["side"] == side):
            image[directory + group["group"]] = group["sector_count"]
            data = group["data"]
            for index, sector in enumerate(group["sectors"]):
                chunk = data[index*SECTOR_SIZE:(index+1)*SECTOR_SIZE]
                start = 16 + (sector - 1) * SECTOR_SIZE
                image[start:start + len(chunk)] = chunk
        result[output] = bytes(image)
    return result


def describe(groups):
    """Return a generated packing report; this is never an input manifest."""
    output = ["Side Group Bytes Sectors Physical sectors", "---- ----- ----- ------- ----------------"]
    for entry in allocations(groups):
        sectors = entry["sectors"]
        where = str(sectors[0]) if len(sectors) == 1 else f"{sectors[0]}..{sectors[-1]}"
        if sectors[0] < DIRECTORY_SECTOR < sectors[-1]:
            where += " (skip500)"
        output.append(f"{entry['side']:4d} {entry['group']:5d} {len(entry['data']):5d} "
                      f"{entry['sector_count']:7d} {where}")
    return "\n".join(output) + "\n"
