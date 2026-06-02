---
name: agent-browser
description: 浏览器自动化工具，用于 AI Agent 的网页交互。当需要打开网站、填写表单、点击按钮、截图、数据抓取、测试 Web 应用或任何浏览器自动化任务时使用。触发词包括"打开网站"、"填表"、"点击按钮"、"截图"、"抓取数据"、"测试页面"、"登录网站"、"浏览器自动化"等。也适用于探索性测试、QA、Bug 排查或 App 质量审查。也支持 Electron 桌面应用（VS Code、Slack、Discord、Figma、Notion、Spotify）和 Vercel Sandbox 微虚拟机 / AWS Bedrock AgentCore 云浏览器环境。
when_to_use:
  - 用户要求打开/访问某个网站或 URL
  - 用户要求填写表单、点击按钮、提交数据
  - 用户要求对网页截图或提取页面数据
  - 用户要求测试 Web 应用或排查 UI Bug
  - 用户要求登录网站或执行浏览器自动化
  - 前端开发完成后需要浏览器验证 UI 还原度
  - 部署后需要验证线上页面可访问性
  - 需要对 Electron 桌面应用进行自动化操作
argument-hint: "<url | action>"
compatibility: Claude Code / Codex / Cursor
license: MIT
metadata:
  source: vercel-labs/agent-browser
  version: 1.0.0
---

# Agent Browser

高性能浏览器自动化 CLI，专为 AI Agent 设计。基于 Chrome/Chromium CDP 协议，使用无障碍树快照和紧凑的 `@eN` 元素引用进行可靠交互。

## 安装

```bash
npm i -g agent-browser && agent-browser install
```

## 使用入口

本文件为发现存根。执行任何 `agent-browser` 命令前，需先从 CLI 加载实际工作流内容：

```bash
agent-browser skills get core             # 入口 — 工作流、常用模式、故障排除
agent-browser skills get core --full      # 包含完整命令参考和模板
```

CLI 提供的内容始终匹配已安装版本，指令不会过期。

## 专项能力

当任务超出普通网页范畴时，加载专项 skill：

```bash
agent-browser skills get electron          # Electron 桌面应用（VS Code、Slack、Discord、Figma...）
agent-browser skills get slack             # Slack 工作区自动化
agent-browser skills get dogfood           # 探索性测试 / QA / Bug 排查
agent-browser skills get vercel-sandbox    # Vercel Sandbox 微虚拟机环境
agent-browser skills get agentcore         # AWS Bedrock AgentCore 云浏览器
```

运行 `agent-browser skills list` 查看已安装版本所有可用能力。

## 核心特点

- **原生 Rust CLI**，非 Node.js 封装，性能极致
- **Chrome/Chromium CDP 直连**，不依赖 Playwright 或 Puppeteer
- **无障碍树快照 + 元素引用**，确保交互可靠性
- **会话管理**：认证保险库、状态持久化、视频录制
- **跨平台**：支持 Claude Code、Cursor、Codex、Continue、Windsurf 等所有主流 AI 编码工具
- **可观测面板**：独立于浏览器会话运行在 4848 端口，可通过代理或转发 URL 访问

## 典型工作流

1. 打开页面：`agent-browser navigate "<url>"`
2. 获取快照：`agent-browser snapshot`（获得 `@e1`、`@e2` 等元素引用）
3. 交互操作：`agent-browser click @e5` / `agent-browser fill @e3 "文本"`
4. 截图验证：`agent-browser screenshot`
5. 数据提取：`agent-browser extract`

## 与 Agents 集成

本 skill 可供以下 Agent 调用：
- **front-agent**：前端开发完成后用浏览器验证 UI 还原度
- **test-agent**：联调测试时执行端到端浏览器测试
- **github-agent**：部署后验证线上页面可访问性
- **ux-agent**：在浏览器中审查设计稿还原效果
