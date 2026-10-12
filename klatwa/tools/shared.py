"""Load the already validated APX tooling shared with the AD2044 project."""

from pathlib import Path
import importlib.util

ROOT = Path(__file__).resolve().parents[1]


def load(name):
    path = ROOT.parent / "ad2044/tools" / f"{name}.py"
    spec = importlib.util.spec_from_file_location("apx_shared_" + name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module
