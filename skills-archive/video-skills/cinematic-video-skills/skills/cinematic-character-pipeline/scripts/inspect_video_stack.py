#!/usr/bin/env python3
"""只读检查电影级人物视频运行栈，不输出凭据。"""

from __future__ import annotations

import json
import os
import platform
import shutil
from pathlib import Path

RUNTIMES = {
    "comfyui": "COMFYUI_ROOT",
    "wan22": "WAN22_ROOT",
    "liveportrait": "LIVEPORTRAIT_ROOT",
    "musetalk": "MUSETALK_ROOT",
    "hunyuan_avatar": "HUNYUAN_AVATAR_ROOT",
}


def runtime_state(env_name: str) -> dict:
    raw = os.environ.get(env_name)
    if not raw:
        return {"configured": False, "path": None, "exists": False}
    path = Path(raw).expanduser()
    return {"configured": True, "path": str(path), "exists": path.is_dir()}


def main() -> int:
    payload = {
        "platform": platform.platform(),
        "machine": platform.machine(),
        "commands": {
            name: shutil.which(name)
            for name in ("ffmpeg", "ffprobe", "nvidia-smi", "python3")
        },
        "runtimes": {
            name: runtime_state(env_name) for name, env_name in RUNTIMES.items()
        },
        "ready_for_local_video": bool(shutil.which("ffmpeg") and shutil.which("ffprobe")),
        "note": "模型权重、许可证接受状态和显存容量需在实际运行时另行验证。",
    }
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
