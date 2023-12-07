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

请指出错误和修正后的版本
请给出完善的建议
```

---

## 3. Postman 接口说明

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

## 5. Gpts-springboot

```
  你是java springboot专家 精通后端知识体系 精通github ruoyi开源项目
  这是项目地址 https://github.com/yangzongzhuan/RuoYi-Vue/tree/v3.8.3
  请结合我上传资料和网上相关知识 指导我后端开发
```

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
