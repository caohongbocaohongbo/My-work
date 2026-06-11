# MCP 加载策略 v2

> v1 缺陷：把 `mcp.json` 当唯一权威源，忽略了插件 MCP 与桌面 IPC 注入，导致 `disabledMcpjsonServers` 对插件 MCP 失效。本版基于 2026-06-11 诊断重写。

## 真权威源（按优先级）

Claude Code 实际加载的 MCP 来自 **5 条独立通道**，必须分别管控：

| # | 通道 | 实测命令 | 用户可控手段 |
|---|------|---------|------------|
| 1 | 用户级 (`claude mcp add -s user`) | `claude mcp list` | `claude mcp add/remove`、`~/.claude/mcp.json` |
| 2 | 项目级 (`.mcp.json` 仓库内) | `find . -name '.mcp.json'` | 仓库 commit |
| 3 | **插件自带 MCP**（如 `claude-code-setup` 含 open-design/pencil/stitch） | `claude plugin list` | `settings.local.json` → `enabledPlugins.*` 改 false |
| 4 | **桌面应用 IPC 注入**（Figma 桌面 → `figma-desktop` 工具集） | `pgrep -x Figma` | 退出对应桌面应用 |
| 5 | 全局/系统配置（Claude Desktop 同步） | 暂未遇到 | — |

⚠ **`disabledMcpjsonServers` 仅对通道 1 和 2 有效**，对 3-5 无效。

## 本机当前真实加载（2026-06-11 诊断）

| 工具命名空间 | 来源通道 | 是否常驻 |
|------------|---------|---------|
| `figma-hosted` | 通道 1（用户级） | 是 |
| `figma-desktop` | 通道 4（Figma 桌面） | 仅 Figma 运行时 |
| `open-design` | 通道 3（插件） | 是（直到禁用插件） |
| `pencil` | 通道 3（插件） | 同上 |
| `stitch` | 通道 3（插件，虽列入 disabledMcpjsonServers 但无效） | 同上 |

## 按需启用流程（修订版）

| 名称 | 触发关键字 | 启用方式 | 停用方式 |
|------|-----------|---------|---------|
| figma-hosted | figma.com URL、`use_figma`、`get_design_context` | 已常驻通道 1，无需启用 | `claude mcp remove figma-hosted` |
| figma-desktop | 用户启动 Figma 桌面 | 自动 | 退出 Figma 桌面应用 |
| pencil | pencil、.pen、batch_design | 插件已启用即常驻 | `enabledPlugins` 关插件 |
| open-design | open design、artifact | 同上 | 同上 |
| stitch | stitch、apply_design_system | 同上 | 同上 |
| cinema4d | Cinema 4D、C4D | `cinema4d-mcp-enable.sh` | `cinema4d-mcp-disable.sh` |

脚本路径：`~/.claude/scripts/`

## 回收规则

- **通道 1/2 标记式回收**：`enable mcp <名称>` 写 `~/.claude/cache/on-demand-touch/mcp_<名称>`，launchd `com.fangcang.claude.ondemand` 每 5 分钟跑 `on-demand-watchdog.sh`，超过 `ON_DEMAND_IDLE_MINUTES`（默认 20 分钟）未刷新自动 disable
- **通道 3 插件式回收**：手工修改 `enabledPlugins` 为 false，重启 Claude Code
- **通道 4 桌面式回收**：退出对应桌面应用即可
- watchdog 新增：扫描 `claude mcp list` 与 `~/.claude/cache/on-demand-touch/` 的差集，把"已挂载但未经 enable 流程"的 MCP 写入告警日志 `~/.claude/logs/on-demand-untracked.log`（不自动 disable，仅提示策略漏洞）

## 关于 figma MCP「当前会话可用」的硬限制

- Claude Code MCP 在进程启动时连接，**当前会话无法热加载**（CLI 架构限制）
- 若 `use_figma`/`get_screenshot` 报 `No such tool available`：
  1. 运行 `claude mcp add -s user figma-hosted https://mcp.figma.com/mcp -t http`
  2. **新开 Claude Code 窗口/会话**，新会话即可调用 figma 工具
  3. 当前会话继续做不依赖 figma 的工作；或退出当前会话重新进入

## Agent 行为约束（强制）

- 执行 enable 后**禁止**使用「已启用」「已配置可用」等暧昧表述
- 必须明确告知：`配置已写入磁盘，当前会话不可用，需重启 Claude Code 或新开会话`
- 重启前不得尝试调用对应 MCP 工具，也不得规划依赖该 MCP 的下一步动作
- 若用户坚持当前会话推进，立刻切换为「产出文档/蓝图等不依赖 MCP 的兜底交付」并显式说明

## 诊断 checklist（出现"不该有的 MCP 挂载了"时）

1. `claude mcp list` → 看通道 1/2 注册
2. `cat ~/.claude/settings.local.json | grep enabledPlugins -A 5` → 看通道 3
3. `pgrep -x Figma` → 看通道 4
4. 比对工具命名空间，定位通道
5. 按通道选择停用手段，不要继续给 `disabledMcpjsonServers` 加项目

## 禁止

- 预先启用按需 MCP
- 在非触发关键字命中时长期挂起按需 MCP
- **把所有 MCP 的"按需"幻想寄托在 `mcp.json` 配置上**——大量 MCP 走的是通道 3/4，与该文件无关

## cinema4d 附加说明

- 虚拟环境：`~/.claude/mcp-venvs/cinema4d/`
- 插件已保留，更新频道 `stable`
