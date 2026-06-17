# MCP 加载策略 v3

> v2 缺陷：5 处错诊把 open-design/pencil/stitch 标成"通道 3 插件 MCP"，并误以为 user-scope 配置在 `~/.claude/mcp.json`。本版基于 2026-06-17 重新实证。
> v1 缺陷：把 `mcp.json` 当唯一权威源，忽略多通道。

## 真权威源（按优先级）

Claude Code 实际加载的 MCP 来自 **5 条独立通道**，必须分别管控：

| # | 通道 | 实测命令 | 真实存储 | 用户可控手段 |
|---|------|---------|---------|------------|
| 1 | 用户级 (`claude mcp add -s user`) | `claude mcp list`、`claude mcp get <name>` 显示 `Scope: User config` | **`~/.claude.json` 的 `mcpServers` 字段（不是 `~/.claude/mcp.json`！）** | `claude mcp remove <name> -s user` |
| 2 | 项目级 (`.mcp.json` 仓库内) | `find . -name '.mcp.json'` | 项目根的 `.mcp.json` | 仓库 commit / 删 .mcp.json |
| 3 | 插件自带 MCP | `claude plugin list` | 插件包内置 | `settings.local.json` → `enabledPlugins.*` 改 false |
| 4 | 桌面应用 IPC 注入 | `pgrep -x Figma` | 桌面 app 内嵌 | 退出对应桌面应用 |
| 5 | 全局/系统配置 | 暂未遇到 | — | — |

⚠ **`disabledMcpjsonServers` 仅对通道 2（项目级 `.mcp.json`）有效**，对通道 1（user-scope `~/.claude.json`）和 3-5 全部无效。**实测**：2026-06-17 把 `stitch` 写进 `disabledMcpjsonServers`，stitch 仍 Connected。

⚠ **`~/.claude/mcp.json`（目录下的）实测不被 Claude CLI 读取**，仅作历史/备忘用。要看 user-scope MCP 必须看 **`~/.claude.json`（家目录单文件）的 `mcpServers` 字段**。

## 本机当前真实加载（2026-06-17 重新诊断）

| 工具命名空间 | 来源通道 | 真实存储位置 | 是否常驻 |
|------------|---------|------------|---------|
| `figma-hosted` | 通道 1（user-scope） | `~/.claude.json` mcpServers | 是 |
| `figma-desktop` | 通道 1（user-scope，HTTP URL 指向 Figma 桌面本地端口 3845） | `~/.claude.json` mcpServers | 是（即使 Figma 未启动也注册，连接才失败） |
| `figma` | 通道 1（user-scope，npx 启动 figma-developer-mcp） | `~/.claude.json` mcpServers | 是 |
| `open-design` | 通道 1（user-scope，执行 `~/.claude/scripts/open-design-mcp.sh`） | `~/.claude.json` mcpServers | 是 |
| `pencil` | 通道 1（user-scope，执行 `Pencil.app` 内置 binary） | `~/.claude.json` mcpServers | 是 |
| `stitch` | 通道 1（user-scope，HTTPS） | `~/.claude.json` mcpServers | 是（`disabledMcpjsonServers` 对其无效） |

**结论**：v2 文档把 open-design/pencil/stitch 标成"通道 3 插件" **完全错诊**。`enabledPlugins` 已 false 但它们仍 Connected，原因不是插件 disable 失效，而是它们**根本不是插件 MCP**，全是 user-scope 注册。

## 按需启用流程（修订版）

| 名称 | 触发关键字 | 启用方式 | 停用方式 |
|------|-----------|---------|---------|
| figma-hosted | figma.com URL、`use_figma`、`get_design_context` | `claude mcp add -s user figma-hosted https://mcp.figma.com/mcp -t http` | `claude mcp remove figma-hosted -s user` |
| figma-desktop | 用户启动 Figma 桌面 | `claude mcp add -s user figma-desktop http://127.0.0.1:3845/mcp -t http` | `claude mcp remove figma-desktop -s user` |
| figma | figma-developer-mcp API key 场景 | `claude mcp add -s user figma -- npx -y figma-developer-mcp --stdio` | `claude mcp remove figma -s user` |
| pencil | pencil、.pen、batch_design | `claude mcp add -s user pencil -- /Applications/Pencil.app/.../mcp-server-darwin-arm64 --app desktop` | `claude mcp remove pencil -s user` |
| open-design | open design、artifact | `claude mcp add -s user open-design -- ~/.claude/scripts/open-design-mcp.sh` | `claude mcp remove open-design -s user` |
| stitch | stitch、apply_design_system | `claude mcp add -s user stitch https://stitch.googleapis.com/mcp -t http` | `claude mcp remove stitch -s user` |
| cinema4d | Cinema 4D、C4D | `~/.claude/scripts/cinema4d-mcp-enable.sh` | `~/.claude/scripts/cinema4d-mcp-disable.sh` |

预设配置见 `~/.claude/mcp-presets/`。脚本路径：`~/.claude/scripts/`。

## 回收规则（修订）

- **通道 1 标记式回收**：`enable mcp <名称>` 写 `~/.claude/cache/on-demand-touch/mcp_<名称>`，launchd `com.fangcang.claude.ondemand` 每 5 分钟跑 `on-demand-watchdog.sh`，超过 `ON_DEMAND_IDLE_MINUTES`（默认 20 分钟）未刷新自动 `claude mcp remove`
- **通道 2 项目式回收**：删项目根 `.mcp.json` 即可
- **通道 3 插件式回收**：手工修改 `enabledPlugins` 为 false，重启 Claude Code
- **通道 4 桌面式回收**：退出对应桌面应用即可
- watchdog 应扫描 `claude mcp list` 与 `~/.claude/cache/on-demand-touch/` 的差集，把"已挂载但未经 enable 流程"的 MCP 写入告警日志 `~/.claude/logs/on-demand-untracked.log`（目前 watchdog 脚本只跑 cleanup-stale，未跑 untracked scan，待修）

## 关于「当前会话可用」的硬限制

- Claude Code MCP 在进程启动时连接，**当前会话无法热加载**（CLI 架构限制）
- 若 `use_figma`/`get_screenshot` 报 `No such tool available`：
  1. 运行对应 `claude mcp add -s user ...` 命令
  2. **新开 Claude Code 窗口/会话**，新会话即可调用
  3. 当前会话继续做不依赖该 MCP 的工作；或退出当前会话重新进入

## Agent 行为约束（强制）

- 执行 enable 后**禁止**使用「已启用」「已配置可用」等暧昧表述
- 必须明确告知：`配置已写入 ~/.claude.json，当前会话不可用，需重启 Claude Code 或新开会话`
- 重启前不得尝试调用对应 MCP 工具，也不得规划依赖该 MCP 的下一步动作
- 若用户坚持当前会话推进，立刻切换为「产出文档/蓝图等不依赖 MCP 的兜底交付」并显式说明

## 诊断 checklist（出现"不该有的 MCP 挂载了"时）

1. `claude mcp list` → 看是否在跑
2. `claude mcp get <name>` → 看 `Scope:` 字段判断通道（`User config` = 通道 1）
3. `python3 -c "import json; print(list(json.load(open('~/.claude.json'.replace('~',__import__('os').path.expanduser('~')))).get('mcpServers',{}).keys()))"` → 看通道 1 真实清单
4. `find <project> -name '.mcp.json'` → 看通道 2
5. `cat ~/.claude/settings.local.json | grep enabledPlugins -A 5` → 看通道 3
6. `pgrep -x Figma` → 看通道 4
7. 比对工具命名空间，定位通道
8. 按通道选择停用手段：通道 1 用 `claude mcp remove -s user`，**不要给 `disabledMcpjsonServers` 加项目**

## 禁止

- 预先启用按需 MCP
- 在非触发关键字命中时长期挂起按需 MCP
- 把所有 MCP 的"按需"幻想寄托在 `~/.claude/mcp.json` 配置上——它根本不是 Claude CLI 读的真实路径
- 用 `disabledMcpjsonServers` 试图关 user-scope MCP——无效

## 诊断教训（2026-06-17）

| 错诊 | 真相 | 排查手段 |
|------|------|---------|
| open-design/pencil/stitch 来自通道 3 插件 | 全是通道 1 user-scope | `claude mcp get <name>` 看 `Scope:` |
| user-scope 配置在 `~/.claude/mcp.json` | 真在 `~/.claude.json`（家目录单文件） | grep 工具命名空间在哪个文件 |
| `disabledMcpjsonServers` 能关 user-scope | 只对项目级 `.mcp.json` 有效 | 把名字写进去再 `claude mcp list` 验证 |
| `mcp-archive.json` 已归档 = 真清空 | 归档动作未真正清空 `~/.claude.json` 的 `mcpServers` | 归档后立刻 `claude mcp list` 验证 |

## cinema4d 附加说明

- 虚拟环境：`~/.claude/mcp-venvs/cinema4d/`
- 插件已保留，更新频道 `stable`
