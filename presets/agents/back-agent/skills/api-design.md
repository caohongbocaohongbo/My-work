# api-design

## 目的

根据需求文档设计完整的 RESTful API（或 GraphQL）接口规范。

## 输入

- `需求规格说明.md`

## 输出

- `API接口文档.md`

## 设计原则

1. **资源导向**：URL 表示资源，HTTP 方法表示操作
2. **一致性**：命名、格式、错误响应全局统一
3. **版本化**：URL 包含版本号（/api/v1/）
4. **可预测**：通过阅读一个端点的文档即可推断其他端点规则
5. **向后兼容**：新增字段不破坏现有客户端

## 执行步骤

### 1. 资源识别

从需求中提取数据实体，映射为 API 资源：

| 实体 | 端点前缀 | 示例 |
|------|----------|------|
| 用户 | /users | GET /users, GET /users/:id |
| 商品 | /products | GET /products, POST /products |
| 订单 | /orders | GET /orders, POST /orders |

### 2. 端点设计

对每个资源，按 RESTful 规范设计：

```
GET    /api/v1/resources          # 列表（支持分页、筛选、排序）
POST   /api/v1/resources          # 创建
GET    /api/v1/resources/:id      # 详情
PUT    /api/v1/resources/:id      # 全量更新
PATCH  /api/v1/resources/:id      # 部分更新
DELETE /api/v1/resources/:id      # 删除
```

### 3. 统一响应格式

**成功响应：**
```json
{
  "code": 0,
  "message": "success",
  "data": { ... }
}
```

**列表响应：**
```json
{
  "code": 0,
  "message": "success",
  "data": {
    "items": [...],
    "pagination": {
      "page": 1,
      "pageSize": 20,
      "total": 100,
      "totalPages": 5
    }
  }
}
```

**错误响应：**
```json
{
  "code": 40101,
  "message": "请先登录",
  "detail": "Access token is missing or expired"
}
```

### 4. 错误码规范

| 范围 | 含义 |
|------|------|
| 0 | 成功 |
| 40000-40099 | 参数校验错误 |
| 40100-40199 | 认证错误 |
| 40300-40399 | 权限错误 |
| 40400-40499 | 资源不存在 |
| 40900-40999 | 资源冲突（重复等） |
| 42900-42999 | 频率限制 |
| 50000-50099 | 服务器内部错误 |

### 5. 文档格式

每个端点应包含：

```markdown
### GET /api/v1/products

获取商品列表，支持分页、筛选、排序。

**Query 参数：**
| 参数 | 类型 | 必填 | 默认值 | 说明 |
|------|------|------|--------|------|
| page | integer | 否 | 1 | 页码 |
| pageSize | integer | 否 | 20 | 每页数量（最大 100） |
| keyword | string | 否 | - | 搜索关键词 |
| category | string | 否 | - | 分类筛选 |
| sortBy | string | 否 | createdAt | 排序字段 |
| sortOrder | string | 否 | desc | 排序方向（asc/desc） |

**成功响应 (200):**
```json
{
  "code": 0,
  "message": "success",
  "data": {
    "items": [
      {
        "id": 1,
        "name": "商品名称",
        "price": 99.00,
        "createdAt": "2026-05-06T10:00:00Z"
      }
    ],
    "pagination": { "page": 1, "pageSize": 20, "total": 1, "totalPages": 1 }
  }
}
```

**错误码：**
| 错误码 | 说明 |
|--------|------|
| 40001 | pageSize 超过最大值 100 |
```
