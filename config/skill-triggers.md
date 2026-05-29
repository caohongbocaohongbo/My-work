# Skill 条件自动加载规则

> 本文件定义哪些 Skill 在满足条件时自动加载，不满足时保持待命。
> 所有 AI 智能体（Claude Code / Codex / Trae / Comate）共用此规则。
> 本地路径：`~/.claude/config/skill-triggers.md`
> GitHub：`config/skill-triggers.md`

---

## 规则引擎

每条规则格式：

```
[Skill-Name]: 触发条件 → 动作
```

**动作类型：**
- `auto-load` — 满足条件时自动加载该 Skill
- `skip` — 满足条件时跳过该 Skill（即使 Agent 默认会加载）
- `default-off` — 始终不自动加载，仅手动 `/skill-name` 或 Agent 显式声明时加载

---

## 条件自动加载规则

### ui-ux-pro-max

**触发条件：** 用户指令中**缺少**任何以下引用时，自动加载：

| 信号 | 匹配模式 |
|------|---------|
| DESIGN.md 文件 | `DESIGN.md`、`design.md`、`设计规范.md` |
| Figma 链接 | `figma.com/design/`、`figma.com/file/`、`figma.com/board/` |
| 明确风格名 | `百度财经`、`Material Design`、`Apple 风格`、`Linear 风格`、`Notion 风格`、`Stripe 风格` 等 |
| 风格参考 URL | 以 `https://` 开头 + `风格`/`设计`/`参照`/`参考` 关键词 |
| copyStyle 调用 | `copyStyle`、`复制风格`、`提取设计语言` |
| 已有 CSS 变量/色板 | `--primary:`、`--bg:`、`色板`、`color palette` |

**决策逻辑：**

```
用户指令分析
├── 包含 DESIGN.md / Figma / 风格URL / copyStyle → 已有设计参考，skip ui-ux-pro-max
└── 缺少上述任一信号 → 无明确设计方向，auto-load ui-ux-pro-max
```

**示例：**

| 指令 | 判定 | 原因 |
|------|------|------|
| "按 france-design.md 做一个页面" | skip | 已有 DESIGN.md |
| "参照这个 Figma 链接做 Dashboard" | skip | 已有 Figma 链接 |
| "做一个股票监控后台" | **auto-load** | 无设计参考 |
| "用百度财经风格生成列表页" | skip | 已有风格名 |
| "帮我搭一个登录页" | **auto-load** | 无设计参考 |
| "参照 https://stripe.com 的配色做页面" | skip | 已有风格参考 URL |

### frontend-design

**触发条件：** 始终 `default-off`。仅当用户指令包含 `生成页面`、`构建前端`、`写一个组件`、`HTML 页面` 且已有设计参考（DESIGN.md / Figma / 色板）时，由 Agent 显式加载。

### copyStyle (hue)

**触发条件：** `default-off`。仅 `/copyStyle` 或 Agent（ux-agent）在分析品牌风格时显式加载。

---

## 跨智能体共享说明

本文件被以下配置引用：

| 智能体 | 配置文件 | 加载方式 |
|--------|---------|---------|
| Claude Code | `~/.claude/settings.local.json` → `skillOverrides` | 启动时读取 |
| Codex | `~/.codex/config.toml` → `[skill_rules]` | 会话启动时读取 |
| Trae CN | `~/Library/Application Support/Trae CN/User/skill_rules.json` | 手动同步 |
| Comate | `~/.comate/skill_rules.json` | 手动同步 |

**同步命令：**

```bash
# 推送到本地所有智能体
cp ~/Documents/My-work-repo/config/skill-triggers.md ~/.claude/config/skill-triggers.md

# Codex / Trae / Comate 需手动复制或软链
ln -sf ~/Documents/My-work-repo/config/skill-triggers.md ~/.claude/config/skill-triggers.md
```

---

## 更新记录

| 日期 | 变更 |
|------|------|
| 2026-05-29 | 初始版本：ui-ux-pro-max 条件自动加载规则 |
