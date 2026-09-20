#!/usr/bin/env python3
"""验证人物电影镜头清单是否具备真实动作与连续性交接。"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

NON_CHARACTER_MODES = {"background", "ui-overlay"}


def nonempty(value: object) -> bool:
    return isinstance(value, str) and bool(value.strip())


def validate(data: dict) -> list[str]:
    errors: list[str] = []
    for key in ("project_id", "duration_seconds", "fps", "characters", "shots"):
        if key not in data:
            errors.append(f"缺少顶层字段: {key}")
    if errors:
        return errors

    if not isinstance(data["characters"], list):
        errors.append("characters 必须是数组")
        characters: list[dict] = []
    else:
        characters = data["characters"]
    character_ids = {
        item.get("id") for item in characters if isinstance(item, dict) and nonempty(item.get("id"))
    }
    for item in characters:
        if not isinstance(item, dict) or not nonempty(item.get("id")) or not nonempty(item.get("bible_path")):
            errors.append("每个 character 必须包含 id 和 bible_path")

    shots = data["shots"] if isinstance(data["shots"], list) else []
    if not shots:
        errors.append("shots 必须是非空数组")
        return errors

    total = 0.0
    seen: set[str] = set()
    for index, shot in enumerate(shots):
        prefix = f"shots[{index}]"
        if not isinstance(shot, dict):
            errors.append(f"{prefix} 必须是对象")
            continue
        shot_id = shot.get("id")
        if not nonempty(shot_id):
            errors.append(f"{prefix}.id 不能为空")
        elif shot_id in seen:
            errors.append(f"{prefix}.id 重复: {shot_id}")
        else:
            seen.add(shot_id)
        try:
            duration = float(shot.get("duration_seconds", 0))
            if duration <= 0:
                raise ValueError
            total += duration
        except (TypeError, ValueError):
            errors.append(f"{prefix}.duration_seconds 必须大于 0")
        for key in ("narrative_goal", "camera", "generation_mode", "continuity_handoff"):
            if not nonempty(shot.get(key)):
                errors.append(f"{prefix}.{key} 不能为空")

        mode = shot.get("generation_mode")
        if mode not in NON_CHARACTER_MODES:
            ids = shot.get("character_ids")
            if not isinstance(ids, list) or not ids:
                errors.append(f"{prefix}.character_ids 必须引用至少一个角色")
            else:
                unknown = sorted({item for item in ids if item not in character_ids})
                if unknown:
                    errors.append(f"{prefix}.character_ids 未定义: {', '.join(unknown)}")
            for key in ("start_state", "end_state", "performance_reference"):
                if not nonempty(shot.get(key)):
                    errors.append(f"{prefix}.{key} 不能为空")
            beats = shot.get("action_beats")
            if not isinstance(beats, list) or not any(nonempty(item) for item in beats):
                errors.append(f"{prefix}.action_beats 必须包含可见动作")

    try:
        target = float(data["duration_seconds"])
        fps = float(data["fps"])
        tolerance = 1.0 / fps
        if fps <= 0 or abs(total - target) > tolerance + 1e-9:
            errors.append(f"镜头总时长 {total:.3f}s 与项目时长 {target:.3f}s 不匹配")
    except (TypeError, ValueError, ZeroDivisionError):
        errors.append("duration_seconds 和 fps 必须是有效正数")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("manifest", type=Path)
    args = parser.parse_args()
    data = json.loads(args.manifest.read_text(encoding="utf-8"))
    errors = validate(data)
    result = {"valid": not errors, "errors": errors}
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
