# 角色圣经模板

为每个角色保存一个 JSON 或 YAML 文件，字段建议如下：

- `id`、`display_name`、`rights_source`。
- `reference_assets`：路径、视角、内容哈希和授权说明。
- `identity_lock`：稳定面部、发型、肤色、体型和年龄特征。
- `wardrobe_lock`：服装、鞋、首饰、随身物和材质。
- `proportion_lock`：身高关系、肩宽和肢体比例。
- `allowed_variations` 与 `forbidden_drift`。
- `model_bindings`：适配器/LoRA、版本、强度、校验值和许可证。
- `shot_states`：每镜开始、结束及交接状态。

接触表至少包含正面、左右 3/4、侧面、全身、微笑、紧张和说话表情。不要让生成模型在未锁定角色时直接批量生成全片。
