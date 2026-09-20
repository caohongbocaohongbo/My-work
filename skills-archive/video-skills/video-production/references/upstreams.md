# 上游来源清单

以下仓库均只保留一份共享副本。Codex 通过 `video-production` 入口按需读取，其他智能体可以直接复用这里的文件，但不自动修改各自配置。

| 能力 | 免费 GitHub 来源 | 本地目录 | 当前固定提交 |
|---|---|---|---|
| HyperFrames | https://github.com/heygen-com/hyperframes | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/hyperframes` | `d11907c3255efcf6169c2eb6a5b617284d242a38` |
| video-use | https://github.com/browser-use/video-use | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/video-use` | `9575612f066aa517354790a645fd90f9f95a743b` |
| Remotion Skills | https://github.com/remotion-dev/skills | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/remotion-skills` | `bbb139d5ba3709b1ffeb27184e9579c681230a08` |
| Generative Media Skills | https://github.com/SamurAIGPT/Generative-Media-Skills | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/generative-media-skills` | `5519622e885abc60217a65c8e090bcb1d9830746` |
| VideoCut Skills | https://github.com/Ceeon/videocut-skills | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/videocut-skills` | `b10e85e1694ac562cb9d0a9496e1a79545d10071` |
| seedance2-skill | https://github.com/dexhunter/seedance2-skill | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/seedance2-skill` | `516284d5bab58361bfdfed3cc96cee3e837d4c44` |
| Visual Skills | https://github.com/smixs/visual-skills | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/visual-skills` | `92be33a5a73325fb3d8e0c73b22744b114e2a90e` |
| Cinematic Video Skills | https://github.com/caohongbocaohongbo/My-work/tree/main/skills-archive/video-skills/cinematic-video-skills | `/Users/fangcang/Documents/My-work-repo/skills-archive/video-skills/cinematic-video-skills` | 随 `My-work` 主仓固定 |

## 使用边界

- 仓库下载和 Skill 文档可免费取得；Generative Media 的 MuAPI、模型生成及部分云端能力可能需要 API Key 和付费额度。
- VideoCut 的完整工作台流程还依赖其配套 Runtime；只在实际剪辑任务触发时按上游 Skill 做就绪检查，不在安装阶段常驻启动。
- Seedance Skill 负责生成可交给即梦的提示词与分镜，本地安装本身不包含即梦的生成服务。
- Visual Skills 采用 CC BY 4.0，复用或派生其内容时保留作者 Serge Shima 与仓库来源署名。它补强导演、分镜、摄影和模型提示方法，不负责实际云端生成。
- Cinematic Video Skills 为本机共享路由层，采用上级仓库 MIT 许可证；不包含 ComfyUI、Wan2.2、LivePortrait、MuseTalk、HunyuanVideo-Avatar 的代码或权重，实际运行分别遵循其许可证。
- 更新上游时先检查本地工作树；只有干净时才能执行 fast-forward 更新，并同步本表的提交号。
