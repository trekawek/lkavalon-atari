#!/usr/bin/env python3
"""Build a fresh resource disk from the editable game content."""
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT.parent / "util"))
from gam_content import main

if __name__ == "__main__":
    main(["--game-dir", str(ROOT), *sys.argv[1:]])
