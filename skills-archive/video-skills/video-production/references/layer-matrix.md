# 六层能力矩阵

审计原则：先复用已安装能力，只在存在清晰质量缺口时新增。`visual-skills` 补导演、分镜与摄影方法；`cinematic-video-skills` 补人物连续表演硬链路。配音音效、剪辑调色继续复用原有仓库和本地工具，第三方模型权重不进入 Skill 归档。

| 层 | 首选能力 | 次选/执行能力 | 本地免费回退 | 不做什么 |
|---|---|---|---|---|
| 导演 | `visual-skills/video` 的 dramaturgy、director treatment | Generative Media `cinema-director` | 手工形成导演阐述与五个锚点 | 不把形容词堆叠当导演方案 |
| 分镜 | `visual-skills/video` 的 14 字段 shot card | Generative Media `storyboard`、Seedance 中文分镜 | 结构化 `storyboard.json` + `storyboard.md` | 不把一组漂亮静帧当完整分镜 |
| 摄影运镜 | `visual-skills/video` 的 camera/light vocabulary | Generative Media `cinema-director` | Remotion/HyperFrames 的平移、推拉、景深代理 | 每镜头不叠加多个互相冲突的主运镜 |
| AI 生成 | Visual Skills 负责模型选择与提示；Seedance/Generative Media 负责已授权调用 | ImageGen 生成环境静帧 | 本地图像运动、SVG、CSS、Canvas | 不让模型生成需要准确呈现的品牌文字和 UI |
| 配音音效 | HyperFrames `media-use` + `hyperframes-audio` | Remotion 音频时间线 | macOS `say`、FFmpeg 合成声床/音效 | 不在无授权时调用付费 TTS 或音乐 API |
| 剪辑调色 | video-use + VideoCut | Remotion/HyperFrames 精确时间线 | FFmpeg concat、eq、curves、loudnorm、编码 | 不把提示词输出冒充剪辑完成 |

## 人物连续表演补充链路

| 阶段 | 首选 Skill | 执行能力 | 验收底线 |
|---|---|---|---|
| 角色与连续性 | `character-bible-continuity` | 参考图、身份适配器/LoRA、镜头状态表 | 脸、服装、比例、持物手和方向可解释且连续 |
| 可复现编排 | `comfyui-video-orchestrator` | ComfyUI 固定工作流 | 模型、版本、种子、参数、输入哈希和输出可追溯 |
| 表演参考 | `motion-reference-prep` | 授权驱动视频、姿态/深度条件 | 镜头内有可辨认的准备、主动作、反应和收势 |
| 人物动画 | `wan22-character-animation` | Wan2.2 Animate / Replace | 真实逐帧动作；静帧运动只能算 animatic |
| 对白表演 | `dialogue-performance-router` | MuseTalk、LivePortrait、HunyuanVideo-Avatar | 口型、眼神、表情和身体节奏共同成立 |
| 时序质检 | `temporal-qc-repair` | 解码、逐帧复核、局部重绘、插帧和重生成 | 身份、肢体、动作、背景和镜头交接全部通过 |

## 默认路由判定

1. 先判断用户要的是策划、素材、镜头还是成片。
2. 成片请求按六层依次生成工件；短任务只进入必要层。
3. 有真实 UI、数字、Logo、法务文案时，固定走程序化图形层。
4. 云端模型、账号或额度不可用时，不阻塞全流程；保存可直接投喂的模型提示，并以本地可播放代理镜头替代。
5. 每层开始前刷新租约；阶段结束后不保留该层上下文或全局挂载。
6. 人物电影任务不得在角色动画或时序质检缺失时降级成“静帧成片”；只能明确交付 animatic。

## 质量门

- 导演：核心信息、情绪弧、母题、节奏、声音、结尾画面齐全。
- 分镜：总时长准确；每镜头至少承担情绪变化、推进动作或增加压力之一。
- 摄影：每镜头只有一个主运镜，且说明“为什么动”。
- 生成：连续性块、参考素材角色和最终画面明确。
- 声音：旁白可懂、音乐让位、峰值不过载。
- 后期：时间线长度、分辨率、帧率、音轨、编码与可播放性全部验证。
- 人物：角色身份、动作节拍、镜头交接和对白表演逐镜通过，不以静帧运动代替。
