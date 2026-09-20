# 电影级人物视频 Skills

这组 Skill 补齐“人物有动作、镜头有衔接、角色不漂移”的生产环节。它们只保存工作方法、检查规则与轻量脚本，不包含模型权重，也不把第三方运行时复制到各智能体配置目录。

## Skills

| Skill | 用途 |
|---|---|
| `cinematic-character-pipeline` | 把人物电影任务拆成可执行镜头，并设置硬质量门 |
| `comfyui-video-orchestrator` | 组织可复现的 ComfyUI 视频工作流 |
| `character-bible-continuity` | 建立角色圣经、身份锁定和跨镜头状态 |
| `motion-reference-prep` | 设计、拍摄和检查动作驱动参考 |
| `wan22-character-animation` | 路由 Wan2.2 Animate 动画/角色替换流程 |
| `dialogue-performance-router` | 在 LivePortrait、MuseTalk、Hunyuan Avatar 间路由 |
| `temporal-qc-repair` | 检测并修复身份漂移、闪烁、动作断裂和坏帧 |

## 共享与隔离

唯一源码位于本目录。各智能体通过 `video-production/scripts/lease_mount.py` 按层获得临时软链接；租约 20 分钟未刷新即被回收。临时挂载、模型运行目录、凭据和缓存均不写入 Skill 源码。

## 许可边界

本仓库内容沿用上级仓库 MIT 许可证。第三方引擎和模型使用各自许可证：

- ComfyUI：GPL-3.0。
- Wan2.2：Apache-2.0。
- LivePortrait：MIT，但默认 InsightFace 模型仅限非商业研究，商业项目必须替换检测模型。
- MuseTalk：代码 MIT；同时遵守所用第三方模型许可。
- HunyuanVideo-Avatar：Tencent Hunyuan Community License，具有地域和大规模商业使用限制。

这些 Skill 不会自动接受许可、不下载模型、不启用付费 API。每次真正调用云端或付费生成前仍需获得该次授权。
