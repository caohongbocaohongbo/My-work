# MCP 加载策略

## 权威源
- 启用清单：`~/.claude/mcp.json`
- 禁用清单：`~/.claude/settings.local.json` → `disabledMcpjsonServers`
- 可恢复预设：`~/.claude/mcp-presets/`（用 `context-on-demand.sh list` 查询）

## 常驻 MCP
- 无。默认新会话不连接任何 MCP。
- `playwright`、`sqlite` 在 `mcp.json` 中注册，但只有本地 SSE 服务（3100/3102）已起时才会真正连上，未起即休眠。

## 按需启用

| 名称 | 触发关键字 | 启用命令 | 停用命令 |
|------|-----------|---------|---------|
| figma-hosted | figma.com URL、设计任务、`use_figma`、`get_design_context` | `context-on-demand.sh enable mcp figma-hosted` | `context-on-demand.sh disable mcp figma-hosted` |
| figma-desktop | figma-desktop、本地 Figma、design file | 任务中提及自动启用 | — |
| pencil | pencil、.pen、线框图、batch_design | `context-on-demand.sh enable mcp pencil` | `context-on-demand.sh disable mcp pencil` |
| open-design | open design、od 项目、artifact | `context-on-demand.sh enable mcp open-design` | `context-on-demand.sh disable mcp open-design` |
| stitch | stitch、apply_design_system | `context-on-demand.sh enable mcp stitch` | `context-on-demand.sh disable mcp stitch` |
| cinema4d | Cinema 4D、C4D | `cinema4d-mcp-enable.sh` | `cinema4d-mcp-disable.sh` |

脚本路径：`~/.claude/scripts/`

## 回收规则
- `playwright` / `sqlite` 仅在本地服务在线时连接，无需回收
- 按需 MCP 任务结束时**主动询问用户**是否 disable（用 `context-on-demand.sh disable mcp <名称>`）
- **空闲自动回收**：launchd `com.fangcang.claude.ondemand` 每 5 分钟跑 `on-demand-watchdog.sh`，扫描 `~/.claude/cache/on-demand-touch/`，超过 `ON_DEMAND_IDLE_MINUTES`（默认 20 分钟）未刷新的标记自动 disable。日志：`~/.claude/logs/on-demand-watchdog.log`
- 关键字命中但 MCP 已自动回收时：再次执行 `enable mcp <名称>`（脚本会重置时间戳）
- 变更后需重启 Claude Code，`/context` 才能反映 token 变化

## 时间戳刷新
- `enable mcp <名称>` 自动写 `~/.claude/cache/on-demand-touch/mcp_<名称>`
- 触发关键字命中但已启用时，用 `context-on-demand.sh touch mcp <名称>` 仅刷新时间戳（不重启）
- `disable` 会同时清掉对应标记

## 关于 figma MCP「当前会话可用」的硬限制
- Claude Code MCP 在进程启动时连接，**当前会话无法热加载**（CLI 架构限制，无法绕过）
- 当前会话内若 `use_figma`/`get_screenshot` 报 `No such tool available`：
  1. 运行 `context-on-demand.sh enable mcp figma-hosted`（时间戳已写入）
  2. **新开一个 Claude Code 窗口/会话**，新会话即可调用 figma 工具
  3. 当前会话继续做不依赖 figma 的工作；或退出当前会话重新进入
- watchdog 仅在「连续 20 分钟未再次 enable / touch」时回收，频繁使用不会被误杀

## Agent 行为约束（强制）
- 执行 `enable mcp <名称>` 后，**禁止**使用「已启用」「已配置可用」等暧昧表述
- 必须明确告知用户：`配置已写入磁盘，当前会话不可用，需重启 Claude Code 或新开会话`
- 在重启前不得尝试调用对应 MCP 工具，也不得规划依赖该 MCP 的下一步动作
- 若用户坚持在当前会话推进，应立刻切换为「产出文档/蓝图等不依赖 MCP 的兜底交付」并显式说明

## 禁止
- 预先启用按需 MCP
- 在非触发关键字命中时长期挂起按需 MCP

## cinema4d 附加说明
- 虚拟环境：`~/.claude/mcp-venvs/cinema4d/`
- 插件已保留，更新频道 `stable`
