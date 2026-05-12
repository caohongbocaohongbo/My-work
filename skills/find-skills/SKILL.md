---
name: "find-skills"
description: "帮助查找和发现适合特定需求的skill。当用户询问如何做某事或需要什么skill时，使用此技能来搜索和推荐相关skill。"
---

# Find Skills

## 概述

此技能帮助用户查找和发现适合其特定需求的skill。当用户询问如何做某事或需要什么skill时，使用此技能来搜索和推荐相关skill。

## 功能

- 语义化搜索skill商店
- 基于用户需求推荐相关skill
- 提供skill安装和使用指南
- 帮助用户扩展AI助手的能力

## 使用场景

当用户提出以下类型的问题时，应使用此技能：
- "我需要一个用于前端开发的skill"
- "有没有用于数据分析的skill？"
- "如何找到适合UI设计的skill？"
- "推荐一个用于代码审查的skill"

## 使用步骤

1. 分析用户的需求和问题
2. 搜索与需求相关的skill
3. 评估找到的skill是否符合用户需求
4. 向用户推荐最适合的skill
5. 提供安装和使用该skill的指南

## 示例

### 示例1：查找前端开发相关的skill

用户："我需要一个用于前端开发的skill"

1. 分析需求：用户需要前端开发相关的skill
2. 搜索相关skill：前端设计、响应式设计、CSS动画等
3. 推荐skill：frontend-design、responsive-restore、css-smooth-animation
4. 提供安装指南：`npx skills add vercel-labs/agent-skills --skill frontend-design`

### 示例2：查找数据分析相关的skill

用户："有没有用于数据分析的skill？"

1. 分析需求：用户需要数据分析相关的skill
2. 搜索相关skill：数据可视化、统计分析等
3. 推荐skill：data-visualization、statistical-analysis
4. 提供安装指南：`npx skills add <repository> --skill data-visualization`

## 安装指南

要安装和使用此技能，用户可以：

1. 使用skills CLI工具安装skill：
   ```bash
   npx skills add <repository> --skill find-skills
   ```

2. 直接在项目中创建skill目录：
   ```bash
   mkdir -p .trae/skills/find-skills
   ```

3. 将此SKILL.md文件复制到该目录中

## 注意事项

- 此技能依赖于用户提供清晰的需求描述
- 搜索结果可能因可用的skill仓库而异
- 推荐的skill可能需要额外的安装步骤
- 某些skill可能需要特定的权限或依赖项

## 维护

- 定期更新skill搜索策略以包含新的skill
- 优化推荐算法以提供更准确的结果
- 保持与最新的skill生态系统兼容
