"""Read numbered messages/pages without a separate file for every record.

Each [ID] section contains JSON-quoted display lines. Two-part [BANK ID]
headers preserve the nested message addresses used by Wladcy Ciemnosci.
IDs are decimal and independent of section order; empty sections are errors.
"""

import json
from pathlib import Path
import re


def quoted_strings(text):
    """Read one or more quoted strings on a directive, with an optional comment."""
    result = []
    decoder = json.JSONDecoder()
    rest = text.strip()
    while rest and not rest.startswith("#"):
        try:
            value, end = decoder.raw_decode(rest)
        except ValueError as exc:
            raise ValueError("Expected a JSON-quoted display line") from exc
        if not isinstance(value, str):
            raise ValueError("Expected a JSON-quoted display line")
        result.append(value)
        if rest[end:] and not rest[end].isspace():
            raise ValueError("Quoted display lines must be separated by whitespace")
        rest = rest[end:].lstrip()
    if not result:
        raise ValueError("Expected at least one quoted display line")
    return result


def read_sections(path, key_fields=1, expected_ids=None):
    """Return ID -> display lines, or (bank, ID) -> lines for key_fields=2."""
    path = Path(path)
    if key_fields not in (1, 2):
        raise ValueError("Text sections support one- or two-part IDs")
    sections = {}
    current = None
    for number, source in enumerate(path.read_text("utf-8").splitlines(), 1):
        line = source.strip()
        if not line or line.startswith("#"):
            continue
        try:
            if line.startswith("["):
                match = re.fullmatch(r"\[([0-9]+(?:\s+[0-9]+)*)\]", line)
                if not match:
                    raise ValueError("Expected a numeric [ID] or [BANK ID] header")
                fields = tuple(int(part) for part in match[1].split())
                if len(fields) != key_fields:
                    raise ValueError(f"Expected {key_fields} number(s) in section header")
                current = fields[0] if key_fields == 1 else fields
                if current in sections:
                    raise ValueError(f"Duplicate text section {current}")
                sections[current] = []
            else:
                if current is None:
                    raise ValueError("Display line appears before its section header")
                value = json.loads(line)
                if not isinstance(value, str):
                    raise ValueError("Expected one JSON-quoted display line")
                sections[current].append(value)
        except ValueError as exc:
            raise ValueError(f"{path}:{number}: {exc}") from exc
    if not sections or any(not lines for lines in sections.values()):
        raise ValueError(f"{path}: missing or empty text sections")
    if expected_ids is not None:
        expected = set(expected_ids)
        if sections.keys() != expected:
            raise ValueError(f"{path}: text section IDs differ: "
                             f"missing={sorted(expected - sections.keys())}, "
                             f"unexpected={sorted(sections.keys() - expected)}")
    return sections
