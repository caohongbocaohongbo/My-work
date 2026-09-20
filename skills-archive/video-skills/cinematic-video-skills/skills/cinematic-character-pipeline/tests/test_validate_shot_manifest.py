import importlib.util
import unittest
from pathlib import Path


SCRIPT = Path(__file__).parents[1] / "scripts" / "validate_shot_manifest.py"
SPEC = importlib.util.spec_from_file_location("validate_shot_manifest", SCRIPT)
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
SPEC.loader.exec_module(MODULE)


def valid_manifest() -> dict:
    return {
        "project_id": "acceptance",
        "duration_seconds": 4,
        "fps": 24,
        "characters": [{"id": "operator", "bible_path": "characters/operator.json"}],
        "shots": [
            {
                "id": "shot-01",
                "duration_seconds": 4,
                "narrative_goal": "角色发现异常并转向屏幕",
                "character_ids": ["operator"],
                "start_state": "面向左侧，右手离开桌面",
                "end_state": "转向屏幕，右手指向告警",
                "action_beats": ["发现告警", "转身", "指向屏幕"],
                "camera": "中景，缓慢推近",
                "performance_reference": "references/operator-turn.mp4",
                "generation_mode": "wan-animate",
                "continuity_handoff": "保持右手抬起并看向屏幕",
            }
        ],
    }


class ManifestValidationTests(unittest.TestCase):
    def test_accepts_complete_character_shot(self):
        self.assertEqual(MODULE.validate(valid_manifest()), [])

    def test_rejects_slideshow_like_character_shot(self):
        data = valid_manifest()
        data["shots"][0]["action_beats"] = []
        data["shots"][0]["performance_reference"] = ""
        errors = MODULE.validate(data)
        self.assertTrue(any("action_beats" in item for item in errors))
        self.assertTrue(any("performance_reference" in item for item in errors))

    def test_allows_non_character_ui_overlay(self):
        data = valid_manifest()
        data["characters"] = []
        data["shots"][0] = {
            "id": "shot-01",
            "duration_seconds": 4,
            "narrative_goal": "呈现准确产品数字",
            "camera": "固定 UI 合成",
            "generation_mode": "ui-overlay",
            "continuity_handoff": "数字淡出进入片尾",
        }
        self.assertEqual(MODULE.validate(data), [])


if __name__ == "__main__":
    unittest.main()
