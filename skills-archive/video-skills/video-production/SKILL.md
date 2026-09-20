---
name: video-production
description: 六层总流程加人物连续表演硬链路的共享视频制作能力。用户提出“生成视频”“做宣传片”“动画电影”、人物连续动作、对白表演、电影级镜头、分镜、摄影、AI 生成、剪辑或调色时使用；只加载当前阶段需要的上游 Skill，不用于单纯播放或概述现有视频。
---

# 视频制作总路由

上游能力只保留一套共享源码，统一位于 `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills`。本入口负责把自然语言任务拆成六层，并逐层加载最小 Skill 集合；不要复制仓库，也不要运行会写入其他智能体全局配置的上游安装器。

## 一句话任务的默认拆解

对“给某产品做一支 60 秒宣传片”这类完整制作请求，按以下顺序执行；某层没有实际工作时可以跳过，但必须在交付记录中说明：

1. **导演**：确定核心信息、观众情绪、视觉母题、故事弧与结尾画面。
2. **分镜**：形成带时间码、镜头功能、动作、声音和交接点的结构化分镜。
3. **摄影运镜**：逐镜头指定景别、镜头、机位、单一主运镜、光源与色彩逻辑。
4. **AI 生成**：选择本地、免费或已授权的模型路径；品牌文字和准确 UI 不交给视频模型生成。
5. **配音音效**：先锁定旁白时长，再做音乐、音效和对白让位；无云端凭据时使用本地 TTS/合成音效。
6. **剪辑调色**：装配时间线、字幕、Logo、程序化 UI、转场、调色、响度与最终编码。

每层的具体优先级、回退链与 Skill 路径见 [六层能力矩阵](references/layer-matrix.md)。进入某层前，只读取该层实际采用的 `SKILL.md`；不要一次性读取全部上游。

## 人物连续表演硬链路

当用户要求人物动作、剧情表演、连续镜头、对白、动画电影或明确拒绝图片幻灯片时，在六层流程中插入以下可验收阶段：

1. `character-development`：角色圣经、参考权利、身份和服装锁定。
2. `video-orchestration`：固定 ComfyUI 工作流、模型、种子和复现记录。
3. `performance-motion`：动作节拍和驱动参考。
4. `character-animation`：Wan2.2 Animate 等真实逐帧角色动画。
5. `dialogue-performance`：口型、表情、视线、身体节奏和多人对白。
6. `temporal-qc`：身份漂移、闪烁、动作断裂和镜头交接检查。

完整人物任务先加载 `cinematic-character-pipeline`，再按镜头加载实际需要的子 Skill。角色镜头没有真实逐帧动作时，只能交付为 animatic；不得把静帧平移、缩放或景深代理称为最终电影镜头。

## 交付形态路由

- 本地可重复渲染、HTML/CSS 动效、产品介绍：HyperFrames。
- React 视频、精确文字/UI、批量模板、固定栏目：Remotion。
- 已有素材的剪辑、口播、字幕和画面修整：video-use + VideoCut。
- AI 镜头提示、电影摄影、Seedance/Kling/Veo：Visual Skills；需要模型调用时再进入 Generative Media 或 Seedance。
- 人物连续表演、动作驱动和角色替换：Cinematic Video Skills + Wan2.2 Animate；工作流由 ComfyUI 固定并经时序 QC。
- 人物对白：按镜头在 LivePortrait、MuseTalk、HunyuanVideo-Avatar 间路由，模型不可用时停在已验证 animatic。
- 云端模型不可用：保留完整生成提示与替换记录，使用本地图像运动、程序化图形、macOS TTS 和 FFmpeg 完成可播放代理成片。

本地图像运动只适用于无人物的解释镜头或明确标注的 animatic。不要声称提示词、分镜或静帧已经等同于模型生成视频。最终报告必须区分“真实执行”“animatic”和“本地替代”。

## 临时挂载与 20 分钟回收

共享路由可直接按绝对路径读取；需要让某个智能体临时发现子 Skill 时，使用租约脚本创建该智能体专属的软链接目录：

```bash
python3 scripts/lease_mount.py mount --agent <agent> --session <session> --layers director,storyboard
python3 scripts/lease_mount.py touch --agent <agent> --session <session>
python3 scripts/lease_mount.py release --agent <agent> --session <session>
```

- 默认租约根为 `/tmp/video-production-mounts-<uid>`，每个 `agent/session` 独立，互不共享配置。
- 每次进入新阶段先 `touch`；超过 1200 秒未触碰的挂载由定时回收器解除。
- 解除的只是临时软链接和租约文件，不删除共享仓库、用户素材或生成产物。
- 不把临时选择写回 `~/.codex`、`~/.claude`、DeepSeek 或其他智能体的配置。

## 隔离与生命周期

- 不运行上游的全局安装器，不向 `~/.claude`、DeepSeek 技能中心或其他智能体配置写入内容。
- Codex 仅保留本入口的共享软链接；子 Skill 按租约挂载，任务结束主动 `release`，异常退出由回收器清理。
- 可在当前项目内安装渲染依赖和生成产物，但不得把用户素材写进技能归档目录。
- 第三方模型、云端转录、MuAPI 或其他付费调用必须在实际调用前说明费用或凭据要求，并取得用户对该次调用的授权。
- 除非用户明确要求，不上传、发布或部署视频。

上游仓库、固定版本和本地入口见 [来源清单](references/upstreams.md)。
