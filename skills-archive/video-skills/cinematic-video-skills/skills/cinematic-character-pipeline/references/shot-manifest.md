# 镜头清单契约

`shot-manifest.json` 至少包含：

- `project_id`、`duration_seconds`、`fps`。
- `characters`：每个角色的 `id` 和 `bible_path`。
- `shots`：按时间顺序排列的镜头。

角色镜头必须包含：

- `id`、`duration_seconds`、`narrative_goal`。
- `character_ids`。
- `start_state` 与 `end_state`：姿态、视线、屏幕方向、持物手、位置和情绪。
- `action_beats`：镜头内按顺序发生的可见动作，不能只写气氛词。
- `camera`：景别、机位和唯一主运镜。
- `performance_reference`：参考视频路径、动作模板或明确的生成控制来源。
- `generation_mode`：如 `wan-animate`、`dialogue-avatar`、`background`、`ui-overlay`。
- `continuity_handoff`：下一镜必须继承的状态。

背景和 UI 镜头可以没有人物动作，但必须显式使用 `background` 或 `ui-overlay`。总镜头时长应与项目时长相差不超过一帧。
