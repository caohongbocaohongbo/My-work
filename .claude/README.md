# Claude Code 配置架构说明

## 配置文件职责划分

```
~/.claude/
├── settings.json          ← 仅存放环境变量 (env)，换环境时唯一需要修改的文件
├── settings.local.json    ← 本地持久配置（插件、权限、钩子、状态栏等），不随环境变化
├── CLAUDE.md              ← 全局行为指令（设计规范、语言规范等），不写配置
├── mcp.json               ← MCP 服务连接定义
└── sync-to-github.sh      ← 自动同步脚本 (Stop 钩子触发)
```

## settings.json — 仅环境变量

换机器/换 API 提供商时，只需修改此文件中的 `env` 块：

```json
{
  "env": {
    "ANTHROPIC_BASE_URL": "...",
    "ANTHROPIC_MODEL": "...",
    "ANTHROPIC_API_KEY": "...",
    ...
  }
}
```

其他所有配置均写入 `settings.local.json`。

## settings.local.json — 持久配置（不受环境变化影响）

此文件由 Claude Code 自动合并读取，优先级高于 `settings.json`。包含：

| 配置项 | 说明 | 是否必须 |
|--------|------|----------|
| `enabledPlugins` | 启用 superpowers + claude-code-setup 插件 | 必须 |
| `extraKnownMarketplaces` | 插件市场来源定义 | 必须 |
| `permissions` | 权限白名单 + bypassPermissions 模式 | 必须 |
| `statusLine` | 状态栏显示（ccstatusline） | 可选 |
| `hooks` | SessionStart / SubagentStop / Stop 钩子 | 必须 |
| `autoUpdatesChannel` | 自动更新频道 | 可选 |
| `skipDangerousModePermissionPrompt` | 跳过危险模式提示 | 必须 |

### Hooks 说明

| Hook | 触发时机 | 作用 |
|------|---------|------|
| `SessionStart` | 每次会话开始 | token-optimizer 提示 + self-improving-agent 回顾 |
| `SubagentStop` | 子代理完成 | self-improving-agent 学习记录检查 |
| `Stop` | 会话结束 | 自动同步 skills 到 GitHub |

## 换环境初始化流程

1. 克隆 work repo：`git clone <repo-url>`
2. 创建/编辑 `~/.claude/settings.json`，填入新环境的 env 变量
3. 将 repo 中 `.claude/settings.local.reference.json` 的内容复制到 `~/.claude/settings.local.json`
4. 配置 `~/.claude/mcp.json`（MCP 服务连接）
5. 重启 Claude Code
