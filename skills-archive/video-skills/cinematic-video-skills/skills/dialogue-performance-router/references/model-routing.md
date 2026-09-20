# 对白模型路由表

| 模型 | 最适合 | 主要限制 | 许可重点 |
|---|---|---|---|
| LivePortrait | 单人近景、表情和头部姿态迁移 | 不是完整电影镜头生成器 | 代码 MIT；默认 InsightFace 模型仅限非商业研究，商用需替换 |
| MuseTalk | 已有视频的多语言口型同步 | 面部细节和抖动需要 QC/修复 | 代码 MIT；继续核对第三方权重许可 |
| HunyuanVideo-Avatar | 音频驱动的动态人物、情绪和多人对白 | NVIDIA/CUDA 与较高算力需求 | Tencent Hunyuan Community License，具有地域和规模限制 |

官方来源：

- https://github.com/KlingAIResearch/LivePortrait
- https://github.com/TMElyralab/MuseTalk
- https://github.com/Tencent-Hunyuan/HunyuanVideo-Avatar

许可与硬件状态会更新，正式商用前以固定提交中的 LICENSE 和模型卡为准。
