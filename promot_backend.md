## Gpts-springboot

```
  你是java springboot专家 精通后端知识体系 精通github ruoyi开源项目
  这是项目地址 https://github.com/yangzongzhuan/RuoYi-Vue/tree/v3.8.3
  请结合我上传资料和网上相关知识 指导我后端开发
```

## 1. Mapper XML

```
表结构
xx

Domain 文件
xx

XML文件
xx

请帮我在xml增加一条根据xx 筛选xx
给出对应的mapper
```

---

## 2. 完善数据表结构

```
当前数据表
  xx

请给出完善的建议
返回完善后的数据表
```

---

## 3. Postman 接口说明 (post 请求)

```
例子
    punch_name    VARCHAR(255) DEFAULT NULL COMMENT '值班名称',
    punch_address VARCHAR(255) DEFAULT NULL COMMENT '值班地址',
    area_code     VARCHAR(255) DEFAULT NULL COMMENT '所属地区',
    根据这张表的数据 生成postman可测试的json数据 并在每个字段右边加上注释 方便生成文档
```

---

## 4. Postman 接口说明 (GET 请求)

```
例子
   punch_name    VARCHAR(255) DEFAULT NULL COMMENT '值班名称',
   punch_address VARCHAR(255) DEFAULT NULL COMMENT '值班地址',
   area_code     VARCHAR(255) DEFAULT NULL COMMENT '所属地区'
   根据这张表的数据 给response做文档说明 每个字段右边加上注释
```

---

---

## 6. Controller 安全性和限制规则建议

```
  请给我的controller
  xx
- 限制规则建议
- 确保输入验证
- 安全性建议
```

---

## 7. 模拟数据表 SQL 查询

```
  <select id="selectMenuPermsByUserId" parameterType="Long" resultType="String">
        select distinct m.perms
        from sys_menu m
                 left join sys_role_menu rm on m.menu_id = rm.menu_id
                 left join sys_user_role ur on rm.role_id = ur.role_id
                 left join sys_role r on r.role_id = ur.role_id
        where m.status = '0'
          and r.status = '0'
          and ur.user_id = #{userId}
    </select>

- 以这段数据库查询举个实际例子 展示它的运行过程给我 要求有具体数据
```

## 8. 对实体类添加校验注解

```
  帮我根据Max Min NotBlank NotNull 对数据添加校验注解
```

## 9. 实体类新增字段 xml 添加对应字段内容

```
  xx.domain
  上面是实体类
  帮我在下面xml添加 字段1  字段2 部分
  以单独每句xml返回
  xx.xml {select update insert}
-
```

### 10. 根据表结构生成 xml ...

```
根据表
生成对应的
xml model impl mapper service 及 service interface

```

### 11 根据文档 或 网页 demo 实现同类型功能

```
  OSS上传
  SNS通知
```

### 12 controller => service interface => service impl => mapper => xml

```
  准备材料 domain dataSheet
  不要别的多余的部分 只给关于该功能 xml mapper service Impl 关键代码
```

### 13 controller + model => postman

```
  准备材料 controller model
  要求1 不要导出excel接口 生成postman文档
  要求2 给每个请求加上参数说明
```

### 14 xml 生成增删改查语句

```
  准备材料 xml

```

### 15 postman 文档

```
要生成类似图中的Postman接口文档，我们需要以下信息：

1. **Controller文件**：包含API端点定义和处理逻辑。
2. **建表SQL**：描述数据库结构和字段。
3. **Model文件**：描述数据模型。
4. **Response示例**：API返回的JSON格式示例（可选，但有助于文档的准确性）。
5. **API功能描述**：简要描述API的功能和用途。

你已经提供了controller文件。为了生成完整的文档，请按照下面的步骤提供剩余的信息：

1. **建表SQL**文件：
   - 这个文件应该包含用于创建涉及到API的表的SQL语句。
2. **Model文件**：
   - Java类文件，描述了涉及到API的数据模型。
3. **Response示例**（可选）：
   - 例如登录成功时返回的JSON格式示例。
4. **API功能描述**（可选）：
   - 例如API的主要功能和使用场景。

你已经上传了多个文件，请确认其中是否已经包含了上述信息。然后我们可以开始生成Postman接口文档。

如果你提供的文件中没有包含所有信息，可以分别上传这些文件。你可以先确认并上传建表SQL和Model文件。

```
