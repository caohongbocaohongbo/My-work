---
name: cinematic-character-pipeline
description: 规划和验收有角色表演、动作连续性与跨镜头衔接的电影化人物视频。用于动画电影、真人式 AI 短片、剧情广告或用户明确拒绝静帧幻灯片时；不用于纯 UI 动效和普通图片轮播。
---

# 电影级人物视频总流程

把“电影感”解释为可观察的角色表演与镜头连续性，不把静帧缩放、景深或转场当成最终人物镜头。

## 路由

1. 先建立角色圣经与镜头间状态，使用 `character-bible-continuity`。
2. 先做带时间和声音的 animatic，再进入昂贵生成。
3. 每个有人的镜头必须有动作节拍；需要可控表演时使用 `motion-reference-prep`。
4. 角色驱动或人物替换使用 `wan22-character-animation`；可复现节点图使用 `comfyui-video-orchestrator`。
5. 有对白、唱词或明显情绪表演时使用 `dialogue-performance-router`。
6. 每个镜头通过 `temporal-qc-repair` 后才能进入剪辑、调色和包装。

## 必要工件

- `character-bible.json`：角色身份、服装、比例、表情和不可改变项。
- `shot-manifest.json`：每镜头的开始状态、动作节拍、结束状态与交接关系。
- animatic：确认总时长、动作节奏、对白和剪辑逻辑。
- workflow JSON 或完整命令记录：模型、版本、参考素材、种子和参数可追溯。
- QC 报告：逐镜头通过、修复或拒收的依据。

镜头清单字段和判定规则见 [镜头清单契约](references/shot-manifest.md)。创建清单后运行：

```bash
python3 scripts/validate_shot_manifest.py path/to/shot-manifest.json
python3 scripts/inspect_video_stack.py
```

## 硬质量门

- 角色镜头必须包含真实逐帧变化；静帧平移、缩放或景深代理只能标为 animatic。
- 同一动作跨镜头时，上一镜结束姿态、视线、持物手和空间方向必须匹配下一镜开始状态。
- 角色身份、服装、发型和身体比例发生不可解释漂移时不得进入最终剪辑。
- 对白镜头必须检查口型、眨眼、视线、情绪和身体节奏；只动嘴不算完整表演。
- 云端模型或算力不可用时，停止在“已验证 animatic / 待生成镜头”，不得把幻灯片包装成最终电影。

## 权限与成本

Skill 可以规划和检查，但不代表获准调用付费 API、上传真人素材或租用 GPU。实际调用前确认该次费用、肖像/动作素材授权和模型许可。凭据只通过运行环境注入，不写入工作流 JSON、Skill 或 Git 仓库。
