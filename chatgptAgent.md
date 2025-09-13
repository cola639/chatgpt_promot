### dynamic jpa sql

项目名称 springboot-dynamicsql

pom.xml 配置如下
java 1.8
spring-boot-starter-parent 2.7.x
jpa
mysql-connector-java

application.yml 配置文件
主数据库账号资料为
url: jdbc:mysql://localhost:3306/movie?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

从数据库账号资料为
url: jdbc:mysql://localhost:3300/movie?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

实现在 service 层面 通过 annotation 如@SourceSwitch("primary") 动态数据源切换 如主数据库负责写 从数据库负责读
1 补充 pom
2 补充 yml
3 给出对应目录树 再给对应的文件内容
如
-aspect
-annotation
-config

### export excel

项目名称 springboot-excel

pom.xml 配置如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok

application.yml 配置文件
url: jdbc:mysql://localhost:3306/movie?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

实现 Movie excel 导出功能 要求实现 enum 对状态或者性别的转换
1 补充 pom
2 补充 yml
3 给出对应目录树 再给对应的文件内容
如
-aspect
-annotation
-config

### export pdf

项目名称 springboot-pdf

pom.xml 配置如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok

application.yml 配置文件
url: jdbc:mysql://localhost:3306/movie?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

实现 pdf 生成 并且有加上红色盖章
1 补充 pom
2 补充 yml
3 给出对应目录树 再给对应的文件内容
如
-aspect
-annotation
-config

### export rbac

项目名称 springboot-rbac

pom.xml 配置如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok

application.yml 配置文件
url: jdbc:mysql://localhost:3306/movie?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

实现 rbac 权限管理 要求按钮级别的控制
1 补充 pom
2 补充 yml
3 给出对应目录树 再给对应的文件内容
4 sql 表设计
如
-aspect
-annotation

### websocket

项目名称 springboot-websocket

pom.xml 如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok

application.yml 配置文件
url: jdbc:mysql://localhost:3306/movie?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

实现 websocket 集成
1 补充 pom
2 补充 yml
3 给出对应目录树 再给对应的文件内容
如
-aspect
-annotation

### kafka

项目名称 springboot-kafka

pom.xml 如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok

application.yml 配置文件
url: jdbc:mysql://localhost:3306/movie?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

实现 kafka 集成
1 补充 pom
2 补充 yml
3 给出对应目录树 再给对应的文件内容
4 有可测试 controller
5 关键日志输出

### safe unsafe demo

学习多线程 给出 safeDemo unsafeDemo
只给改动的地方加上对比说明

### secKill goods

我想学习秒杀系统设计
先给我做一个错误的例子
项目名称 springboot-seckill

pom.xml 如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok

application.yml 配置文件
url: jdbc:mysql://localhost:3306/goods?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

1 补充 pom.xml
2 sql 插入商品
3 补充 yml
4 给出对应目录树 再给对应的文件内容
5 有可测试 controller
6 关键日志输出
7 Jmeter 测试 jmx 基于 5.6.3 version 使用方法也补充下
8 @SL4J 做日志记录 @RequiredArgsConstructor 做服务注入
不要生成文件去下载 直接给我返回文件内容

### SSO Design

我想学习 SSO 登录设计

项目名称 springboot-sso

pom.xml 如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok

application.yml 配置文件
url: jdbc:mysql://localhost:3333/demo?useSSL=false
username: root
password: 123456
driver-class-name: com.mysql.cj.jdbc.Driver

1 补充 pom.xml
2 补充 sql
3 补充 yml
4 给出对应目录树 再给对应的文件内容
5 有可测试 controller
6 关键日志输出
8 @SL4J 做日志记录 @RequiredArgsConstructor 做服务注入
不要生成文件去下载 直接给我返回文件内容

### 参考这样形式 帮我写 XXX enums

public enum MovieStatus {

    INACTIVE(0, "Inactive"),
    ACTIVE(1, "Active"),
    BANNED(2, "Banned"),
    COMING_SOON(3, "Coming Soon");

    private final int code;
    private final String description;

    MovieStatus(int code, String description) {
        this.code = code;
        this.description = description;
    }

    public int getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public static MovieStatus fromCode(int code) {
        for (MovieStatus status : MovieStatus.values()) {
            if (status.getCode() == code) {
                return status;
            }
        }
        throw new IllegalArgumentException("Unknown code: " + code);
    }

}

### springboot jpa

```
create table movies
(
    movie_id     bigint(20) auto_increment comment 'Movie ID',
    movie_name   varchar(255) null comment 'Movie name',
    movie_type   varchar(255) null comment 'Movie type',
    movie_actors varchar(255) null comment 'Movie actors',
    movie_status tinyint(1)   null comment 'Movie status (active/inactive)',
    create_time  datetime     null comment 'Record creation time',
    update_time  datetime default current_timestamp on update current_timestamp comment 'Record last update time',
    remarks      varchar(255) null comment 'Additional remarks',
    primary key (movie_id)
) engine = innodb
  auto_increment = 1
  default charset = utf8
  collate = utf8_general_ci comment = 'Movies table';


项目名称 springboot-jpa

pom.xml 如下
java 1.8
spring-boot-starter-parent 2.7.16
jpa
mysql-connector-java
lombok
JackJson

0 补充movie_movie_types movie_types actors sql包括每个表插入5条mock数据
1 补充 pom
2 补充 yml
3 补充 sql 包括
3 给出对应目录树 再给对应的文件内容


实现jpa对movies的增删改查 并且实现分页功能
实现movies 结合 actors查询
实现根据movie_type查询
实现涉及用oneToMany manyToMany join in exist between 复杂sql查询



```

### 项目名称 master slave docker

2 台 ubuntu20 机器 主数据库 142.171.9.183 从数据库 198.13.37.5
基于主机模式
部署 mysql8.0+ MySQL InnoDB Cluster 来实现主从同步 容灾 强一致性
使用 MySQL Router 作为代理，确保自动负载均衡和故障转移
mysql 账号设置 test 密码 test123
分别给出 2 台对应配置内容

我有 2 台机器都有 docker 计划主数据库 142.171.9.183 从数据库 64.112.41.32
docker 部署 mysql8.0+ MySQL InnoDB Cluster 来实现主从同步 容灾 强一致性
使用 MySQL Router 作为代理，确保自动负载均衡和故障转移
账号设置 root 密码 123456
给出安装的 library 和 分别给出 2 台对应配置内容

我有 1 台机器有 docker docker-compose 计划 1 主 1 从
主数据库容器本地 IP 3306 端口 从数据库容器本地 3307 端口
docker 部署 mysql8.0+ MySQL InnoDB Cluster 来实现主从同步 容灾 强一致性
使用 MySQL Router 作为代理，确保自动负载均衡和故障转移
账号都设置 root 密码 123456
给出安装的 library 和 分别给出 2 个数据库对应配置内容

### 安装 8.0

一键安装脚本 mysql 8.0 并设置用户 root 和密码 123456 登录 sh

### sql

把 Java 中带转义字符（\t, \n, + 拼接）的 @Query 注解里的 SQL 还原为可以直接在数据库控制台执行的完整 SQL 语句

### Design module

in a best design pattern, consider the functional requirement & flex & resuable
design a email/export Excel/Amazon S3 service
requirement: 1 , 2, 3,

---

Following best design patterns,design email service consider functional requirements, flexibility, and reusability.

Functional Requirements

1 Support configuration via YAML.

2 Decouple the core email-sending logic from the actual implementation, allowing easy replacement of SMTP or third-party services (e.g., Alibaba Cloud Mail, AWS SES).

3 Support bulk sending with parallel processing to avoid blocking.

4 Use a template engine with Thymeleaf support.

5 Utilize a thread pool and asynchronous tasks to prevent sequential blocking.

6 Ensure high portability, allowing implementation replacement with zero intrusion.

7 Please also provide the code directory structure.

8 Render dynamic email content using Thymeleaf templates

### 可在不同项目 独立可迁移模块 遵循最佳实践方式 给出目录结构

### design minio upload

基于最佳设计模式 设计一个 minio 上传 下载文件的 service
function requirement
1 支持单个 或者批量上传
2 支持生成时效性 token 给前端上传
3 支持对单独某个文件生成有时间限制的访问链接 或者 下载链接
4 支持生成时效性的文件 过期自动删除
可在不同项目 独立可迁移模块 遵循最佳实践方式 给出目录结构
再补充一些你能考虑到的

### ui

支持主框架 Layout（左侧菜单、顶部导航、内容区、面包屑）。

动态路由与子路由加载（基于配置生成）。

菜单与路由联动（支持隐藏、权限控制）。

后端下发路由配置 / 权限信息，前端动态渲染菜单与页面。

懒加载、按需加载子模块。

主题切换 主题色设置 头像展示 信息通知

还有补充的吗

### RBAC

帮我设计一个 rbac 系统
基于最佳设计模式
function requirement
1 支持多角色管理
2 权限控制到按钮
3 controller 层面可以通过注解判断权限

给出 ddl sql 数据 controller 例子 给出目录结构
要求能在本地运行起来
可在不同项目 独立可迁移模块 遵循最佳实践方式
再补充一些你能考虑到的

### spring boot 模块

给出一个 monitor 模块
1 要求统计 sql 拦截 SQL，记录执行次数、平均/最大/最小耗时
2 要求统计 uri 访问频率 总次数 平均耗时 报错次数 最大耗时 最小耗时
要求模块化 可迁移化 不需要侵入原来代码模块
只要做成 module 就行 先不做 jar 包
给出 Spring Boot 标准风格目录结构
给出 具体代码
