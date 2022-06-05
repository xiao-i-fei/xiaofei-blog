/*
 Navicat Premium Data Transfer

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : xiaofei-blog

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 05/06/2022 16:39:37
*/
CREATE DATABASE IF NOT EXISTS `mall-admin` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `mall-admin`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article`  (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `user_id` int NOT NULL COMMENT '作者',
                               `category_id` int NULL DEFAULT NULL COMMENT '文章分类',
                               `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章缩略图',
                               `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
                               `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
                               `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '文章类型 1原创 2转载 3翻译',
                               `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
                               `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
                               `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
                               `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密 3评论可见',
                               `create_time` datetime NOT NULL COMMENT '发表时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article
-- ----------------------------

-- ----------------------------
-- Table structure for tb_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tag`;
CREATE TABLE `tb_article_tag`  (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `article_id` int NOT NULL COMMENT '文章id',
                                   `tag_id` int NOT NULL COMMENT '标签id',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `fk_article_tag_1`(`article_id`) USING BTREE,
                                   INDEX `fk_article_tag_2`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
                                `create_time` datetime NOT NULL COMMENT '创建时间',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_category
-- ----------------------------

-- ----------------------------
-- Table structure for tb_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_record`;
CREATE TABLE `tb_chat_record`  (
                                   `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                   `user_id` int NULL DEFAULT NULL COMMENT '用户id',
                                   `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
                                   `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
                                   `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '聊天内容',
                                   `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip地址',
                                   `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip来源',
                                   `type` tinyint NOT NULL COMMENT '类型',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_chat_record
-- ----------------------------

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
                               `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                               `user_id` int NOT NULL COMMENT '评论用户Id',
                               `topic_id` int NULL DEFAULT NULL COMMENT '评论主题id',
                               `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
                               `reply_user_id` int NULL DEFAULT NULL COMMENT '回复用户id',
                               `parent_id` int NULL DEFAULT NULL COMMENT '父评论id',
                               `type` tinyint NOT NULL COMMENT '评论类型 1.文章 2.友链 3.说说',
                               `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除  0否 1是',
                               `is_review` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否审核',
                               `create_time` datetime NOT NULL COMMENT '评论时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               PRIMARY KEY (`id`) USING BTREE,
                               INDEX `fk_comment_user`(`user_id`) USING BTREE,
                               INDEX `fk_comment_parent`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend_link`;
CREATE TABLE `tb_friend_link`  (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接名',
                                   `link_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接头像',
                                   `link_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接地址',
                                   `link_intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接介绍',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `fk_friend_link_user`(`link_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                            `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
                            `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径',
                            `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件',
                            `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单icon',
                            `create_time` datetime NOT NULL COMMENT '创建时间',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            `order_num` tinyint(1) NOT NULL COMMENT '排序',
                            `parent_id` int NULL DEFAULT NULL COMMENT '父id',
                            `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏  0否1是',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
                               `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
                               `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
                               `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
                               `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
                               `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ip',
                               `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户地址',
                               `time` tinyint(1) NULL DEFAULT NULL COMMENT '弹幕速度',
                               `is_review` tinyint NOT NULL DEFAULT 1 COMMENT '是否审核',
                               `create_time` datetime NOT NULL COMMENT '发布时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log`  (
                                     `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                     `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
                                     `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
                                     `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作url',
                                     `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作方法',
                                     `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
                                     `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
                                     `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
                                     `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
                                     `user_id` int NOT NULL COMMENT '用户id',
                                     `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
                                     `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
                                     `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
                                     `create_time` datetime NOT NULL COMMENT '创建时间',
                                     `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_page
-- ----------------------------
DROP TABLE IF EXISTS `tb_page`;
CREATE TABLE `tb_page`  (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '页面id',
                            `page_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面名',
                            `page_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面标签',
                            `page_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面封面',
                            `create_time` datetime NOT NULL COMMENT '创建时间',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '页面' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_page
-- ----------------------------

-- ----------------------------
-- Table structure for tb_photo
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo`;
CREATE TABLE `tb_photo`  (
                             `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                             `album_id` int NOT NULL COMMENT '相册id',
                             `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片名',
                             `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '照片描述',
                             `photo_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片地址',
                             `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
                             `create_time` datetime NOT NULL COMMENT '创建时间',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '照片' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo_album`;
CREATE TABLE `tb_photo_album`  (
                                   `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                   `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册名',
                                   `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册描述',
                                   `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册封面',
                                   `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
                                   `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态值 1公开 2私密',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '相册' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_photo_album
-- ----------------------------

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource`  (
                                `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名',
                                `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限路径',
                                `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
                                `parent_id` int NULL DEFAULT NULL COMMENT '父权限id',
                                `is_anonymous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否匿名访问 0否 1是',
                                `create_time` datetime NOT NULL COMMENT '创建时间',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
                            `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
                            `role_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
                            `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用  0否 1是',
                            `create_time` datetime NOT NULL COMMENT '创建时间',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu`  (
                                 `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                 `role_id` int NULL DEFAULT NULL COMMENT '角色id',
                                 `menu_id` int NULL DEFAULT NULL COMMENT '菜单id',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for tb_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource`  (
                                     `id` int NOT NULL AUTO_INCREMENT,
                                     `role_id` int NULL DEFAULT NULL COMMENT '角色id',
                                     `resource_id` int NULL DEFAULT NULL COMMENT '权限id',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_talk
-- ----------------------------
DROP TABLE IF EXISTS `tb_talk`;
CREATE TABLE `tb_talk`  (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '说说id',
                            `user_id` int NOT NULL COMMENT '用户id',
                            `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '说说内容',
                            `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
                            `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶',
                            `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1.公开 2.私密',
                            `create_time` datetime NOT NULL COMMENT '创建时间',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_talk
-- ----------------------------

-- ----------------------------
-- Table structure for tb_unique_view
-- ----------------------------
DROP TABLE IF EXISTS `tb_unique_view`;
CREATE TABLE `tb_unique_view`  (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `views_count` int NOT NULL COMMENT '访问量',
                                   `create_time` datetime NOT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_unique_view
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_auth`;
CREATE TABLE `tb_user_auth`  (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `user_info_id` int NOT NULL COMMENT '用户信息id',
                                 `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
                                 `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
                                 `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
                                 `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户登录ip',
                                 `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip来源',
                                 `create_time` datetime NOT NULL COMMENT '创建时间',
                                 `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                 `last_login_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
                                 PRIMARY KEY (`id`) USING BTREE,
                                 UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
                                 `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                                 `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱号',
                                 `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
                                 `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
                                 `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户简介',
                                 `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人网站',
                                 `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
                                 `create_time` datetime NOT NULL COMMENT '创建时间',
                                 `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `user_id` int NULL DEFAULT NULL COMMENT '用户id',
                                 `role_id` int NULL DEFAULT NULL COMMENT '角色id',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for tb_website_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_website_config`;
CREATE TABLE `tb_website_config`  (
                                      `id` int NOT NULL AUTO_INCREMENT,
                                      `config` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配置信息',
                                      `create_time` datetime NOT NULL COMMENT '创建时间',
                                      `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_website_config
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
