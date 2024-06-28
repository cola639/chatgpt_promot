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

-
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

### 12 controller

```
  准备材料 domain dataSheet
  不要别的多余的部分 只给关于该功能 xml mapper service Impl 关键代码
```
