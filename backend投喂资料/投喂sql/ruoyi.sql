/*
 Navicat Premium Data Transfer

 Source Server         : localhost-mysql57
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 20/07/2023 10:08:19
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `package_name`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`       datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`       datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table`
VALUES (1, 'sys_role_dept', '角色和部门关联表', NULL, NULL, 'SysRoleDept', 'crud', 'com.colaclub.system', 'system',
        'dept', '角色和部门关联', 'ruoyi', '0', '/', NULL, 'admin', '2023-04-08 11:32:28', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (2, 'user_chat', '用户聊天表', NULL, NULL, 'UserChat', 'crud', 'com.colaclub.system', 'system', 'chat',
        '用户聊天', 'ruoyi', '0', '/', NULL, 'admin', '2023-06-27 00:39:59', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (3, 'sys_role', '角色信息表', NULL, NULL, 'SysRole', 'crud', 'com.colaclub.system', 'system', 'role', '角色信息',
        'ruoyi', '0', '/', NULL, 'admin', '2023-06-27 00:48:13', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `sort`           int(11) NULL DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES (1, '1', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2023-04-08 11:32:28', '', NULL);
INSERT INTO `gen_table_column`
VALUES (2, '1', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 2, 'admin', '2023-04-08 11:32:28', '', NULL);
INSERT INTO `gen_table_column`
VALUES (3, '2', 'id', '聊天记录ID', 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input',
        '', 1, 'admin', '2023-06-27 00:39:59', '', NULL);
INSERT INTO `gen_table_column`
VALUES (4, '2', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input',
        '', 2, 'admin', '2023-06-27 00:39:59', '', NULL);
INSERT INTO `gen_table_column`
VALUES (5, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 3, 'admin', '2023-06-27 00:39:59', '', NULL);
INSERT INTO `gen_table_column`
VALUES (6, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 4, 'admin', '2023-06-27 00:39:59', '', NULL);
INSERT INTO `gen_table_column`
VALUES (7, '2', 'message', '聊天', 'longtext', 'String', 'message', '0', '0', NULL, '1', '1', '1', '1', 'EQ',
        'textarea', '', 5, 'admin', '2023-06-27 00:39:59', '', NULL);
INSERT INTO `gen_table_column`
VALUES (8, '2', 'message_type', '消息类型', 'varchar(20)', 'String', 'messageType', '0', '0', NULL, '1', '1', '1', '1',
        'EQ', 'select', '', 6, 'admin', '2023-06-27 00:39:59', '', NULL);
INSERT INTO `gen_table_column`
VALUES (9, '3', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ',
        'input', '', 1, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (10, '3', 'role_name', '角色名称', 'varchar(30)', 'String', 'roleName', '0', '0', '1', '1', '1', '1', '1',
        'LIKE', 'input', '', 2, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (11, '3', 'role_key', '角色权限字符串', 'varchar(100)', 'String', 'roleKey', '0', '0', '1', '1', '1', '1', '1',
        'EQ', 'input', '', 3, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (12, '3', 'role_sort', '显示顺序', 'int(4)', 'Integer', 'roleSort', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (13, '3', 'data_scope', '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
        'char(1)', 'String', 'dataScope', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin',
        '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (14, '3', 'menu_check_strictly', '菜单树选择项是否关联显示', 'tinyint(1)', 'Integer', 'menuCheckStrictly', '0',
        '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (15, '3', 'dept_check_strictly', '部门树选择项是否关联显示', 'tinyint(1)', 'Integer', 'deptCheckStrictly', '0',
        '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (16, '3', 'status', '角色状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1',
        'EQ', 'radio', '', 8, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (17, '3', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL,
        NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (18, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'input', '', 10, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (19, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 11, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (20, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ',
        'input', '', 12, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (21, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL,
        'EQ', 'datetime', '', 13, 'admin', '2023-06-27 00:48:13', '', NULL);
INSERT INTO `gen_table_column`
VALUES (22, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ',
        'textarea', '', 14, 'admin', '2023-06-27 00:48:13', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`  datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`  datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-02-01 12:51:44', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config`
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-02-01 12:51:44', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-02-01 12:51:44', '', NULL,
        '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config`
VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2023-02-01 12:51:44', '', NULL,
        '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-02-01 12:51:44',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
    `ancestors`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
    `order_num`   int(4) NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-02-01 12:51:44', '',
        NULL);
INSERT INTO `sys_dept`
VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);
INSERT INTO `sys_dept`
VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin',
        '2023-02-01 12:51:44', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int(4) NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '默认分组');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '系统分组');
INSERT INTO `sys_dict_data`
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '通知');
INSERT INTO `sys_dict_data`
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '公告');
INSERT INTO `sys_dict_data`
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '关闭状态');
INSERT INTO `sys_dict_data`
VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '新增操作');
INSERT INTO `sys_dict_data`
VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '修改操作');
INSERT INTO `sys_dict_data`
VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '删除操作');
INSERT INTO `sys_dict_data`
VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '授权操作');
INSERT INTO `sys_dict_data`
VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '导出操作');
INSERT INTO `sys_dict_data`
VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '导入操作');
INSERT INTO `sys_dict_data`
VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '强退操作');
INSERT INTO `sys_dict_data`
VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-02-01 12:51:44', '', NULL,
        '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type`
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type`
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type`
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type`
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type`
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`
(
    `job_id`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
    `job_name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT '' COMMENT '任务名称',
    `job_group`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
    `invoke_target`   varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
    `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
    `misfire_policy`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    `concurrent`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
    `status`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
    `create_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`     datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`     datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
    PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job`
VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_job`
VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_job`
VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?',
        '3', '1', '1', 'admin', '2023-02-01 12:51:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`
(
    `job_log_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
    `job_name`       varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '任务名称',
    `job_group`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '任务组名',
    `invoke_target`  varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
    `job_message`    varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
    `status`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
    `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
    `status`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime NULL DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 14:19:20');
INSERT INTO `sys_logininfor`
VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-01 15:21:36');
INSERT INTO `sys_logininfor`
VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-18 13:07:34');
INSERT INTO `sys_logininfor`
VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-19 16:48:14');
INSERT INTO `sys_logininfor`
VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-20 00:36:56');
INSERT INTO `sys_logininfor`
VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-22 18:23:48');
INSERT INTO `sys_logininfor`
VALUES (106, 'admin', '192.168.2.141', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-22 18:28:10');
INSERT INTO `sys_logininfor`
VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-22 22:51:39');
INSERT INTO `sys_logininfor`
VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-23 01:43:09');
INSERT INTO `sys_logininfor`
VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-23 01:43:14');
INSERT INTO `sys_logininfor`
VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-23 10:36:23');
INSERT INTO `sys_logininfor`
VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-23 12:53:32');
INSERT INTO `sys_logininfor`
VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-23 17:59:35');
INSERT INTO `sys_logininfor`
VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 00:28:32');
INSERT INTO `sys_logininfor`
VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 13:45:30');
INSERT INTO `sys_logininfor`
VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 15:06:53');
INSERT INTO `sys_logininfor`
VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 11:59:22');
INSERT INTO `sys_logininfor`
VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-25 13:19:51');
INSERT INTO `sys_logininfor`
VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 13:19:54');
INSERT INTO `sys_logininfor`
VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-08 11:31:13');
INSERT INTO `sys_logininfor`
VALUES (120, 'admin', '192.168.8.100', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-08 12:09:57');
INSERT INTO `sys_logininfor`
VALUES (121, 'admin', '192.168.8.100', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-08 13:06:21');
INSERT INTO `sys_logininfor`
VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-18 03:47:48');
INSERT INTO `sys_logininfor`
VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-18 14:22:08');
INSERT INTO `sys_logininfor`
VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 01:26:41');
INSERT INTO `sys_logininfor`
VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 10:13:17');
INSERT INTO `sys_logininfor`
VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-19 10:15:53');
INSERT INTO `sys_logininfor`
VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 10:15:59');
INSERT INTO `sys_logininfor`
VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 15:10:59');
INSERT INTO `sys_logininfor`
VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 16:43:49');
INSERT INTO `sys_logininfor`
VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 17:17:31');
INSERT INTO `sys_logininfor`
VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 17:17:35');
INSERT INTO `sys_logininfor`
VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 20:04:23');
INSERT INTO `sys_logininfor`
VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 21:55:13');
INSERT INTO `sys_logininfor`
VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 12:41:05');
INSERT INTO `sys_logininfor`
VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 14:44:08');
INSERT INTO `sys_logininfor`
VALUES (136, 'admin', '192.168.2.141', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 14:21:18');
INSERT INTO `sys_logininfor`
VALUES (137, 'admin', '192.168.2.141', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-25 15:41:14');
INSERT INTO `sys_logininfor`
VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-26 01:12:39');
INSERT INTO `sys_logininfor`
VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-27 00:39:00');
INSERT INTO `sys_logininfor`
VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-01 23:20:06');
INSERT INTO `sys_logininfor`
VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-02 02:05:12');
INSERT INTO `sys_logininfor`
VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-02 04:17:55');
INSERT INTO `sys_logininfor`
VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-02 14:38:49');
INSERT INTO `sys_logininfor`
VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-02 15:37:58');
INSERT INTO `sys_logininfor`
VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-06 17:58:16');
INSERT INTO `sys_logininfor`
VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 01:19:30');
INSERT INTO `sys_logininfor`
VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 10:07:58');
INSERT INTO `sys_logininfor`
VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 11:00:04');
INSERT INTO `sys_logininfor`
VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 15:20:40');
INSERT INTO `sys_logininfor`
VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 15:20:58');
INSERT INTO `sys_logininfor`
VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 15:21:44');
INSERT INTO `sys_logininfor`
VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 15:23:17');
INSERT INTO `sys_logininfor`
VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 15:24:08');
INSERT INTO `sys_logininfor`
VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 15:25:37');
INSERT INTO `sys_logininfor`
VALUES (155, 'admin', '192.168.2.123', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 15:26:15');
INSERT INTO `sys_logininfor`
VALUES (156, 'admin', '192.168.2.123', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 16:50:57');
INSERT INTO `sys_logininfor`
VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 21:14:34');
INSERT INTO `sys_logininfor`
VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 21:15:03');
INSERT INTO `sys_logininfor`
VALUES (159, 'admin', '192.168.8.100', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-07 21:15:14');
INSERT INTO `sys_logininfor`
VALUES (160, 'admin', '192.168.8.100', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-09 00:44:26');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int(4) NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
    `is_frame`    int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `is_cache`    int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1061 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-02-01 12:51:44', '',
        NULL, '系统管理目录');
INSERT INTO `sys_menu`
VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-02-01 12:51:44',
        '', NULL, '系统监控目录');
INSERT INTO `sys_menu`
VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-02-01 12:51:44', '',
        NULL, '系统工具目录');
INSERT INTO `sys_menu`
VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin',
        '2023-02-01 12:51:44', 'admin', '2023-06-27 00:50:22', '若依官网地址');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2023-02-01 12:51:44', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2023-02-01 12:51:44', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table',
        'admin', '2023-02-01 12:51:44', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2023-02-01 12:51:44', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post',
        'admin', '2023-02-01 12:51:44', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2023-02-01 12:51:44', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit',
        'admin', '2023-02-01 12:51:44', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        'message', 'admin', '2023-02-01 12:51:44', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu`
VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-02-01 12:51:44', '', NULL,
        '日志管理菜单');
INSERT INTO `sys_menu`
VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list',
        'online', 'admin', '2023-02-01 12:51:44', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu`
VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin',
        '2023-02-01 12:51:44', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu`
VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid',
        'admin', '2023-02-01 12:51:44', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu`
VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list',
        'server', 'admin', '2023-02-01 12:51:44', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu`
VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis',
        'admin', '2023-02-01 12:51:44', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu`
VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list',
        'redis-list', 'admin', '2023-02-01 12:51:44', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu`
VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build',
        'admin', '2023-02-01 12:51:44', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu`
VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2023-02-01 12:51:44', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu`
VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger',
        'admin', '2023-02-01 12:51:44', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu`
VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list',
        'form', 'admin', '2023-02-01 12:51:44', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu`
VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0',
        'monitor:logininfor:list', 'logininfor', 'admin', '2023-02-01 12:51:44', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu`
VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1041, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1045, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1046, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1047, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1048, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1049, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1050, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1051, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1052, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1053, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1054, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1055, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1056, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1057, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1058, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1059, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1060, '聊天管理', 0, 0, 'chat', 'chat', NULL, 1, 0, 'C', '0', '0', '', 'wechat', 'admin', '2023-06-19 10:21:36',
        'admin', '2023-06-19 10:29:21', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob NULL COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice`
VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin',
        '2023-02-01 12:51:44', '', NULL, '管理员');
INSERT INTO `sys_notice`
VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-02-01 12:51:44',
        '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
    `business_type`  int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
    `operator_type`  int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
    `status`         int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime NULL DEFAULT NULL COMMENT '操作时间',
    PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log`
VALUES (1, '代码生成', 6, 'com.colaclub.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_role_dept', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-04-08 11:32:28');
INSERT INTO `sys_oper_log`
VALUES (2, '菜单管理', 1, 'com.colaclub.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"聊天管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"chat\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 10:21:36');
INSERT INTO `sys_oper_log`
VALUES (3, '菜单管理', 2, 'com.colaclub.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2023-06-19 10:21:36\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1060,\"menuName\":\"聊天管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"chat\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 10:22:38');
INSERT INTO `sys_oper_log`
VALUES (4, '菜单管理', 2, 'com.colaclub.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"chat\",\"createTime\":\"2023-06-19 10:21:36\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1060,\"menuName\":\"聊天管理\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"chat\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 10:29:21');
INSERT INTO `sys_oper_log`
VALUES (5, '代码生成', 6, 'com.colaclub.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'user_chat', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-06-27 00:39:59');
INSERT INTO `sys_oper_log`
VALUES (6, '代码生成', 8, 'com.colaclub.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-06-27 00:40:05');
INSERT INTO `sys_oper_log`
VALUES (7, '代码生成', 6, 'com.colaclub.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL,
        '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_role', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-06-27 00:48:13');
INSERT INTO `sys_oper_log`
VALUES (8, '菜单管理', 3, 'com.colaclub.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0,
        NULL, '2023-06-27 00:50:11');
INSERT INTO `sys_oper_log`
VALUES (9, '菜单管理', 2, 'com.colaclub.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL,
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2023-02-01 12:51:44\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-27 00:50:22');
INSERT INTO `sys_oper_log`
VALUES (10, '菜单管理', 3, 'com.colaclub.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0,
        NULL, '2023-06-27 00:50:31');
INSERT INTO `sys_oper_log`
VALUES (11, '菜单管理', 3, 'com.colaclub.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL,
        '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0,
        NULL, '2023-06-27 00:50:57');
INSERT INTO `sys_oper_log`
VALUES (12, '代码生成', 8, 'com.colaclub.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-07-01 23:20:48');
INSERT INTO `sys_oper_log`
VALUES (13, '代码生成', 8, 'com.colaclub.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-07-01 23:20:48');
INSERT INTO `sys_oper_log`
VALUES (14, '代码生成', 8, 'com.colaclub.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-07-01 23:21:51');
INSERT INTO `sys_oper_log`
VALUES (15, '代码生成', 8, 'com.colaclub.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL,
        '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-07-01 23:21:51');
INSERT INTO `sys_oper_log`
VALUES (16, '聊天管理', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin', NULL,
        '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', NULL, 1,
        'Invalid bound statement (not found): com.colaclub.chat.mapper.UserChatMapper.deleteChatById',
        '2023-07-06 18:02:50');
INSERT INTO `sys_oper_log`
VALUES (17, '聊天管理', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin', NULL,
        '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', NULL, 1,
        'Invalid bound statement (not found): com.colaclub.chat.mapper.UserChatMapper.deleteChatById',
        '2023-07-06 18:12:28');
INSERT INTO `sys_oper_log`
VALUES (18, '聊天管理', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin', NULL,
        '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', NULL, 1,
        'Invalid bound statement (not found): com.colaclub.chat.mapper.UserChatMapper.deleteChatById',
        '2023-07-06 18:13:29');
INSERT INTO `sys_oper_log`
VALUES (19, '聊天管理', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin', NULL,
        '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2023-07-06 18:14:01');
INSERT INTO `sys_oper_log`
VALUES (20, '聊天管1理12221', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin',
        NULL, '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL,
        '2023-07-07 01:19:41');
INSERT INTO `sys_oper_log`
VALUES (21, '聊天管1理12221', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin',
        NULL, '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL,
        '2023-07-07 01:19:55');
INSERT INTO `sys_oper_log`
VALUES (22, '聊天管理', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin', NULL,
        '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL,
        '2023-07-07 10:08:41');
INSERT INTO `sys_oper_log`
VALUES (23, '聊天管理', 3, 'com.colaclub.web.controller.chat.UserChatController.remove()', 'DELETE', 1, 'admin', NULL,
        '/chat/2', '127.0.0.1', '内网IP', '{userId=2}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL,
        '2023-07-07 10:18:35');
INSERT INTO `sys_oper_log`
VALUES (24, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP',
        '{\"id\":106,\"message\":\"测试聊天信息7\",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 15:35:45');
INSERT INTO `sys_oper_log`
VALUES (25, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP',
        '{\"id\":107,\"message\":\"测试聊天信息7\",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 15:39:55');
INSERT INTO `sys_oper_log`
VALUES (26, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP',
        '{\"id\":108,\"message\":\"测试聊天信息7\",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 16:51:10');
INSERT INTO `sys_oper_log`
VALUES (27, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP', '{\"id\":109,\"message\":\"\",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 16:51:19');
INSERT INTO `sys_oper_log`
VALUES (28, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP', '{\"id\":110,\"message\":\" \",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 16:51:30');
INSERT INTO `sys_oper_log`
VALUES (29, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP', '{\"id\":111,\"message\":\" \",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 17:00:16');
INSERT INTO `sys_oper_log`
VALUES (30, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP', '{\"id\":112,\"message\":\" \",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 17:30:05');
INSERT INTO `sys_oper_log`
VALUES (31, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP', '{\"id\":113,\"message\":\" \",\"messageType\":\"text\",\"userId\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 17:45:16');
INSERT INTO `sys_oper_log`
VALUES (32, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL,
        '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\cola1\\Desktop\\study\\Java\\RuoYi-SpringBoot-3.8.3\\ruoyi-system\\target\\classes\\mapper\\chat\\ChatMapper.xml]\r\n### The error may involve com.colaclub.chat.mapper.UserChatMapper.insertChat-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_chat          ( user_id,                                                    message_type )           values ( ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-07-07 17:45:20');
INSERT INTO `sys_oper_log` VALUES (33, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"id\":114,\"message\":\"jia\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 17:45:32');
INSERT INTO `sys_oper_log` VALUES (34, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\cola1\\Desktop\\study\\Java\\RuoYi-SpringBoot-3.8.3\\ruoyi-system\\target\\classes\\mapper\\chat\\ChatMapper.xml]\r\n### The error may involve com.colaclub.chat.mapper.UserChatMapper.insertChat-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_chat          ( user_id,                                                    message_type )           values ( ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-07-07 17:45:35');
INSERT INTO `sys_oper_log` VALUES (35, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\cola1\\Desktop\\study\\Java\\RuoYi-SpringBoot-3.8.3\\ruoyi-system\\target\\classes\\mapper\\chat\\ChatMapper.xml]\r\n### The error may involve com.colaclub.chat.mapper.UserChatMapper.insertChat-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_chat          ( user_id,                                                    message_type )           values ( ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-07-07 17:51:46');
INSERT INTO `sys_oper_log` VALUES (36, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\cola1\\Desktop\\study\\Java\\RuoYi-SpringBoot-3.8.3\\ruoyi-system\\target\\classes\\mapper\\chat\\ChatMapper.xml]\r\n### The error may involve com.colaclub.chat.mapper.UserChatMapper.insertChat-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_chat          ( user_id,                                                    message_type )           values ( ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-07-07 17:51:47');
INSERT INTO `sys_oper_log` VALUES (37, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\cola1\\Desktop\\study\\Java\\RuoYi-SpringBoot-3.8.3\\ruoyi-system\\target\\classes\\mapper\\chat\\ChatMapper.xml]\r\n### The error may involve com.colaclub.chat.mapper.UserChatMapper.insertChat-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_chat          ( user_id,                                                    message_type )           values ( ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-07-07 17:52:01');
INSERT INTO `sys_oper_log` VALUES (38, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\cola1\\Desktop\\study\\Java\\RuoYi-SpringBoot-3.8.3\\ruoyi-system\\target\\classes\\mapper\\chat\\ChatMapper.xml]\r\n### The error may involve com.colaclub.chat.mapper.UserChatMapper.insertChat-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_chat          ( user_id,                                                    message_type )           values ( ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-07-07 17:52:41');
INSERT INTO `sys_oper_log` VALUES (39, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [C:\\Users\\cola1\\Desktop\\study\\Java\\RuoYi-SpringBoot-3.8.3\\ruoyi-system\\target\\classes\\mapper\\chat\\ChatMapper.xml]\r\n### The error may involve com.colaclub.chat.mapper.UserChatMapper.insertChat-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into user_chat          ( user_id,                                                    message_type )           values ( ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2023-07-07 17:53:58');
INSERT INTO `sys_oper_log` VALUES (40, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-07-07 18:14:22');
INSERT INTO `sys_oper_log` VALUES (41, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"发生错误\",\"code\":500}', 0, NULL, '2023-07-07 18:14:30');
INSERT INTO `sys_oper_log` VALUES (42, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"参数有误\",\"code\":500}', 0, NULL, '2023-07-07 18:16:49');
INSERT INTO `sys_oper_log` VALUES (43, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"参数有误\",\"code\":500}', 0, NULL, '2023-07-07 18:16:50');
INSERT INTO `sys_oper_log` VALUES (44, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"参数有误\",\"code\":500}', 0, NULL, '2023-07-07 21:19:16');
INSERT INTO `sys_oper_log` VALUES (45, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"参数有误\",\"code\":500}', 0, NULL, '2023-07-07 21:21:13');
INSERT INTO `sys_oper_log` VALUES (46, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"参数有误\",\"code\":500}', 0, NULL, '2023-07-07 21:43:46');
INSERT INTO `sys_oper_log` VALUES (47, '新增聊天', 1, 'com.colaclub.web.controller.chat.UserChatController.add()', 'POST', 1, 'admin', NULL, '/chat/newChat', '127.0.0.1', '内网IP', '{\"message\":\"\",\"messageType\":\"text\",\"userId\":6}', '{\"msg\":\"参数有误\",\"code\":500}', 0, NULL, '2023-07-07 21:46:45');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-02-01 12:51:44', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-02-01 12:51:44', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-02-01 12:51:44', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '192.168.8.100', '2023-07-09 00:44:26', 'admin', '2023-02-01 12:51:44', '', '2023-07-09 00:44:26', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-01 12:51:44', 'admin', '2023-02-01 12:51:44', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for user_chat
-- ----------------------------
DROP TABLE IF EXISTS `user_chat`;
CREATE TABLE `user_chat`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '聊天记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '聊天',
  `message_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'text' COMMENT '消息类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户聊天表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_chat
-- ----------------------------
INSERT INTO `user_chat` VALUES (100, 0, '2023-06-25 15:14:52', NULL, '测试聊天信息1', 'text');
INSERT INTO `user_chat` VALUES (101, 1, '2023-06-25 15:14:52', NULL, '测试聊天信息2', 'text');
INSERT INTO `user_chat` VALUES (103, 3, '2023-06-25 15:14:52', NULL, '测试聊天信息4', 'text');
INSERT INTO `user_chat` VALUES (104, 4, '2023-06-25 15:14:52', NULL, '测试聊天信息5', 'text');
INSERT INTO `user_chat` VALUES (105, 5, '2023-06-25 15:14:52', NULL, '测试聊天信息6', 'text');

SET FOREIGN_KEY_CHECKS = 1;
