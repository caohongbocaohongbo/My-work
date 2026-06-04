# sdk-generation

## 目的

根据 API 接口文档，自动生成客户端 SDK 调用代码（JavaScript/TypeScript/Python）。

## 输入

- `API接口文档.md`

## 输出

- SDK 代码文件（按语言选择）

## 执行步骤

### 1. 确定目标语言

根据项目技术栈选择：
- JavaScript（前端项目默认）
- TypeScript（类型安全）
- Python（后端/脚本项目）

### 2. JavaScript SDK 模板

```javascript
// api-client.js
class APIClient {
  constructor(baseURL = 'http://localhost:3000/api/v1') {
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      headers: {
        'Content-Type': 'application/json',
        ...options.headers,
      },
      ...options,
    };

    const response = await fetch(url, config);
    const data = await response.json();

    if (data.code !== 0) {
      throw new APIError(data.code, data.message, data.detail);
    }

    return data.data;
  }

  // === 用户 API ===
  async getUsers(params = {}) {
    const query = new URLSearchParams(params).toString();
    return this.request(`/users?${query}`);
  }

  async getUser(id) {
    return this.request(`/users/${id}`);
  }

  async createUser(userData) {
    return this.request('/users', {
      method: 'POST',
      body: JSON.stringify(userData),
    });
  }

  async updateUser(id, userData) {
    return this.request(`/users/${id}`, {
      method: 'PATCH',
      body: JSON.stringify(userData),
    });
  }

  async deleteUser(id) {
    return this.request(`/users/${id}`, {
      method: 'DELETE',
    });
  }

  // === 商品 API ===
  // ...按相同模式生成
}

class APIError extends Error {
  constructor(code, message, detail) {
    super(message);
    this.code = code;
    this.detail = detail;
  }
}

export default APIClient;
```

### 3. Python SDK 模板

```python
# api_client.py
import requests
from typing import Optional, Dict, Any, List

class APIClient:
    def __init__(self, base_url: str = "http://localhost:3000/api/v1"):
        self.base_url = base_url
        self.session = requests.Session()
        self.session.headers.update({"Content-Type": "application/json"})

    def _request(self, method: str, endpoint: str, **kwargs) -> Dict[str, Any]:
        url = f"{self.base_url}{endpoint}"
        response = self.session.request(method, url, **kwargs)
        data = response.json()
        if data.get("code") != 0:
            raise APIError(data["code"], data["message"], data.get("detail"))
        return data["data"]

    # === 用户 API ===
    def get_users(self, **params) -> Dict:
        return self._request("GET", "/users", params=params)

    def get_user(self, user_id: int) -> Dict:
        return self._request("GET", f"/users/{user_id}")

    def create_user(self, user_data: Dict) -> Dict:
        return self._request("POST", "/users", json=user_data)

    def update_user(self, user_id: int, user_data: Dict) -> Dict:
        return self._request("PATCH", f"/users/{user_id}", json=user_data)

    def delete_user(self, user_id: int) -> Dict:
        return self._request("DELETE", f"/users/{user_id}")


class APIError(Exception):
    def __init__(self, code: int, message: str, detail: Optional[str] = None):
        self.code = code
        self.message = message
        self.detail = detail
        super().__init__(message)
```

### 4. 生成规则

1. **命名转换**：API 端点 `/user-profiles` → `getUserProfiles()`
2. **参数映射**：Query 参数 → 函数参数对象；Body 参数 → 函数参数对象
3. **类型标注**：TypeScript/Python 添加类型注解
4. **错误处理**：统一抛出 APIError，调用方自行处理
