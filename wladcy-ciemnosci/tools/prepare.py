#!/usr/bin/env python3
"""Pack native resources into fresh ATRs, leaving the program region blank."""
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT.parent / "util"))
from pack_assets import prepare


if __name__ == "__main__":
    prepare(ROOT)
