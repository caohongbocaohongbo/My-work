# api-render

## 目的

将前端代码与后端 API 对接，实现真实数据获取和渲染，覆盖所有异步状态。

## 输入

- 前端代码（index.html）
- `API接口文档.md`（back-agent 产出）

## 输出

- 更新后的前端代码，所有 mock 数据替换为真实 API 调用

## 执行步骤

### 1. API 端点映射

根据 API 文档，建立页面与 API 的映射表：

| 页面 | 数据需求 | API 端点 | 请求方式 | 触发时机 |
|------|----------|----------|----------|----------|
| 首页 | 商品列表 | GET /api/products | GET | 页面加载 |
| 详情 | 商品详情 | GET /api/products/:id | GET | 点击商品卡片 |
| 登录 | 用户认证 | POST /api/auth/login | POST | 表单提交 |

### 2. 实现数据层

创建统一的 API 请求模块：

```javascript
// API 基础配置
const API_BASE = 'http://localhost:3000/api';

// 通用请求封装
async function apiRequest(endpoint, options = {}) {
  const config = {
    headers: { 'Content-Type': 'application/json' },
    ...options,
  };
  try {
    const response = await fetch(`${API_BASE}${endpoint}`, config);
    if (!response.ok) {
      const error = await response.json().catch(() => ({}));
      throw new APIError(response.status, error.message || '请求失败');
    }
    return await response.json();
  } catch (err) {
    if (err instanceof APIError) throw err;
    throw new APIError(0, '网络连接失败，请检查网络');
  }
}

class APIError extends Error {
  constructor(status, message) {
    super(message);
    this.status = status;
  }
}
```

### 3. 覆盖所有异步状态

**每个 API 调用必须处理四种状态：**

```
1. Loading（加载中）  → 骨架屏 / Spinner / 进度条
2. Success（成功）    → 正常渲染数据
3. Empty（空数据）    → 空状态插图 + 引导文案 + 操作按钮
4. Error（错误）      → 错误提示 + 重试按钮 + 错误详情（开发环境）
```

实现模式：

```javascript
async function loadData() {
  const container = document.getElementById('data-container');

  // 1. Loading 态
  container.innerHTML = renderSkeleton();
  container.classList.add('is-loading');

  try {
    const data = await apiRequest('/products');

    // 2. Empty 态
    if (!data || data.length === 0) {
      container.innerHTML = renderEmptyState();
      container.classList.remove('is-loading');
      return;
    }

    // 3. Success 态
    container.innerHTML = renderData(data);
    container.classList.remove('is-loading');

  } catch (err) {
    // 4. Error 态
    container.innerHTML = renderError(err, () => loadData());
    container.classList.remove('is-loading');
  }
}
```

### 4. 错误处理策略

| 错误类型 | HTTP 状态码 | 用户提示 | 系统行为 |
|----------|-------------|----------|----------|
| 网络错误 | 0 / fetch fail | "网络连接失败，请检查网络" | 显示重试按钮 |
| 服务端错误 | 5xx | "服务器繁忙，请稍后重试" | 自动重试 1 次 + 重试按钮 |
| 未登录 | 401 | "请先登录" | 跳转登录页 |
| 无权限 | 403 | "无权访问此内容" | 返回上一页 |
| 资源不存在 | 404 | "内容不存在或已删除" | 显示 404 页面 |
| 参数错误 | 400 | 显示具体错误信息 | 高亮错误字段 |
| 超时 | 408 / timeout | "请求超时，请重试" | 显示重试按钮 |

### 5. 乐观更新（可选）

对高频操作（点赞、收藏），使用乐观更新提升体验：
1. 先更新 UI
2. 发 API 请求
3. 失败则回滚 UI + 提示错误
