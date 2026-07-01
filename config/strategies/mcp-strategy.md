# MCP 加载策略 v4

> v4 变更（2026-06-29）：放弃 v3 的「`claude mcp add` 写 user-scope + launchd 回收狗」按需方案，改为 **方案C 会话级注入**（`--mcp-config` + `--strict-mcp-config`）。原因：v3 回收狗实测长期「回收 0 项」——被直接写进常驻的 MCP 没有 touch 标记，逃逸出 cleanup-stale 管辖；且 add 后仍需重启会话，笨重。方案C 把回收粒度从「按时间」改成「按进程生命周期」，进程退出即净，无需 launchd/watchdog/touch。
> v3 仍有效的部分：下方「5 通道权威源」与「诊断教训」表保留，定位 MCP 来源时照用。

## 一、当前生效方案：方案C 会话级注入

**核心**：默认 `claude` 走空 user-scope（零 MCP、零 token）；用时按场景启动器注入，退出即回收。

- user-scope `~/.claude.json` 的 `mcpServers` 永久保持 `{}`（2026-06-29 已清空，原配置备份于 `~/Documents/My-work-repo/智能体共用/main_claude-json-before-mcp-c-plan_20260629_v1.json`）
- preset 目录 `~/.claude/mcp-presets/`，每个文件是 `--mcp-config` 可直接加载的格式：`{"mcpServers": {"<name>": {...}}}`（注意：**不是** v3 旧的 `{"name","config"}` 格式）
- 现有 6 个 preset：`figma-hosted` `figma-desktop` `figma` `open-design` `pencil` `stitch`
- 启动器 alias 在 `~/.zshrc`（cdesign/cfigma/cfigd/cpen/cod/cstitch），见该文件「按需 MCP 场景启动器」段

### 启动器与组合规则

```
cdesign  → figma-hosted + pencil + open-design + stitch（设计全家桶）
cfigma   → figma-hosted        cfigd → figma-desktop（需 Figma 桌面运行）
cpen     → pencil              cod   → open-design       cstitch → stitch
```

任意组合：
```
command claude --tools "$_CTOOLS" --mcp-config "$P/<a>.json" "$P/<b>.json" --strict-mcp-config
```

⚠ **参数顺序铁律**：`--mcp-config` 是可变参数（variadic），会一直吞后面的位置参数当 config 路径。**必须让 `--strict-mcp-config` 殿后当终止哨兵**，否则后续追加的 prompt/子命令会被误吞成 config 文件路径（实测 `--mcp-config X mcp list` 会把 `mcp` `list` 当成两个不存在的 config 文件报错）。

## 二、回收：进程级，无基础设施

- 回收 = 关闭该会话进程，自动且彻底，无逃逸可能
- launchd `com.fangcang.claude.ondemand` 已退役（2026-06-29 `launchctl bootout` + plist 改名 `~/Library/LaunchAgents/com.fangcang.claude.ondemand.plist.disabled`，保留可回滚）
- watchdog / touch 标记目录 / 20 分钟阈值 全部弃用，不再维护

## 三、验证手段（实测要点）

- ❌ `claude --mcp-config X --strict-mcp-config mcp list`：`mcp list` 子命令**只读持久配置，不反映 `--mcp-config` 临时注入**，验证不了，别用
- ✅ 会话级验证：`claude --mcp-config X --strict-mcp-config -p "Do you have a tool whose name starts with mcp__<ns>? yes/no"`，模型答 Yes 即注入成功（2026-06-29 figma-hosted 实测通过）
- ⚠ macOS 无 GNU `timeout`，脚本里别用（用 `gtimeout` 需先装 coreutils）

## 四、5 通道权威源（v3 保留，定位来源时照用）

| # | 通道 | 实测命令 | 真实存储 | 用户可控手段 |
|---|------|---------|---------|------------|
| 1 | 用户级 | `claude mcp get <name>` 显示 `Scope: User config` | **`~/.claude.json` 的 `mcpServers`（不是 `~/.claude/mcp.json`！）** | `claude mcp remove <name> -s user` |
| 2 | 项目级 `.mcp.json` | `find . -name '.mcp.json'` | 项目根 `.mcp.json` | 删文件 / `disabledMcpjsonServers` |
| 3 | 插件自带 | `claude plugin list` | 插件包内置 | `enabledPlugins.*` 改 false |
| 4 | 桌面 IPC 注入 | `pgrep -x Figma` | 桌面 app 内嵌 | 退出桌面应用 |
| 5 | `--mcp-config`（方案C） | 启动参数 | preset 文件，仅本进程 | 关闭进程 |

⚠ `disabledMcpjsonServers` **仅对通道 2 有效**，对 user-scope/插件/桌面/`--mcp-config` 全部无效。
⚠ `~/.claude/mcp.json`（目录下那个）**不被 CLI 读取**，仅历史备忘。

## 五、Agent 行为约束（强制）

- 当前会话无法热加载 MCP（CLI 启动时才连接）。要在当前会话用某 MCP，必须**新开会话并用对应启动器**，不能在本会话临时挂载
- 执行配置变更后禁止用「已启用/已配置可用」等暧昧表述；要明确告知「需用 `<启动器>` 新开会话才生效」
- 用户坚持当前会话推进时，切换为「产出不依赖该 MCP 的文档/蓝图」并显式说明

## 六、诊断 checklist（出现「不该有的 MCP 挂了」时）

1. `claude mcp get <name>` → 看 `Scope:` 判通道
2. 通道 1：去 `~/.claude.json` 的 `mcpServers` 看（方案C 下这里应为空 `{}`）
3. 通道 2：`find <project> -name '.mcp.json'`
4. 通道 4：`pgrep -x Figma`
5. 若是 `--mcp-config` 注入（通道 5），关进程即消

## 七、禁止

- 往 user-scope `~/.claude.json` 写常驻 MCP（破坏方案C 的「默认纯净」前提）
- 用 `disabledMcpjsonServers` 关 user-scope 或 `--mcp-config` 注入——无效
- 把 `--mcp-config` 放在 prompt/子命令前而不带 `--strict-mcp-config` 哨兵殿后——会吞参数
- 复活 launchd 回收狗（已被进程级回收取代）

## 八、诊断教训表（2026-06-17 ~ 2026-06-29）

| 错诊 | 真相 | 排查手段 |
|------|------|---------|
| 回收狗在跑就等于按需生效 | 它只回收「有 touch 标记」的，常驻直配项无标记→恒回收 0 | 看 `on-demand-watchdog.log` 是否长期「回收 0 项」 |
| 旧 preset `{"name","config"}` 能喂 `--mcp-config` | 不能，需 `{"mcpServers":{...}}` 格式 | 用 `-p` 会话验证 yes/no |
| `mcp list` 能验证 `--mcp-config` | 不能，它只读持久配置 | 改用会话级 `-p` 验证 |
| open-design/pencil/stitch 是插件 MCP | 全是 user-scope（通道 1） | `claude mcp get <name>` 看 Scope |

## 九、skills/agents 会话级软链（v4 扩展，2026-07-01）

把「关终端即净」从 MCP 扩展到 skills/agents，同一心智：
- **正本**：skills → `~/.claude/skills-archive/`；agents → `~/.claude/agent-presets/`
- **视图**（Claude Code 实际扫描处）：`~/.claude/skills/` 默认只常驻 `find-skills`；`agents/` 保留现有目录
- **机制**：`scripts/session-context.sh`（`start`/`end`/`reap`/`link`/`unlink`/`status`）
  - `SessionStart` hook → `start`：按 `$CLAUDE_SCENE` 从正本 `ln -s` 进视图目录，写 manifest `cache/session-scene/<sid>`
  - `SessionEnd` hook → `end`：**引用计数**撤链，仅当无其他活跃会话引用才删软链
  - `reap`：孤儿兜底，manifest 超 12h（关窗未触发 SessionEnd）在下次 SessionStart 清理
- **场景映射**：`config/scene-context.map`（`<scene>|<skills|agents>|<空格分隔名称>`）
- **启动器**：`cdesign` 内置 `CLAUDE_SCENE=design`；新增 `cdev`（dev 场景，无 MCP）；可叠加 `CLAUDE_SCENE=design cfigma`
- **兼容**：macOS bash 3.2 无关联数组，脚本用函数替代；`sync-to-github.sh` 用 `--no-links` 防临时软链入库，`skills-archive` 已纳入同步与 bootstrap 恢复
- **局限**：只在开会话那刻生效（Claude 启动时扫描目录），非会话中途热增减
- **agents 现状**：`agents/` 下为非标准目录（非 `agents/*.md`），当前不被当 subagent 加载、不占上下文，故映射 agents 字段留空，待标准化后填入

**废止并入 v4**：`context-on-demand.sh` 的 `mcp enable/disable` 写 user-scope（已改为只提示启动器）、skill/agent 的 mv enable/disable、20 分钟 `watchdog cleanup-stale` —— 全部由方案C + 会话级软链取代。

## cinema4d 附加

- 虚拟环境 `~/.claude/mcp-venvs/cinema4d/`；如需纳入方案C，按相同格式建 `~/.claude/mcp-presets/cinema4d.json` 再加启动器
