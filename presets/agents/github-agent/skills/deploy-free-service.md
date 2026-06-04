# deploy-free-service

## 目的

将项目部署到免费托管平台，获得可公开访问的在线地址。

## 输入

- GitHub 仓库地址
- 项目类型（纯前端 / 全栈 / API）

## 输出

- 在线预览/访问地址
- 部署配置说明

## 平台选择

### 纯前端项目（HTML/CSS/JS）

| 平台 | 适用场景 | 部署方式 |
|------|----------|----------|
| **GitHub Pages** | 静态站点 | 推送即部署 |
| **Vercel** | 静态站点 + SPA | 关联 GitHub 自动部署 |
| **Netlify** | 静态站点 + 表单 | 拖拽部署或关联 GitHub |
| **Cloudflare Pages** | 静态站点 + 全球CDN | 关联 GitHub |

**推荐：Vercel**
- 零配置部署
- 自动 HTTPS
- 支持 SPA 路由重写
- 每次 PR 自动生成预览链接

### 后端 API 项目

| 平台 | 适用场景 | 限制 |
|------|----------|------|
| **Render** | Python/Node/Go Web 服务 | 免费 750h/月，15 分钟不活跃休眠 |
| **Railway** | 全栈/后端 | 免费额度 $5/月 |
| **Fly.io** | 容器化应用 | 免费 3 个 VM |
| **Vercel Serverless** | API 路由 | 函数执行限制 10s |

**推荐：Render**
- 支持 Docker 和原生运行时
- 自动 HTTPS
- Web Service / Static Site / Cron Job 三种模式

### 全栈项目

| 平台 | 部署方式 |
|------|----------|
| **Vercel + Render** | 前端部署 Vercel，API 部署 Render |
| **Railway** | 前后端一起部署 |

## 部署步骤

### Vercel（前端）

```bash
# 准备工作：确保项目有正确的构建配置
# vercel.json (可选)
{
  "rewrites": [
    { "source": "/(.*)", "destination": "/index.html" }
  ]
}

# 使用 Vercel CLI 部署
npx vercel --prod

# 或直接在 Vercel Dashboard 导入 GitHub 仓库
```

### Render（后端 API）

```bash
# 1. 在 Render Dashboard 创建 Web Service
# 2. 关联 GitHub 仓库
# 3. 配置：
#    - Build Command: pip install -r requirements.txt
#    - Start Command: uvicorn main:app --host 0.0.0.0 --port $PORT
# 4. 环境变量：通过 Render Dashboard 配置
```

### GitHub Pages

```bash
# 在 GitHub 仓库 Settings → Pages → Source: GitHub Actions
# 创建 .github/workflows/deploy.yml

name: Deploy to GitHub Pages
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pages: write
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v4
      - uses: actions/upload-pages-artifact@v3
        with:
          path: '.'
      - id: deployment
        uses: actions/deploy-pages@v4
```

## 验证清单

- [ ] 主页可正常访问
- [ ] 所有页面无 404
- [ ] HTTPS 正常工作
- [ ] 表单/交互功能正常
- [ ] API 端点响应正常（如有）
- [ ] 移动端显示正常

## 输出格式

```markdown
## 部署报告

### 部署信息
- 部署平台: Vercel
- 在线地址: https://project-name.vercel.app
- 部署时间: 2026-05-06 15:30 UTC

### 部署配置
- 分支: main
- 构建命令: (无，纯静态)
- 输出目录: ./
- 环境变量: 无

### 验证结果
- [x] 主页可访问 (HTTP 200)
- [x] HTTPS 正常
- [x] 所有页面正常
- [x] 交互功能正常

### 已知限制
- Render 免费版有 15 分钟休眠，首次访问可能较慢
```
