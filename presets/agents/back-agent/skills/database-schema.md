# database-schema

## 目的

根据需求文档设计数据库表结构、索引和关系。

## 输入

- `需求规格说明.md`
- `API接口文档.md`（保持数据模型一致）

## 输出

- `数据库Schema.md`

## 设计原则

1. **命名规范**：表名用蛇形命名（snake_case）复数形式；字段名用蛇形命名
2. **每表必有主键**：使用自增 ID 或 UUID
3. **时间戳**：每表包含 `created_at`、`updated_at`（软删除加 `deleted_at`）
4. **最小字段原则**：不用 NULL 时加 NOT NULL；有默认值就设置 DEFAULT
5. **索引合理**：WHERE/JOIN/ORDER BY 字段加索引；避免过度索引
6. **范式化**：达到 3NF，避免数据冗余

## 执行步骤

### 1. 实体识别

从需求和 API 文档中提取核心实体：

```
用户 (users) → 订单 (orders) → 订单项 (order_items) ← 商品 (products)
```

### 2. 表结构设计

每张表需定义：

```sql
CREATE TABLE users (
    id              BIGSERIAL       PRIMARY KEY,
    username        VARCHAR(50)     NOT NULL UNIQUE,
    email           VARCHAR(255)    NOT NULL UNIQUE,
    password_hash   VARCHAR(255)    NOT NULL,
    role            VARCHAR(20)     NOT NULL DEFAULT 'user',
    status          VARCHAR(20)     NOT NULL DEFAULT 'active',
    created_at      TIMESTAMP       NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- 索引
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_status ON users(status);
CREATE INDEX idx_users_created_at ON users(created_at);
```

### 3. 字段类型规范

| 业务含义 | 推荐类型 |
|----------|----------|
| 主键 | BIGSERIAL / UUID |
| 短文本 (≤255) | VARCHAR(N) |
| 长文本 | TEXT |
| 布尔值 | BOOLEAN |
| 金额 | DECIMAL(12,2) |
| 时间 | TIMESTAMP / TIMESTAMPTZ |
| 枚举 | VARCHAR(20) + CHECK 约束 |
| JSON 数据 | JSONB |
| 文件路径 | VARCHAR(500) |

### 4. 索引策略

| 场景 | 索引类型 |
|------|----------|
| 主键查询 | 自动（B-Tree） |
| 唯一约束 | UNIQUE INDEX |
| 外键关联 | INDEX on FK column |
| 模糊搜索 | GIN + pg_trgm（PostgreSQL） |
| 全文搜索 | GIN + tsvector |
| 排序分页 | 复合索引 (status, created_at DESC) |
| 地理位置 | GiST / SP-GIST |

### 5. 文档格式

```markdown
## 数据库设计

### ER 图

[ASCII ER 图或文字描述]

### 表清单

| 表名 | 说明 | 预估行数 |
|------|------|----------|
| users | 用户表 | 100K |
| products | 商品表 | 10K |
| orders | 订单表 | 1M |
| order_items | 订单明细 | 5M |

### 表结构详情

#### users
| 字段 | 类型 | 约束 | 说明 |
|------|------|------|------|
| id | BIGSERIAL | PK | 用户ID |
| username | VARCHAR(50) | NOT NULL, UNIQUE | 用户名 |
| email | VARCHAR(255) | NOT NULL, UNIQUE | 邮箱 |
| password_hash | VARCHAR(255) | NOT NULL | 密码哈希 |
| role | VARCHAR(20) | NOT NULL, DEFAULT 'user' | 角色 |
| status | VARCHAR(20) | NOT NULL, DEFAULT 'active' | 状态 |
| created_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | 创建时间 |
| updated_at | TIMESTAMP | NOT NULL, DEFAULT NOW() | 更新时间 |

**索引：**
- `idx_users_email` ON (email)
- `idx_users_status` ON (status)
- `idx_users_created_at` ON (created_at)

### 迁移注意事项

- 大表加索引：使用 CONCURRENTLY（PostgreSQL）避免锁表
- 大表加字段：设置 DEFAULT 值后逐步回填
- 不可逆变更：先在从库验证，再做主库变更
```
