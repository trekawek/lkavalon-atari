"""Runtime bounds for the unchanged Klątwa/Władcy executables.

The disk directory permits larger transfers than the physical workspaces do.
Check generated records at the buffers that actually receive them, including
initial room/view composition. Puzzle-created future object combinations are
game logic and are not exhaustively simulated by these static checks.
"""

from pathlib import Path
import shlex

import gam_assets
import gam_world


def records(data, label):
    result, position = [], 0
    while position + 2 <= len(data):
        size = int.from_bytes(data[position:position + 2], "little")
        position += 2
        if not size:
            if any(data[position:]):
                raise ValueError(f"{label}: bytes after record terminator")
            return result
        end = position + size
        if end > len(data):
            raise ValueError(f"{label}: truncated record {len(result)}")
        result.append(data[position:end])
        position = end
    if position != len(data):
        raise ValueError(f"{label}: incomplete record header")
    return result


def _bounded(length, maximum, label):
    if length > maximum:
        raise ValueError(f"{label}: {length} bytes exceeds {maximum}-byte runtime buffer")


def _scene_collections(path, count):
    """Selectors store an index into stage resource zero, after object+200.

    Read the authored rows because subsequent handler metadata has no common
    length prefix. The engine retains original duplicate selectors and searches
    their bytes in order; they must not be collapsed into a dictionary here.
    """
    for number, line in enumerate(path.read_text("utf-8").splitlines(), 1):
        fields = shlex.split(line, comments=True)
        if not fields:
            continue
        if len(fields) < 3 or fields[0] != "object":
            raise ValueError(f"{path}:{number}: expected object zone collection")
        collection = int(fields[2])
        if not 0 <= collection < count:
            raise ValueError(f"{path}:{number}: action collection {collection} does not exist in this stage")


def _picture(body, label, viewport=True, height_limit=112):
    if len(body) < 4:
        raise ValueError(f"{label}: missing picture geometry")
    x, y, width, height = body[:4]
    _, used = gam_assets.decompress_rle(body[4:], width, height)
    if used + 4 != len(body):
        raise ValueError(f"{label}: bytes after packed picture")
    if viewport and (x + width > 40 or y + height > height_limit):
        raise ValueError(f"{label}: picture exceeds the 160-by-{height_limit} Atari bitmap")
    return x, y, width, height


def _mask(body, label):
    if len(body) < 2:
        raise ValueError(f"{label}: missing hit-map dimensions")
    width, height = body[:2]
    _, used = gam_assets.decompress_rle(body[2:], width, height)
    if used + 2 != len(body):
        raise ValueError(f"{label}: bytes after packed hit map")
    return width, height


def validate_groups(root, groups):
    root = Path(root)
    game = root.name
    klatwa = game == "klatwa"
    if game not in gam_world.PROFILES:
        raise ValueError(f"Unknown GAM game: {game}")
    profile = gam_world.PROFILES[game]
    first_stage_last = 22 if klatwa else 15
    scene_cache = 800 if klatwa else 672  # $A3E0/$A460 .. display list $A700.
    title_cache = 1712 if klatwa else 672  # K changes RESOURCE-BASE for title.
    item_limit = 1830 if klatwa else 5000  # Item base .. base hit map.
    room_limit = 120 if klatwa else 95    # Room descriptor .. action scratch.
    action_limit = 360 if klatwa else 45  # Action scratch .. item bank.
    zoom_mask_limit = 182 if klatwa else 185  # Zoom hit map .. item staging.
    for group in (3, 4, 6):
        limit = 0x36EA if klatwa and group != 3 else 0x3800
        _bounded(len(groups[group]), limit, f"Group {group} banked RAM")
    for group in (5, 7):
        _bounded(len(groups[group]), item_limit, f"Group {group} item bank before hit-map RAM")
        # Its final partial sector may overwrite the not-yet-drawn base hit map.
        # Live records must finish before that map, unlike unused zero padding.
    if len(groups[8]) != 896:
        raise ValueError("Save group must contain exactly seven 128-byte sectors")

    resources = {g: records(groups[g], f"group {g}") for g in range(3, 8)}
    title = resources[3]
    if len(title) != 14:
        raise ValueError("Title group requires resource IDs 0..13")
    font_bytes = 1023 if klatwa else 1024
    if len(title[7]) != font_bytes or len(title[8]) != font_bytes:
        raise ValueError(f"Fonts must contain exactly {font_bytes} bytes")
    if klatwa:
        _bounded(len(title[10]), 0x9752 - 0x8D52, "Player sprite bank")
    directions = records(title[10], "player directions")
    if len(directions) != 4:
        raise ValueError("Player sprite bank needs four directions")
    for direction, body in enumerate(directions):
        frames = records(body, f"player direction {direction}")
        if len(frames) != 5:
            raise ValueError("Each player direction needs five frames")
        for frame in frames:
            if len(frame) < 4 or len(frame) != 4 + frame[2] * frame[3]:
                raise ValueError("Player frame geometry differs from its pixels")
            # Movement's fixed saved rectangle is 5 bytes by 54 rows.
            if frame[0] + frame[2] > 5 or frame[1] + frame[3] > 54:
                raise ValueError("Player frame exceeds its fixed composition rectangle")
    for resource in range(2, 7):
        _bounded(len(title[resource]), title_cache, f"Title art {resource}")
        for frame, body in enumerate(records(title[resource], f"title {resource}")):
            _picture(body, f"Title art {resource}/{frame}")
    # K fetches the entire page collection into the title cache; W fetches pages.
    if klatwa:
        _bounded(len(title[9]), title_cache, "Title page collection")
    else:
        for index, page in enumerate(records(title[9], "title pages")):
            _bounded(len(page), title_cache, f"Title page {index}")

    pictures, masks = {}, {}
    for group in (4, 6):
        stage = (group - 2) // 2
        scene = resources[group]
        actions = records(scene[0], f"stage {stage} actions")
        if len(actions) < 2:
            raise ValueError(f"Stage {stage}: default action collection 1 is required")
        for index, collection in enumerate(actions):
            _bounded(len(collection), action_limit, f"Stage {stage} action collection {index}")
        for room in range(1, profile["rooms"]):
            if (room <= first_stage_last) == (stage == 1):
                _scene_collections(root / f"rooms/{room:02d}/actions.txt", len(actions))
        for index, room in enumerate(records(scene[1], f"stage {stage} rooms")):
            _bounded(len(room), room_limit, f"Room {index + 1} descriptor")
        _bounded(len(scene[2]), scene_cache, f"Stage {stage} zoom border")
        _picture(scene[2], f"Stage {stage} zoom border")
        for resource, body in enumerate(scene[3:], 3):
            if len(body) == 1:  # Explicit unavailable image state.
                continue
            _bounded(len(body), scene_cache, f"Stage {stage} shared art {resource}")
            if klatwa and group == 6 and resource >= 46:
                # Four stage-two message banks occupy IDs 46..49 in K.
                continue
            variants = records(body, f"stage {stage} shared art {resource}")
            for variant, data in enumerate(variants):
                if len(data) == 1:
                    continue
                key = stage, resource, variant
                if variant % 2:
                    masks[key] = _mask(data, f"Stage {stage} hit map {resource}/{variant}")
                else:
                    # K's original art draws two rows beyond its 112-row preview.
                    pictures[key] = _picture(data, f"Stage {stage} picture {resource}/{variant}", height_limit=114 if klatwa else 112)
        items = resources[group + 1]
        for resource in range(2 if klatwa else 4, len(items), 2):
            if resource + 1 >= len(items):
                raise ValueError(f"Stage {stage} item picture lacks a paired hit map")
            if len(items[resource]) == 1:
                continue
            label = f"Stage {stage} item {202 + (resource - 2) // 2}"
            pictures[stage, "item", resource] = _picture(items[resource], label, False)
            x, y, width, height = pictures[stage, "item", resource]
            _bounded(4 + width * height, 78, label + " decoded picture")
            masks[stage, "item", resource + 1] = _mask(items[resource + 1], label + " hit map")

    positions, stage2_positions = gam_world._positions(root, profile)

    def image(stage, ident, label):
        if ident > 200:
            raise ValueError(f"{label}: item {ident} requires a close-up or inventory view")
        key = (stage, ident % 100, 2 * (ident // 100))
        if key not in pictures:
            raise ValueError(f"{label}: drawable {ident} has no picture in stage {stage}")
        return pictures[key], masks.get((key[0], key[1], key[2] + 1))

    def drawable(stage, ident, label):
        if ident <= 200:
            return image(stage, ident, label)
        resource = 2 * (ident - 202) + 2
        key = stage, "item", resource
        if key not in pictures:
            raise ValueError(f"{label}: missing item art for {ident}")
        offset = 2 * (ident - 202)
        source = stage2_positions if stage == 2 and offset < (22 if klatwa else 46) else positions
        if offset < 0 or offset + 2 > len(source):
            raise ValueError(f"{label}: no position for item {ident}")
        return ((*source[offset:offset + 2], *pictures[key][2:]),
                masks[stage, "item", resource + 1])

    def inside(geometry, frame, label):
        px, py, pw, ph = geometry
        if px < frame[0] or py < frame[1] or px + pw > frame[0] + frame[2] or py + ph > frame[1] + frame[3]:
            raise ValueError(f"{label}: drawable exceeds its zoom picture")

    def check_mask(geometry, mask, canvas, label, base=False):
        if mask is None:
            return
        x, y, _, _ = geometry
        ox, oy, width, height = canvas
        dx, dy = x - ox, (y - oy) // 6
        capacity = 0x284 + zoom_mask_limit if base else zoom_mask_limit
        # Some original one-column zero maps clear beyond the logical base-map
        # height into the zoom workspace, which is initialized upon entering it.
        final_byte = 2 + (dy + mask[1] - 1) * width + dx + mask[0]
        if dx < 0 or dy < 0 or dx + mask[0] > width or final_byte > capacity:
            raise ValueError(f"{label}: hit-map overlay lies outside its active view")

    inventory = gam_world.read_objects(root / "rooms/00/objects.txt")
    if len(inventory) != 2 or len(inventory[1]) != 6:
        raise ValueError("Inventory storage needs view 0 and five slots after view 1's background")
    for stage in (1, 2):
        geometry, hit = image(stage, inventory[1][0], "Inventory background")
        _bounded(4 + geometry[2] * geometry[3], 1024, "Decoded inventory background")
        if hit is None:
            raise ValueError("Inventory background requires a hit map")
        _bounded(2 + hit[0] * hit[1], zoom_mask_limit, "Inventory hit map")
        if stage == 1:
            # Room zero is the authored starting inventory. Later stage
            # transitions clear/restrict the player's inventory in game code.
            canvas = (*geometry[:2], *hit)
            for ident in inventory[1][1:]:
                if ident <= 1:
                    continue
                label = f"Initial inventory item {ident}"
                item, item_mask = drawable(stage, ident, label)
                inside(item, geometry, label)
                check_mask(item, item_mask, canvas, label)

    for room in range(1, profile["rooms"]):
        stage = 1 if room <= first_stage_last else 2
        descriptor = records(resources[2 * stage + 2][1], "room descriptors")[room - 1]
        layout = records(records(descriptor, f"room {room}")[0], f"room {room} layout")
        layers = layout[0]
        if not layers:
            raise ValueError(f"Room {room}: no base image")
        base, mask = image(stage, layers[0], f"Room {room}")
        if mask is None:
            raise ValueError(f"Room {room}: base image has no hit map")
        base_canvas = (4, 0, 2 * mask[0], mask[1])
        _bounded(2 + base_canvas[2] * base_canvas[3], 0x284, f"Room {room} base hit map")
        views = gam_world.read_objects(root / f"rooms/{room:02d}/objects.txt")
        for ident in list(layers) + list(views[0]):
            if ident <= 1:
                continue
            geometry, hit = image(stage, ident, f"Room {room} base view")
            check_mask(geometry, hit, base_canvas, f"Room {room} drawable {ident}", base=True)
        for view, objects in enumerate(views[1:], 1):
            if objects[0] == 0:
                continue  # Dormant view populated by a later puzzle action.
            label = f"Room {room} view {view}"
            first, _ = image(stage, objects[0], label)
            x, y, width, height = first
            frame = (x - 1, y - 6, width + 2, height + 12)
            if frame[0] < 0 or frame[1] < 0 or frame[0] + frame[2] > 40 or frame[1] + frame[3] > 112:
                raise ValueError(f"{label}: framed zoom exceeds the scene")
            _bounded(4 + frame[2] * frame[3], 1024, label + " decoded zoom")
            canvas = (*frame[:2], frame[2], frame[3] // 6)
            _bounded(2 + canvas[2] * canvas[3], zoom_mask_limit, label + " zoom hit map")
            for ident in objects:
                if ident <= 1:
                    continue
                geometry, hit = drawable(stage, ident, label)
                inside(geometry, frame, label + f" drawable {ident}")
                check_mask(geometry, hit, canvas, label + f" drawable {ident}")
