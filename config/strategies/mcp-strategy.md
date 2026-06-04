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
- 30 分钟未使用的按需 MCP，主 Agent 须提示用户回收
- 变更后需重启 Claude Code，`/context` 才能反映 token 变化

## 禁止
- 预先启用按需 MCP
- 在非触发关键字命中时长期挂起按需 MCP

## cinema4d 附加说明
- 虚拟环境：`~/.claude/mcp-venvs/cinema4d/`
- 插件已保留，更新频道 `stable`
