import subprocess
import sys
from pathlib import Path

import pytest

examples = list((Path(__file__).resolve().parent.parent / "examples").glob("**/src/example.py"))


@pytest.mark.parametrize("example", examples, ids=[x.parent.parent.name for x in examples])
def test_examples(example):
    """
    Check if the examples provided in the repo still are succeeding the optimization.

    """
    example_name = example.parent.parent.name
    env = sys.executable
    try:
        subprocess.check_output([env, str(example)])
    except Exception:
        pytest.fail(f"Running example '{example_name}' failed")
