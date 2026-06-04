# repo-create

## 目的

在 GitHub 上创建仓库，初始化项目结构并推送代码。

## 输入

- 项目代码（前端/后端文件）
- 项目名称
- 项目描述（可选）

## 输出

- GitHub 仓库 URL
- 推送状态

## 执行步骤

### 1. 准备项目结构

确保项目包含基本文件：

```
project-name/
├── README.md          # 项目说明
├── .gitignore         # Git 忽略规则
├── index.html         # 前端入口（如有）
├── src/               # 源代码
├── package.json       # 依赖配置（如有）
├── requirements.txt   # Python 依赖（如有）
└── ...
```

### 2. 创建 README.md

```markdown
# 项目名称

## 简介
一句话描述项目。

## 功能
- 功能 1
- 功能 2

## 技术栈
- 前端: HTML/CSS/JS
- 后端: Python/FastAPI (如有)

## 快速开始
\`\`\`bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev
\`\`\`

## 在线预览
[待部署后更新]

## 项目结构
\`\`\`
...
\`\`\`
```

### 3. 创建 .gitignore

根据项目类型生成对应的 `.gitignore`：

```
# Dependencies
node_modules/
.pnp
.pnp.js

# Build
dist/
build/

# Environment
.env
.env.local
.env.*.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
npm-debug.log*
```

### 4. 创建仓库并推送

使用 GitHub CLI（`gh`）：

```bash
# 初始化 Git
cd /path/to/project
git init
git add .
git commit -m "Initial commit"

# 创建 GitHub 仓库
gh repo create <repo-name> --public --source=. --remote=origin --push
```

若 `gh` 未配置，使用手动方式：
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/<username>/<repo-name>.git
git branch -M main
git push -u origin main
```

### 5. 输出格式

```markdown
## 仓库创建报告

### 基本信息
- 仓库名称: <repo-name>
- 仓库地址: https://github.com/<username>/<repo-name>
- 默认分支: main
- 可见性: Public

### 文件清单
- [x] README.md
- [x] .gitignore
- [x] index.html
- [x] 其他文件...

### 推送状态
- [x] 代码已推送至 GitHub
- [x] 仓库可公开访问
```
