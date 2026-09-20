# ComfyUI 工作流契约

每个镜头的运行记录至少包含：

- 镜头 ID、工作流 JSON 路径和生成时间。
- ComfyUI 版本、核心模型、VAE、文本编码器、LoRA、ControlNet/适配器及其校验值。
- 输入参考图、动作参考、遮罩、首帧和末帧的内容哈希。
- 种子、步数、采样器、调度器、CFG、宽高、帧数和帧率。
- 输出视频及逐帧序列路径。
- 实际运行模式：本地、自托管或付费 API。
- 时序 QC 结果和修复历史。

官方来源：

- ComfyUI：https://github.com/Comfy-Org/ComfyUI
- 官方文档：https://docs.comfy.org/

ComfyUI 核心采用 GPL-3.0；各模型、节点和权重必须分别核对许可证。
