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
