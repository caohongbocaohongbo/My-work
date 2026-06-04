# auto-pr

## 目的

自动创建 Pull Request，用于代码审查和团队协作。

## 输入

- 功能分支名称
- PR 标题和描述
- 目标分支（默认 main）

## 输出

- PR 链接

## 执行步骤

### 1. 创建功能分支

```bash
git checkout -b feature/<feature-name>
git add .
git commit -m "feat: <简短描述>"
git push -u origin feature/<feature-name>
```

### 2. 生成 PR 描述

```markdown
## 变更概述
<简要说明本次变更目的和内容>

## 变更类型
- [ ] Bug 修复
- [x] 新功能
- [ ] 重构
- [ ] 文档更新

## 详细变更
- 新增 XX 页面
- 实现 XX API
- 修复 XX 问题

## 测试说明
- 前端: 在浏览器中测试了 XX 流程
- 后端: 运行 `pytest` 全部通过
- API 测试: 覆盖了所有端点

## 关联文档
- 需求文档: [链接]
- 设计稿: [链接]
- API 文档: [链接]

## 截图
| 页面 | 桌面端 | 移动端 |
|------|--------|--------|
| 首页 | [截图] | [截图] |

## 检查清单
- [x] 代码通过测试
- [x] UI 还原度 ≥95%
- [x] API 覆盖率 100%
- [x] 无明显 Bug
```

### 3. 创建 PR

使用 GitHub CLI：

```bash
gh pr create \
  --title "feat: <功能名称>" \
  --body "$(cat PR_DESCRIPTION.md)" \
  --base main \
  --head feature/<feature-name>
```

### 4. 输出格式

```markdown
## PR 创建报告

### PR 信息
- 标题: feat: <功能名称>
- 分支: feature/<feature-name> → main
- PR 地址: https://github.com/<owner>/<repo>/pull/<number>
- 状态: Open

### 包含的提交
- <commit-hash> feat: <简短描述>

### 文件变更
- index.html (新增/修改)
- styles.css (修改)
- api.js (新增)
```
