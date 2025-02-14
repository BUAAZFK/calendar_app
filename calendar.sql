/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : calendar

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 14/02/2025 22:00:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add event', 1, 'add_event');
INSERT INTO `auth_permission` VALUES (2, 'Can change event', 1, 'change_event');
INSERT INTO `auth_permission` VALUES (3, 'Can delete event', 1, 'delete_event');
INSERT INTO `auth_permission` VALUES (4, 'Can view event', 1, 'view_event');
INSERT INTO `auth_permission` VALUES (5, 'Can add log entry', 2, 'add_logentry');
INSERT INTO `auth_permission` VALUES (6, 'Can change log entry', 2, 'change_logentry');
INSERT INTO `auth_permission` VALUES (7, 'Can delete log entry', 2, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (8, 'Can view log entry', 2, 'view_logentry');
INSERT INTO `auth_permission` VALUES (9, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (11, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (12, 'Can view permission', 3, 'view_permission');
INSERT INTO `auth_permission` VALUES (13, 'Can add group', 4, 'add_group');
INSERT INTO `auth_permission` VALUES (14, 'Can change group', 4, 'change_group');
INSERT INTO `auth_permission` VALUES (15, 'Can delete group', 4, 'delete_group');
INSERT INTO `auth_permission` VALUES (16, 'Can view group', 4, 'view_group');
INSERT INTO `auth_permission` VALUES (17, 'Can add user', 5, 'add_user');
INSERT INTO `auth_permission` VALUES (18, 'Can change user', 5, 'change_user');
INSERT INTO `auth_permission` VALUES (19, 'Can delete user', 5, 'delete_user');
INSERT INTO `auth_permission` VALUES (20, 'Can view user', 5, 'view_user');
INSERT INTO `auth_permission` VALUES (21, 'Can add content type', 6, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (22, 'Can change content type', 6, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (23, 'Can delete content type', 6, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (24, 'Can view content type', 6, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (25, 'Can add session', 7, 'add_session');
INSERT INTO `auth_permission` VALUES (26, 'Can change session', 7, 'change_session');
INSERT INTO `auth_permission` VALUES (27, 'Can delete session', 7, 'delete_session');
INSERT INTO `auth_permission` VALUES (28, 'Can view session', 7, 'view_session');
INSERT INTO `auth_permission` VALUES (29, 'Can add victory', 8, 'add_victory');
INSERT INTO `auth_permission` VALUES (30, 'Can change victory', 8, 'change_victory');
INSERT INTO `auth_permission` VALUES (31, 'Can delete victory', 8, 'delete_victory');
INSERT INTO `auth_permission` VALUES (32, 'Can view victory', 8, 'view_victory');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (5, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (6, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (1, 'events', 'event');
INSERT INTO `django_content_type` VALUES (8, 'events', 'victory');
INSERT INTO `django_content_type` VALUES (7, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-01-31 14:03:00.358968');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-01-31 14:03:01.071750');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-01-31 14:03:01.226992');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-01-31 14:03:01.234290');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-31 14:03:01.240445');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-01-31 14:03:01.309219');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-01-31 14:03:01.381835');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-01-31 14:03:01.401956');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-01-31 14:03:01.409126');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-01-31 14:03:01.472193');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-01-31 14:03:01.475029');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-01-31 14:03:01.482676');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-01-31 14:03:01.556938');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-01-31 14:03:01.621797');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-01-31 14:03:01.639130');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-01-31 14:03:01.647113');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-01-31 14:03:01.702633');
INSERT INTO `django_migrations` VALUES (18, 'events', '0001_initial', '2025-01-31 14:03:01.731453');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2025-01-31 14:03:01.771328');
INSERT INTO `django_migrations` VALUES (20, 'events', '0002_victory', '2025-02-02 06:13:06.176961');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for events_event
-- ----------------------------
DROP TABLE IF EXISTS `events_event`;
CREATE TABLE `events_event`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `progress` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events_event
-- ----------------------------
INSERT INTO `events_event` VALUES (8, '去旌介', '过年走亲戚，在两个姨姨家吃饭\n', 'Life', 'completed', '2025-02-01');
INSERT INTO `events_event` VALUES (10, '看论文、买东西', '看RL4CO、RLHF的论文，寻找组合优化问题的可能创新方法；\n继续抓紧修改缓存调度代码，争取把启发式方法调试成功；', 'study', 'not-started', '2025-02-02');
INSERT INTO `events_event` VALUES (11, '学习大模型知识', '继续看huggingface 的视频，并完成1.5B大模型的本地应用；\n基本了解大模型的微调等过程；\n了解并开始记录大模型训练设备清单；', 'study；work', 'not-started', '2025-02-02');
INSERT INTO `events_event` VALUES (12, 'calendar待办事项网页开发', '完成背景状态显示功能', 'learn', 'in-progress', '2025-02-02');
INSERT INTO `events_event` VALUES (13, '亲戚吃饭', '无', 'Life', 'not-started', '2025-02-03');
INSERT INTO `events_event` VALUES (14, '缓存调度代码', '1、修改缓存调度代码，输出机器、缓存、工件状态变化\n2、列出缓存调度论文目录\n3、思考启发式算法解决组合优化问题的新思路', 'study', 'not-started', '2025-02-03');
INSERT INTO `events_event` VALUES (15, '拔牙', '拔掉下颌两颗智齿：很疼', 'Life', 'completed', '2025-02-04');
INSERT INTO `events_event` VALUES (16, '看牙', '洗牙', 'Life', 'not-started', '2025-02-05');
INSERT INTO `events_event` VALUES (17, '学习LLM的视频', '看LLM视频\n看装机视频', 'study', 'not-started', '2025-02-05');
INSERT INTO `events_event` VALUES (18, '同学聚会', '同学聚会', 'Life', 'not-started', '2025-02-07');

-- ----------------------------
-- Table structure for events_victory
-- ----------------------------
DROP TABLE IF EXISTS `events_victory`;
CREATE TABLE `events_victory`  (
  `date` date NOT NULL,
  `state` tinyint(1) NOT NULL,
  PRIMARY KEY (`date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events_victory
-- ----------------------------
INSERT INTO `events_victory` VALUES ('2025-02-01', 0);
INSERT INTO `events_victory` VALUES ('2025-02-02', 1);
INSERT INTO `events_victory` VALUES ('2025-02-03', 1);
INSERT INTO `events_victory` VALUES ('2025-02-04', 1);
INSERT INTO `events_victory` VALUES ('2025-02-05', 1);
INSERT INTO `events_victory` VALUES ('2025-02-06', 1);
INSERT INTO `events_victory` VALUES ('2025-02-07', 1);
INSERT INTO `events_victory` VALUES ('2025-02-08', 1);

SET FOREIGN_KEY_CHECKS = 1;
