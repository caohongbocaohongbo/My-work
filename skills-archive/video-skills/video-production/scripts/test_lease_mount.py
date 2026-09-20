#!/usr/bin/env python3
"""租约挂载的最小验收测试。"""

from __future__ import annotations

import json
import subprocess
import sys
import time
from pathlib import Path

SCRIPT = Path(__file__).resolve().parent / "lease_mount.py"
AGENT = "acceptance-a"
SESSION = "lease-test"


def run(*args: str) -> dict:
    completed = subprocess.run(
        [sys.executable, str(SCRIPT), *args],
        check=True,
        capture_output=True,
        text=True,
    )
    return json.loads(completed.stdout)


mounted = run(
    "mount",
    "--agent",
    AGENT,
    "--session",
    SESSION,
    "--layers",
    "character-development,performance-motion,character-animation,dialogue-performance,temporal-qc",
)
skills = Path(mounted["skills_dir"])
assert skills.is_dir()
assert (skills / "cinematic-character-pipeline").is_symlink()
assert (skills / "character-bible-continuity").is_symlink()
assert (skills / "motion-reference-prep").is_symlink()
assert (skills / "comfyui-video-orchestrator").is_symlink()
assert (skills / "wan22-character-animation").is_symlink()
assert (skills / "dialogue-performance-router").is_symlink()
assert (skills / "temporal-qc-repair").is_symlink()
assert (skills / "cinematic-character-pipeline" / "SKILL.md").is_file()

other = run("mount", "--agent", "acceptance-b", "--session", SESSION, "--layers", "edit-color")
assert Path(other["skills_dir"]) != skills

lease = skills.parent / "lease.json"
payload = json.loads(lease.read_text(encoding="utf-8"))
payload["last_touch"] = int(time.time()) - 1201
lease.write_text(json.dumps(payload), encoding="utf-8")
run("reap")
assert not skills.parent.exists()
assert Path(other["skills_dir"]).exists()

run("release", "--agent", "acceptance-b", "--session", SESSION)
print("lease_mount: ok")
