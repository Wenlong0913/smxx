/*
Navicat PGSQL Data Transfer

Source Server         : dagle
Source Server Version : 90410
Source Host           : localhost:3305
Source Database       : dagle_dev
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90410
File Encoding         : 65001

Date: 2017-01-15 17:02:19
*/


-- ----------------------------
-- Sequence structure for audits_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."audits_id_seq";
CREATE SEQUENCE "public"."audits_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 55
 CACHE 1;
SELECT setval('"public"."audits_id_seq"', 55, true);

-- ----------------------------
-- Sequence structure for catalogs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."catalogs_id_seq";
CREATE SEQUENCE "public"."catalogs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 24
 CACHE 1;
SELECT setval('"public"."catalogs_id_seq"', 24, true);

-- ----------------------------
-- Sequence structure for ckeditor_assets_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ckeditor_assets_id_seq";
CREATE SEQUENCE "public"."ckeditor_assets_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for cms_channels_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cms_channels_id_seq";
CREATE SEQUENCE "public"."cms_channels_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 28
 CACHE 1;
SELECT setval('"public"."cms_channels_id_seq"', 28, true);

-- ----------------------------
-- Sequence structure for cms_pages_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cms_pages_id_seq";
CREATE SEQUENCE "public"."cms_pages_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"public"."cms_pages_id_seq"', 10, true);

-- ----------------------------
-- Sequence structure for cms_sites_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cms_sites_id_seq";
CREATE SEQUENCE "public"."cms_sites_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4
 CACHE 1;
SELECT setval('"public"."cms_sites_id_seq"', 4, true);

-- ----------------------------
-- Sequence structure for image_item_relations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."image_item_relations_id_seq";
CREATE SEQUENCE "public"."image_item_relations_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for image_item_tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."image_item_tags_id_seq";
CREATE SEQUENCE "public"."image_item_tags_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for image_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."image_items_id_seq";
CREATE SEQUENCE "public"."image_items_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."items_id_seq";
CREATE SEQUENCE "public"."items_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 22
 CACHE 1;
SELECT setval('"public"."items_id_seq"', 22, true);

-- ----------------------------
-- Sequence structure for material_management_details_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."material_management_details_id_seq";
CREATE SEQUENCE "public"."material_management_details_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for material_managements_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."material_managements_id_seq";
CREATE SEQUENCE "public"."material_managements_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for members_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."members_id_seq";
CREATE SEQUENCE "public"."members_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for order_materials_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_materials_id_seq";
CREATE SEQUENCE "public"."order_materials_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for order_products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_products_id_seq";
CREATE SEQUENCE "public"."order_products_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."orders_id_seq";
CREATE SEQUENCE "public"."orders_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for produces_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."produces_id_seq";
CREATE SEQUENCE "public"."produces_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."roles_id_seq"', 5, true);

-- ----------------------------
-- Sequence structure for sites_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sites_id_seq";
CREATE SEQUENCE "public"."sites_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."sites_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for task_types_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."task_types_id_seq";
CREATE SEQUENCE "public"."task_types_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for tasks_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tasks_id_seq";
CREATE SEQUENCE "public"."tasks_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for theme_configs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."theme_configs_id_seq";
CREATE SEQUENCE "public"."theme_configs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for themes_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."themes_id_seq";
CREATE SEQUENCE "public"."themes_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for tracker_actions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tracker_actions_id_seq";
CREATE SEQUENCE "public"."tracker_actions_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."tracker_actions_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for tracker_sessions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tracker_sessions_id_seq";
CREATE SEQUENCE "public"."tracker_sessions_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 17
 CACHE 1;
SELECT setval('"public"."tracker_sessions_id_seq"', 17, true);

-- ----------------------------
-- Sequence structure for tracker_share_codes_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tracker_share_codes_id_seq";
CREATE SEQUENCE "public"."tracker_share_codes_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for tracker_user_relations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tracker_user_relations_id_seq";
CREATE SEQUENCE "public"."tracker_user_relations_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for tracker_visits_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tracker_visits_id_seq";
CREATE SEQUENCE "public"."tracker_visits_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 27
 CACHE 1;
SELECT setval('"public"."tracker_visits_id_seq"', 27, true);

-- ----------------------------
-- Sequence structure for user_mobiles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_mobiles_id_seq";
CREATE SEQUENCE "public"."user_mobiles_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."user_mobiles_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for user_weixins_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_weixins_id_seq";
CREATE SEQUENCE "public"."user_weixins_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."users_id_seq"', 3, true);

-- ----------------------------
-- Table structure for ar_internal_metadata
-- ----------------------------
DROP TABLE IF EXISTS "public"."ar_internal_metadata";
CREATE TABLE "public"."ar_internal_metadata" (
"key" varchar COLLATE "default" NOT NULL,
"value" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ar_internal_metadata
-- ----------------------------
INSERT INTO "public"."ar_internal_metadata" VALUES ('environment', 'development', '2017-01-11 05:18:56.51979', '2017-01-11 05:18:56.51979');

-- ----------------------------
-- Table structure for audits
-- ----------------------------
DROP TABLE IF EXISTS "public"."audits";
CREATE TABLE "public"."audits" (
"id" int4 DEFAULT nextval('audits_id_seq'::regclass) NOT NULL,
"auditable_id" int4,
"auditable_type" varchar COLLATE "default",
"associated_id" int4,
"associated_type" varchar COLLATE "default",
"user_id" int4,
"user_type" varchar COLLATE "default",
"username" varchar COLLATE "default",
"action" varchar COLLATE "default",
"audited_changes" text COLLATE "default",
"version" int4 DEFAULT 0,
"comment" varchar COLLATE "default",
"remote_address" varchar COLLATE "default",
"request_uuid" varchar COLLATE "default",
"created_at" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of audits
-- ----------------------------
INSERT INTO "public"."audits" VALUES ('1', '1', 'User', null, null, null, null, null, 'create', '---
nickname: 管理员
email: ''''
encrypted_password: "$2a$11$FVITmgkeCP7PnsvgT11iIextLtc.jgPg5A2JN7g25S2IeYgScYId."
reset_password_token: 
reset_password_sent_at: 
remember_created_at: 
sign_in_count: 0
current_sign_in_at: 
last_sign_in_at: 
current_sign_in_ip: 
last_sign_in_ip: 
username: 
headshot: 
', '1', null, null, '77e6f078-1043-4e0b-a761-ea68c0114cb8', '2017-01-11 05:21:42.607999');
INSERT INTO "public"."audits" VALUES ('2', '2', 'User', null, null, null, null, null, 'create', '---
nickname: 商家
email: ''''
encrypted_password: "$2a$11$eWghSVIjMYzXIqn6sGLaE.0QZb1Gd7gBpByh4rgP1HYJPgBbwJYEu"
reset_password_token: 
reset_password_sent_at: 
remember_created_at: 
sign_in_count: 0
current_sign_in_at: 
last_sign_in_at: 
current_sign_in_ip: 
last_sign_in_ip: 
username: 
headshot: 
', '1', null, null, 'b268a8c0-4e1c-4914-b72e-66f8ec6fe98b', '2017-01-11 05:21:42.907237');
INSERT INTO "public"."audits" VALUES ('3', '3', 'User', null, null, null, null, null, 'create', '---
nickname: 用户
email: ''''
encrypted_password: "$2a$11$j4X4m6ncIz4BwkKLsat.penVFVdlY9qrhBRTlQaSNiNZxQJp4AOpu"
reset_password_token: 
reset_password_sent_at: 
remember_created_at: 
sign_in_count: 0
current_sign_in_at: 
last_sign_in_at: 
current_sign_in_ip: 
last_sign_in_ip: 
username: 
headshot: 
', '1', null, null, '5f0922c6-4229-45d6-a06f-1cbd113a99d3', '2017-01-11 05:21:43.170921');
INSERT INTO "public"."audits" VALUES ('4', '1', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 自购
features:
  contact_name: 自购联系人
  phone_number: ''15213364363''
name_py: ZG
catalog_id: 
', '1', null, null, 'f79cdc0a-0eaf-4c99-9a6d-b81af1c2f033', '2017-01-11 05:21:43.929206');
INSERT INTO "public"."audits" VALUES ('5', '2', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 康鑫
features:
  contact_name: 康鑫联系人
  phone_number: ''15213364314''
name_py: KX
catalog_id: 
', '1', null, null, 'a3796cea-be3f-49e9-90ea-763bd4cbf651', '2017-01-11 05:21:43.949236');
INSERT INTO "public"."audits" VALUES ('6', '3', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 联利达五金
features:
  contact_name: 联利达五金联系人
  phone_number: ''15213364320''
name_py: LLDWJ
catalog_id: 
', '1', null, null, '5e71d786-370f-476d-a1aa-9b7380dd91f8', '2017-01-11 05:21:43.968991');
INSERT INTO "public"."audits" VALUES ('7', '4', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 友达
features:
  contact_name: 友达联系人
  phone_number: ''15213364319''
name_py: YD
catalog_id: 
', '1', null, null, '7a84d752-0729-4903-930c-59627c2460eb', '2017-01-11 05:21:43.989242');
INSERT INTO "public"."audits" VALUES ('8', '5', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 锐丰
features:
  contact_name: 锐丰联系人
  phone_number: ''15213364372''
name_py: RF
catalog_id: 
', '1', null, null, '4111d575-4eaf-4994-9afe-85504bc8132e', '2017-01-11 05:21:44.009522');
INSERT INTO "public"."audits" VALUES ('9', '6', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 壹佰
features:
  contact_name: 壹佰联系人
  phone_number: ''15213364349''
name_py: YB
catalog_id: 
', '1', null, null, '4c337431-526b-4dda-ad03-1fac2a11e6bd', '2017-01-11 05:21:44.028433');
INSERT INTO "public"."audits" VALUES ('10', '7', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 盛世百龙
features:
  contact_name: 盛世百龙联系人
  phone_number: ''15213364398''
name_py: SSBL
catalog_id: 
', '1', null, null, '77a68e3d-4c87-4769-b54b-b2dd4ffc80c1', '2017-01-11 05:21:44.047168');
INSERT INTO "public"."audits" VALUES ('11', '8', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 义力
features:
  contact_name: 义力联系人
  phone_number: ''15213364394''
name_py: YL
catalog_id: 
', '1', null, null, '31c080c4-729d-476a-a2c3-211cc66007e0', '2017-01-11 05:21:44.06639');
INSERT INTO "public"."audits" VALUES ('12', '9', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 山森科技
features:
  contact_name: 山森科技联系人
  phone_number: ''15213364384''
name_py: SSKJ
catalog_id: 
', '1', null, null, '546855bd-b0b3-4a18-9fc0-f02034f960ec', '2017-01-11 05:21:44.085399');
INSERT INTO "public"."audits" VALUES ('13', '10', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 精工
features:
  contact_name: 精工联系人
  phone_number: ''15213364391''
name_py: JG
catalog_id: 
', '1', null, null, 'dd2a5c64-a298-47da-a7f0-ec04e4089df2', '2017-01-11 05:21:44.104169');
INSERT INTO "public"."audits" VALUES ('14', '11', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 申康
features:
  contact_name: 申康联系人
  phone_number: ''15213364313''
name_py: SK
catalog_id: 
', '1', null, null, '6e66feb1-1101-41b4-9fb5-9f2ea6a165ef', '2017-01-11 05:21:44.124136');
INSERT INTO "public"."audits" VALUES ('15', '12', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 同乐
features:
  contact_name: 同乐联系人
  phone_number: ''15213364383''
name_py: TL
catalog_id: 
', '1', null, null, '0547f10d-917e-4a08-8302-c897d5c4bb5c', '2017-01-11 05:21:44.143195');
INSERT INTO "public"."audits" VALUES ('16', '13', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 上海画宇
features:
  contact_name: 上海画宇联系人
  phone_number: ''15213364379''
name_py: SHHY
catalog_id: 
', '1', null, null, '9b77c9f3-c5f6-40ab-aba8-6ae2611895b1', '2017-01-11 05:21:44.161988');
INSERT INTO "public"."audits" VALUES ('17', '14', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 大家木业
features:
  contact_name: 大家木业联系人
  phone_number: ''15213364391''
name_py: DJMY
catalog_id: 
', '1', null, null, '5f8006c0-3620-4b11-94e0-934f7cebf27e', '2017-01-11 05:21:44.180739');
INSERT INTO "public"."audits" VALUES ('18', '15', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 蒙友
features:
  contact_name: 蒙友联系人
  phone_number: ''15213364314''
name_py: MY
catalog_id: 
', '1', null, null, '8ef372ed-1898-4f6f-9925-e9db977aeced', '2017-01-11 05:21:44.199501');
INSERT INTO "public"."audits" VALUES ('19', '16', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 朋诚心
features:
  contact_name: 朋诚心联系人
  phone_number: ''15213364365''
name_py: PCX
catalog_id: 
', '1', null, null, '7819a0a6-62c0-4283-a3c7-8f2063b73203', '2017-01-11 05:21:44.245921');
INSERT INTO "public"."audits" VALUES ('20', '17', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 尚好佳
features:
  contact_name: 尚好佳联系人
  phone_number: ''15213364389''
name_py: SHJ
catalog_id: 
', '1', null, null, '55ceaf24-c9b2-4ecf-8545-3595c399a03c', '2017-01-11 05:21:44.281351');
INSERT INTO "public"."audits" VALUES ('21', '18', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 同鑫
features:
  contact_name: 同鑫联系人
  phone_number: ''15213364364''
name_py: TX
catalog_id: 
', '1', null, null, '19533c23-2893-471a-a4f8-8f02ee38d3fa', '2017-01-11 05:21:44.302585');
INSERT INTO "public"."audits" VALUES ('22', '19', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 君子兰
features:
  contact_name: 君子兰联系人
  phone_number: ''15213364334''
name_py: JZL
catalog_id: 
', '1', null, null, '705b1bdb-6d06-4c8f-8425-fa06bea0d123', '2017-01-11 05:21:44.32161');
INSERT INTO "public"."audits" VALUES ('23', '20', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 银冠
features:
  contact_name: 银冠联系人
  phone_number: ''15213364348''
name_py: YG
catalog_id: 
', '1', null, null, 'f26e819c-00db-477c-95d1-444e72490e58', '2017-01-11 05:21:44.344543');
INSERT INTO "public"."audits" VALUES ('24', '21', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 爱格
features:
  contact_name: 爱格联系人
  phone_number: ''15213364329''
name_py: AG
catalog_id: 
', '1', null, null, 'e545fe5c-aafb-4725-8425-3398b95184d9', '2017-01-11 05:21:44.3634');
INSERT INTO "public"."audits" VALUES ('25', '22', 'Item', null, null, null, null, null, 'create', '---
site_id: 1
name: 恒泰
features:
  contact_name: 恒泰联系人
  phone_number: ''15213364385''
name_py: HT
catalog_id: 
', '1', null, null, '1a407846-ea74-44c0-82d9-cbe40e5d76c4', '2017-01-11 05:21:44.384282');
INSERT INTO "public"."audits" VALUES ('26', '1', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 
name: 柜体
position: 
', '1', null, null, '55ee9251-540d-4b7f-8a6b-dc8a38c18323', '2017-01-11 05:21:44.437368');
INSERT INTO "public"."audits" VALUES ('27', '2', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 板材
position: 
', '1', null, null, '30b54211-59cf-4e7c-83e7-dec6b7e9ac85', '2017-01-11 05:21:44.494138');
INSERT INTO "public"."audits" VALUES ('28', '3', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 五金
position: 
', '1', null, null, '4103b418-ea24-4fcf-81de-3ee81bbf02cd', '2017-01-11 05:21:44.525308');
INSERT INTO "public"."audits" VALUES ('29', '4', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 封边带
position: 
', '1', null, null, 'c7ff3d99-3d6f-4362-a8cc-4fda9aa11283', '2017-01-11 05:21:44.551117');
INSERT INTO "public"."audits" VALUES ('30', '5', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 纸箱
position: 
', '1', null, null, 'a35de978-d780-4b05-a28e-839f41417728', '2017-01-11 05:21:44.576126');
INSERT INTO "public"."audits" VALUES ('31', '6', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 气泡垫/珍珠棉
position: 
', '1', null, null, 'ca21b36c-314c-442a-9e8a-3d82845aee25', '2017-01-11 05:21:44.599498');
INSERT INTO "public"."audits" VALUES ('32', '7', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 油漆
position: 
', '1', null, null, '3fa4db87-31b5-4664-a01f-a55501108bca', '2017-01-11 05:21:44.623933');
INSERT INTO "public"."audits" VALUES ('33', '8', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 刀具
position: 
', '1', null, null, '85df2a5c-c9c8-45c1-ad02-de47d8191818', '2017-01-11 05:21:44.649805');
INSERT INTO "public"."audits" VALUES ('34', '9', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 封口胶
position: 
', '1', null, null, '204df6de-1741-4500-bfbd-eb66d84465db', '2017-01-11 05:21:44.673736');
INSERT INTO "public"."audits" VALUES ('35', '10', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 胶
position: 
', '1', null, null, '556631c2-3219-4c3f-9ae8-846bb7c9d5f8', '2017-01-11 05:21:44.696296');
INSERT INTO "public"."audits" VALUES ('36', '11', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 旋转鞋柜
position: 
', '1', null, null, 'ac647c89-5839-4970-9ae8-4f62c6c00f05', '2017-01-11 05:21:44.725284');
INSERT INTO "public"."audits" VALUES ('37', '12', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 密码抽
position: 
', '1', null, null, 'cc2e8f3e-985e-48a6-ae82-2a753fa0e1fc', '2017-01-11 05:21:44.754565');
INSERT INTO "public"."audits" VALUES ('38', '13', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 反转床
position: 
', '1', null, null, 'cc0a972e-d6e1-4f75-9f0f-9de472f8050a', '2017-01-11 05:21:44.818525');
INSERT INTO "public"."audits" VALUES ('39', '14', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 1
name: 穿衣镜
position: 
', '1', null, null, '3924dc12-d4b8-4b6d-8818-98c8ac58a161', '2017-01-11 05:21:44.848788');
INSERT INTO "public"."audits" VALUES ('40', '15', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 
name: 移门
position: 
', '1', null, null, '8a1be1c5-4f2e-4512-a2f7-c9e760310735', '2017-01-11 05:21:44.881758');
INSERT INTO "public"."audits" VALUES ('41', '16', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 15
name: 五金
position: 
', '1', null, null, '4d7cea19-a176-49b9-b313-e8b13da056b4', '2017-01-11 05:21:44.917023');
INSERT INTO "public"."audits" VALUES ('42', '17', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 15
name: 皮纹/软包
position: 
', '1', null, null, '974874c3-56b7-4dd7-95fc-78b476ea9316', '2017-01-11 05:21:44.945493');
INSERT INTO "public"."audits" VALUES ('43', '18', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 15
name: 玻璃/腰线
position: 
', '1', null, null, '228cf298-d70e-485c-88b3-4c907b1c9977', '2017-01-11 05:21:44.971488');
INSERT INTO "public"."audits" VALUES ('44', '19', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 15
name: 型材
position: 
', '1', null, null, '908f2089-594a-4928-9975-f80881d5dfa1', '2017-01-11 05:21:44.998726');
INSERT INTO "public"."audits" VALUES ('45', '20', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 
name: 平开门
position: 
', '1', null, null, '676afafe-3ff9-4ada-8949-4ec4be4f9ede', '2017-01-11 05:21:45.023772');
INSERT INTO "public"."audits" VALUES ('46', '21', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 20
name: 五金
position: 
', '1', null, null, '0a29f863-b392-43c9-92ad-c0e36780bc8d', '2017-01-11 05:21:45.050744');
INSERT INTO "public"."audits" VALUES ('47', '22', 'Catalog', null, null, null, null, null, 'create', '---
parent_id: 20
name: 吸塑
position: 
', '1', null, null, 'ba5a008d-0524-4354-894d-3895c9b8d109', '2017-01-11 05:21:45.075082');
INSERT INTO "public"."audits" VALUES ('48', '1', 'User', null, null, '1', 'User', null, 'update', '---
current_sign_in_at:
- 
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 02:57:15.047450896 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: 2017-01-12 02:57:15.047450896 Z
last_sign_in_at:
- 
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 02:57:15.047450896 Z
  zone: *1
  time: 2017-01-12 02:57:15.047450896 Z
current_sign_in_ip:
- 
- "::1"
last_sign_in_ip:
- 
- "::1"
sign_in_count:
- 0
- 1
', '2', null, '::1', 'c92d8a32-a025-4dbc-ae25-5593f086859d', '2017-01-12 02:57:15.099338');
INSERT INTO "public"."audits" VALUES ('49', '1', 'User', null, null, '1', 'User', null, 'update', '---
current_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 02:57:15.047450000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: 2017-01-12 02:57:15.047450000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 05:34:54.418987095 Z
  zone: *1
  time: 2017-01-12 05:34:54.418987095 Z
sign_in_count:
- 1
- 2
', '3', null, '::1', 'c1eead72-ddc5-4ffd-91ca-df23f4be2cc0', '2017-01-12 05:34:54.458816');
INSERT INTO "public"."audits" VALUES ('50', '1', 'User', null, null, '1', 'User', null, 'update', '---
current_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 05:34:54.418987000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: 2017-01-12 05:34:54.418987000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-13 02:21:16.749764919 Z
  zone: *1
  time: 2017-01-13 02:21:16.749764919 Z
last_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 02:57:15.047450000 Z
  zone: *1
  time: 2017-01-12 02:57:15.047450000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 05:34:54.418987000 Z
  zone: *1
  time: 2017-01-12 05:34:54.418987000 Z
sign_in_count:
- 2
- 3
', '4', null, '::1', 'f132bc83-2217-4797-b116-e6a552f93a49', '2017-01-13 02:21:16.808279');
INSERT INTO "public"."audits" VALUES ('51', '1', 'User', null, null, '1', 'User', null, 'update', '---
current_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-13 02:21:16.749764000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: 2017-01-13 02:21:16.749764000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-14 05:02:32.233594521 Z
  zone: *1
  time: 2017-01-14 05:02:32.233594521 Z
last_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-12 05:34:54.418987000 Z
  zone: *1
  time: 2017-01-12 05:34:54.418987000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-13 02:21:16.749764000 Z
  zone: *1
  time: 2017-01-13 02:21:16.749764000 Z
sign_in_count:
- 3
- 4
', '5', null, '::1', '78598161-de5f-4c2b-b072-d7f6574ebc1b', '2017-01-14 05:02:32.280651');
INSERT INTO "public"."audits" VALUES ('52', '1', 'User', null, null, '1', 'User', null, 'update', '---
current_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-14 05:02:32.233594000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: 2017-01-14 05:02:32.233594000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-15 03:15:26.619095875 Z
  zone: *1
  time: 2017-01-15 03:15:26.619095875 Z
last_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-13 02:21:16.749764000 Z
  zone: *1
  time: 2017-01-13 02:21:16.749764000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-14 05:02:32.233594000 Z
  zone: *1
  time: 2017-01-14 05:02:32.233594000 Z
sign_in_count:
- 4
- 5
', '6', null, '::1', '9fefd3e0-cda1-4c6b-af06-9a6653f67247', '2017-01-15 03:15:26.662018');
INSERT INTO "public"."audits" VALUES ('53', '23', 'Catalog', null, null, '1', 'User', null, 'create', '---
parent_id: 
name: a
position: 
', '1', null, '::1', '27a157da-147f-4c20-b341-8ba7f9f0fc30', '2017-01-15 03:16:20.134913');
INSERT INTO "public"."audits" VALUES ('54', '24', 'Catalog', null, null, '1', 'User', null, 'create', '---
parent_id: 23
name: aa
position: 
', '1', null, '::1', '69955147-f4c8-445f-bad1-6aee04ff420d', '2017-01-15 03:16:28.400353');
INSERT INTO "public"."audits" VALUES ('55', '1', 'User', null, null, '1', 'User', null, 'update', '---
current_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-15 03:15:26.619095000 Z
  zone: &1 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: 2017-01-15 03:15:26.619095000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-15 08:48:54.729885032 Z
  zone: *1
  time: 2017-01-15 08:48:54.729885032 Z
last_sign_in_at:
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-14 05:02:32.233594000 Z
  zone: *1
  time: 2017-01-14 05:02:32.233594000 Z
- !ruby/object:ActiveSupport::TimeWithZone
  utc: 2017-01-15 03:15:26.619095000 Z
  zone: *1
  time: 2017-01-15 03:15:26.619095000 Z
sign_in_count:
- 5
- 6
', '7', null, '::1', '3bbc8835-de1b-4759-8e95-100dd8c73c10', '2017-01-15 08:48:54.767089');

-- ----------------------------
-- Table structure for catalog_hierarchies
-- ----------------------------
DROP TABLE IF EXISTS "public"."catalog_hierarchies";
CREATE TABLE "public"."catalog_hierarchies" (
"ancestor_id" int4 NOT NULL,
"descendant_id" int4 NOT NULL,
"generations" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of catalog_hierarchies
-- ----------------------------
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '1', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '2', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '3', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '4', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '5', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '6', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '7', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '8', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '9', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '10', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '11', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '12', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '13', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('1', '14', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('2', '2', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('3', '3', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('4', '4', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('5', '5', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('6', '6', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('7', '7', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('8', '8', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('9', '9', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('10', '10', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('11', '11', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('12', '12', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('13', '13', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('14', '14', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('15', '15', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('15', '16', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('15', '17', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('15', '18', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('15', '19', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('16', '16', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('17', '17', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('18', '18', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('19', '19', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('20', '20', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('20', '21', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('20', '22', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('21', '21', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('22', '22', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('23', '23', '0');
INSERT INTO "public"."catalog_hierarchies" VALUES ('23', '24', '1');
INSERT INTO "public"."catalog_hierarchies" VALUES ('24', '24', '0');

-- ----------------------------
-- Table structure for catalogs
-- ----------------------------
DROP TABLE IF EXISTS "public"."catalogs";
CREATE TABLE "public"."catalogs" (
"id" int4 DEFAULT nextval('catalogs_id_seq'::regclass) NOT NULL,
"parent_id" int4,
"name" varchar COLLATE "default",
"position" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"type" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of catalogs
-- ----------------------------
INSERT INTO "public"."catalogs" VALUES ('1', null, '柜体', null, '2017-01-11 05:21:44.429633', '2017-01-11 05:21:44.429633', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('2', '1', '板材', null, '2017-01-11 05:21:44.487602', '2017-01-11 05:21:44.487602', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('3', '1', '五金', null, '2017-01-11 05:21:44.518427', '2017-01-11 05:21:44.518427', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('4', '1', '封边带', null, '2017-01-11 05:21:44.545502', '2017-01-11 05:21:44.545502', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('5', '1', '纸箱', null, '2017-01-11 05:21:44.570451', '2017-01-11 05:21:44.570451', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('6', '1', '气泡垫/珍珠棉', null, '2017-01-11 05:21:44.594139', '2017-01-11 05:21:44.594139', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('7', '1', '油漆', null, '2017-01-11 05:21:44.617571', '2017-01-11 05:21:44.617571', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('8', '1', '刀具', null, '2017-01-11 05:21:44.643212', '2017-01-11 05:21:44.643212', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('9', '1', '封口胶', null, '2017-01-11 05:21:44.668256', '2017-01-11 05:21:44.668256', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('10', '1', '胶', null, '2017-01-11 05:21:44.690987', '2017-01-11 05:21:44.690987', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('11', '1', '旋转鞋柜', null, '2017-01-11 05:21:44.718138', '2017-01-11 05:21:44.718138', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('12', '1', '密码抽', null, '2017-01-11 05:21:44.747653', '2017-01-11 05:21:44.747653', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('13', '1', '反转床', null, '2017-01-11 05:21:44.775713', '2017-01-11 05:21:44.775713', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('14', '1', '穿衣镜', null, '2017-01-11 05:21:44.842281', '2017-01-11 05:21:44.842281', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('15', null, '移门', null, '2017-01-11 05:21:44.873467', '2017-01-11 05:21:44.873467', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('16', '15', '五金', null, '2017-01-11 05:21:44.908379', '2017-01-11 05:21:44.908379', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('17', '15', '皮纹/软包', null, '2017-01-11 05:21:44.93774', '2017-01-11 05:21:44.93774', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('18', '15', '玻璃/腰线', null, '2017-01-11 05:21:44.96556', '2017-01-11 05:21:44.96556', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('19', '15', '型材', null, '2017-01-11 05:21:44.992401', '2017-01-11 05:21:44.992401', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('20', null, '平开门', null, '2017-01-11 05:21:45.01753', '2017-01-11 05:21:45.01753', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('21', '20', '五金', null, '2017-01-11 05:21:45.044756', '2017-01-11 05:21:45.044756', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('22', '20', '吸塑', null, '2017-01-11 05:21:45.069033', '2017-01-11 05:21:45.069033', 'MaterialCatalog');
INSERT INTO "public"."catalogs" VALUES ('23', null, 'a', null, '2017-01-15 03:16:20.118597', '2017-01-15 03:16:20.118597', 'ProductCatalog');
INSERT INTO "public"."catalogs" VALUES ('24', '23', 'aa', null, '2017-01-15 03:16:28.391908', '2017-01-15 03:16:28.391908', 'ProductCatalog');

-- ----------------------------
-- Table structure for ckeditor_assets
-- ----------------------------
DROP TABLE IF EXISTS "public"."ckeditor_assets";
CREATE TABLE "public"."ckeditor_assets" (
"id" int4 DEFAULT nextval('ckeditor_assets_id_seq'::regclass) NOT NULL,
"data_file_name" varchar COLLATE "default" NOT NULL,
"data_content_type" varchar COLLATE "default",
"data_file_size" int4,
"data_fingerprint" varchar COLLATE "default",
"type" varchar(30) COLLATE "default",
"width" int4,
"height" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"assetable_id" int4 NOT NULL,
"assetable_type" varchar(30) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ckeditor_assets
-- ----------------------------

-- ----------------------------
-- Table structure for cms_channels
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_channels";
CREATE TABLE "public"."cms_channels" (
"id" int4 DEFAULT nextval('cms_channels_id_seq'::regclass) NOT NULL,
"site_id" int4 NOT NULL,
"parent_id" int4,
"title" varchar COLLATE "default" NOT NULL,
"short_title" varchar COLLATE "default" NOT NULL,
"properties" varchar COLLATE "default",
"tmp_index" varchar COLLATE "default" NOT NULL,
"tmp_detail" varchar COLLATE "default" NOT NULL,
"keywords" varchar COLLATE "default",
"description" varchar COLLATE "default",
"image_path" varchar COLLATE "default",
"content" text COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of cms_channels
-- ----------------------------
INSERT INTO "public"."cms_channels" VALUES ('5', '4', null, '首页', 'index', null, 'temp_index.html.erb', 'temp_detail.html.erb', null, null, null, null, '2017-01-12 05:51:43.908232', '2017-01-12 05:51:43.908232');
INSERT INTO "public"."cms_channels" VALUES ('6', '4', '0', '桌面端', 'desk', '', 'temp_index_desk.html.erb', 'temp_detail.html.erb', '', '', '', '', '2017-01-12 05:51:44.328825', '2017-01-12 05:51:44.328825');
INSERT INTO "public"."cms_channels" VALUES ('7', '4', '0', '手机端', 'mobile', '', 'temp_index_mobile.html.erb', 'temp_detail.html.erb', '', '', '', '', '2017-01-12 05:51:44.555683', '2017-01-12 05:51:44.555683');
INSERT INTO "public"."cms_channels" VALUES ('8', '4', '4', '更新日志', 'log', '', 'temp_log_list.html.erb', 'temp_news_detail.html.erb', '更新日志', '', '', '', '2017-01-12 05:51:44.803299', '2017-01-12 05:51:44.803299');
INSERT INTO "public"."cms_channels" VALUES ('9', '4', '0', '博客', 'blog', '', 'temp_news_list.html.erb', 'temp_news_detail.html.erb', '博客', '', '', '', '2017-01-12 05:51:45.024955', '2017-01-12 05:51:45.024955');
INSERT INTO "public"."cms_channels" VALUES ('10', '4', '0', '技术支持', 'support', '', 'temp_support_list.html.erb', 'temp_news_detail.html.erb', '技术支持', '', '', '', '2017-01-12 05:51:45.281722', '2017-01-12 05:51:45.281722');
INSERT INTO "public"."cms_channels" VALUES ('11', '4', '9', '常见问题', 'faq', '', 'temp_faq.html.erb', 'temp_news_detail.html.erb', '常见问题', '', '', '', '2017-01-12 05:51:45.525908', '2017-01-12 05:51:45.525908');
INSERT INTO "public"."cms_channels" VALUES ('12', '4', null, '产品', 'product', '', 'temp_product.html.erb', 'temp_detail.html.erb', '', '工厂ERP管理系统，经销商SCRM关系管理系统，OMS订单管理系统，BPM流程管理系统，电子商务系统', '', '', '2017-01-13 04:00:58.845778', '2017-01-13 04:00:58.845778');
INSERT INTO "public"."cms_channels" VALUES ('13', '4', '12', '工厂ERP管理系统', 'erp', 'product', 'temp_product.html.erb', 'temp_detail.html.erb', '工厂ERP管理系统，ERP', '德格SaaS企业管理定制软件，工厂ERP管理解决方案', '', '', '2017-01-13 04:05:09.029676', '2017-01-13 04:05:09.029676');
INSERT INTO "public"."cms_channels" VALUES ('14', '4', '12', '经销商SCRM关系管理系统', 'scrm', 'product', 'temp_product.html.erb', 'temp_detail.html.erb', 'SCRM社交管理系统，SCRM', '德格SaaS企业管理定制软件，经销商SCRM关系管理解决方案', '', '', '2017-01-13 04:07:26.255642', '2017-01-13 04:07:26.255642');
INSERT INTO "public"."cms_channels" VALUES ('16', '4', '12', 'OMS订单管理系统', 'oms', 'product', 'temp_product.html.erb', 'temp_detail.html.erb', 'OMS订单管理系统，OMS', '德格SaaS企业管理定制软件，OMS订单管理解决方案', '', '', '2017-01-13 04:27:58.543867', '2017-01-13 04:27:58.543867');
INSERT INTO "public"."cms_channels" VALUES ('17', '4', '12', 'BPM流程管理系统', 'bpm', 'product', 'temp_product.html.erb', 'temp_detail.html.erb', 'BPM流程管理系统，BPM', '德格SaaS企业管理定制软件，BPM流程管理解决方案', '', '', '2017-01-13 04:29:22.805834', '2017-01-13 04:29:22.805834');
INSERT INTO "public"."cms_channels" VALUES ('18', '4', '12', '电子商务系统', 'net-pay', 'product', 'temp_product.html.erb', 'temp_detail.html.erb', '电子商务系统，电商', '德格SaaS企业管理定制软件，电子商务解决方案', '', '', '2017-01-13 06:44:21.081484', '2017-01-13 06:44:21.081484');
INSERT INTO "public"."cms_channels" VALUES ('19', '4', null, '功能', 'function', '', 'temp_function.html.erb', 'temp_detail.html.erb', '', '', '', '', '2017-01-15 03:44:21.199214', '2017-01-15 03:44:21.199214');
INSERT INTO "public"."cms_channels" VALUES ('20', '4', '19', '管库存', 'admin-stock', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '管库存', '德格SaaS企业管理定制软件，库存管理功能', '', '', '2017-01-15 03:46:57.103987', '2017-01-15 03:46:57.103987');
INSERT INTO "public"."cms_channels" VALUES ('21', '4', '19', '管销售', 'admin-sales', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '管销售', '德格SaaS企业管理定制软件，销售管理功能', '', '', '2017-01-15 03:48:54.551347', '2017-01-15 03:53:32.879196');
INSERT INTO "public"."cms_channels" VALUES ('22', '4', '19', '管采购', 'admin-buy', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '管采购', '德格SaaS企业管理定制软件，采购管理功能', '', '', '2017-01-15 03:50:39.343247', '2017-01-15 03:50:39.343247');
INSERT INTO "public"."cms_channels" VALUES ('23', '4', '19', '管生产', 'admin-production', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '管生产', '德格SaaS企业管理定制软件，生产管理功能', '', '', '2017-01-15 03:52:25.63353', '2017-01-15 03:52:25.63353');
INSERT INTO "public"."cms_channels" VALUES ('24', '4', '19', '官营销', 'admin-marketing', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '官营销', '德格SaaS企业管理定制软件，营销管理功能', '', '', '2017-01-15 03:54:37.571396', '2017-01-15 03:54:37.571396');
INSERT INTO "public"."cms_channels" VALUES ('25', '4', '19', '管客户', 'admin-client', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '管客户', '德格SaaS企业管理定制软件，客户管理功能', '', '', '2017-01-15 03:55:42.732587', '2017-01-15 03:55:42.732587');
INSERT INTO "public"."cms_channels" VALUES ('26', '4', '19', '管电商', 'admin-online', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '管电商', '德格SaaS企业管理定制软件，电商管理功能', '', '', '2017-01-15 03:59:29.406115', '2017-01-15 03:59:29.406115');
INSERT INTO "public"."cms_channels" VALUES ('27', '4', '19', '管协同', 'admin-teamwork', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '管协同', '德格SaaS企业管理定制软件，协同管理功能', '', '', '2017-01-15 04:00:51.735666', '2017-01-15 04:00:51.735666');
INSERT INTO "public"."cms_channels" VALUES ('28', '4', '19', '定制功能', 'admin-customade', 'function', 'temp_function.html.erb', 'temp_detail.html.erb', '定制功能', '德格SaaS企业管理定制软件，定制功能', '', '', '2017-01-15 04:02:03.887407', '2017-01-15 04:02:03.887407');

-- ----------------------------
-- Table structure for cms_pages
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_pages";
CREATE TABLE "public"."cms_pages" (
"id" int4 DEFAULT nextval('cms_pages_id_seq'::regclass) NOT NULL,
"channel_id" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"short_title" varchar COLLATE "default" NOT NULL,
"properties" varchar COLLATE "default",
"keywords" varchar COLLATE "default",
"description" varchar COLLATE "default",
"image_path" varchar COLLATE "default",
"content" text COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of cms_pages
-- ----------------------------
INSERT INTO "public"."cms_pages" VALUES ('9', '8', 'SaaS安全吗？', 'saas-an-quan-ma', 'nil', '', '', '', 'nil', '2017-01-12 05:51:45.716665', '2017-01-12 05:51:45.716665');
INSERT INTO "public"."cms_pages" VALUES ('10', '8', '案发违法', 'an-fa-wei-fa', 'nil', '', '', '/ckeditor_assets/pictures/1/content_color.jpg', 'nil', '2017-01-12 05:51:45.903006', '2017-01-12 05:51:45.903006');

-- ----------------------------
-- Table structure for cms_sites
-- ----------------------------
DROP TABLE IF EXISTS "public"."cms_sites";
CREATE TABLE "public"."cms_sites" (
"id" int4 DEFAULT nextval('cms_sites_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default" NOT NULL,
"template" varchar COLLATE "default" NOT NULL,
"domain" varchar COLLATE "default",
"description" varchar COLLATE "default",
"features" jsonb,
"is_published" bool DEFAULT true,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of cms_sites
-- ----------------------------
INSERT INTO "public"."cms_sites" VALUES ('4', 'dagle', 'dagle', 'dagle', 'dagle', null, 't', '2017-01-12 05:51:43.665516', '2017-01-12 05:51:43.665516');

-- ----------------------------
-- Table structure for image_item_relations
-- ----------------------------
DROP TABLE IF EXISTS "public"."image_item_relations";
CREATE TABLE "public"."image_item_relations" (
"id" int4 DEFAULT nextval('image_item_relations_id_seq'::regclass) NOT NULL,
"image_item_id" int4,
"relation_type" varchar COLLATE "default",
"relation_id" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of image_item_relations
-- ----------------------------

-- ----------------------------
-- Table structure for image_item_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."image_item_tags";
CREATE TABLE "public"."image_item_tags" (
"id" int4 DEFAULT nextval('image_item_tags_id_seq'::regclass) NOT NULL,
"image_item_id" int4,
"name" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of image_item_tags
-- ----------------------------

-- ----------------------------
-- Table structure for image_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."image_items";
CREATE TABLE "public"."image_items" (
"id" int4 DEFAULT nextval('image_items_id_seq'::regclass) NOT NULL,
"owner_type" varchar COLLATE "default",
"owner_id" int4,
"name" varchar COLLATE "default",
"file_size" int4,
"width" int4,
"height" int4,
"data" jsonb,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of image_items
-- ----------------------------

-- ----------------------------
-- Table structure for item_relations
-- ----------------------------
DROP TABLE IF EXISTS "public"."item_relations";
CREATE TABLE "public"."item_relations" (
"master_id" int4,
"slave_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of item_relations
-- ----------------------------

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS "public"."items";
CREATE TABLE "public"."items" (
"id" int4 DEFAULT nextval('items_id_seq'::regclass) NOT NULL,
"site_id" int4,
"name" varchar COLLATE "default",
"features" jsonb,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"type" varchar COLLATE "default",
"name_py" varchar COLLATE "default",
"catalog_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO "public"."items" VALUES ('1', '1', '自购', '{"contact_name": "自购联系人", "phone_number": "15213364363"}', '2017-01-11 05:21:43.917483', '2017-01-11 05:21:43.917483', 'Vendor', 'ZG', null);
INSERT INTO "public"."items" VALUES ('2', '1', '康鑫', '{"contact_name": "康鑫联系人", "phone_number": "15213364314"}', '2017-01-11 05:21:43.942562', '2017-01-11 05:21:43.942562', 'Vendor', 'KX', null);
INSERT INTO "public"."items" VALUES ('3', '1', '联利达五金', '{"contact_name": "联利达五金联系人", "phone_number": "15213364320"}', '2017-01-11 05:21:43.962151', '2017-01-11 05:21:43.962151', 'Vendor', 'LLDWJ', null);
INSERT INTO "public"."items" VALUES ('4', '1', '友达', '{"contact_name": "友达联系人", "phone_number": "15213364319"}', '2017-01-11 05:21:43.982724', '2017-01-11 05:21:43.982724', 'Vendor', 'YD', null);
INSERT INTO "public"."items" VALUES ('5', '1', '锐丰', '{"contact_name": "锐丰联系人", "phone_number": "15213364372"}', '2017-01-11 05:21:44.002544', '2017-01-11 05:21:44.002544', 'Vendor', 'RF', null);
INSERT INTO "public"."items" VALUES ('6', '1', '壹佰', '{"contact_name": "壹佰联系人", "phone_number": "15213364349"}', '2017-01-11 05:21:44.021895', '2017-01-11 05:21:44.021895', 'Vendor', 'YB', null);
INSERT INTO "public"."items" VALUES ('7', '1', '盛世百龙', '{"contact_name": "盛世百龙联系人", "phone_number": "15213364398"}', '2017-01-11 05:21:44.041062', '2017-01-11 05:21:44.041062', 'Vendor', 'SSBL', null);
INSERT INTO "public"."items" VALUES ('8', '1', '义力', '{"contact_name": "义力联系人", "phone_number": "15213364394"}', '2017-01-11 05:21:44.060256', '2017-01-11 05:21:44.060256', 'Vendor', 'YL', null);
INSERT INTO "public"."items" VALUES ('9', '1', '山森科技', '{"contact_name": "山森科技联系人", "phone_number": "15213364384"}', '2017-01-11 05:21:44.078997', '2017-01-11 05:21:44.078997', 'Vendor', 'SSKJ', null);
INSERT INTO "public"."items" VALUES ('10', '1', '精工', '{"contact_name": "精工联系人", "phone_number": "15213364391"}', '2017-01-11 05:21:44.097936', '2017-01-11 05:21:44.097936', 'Vendor', 'JG', null);
INSERT INTO "public"."items" VALUES ('11', '1', '申康', '{"contact_name": "申康联系人", "phone_number": "15213364313"}', '2017-01-11 05:21:44.117704', '2017-01-11 05:21:44.117704', 'Vendor', 'SK', null);
INSERT INTO "public"."items" VALUES ('12', '1', '同乐', '{"contact_name": "同乐联系人", "phone_number": "15213364383"}', '2017-01-11 05:21:44.136749', '2017-01-11 05:21:44.136749', 'Vendor', 'TL', null);
INSERT INTO "public"."items" VALUES ('13', '1', '上海画宇', '{"contact_name": "上海画宇联系人", "phone_number": "15213364379"}', '2017-01-11 05:21:44.155678', '2017-01-11 05:21:44.155678', 'Vendor', 'SHHY', null);
INSERT INTO "public"."items" VALUES ('14', '1', '大家木业', '{"contact_name": "大家木业联系人", "phone_number": "15213364391"}', '2017-01-11 05:21:44.174338', '2017-01-11 05:21:44.174338', 'Vendor', 'DJMY', null);
INSERT INTO "public"."items" VALUES ('15', '1', '蒙友', '{"contact_name": "蒙友联系人", "phone_number": "15213364314"}', '2017-01-11 05:21:44.1933', '2017-01-11 05:21:44.1933', 'Vendor', 'MY', null);
INSERT INTO "public"."items" VALUES ('16', '1', '朋诚心', '{"contact_name": "朋诚心联系人", "phone_number": "15213364365"}', '2017-01-11 05:21:44.212366', '2017-01-11 05:21:44.212366', 'Vendor', 'PCX', null);
INSERT INTO "public"."items" VALUES ('17', '1', '尚好佳', '{"contact_name": "尚好佳联系人", "phone_number": "15213364389"}', '2017-01-11 05:21:44.270056', '2017-01-11 05:21:44.270056', 'Vendor', 'SHJ', null);
INSERT INTO "public"."items" VALUES ('18', '1', '同鑫', '{"contact_name": "同鑫联系人", "phone_number": "15213364364"}', '2017-01-11 05:21:44.29566', '2017-01-11 05:21:44.29566', 'Vendor', 'TX', null);
INSERT INTO "public"."items" VALUES ('19', '1', '君子兰', '{"contact_name": "君子兰联系人", "phone_number": "15213364334"}', '2017-01-11 05:21:44.315262', '2017-01-11 05:21:44.315262', 'Vendor', 'JZL', null);
INSERT INTO "public"."items" VALUES ('20', '1', '银冠', '{"contact_name": "银冠联系人", "phone_number": "15213364348"}', '2017-01-11 05:21:44.337433', '2017-01-11 05:21:44.337433', 'Vendor', 'YG', null);
INSERT INTO "public"."items" VALUES ('21', '1', '爱格', '{"contact_name": "爱格联系人", "phone_number": "15213364329"}', '2017-01-11 05:21:44.357282', '2017-01-11 05:21:44.357282', 'Vendor', 'AG', null);
INSERT INTO "public"."items" VALUES ('22', '1', '恒泰', '{"contact_name": "恒泰联系人", "phone_number": "15213364385"}', '2017-01-11 05:21:44.376032', '2017-01-11 05:21:44.376032', 'Vendor', 'HT', null);

-- ----------------------------
-- Table structure for material_management_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."material_management_details";
CREATE TABLE "public"."material_management_details" (
"id" int4 DEFAULT nextval('material_management_details_id_seq'::regclass) NOT NULL,
"material_id" int4,
"material_management_id" int4,
"number" int4,
"price" numeric(8,2),
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of material_management_details
-- ----------------------------

-- ----------------------------
-- Table structure for material_managements
-- ----------------------------
DROP TABLE IF EXISTS "public"."material_managements";
CREATE TABLE "public"."material_managements" (
"id" int4 DEFAULT nextval('material_managements_id_seq'::regclass) NOT NULL,
"note" varchar COLLATE "default",
"operate_type" int4,
"operate_date" date,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of material_managements
-- ----------------------------

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS "public"."members";
CREATE TABLE "public"."members" (
"id" int4 DEFAULT nextval('members_id_seq'::regclass) NOT NULL,
"user_id" int4,
"site_id" int4,
"name" varchar COLLATE "default",
"gender" int4,
"birth" date,
"qq" varchar COLLATE "default",
"email" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of members
-- ----------------------------

-- ----------------------------
-- Table structure for order_materials
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_materials";
CREATE TABLE "public"."order_materials" (
"id" int4 DEFAULT nextval('order_materials_id_seq'::regclass) NOT NULL,
"order_id" int4,
"material_id" int4,
"amount" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of order_materials
-- ----------------------------

-- ----------------------------
-- Table structure for order_products
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_products";
CREATE TABLE "public"."order_products" (
"id" int4 DEFAULT nextval('order_products_id_seq'::regclass) NOT NULL,
"order_id" int4,
"product_id" int4,
"amount" int4,
"price" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of order_products
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
"id" int4 DEFAULT nextval('orders_id_seq'::regclass) NOT NULL,
"code" varchar COLLATE "default",
"user_id" int4,
"site_id" int4,
"price" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"description" text COLLATE "default",
"status" int4,
"internal_status" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for produces
-- ----------------------------
DROP TABLE IF EXISTS "public"."produces";
CREATE TABLE "public"."produces" (
"id" int4 DEFAULT nextval('produces_id_seq'::regclass) NOT NULL,
"order_id" int4,
"status" int4,
"assignee_id" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of produces
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
"id" int4 DEFAULT nextval('roles_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"resource_type" varchar COLLATE "default",
"resource_id" int4,
"created_at" timestamp(6),
"updated_at" timestamp(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES ('1', 'super_admin', null, null, '2017-01-11 05:21:42.206765', '2017-01-11 05:21:42.206765');
INSERT INTO "public"."roles" VALUES ('2', 'admin', null, null, '2017-01-11 05:21:42.213342', '2017-01-11 05:21:42.213342');
INSERT INTO "public"."roles" VALUES ('3', 'agent', null, null, '2017-01-11 05:21:42.220084', '2017-01-11 05:21:42.220084');
INSERT INTO "public"."roles" VALUES ('4', 'product_manager', null, null, '2017-01-11 05:21:43.309957', '2017-01-11 05:21:43.309957');
INSERT INTO "public"."roles" VALUES ('5', 'factory_manager', null, null, '2017-01-11 05:21:43.318307', '2017-01-11 05:21:43.318307');

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."schema_migrations";
CREATE TABLE "public"."schema_migrations" (
"version" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of schema_migrations
-- ----------------------------
INSERT INTO "public"."schema_migrations" VALUES ('20161109090941');
INSERT INTO "public"."schema_migrations" VALUES ('20161109093138');
INSERT INTO "public"."schema_migrations" VALUES ('20161109140529');
INSERT INTO "public"."schema_migrations" VALUES ('20161109140611');
INSERT INTO "public"."schema_migrations" VALUES ('20161109140702');
INSERT INTO "public"."schema_migrations" VALUES ('20161110061110');
INSERT INTO "public"."schema_migrations" VALUES ('20161110061759');
INSERT INTO "public"."schema_migrations" VALUES ('20161110083835');
INSERT INTO "public"."schema_migrations" VALUES ('20161110125541');
INSERT INTO "public"."schema_migrations" VALUES ('20161114130011');
INSERT INTO "public"."schema_migrations" VALUES ('20161114130012');
INSERT INTO "public"."schema_migrations" VALUES ('20161114130013');
INSERT INTO "public"."schema_migrations" VALUES ('20161117025600');
INSERT INTO "public"."schema_migrations" VALUES ('20161120134318');
INSERT INTO "public"."schema_migrations" VALUES ('20161121090159');
INSERT INTO "public"."schema_migrations" VALUES ('20161124111517');
INSERT INTO "public"."schema_migrations" VALUES ('20161126083633');
INSERT INTO "public"."schema_migrations" VALUES ('20161126085749');
INSERT INTO "public"."schema_migrations" VALUES ('20161126141655');
INSERT INTO "public"."schema_migrations" VALUES ('20161126151252');
INSERT INTO "public"."schema_migrations" VALUES ('20161126194833');
INSERT INTO "public"."schema_migrations" VALUES ('20161128024926');
INSERT INTO "public"."schema_migrations" VALUES ('20161128025003');
INSERT INTO "public"."schema_migrations" VALUES ('20161129063535');
INSERT INTO "public"."schema_migrations" VALUES ('20161130052558');
INSERT INTO "public"."schema_migrations" VALUES ('20161130052559');
INSERT INTO "public"."schema_migrations" VALUES ('20161206031422');
INSERT INTO "public"."schema_migrations" VALUES ('20161207123923');
INSERT INTO "public"."schema_migrations" VALUES ('20161208090812');
INSERT INTO "public"."schema_migrations" VALUES ('20161208092623');
INSERT INTO "public"."schema_migrations" VALUES ('20161208095125');
INSERT INTO "public"."schema_migrations" VALUES ('20161208095335');
INSERT INTO "public"."schema_migrations" VALUES ('20161209093236');
INSERT INTO "public"."schema_migrations" VALUES ('20161213030152');
INSERT INTO "public"."schema_migrations" VALUES ('20161216023502');
INSERT INTO "public"."schema_migrations" VALUES ('20161216024445');
INSERT INTO "public"."schema_migrations" VALUES ('20161221062959');
INSERT INTO "public"."schema_migrations" VALUES ('20161222080634');
INSERT INTO "public"."schema_migrations" VALUES ('20161226061742');
INSERT INTO "public"."schema_migrations" VALUES ('20161226073251');
INSERT INTO "public"."schema_migrations" VALUES ('20161226074707');
INSERT INTO "public"."schema_migrations" VALUES ('20161227094759');
INSERT INTO "public"."schema_migrations" VALUES ('20161228022510');
INSERT INTO "public"."schema_migrations" VALUES ('20161228025647');
INSERT INTO "public"."schema_migrations" VALUES ('20161228053123');
INSERT INTO "public"."schema_migrations" VALUES ('20161228084223');
INSERT INTO "public"."schema_migrations" VALUES ('20170103065515');
INSERT INTO "public"."schema_migrations" VALUES ('20170103131852');
INSERT INTO "public"."schema_migrations" VALUES ('20170104034042');
INSERT INTO "public"."schema_migrations" VALUES ('20170104063322');
INSERT INTO "public"."schema_migrations" VALUES ('20170104064327');
INSERT INTO "public"."schema_migrations" VALUES ('20170105021426');
INSERT INTO "public"."schema_migrations" VALUES ('20170105021556');
INSERT INTO "public"."schema_migrations" VALUES ('20170105025511');
INSERT INTO "public"."schema_migrations" VALUES ('20170105060833');
INSERT INTO "public"."schema_migrations" VALUES ('20170112035647');

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS "public"."sites";
CREATE TABLE "public"."sites" (
"id" int4 DEFAULT nextval('sites_id_seq'::regclass) NOT NULL,
"user_id" int4,
"title" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"features" jsonb,
"type" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO "public"."sites" VALUES ('1', '1', '本公司', '2017-01-11 05:21:43.301769', '2017-01-11 05:21:43.301769', null, null);

-- ----------------------------
-- Table structure for task_types
-- ----------------------------
DROP TABLE IF EXISTS "public"."task_types";
CREATE TABLE "public"."task_types" (
"id" int4 DEFAULT nextval('task_types_id_seq'::regclass) NOT NULL,
"type" varchar COLLATE "default",
"name" varchar COLLATE "default",
"ordinal" int4,
"roles" jsonb,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of task_types
-- ----------------------------

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS "public"."tasks";
CREATE TABLE "public"."tasks" (
"id" int4 DEFAULT nextval('tasks_id_seq'::regclass) NOT NULL,
"site_id" int4,
"title" varchar COLLATE "default",
"description" text COLLATE "default",
"creator_id" int4,
"assignee_id" int4,
"resource_type" varchar COLLATE "default",
"resource_id" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"ordinal" int4,
"task_type_id" int4,
"status" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tasks
-- ----------------------------

-- ----------------------------
-- Table structure for theme_configs
-- ----------------------------
DROP TABLE IF EXISTS "public"."theme_configs";
CREATE TABLE "public"."theme_configs" (
"id" int4 DEFAULT nextval('theme_configs_id_seq'::regclass) NOT NULL,
"site_id" int4,
"theme_id" int4,
"config" text COLLATE "default",
"active" bool DEFAULT false NOT NULL,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of theme_configs
-- ----------------------------

-- ----------------------------
-- Table structure for themes
-- ----------------------------
DROP TABLE IF EXISTS "public"."themes";
CREATE TABLE "public"."themes" (
"id" int4 DEFAULT nextval('themes_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"display_name" varchar COLLATE "default",
"config" text COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of themes
-- ----------------------------

-- ----------------------------
-- Table structure for tracker_actions
-- ----------------------------
DROP TABLE IF EXISTS "public"."tracker_actions";
CREATE TABLE "public"."tracker_actions" (
"id" int4 DEFAULT nextval('tracker_actions_id_seq'::regclass) NOT NULL,
"name" varchar COLLATE "default",
"controller_path" varchar COLLATE "default",
"action_name" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tracker_actions
-- ----------------------------
INSERT INTO "public"."tracker_actions" VALUES ('1', null, 'home', 'index', '2017-01-11 05:29:16.776588', '2017-01-11 05:29:16.776588');
INSERT INTO "public"."tracker_actions" VALUES ('2', null, 'admin/home', 'index', '2017-01-12 02:57:15.372212', '2017-01-12 02:57:15.372212');

-- ----------------------------
-- Table structure for tracker_sessions
-- ----------------------------
DROP TABLE IF EXISTS "public"."tracker_sessions";
CREATE TABLE "public"."tracker_sessions" (
"id" int4 DEFAULT nextval('tracker_sessions_id_seq'::regclass) NOT NULL,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tracker_sessions
-- ----------------------------
INSERT INTO "public"."tracker_sessions" VALUES ('1', '2017-01-11 05:29:16.660465', '2017-01-11 05:29:16.660465');
INSERT INTO "public"."tracker_sessions" VALUES ('2', '2017-01-11 05:30:48.250362', '2017-01-11 05:30:48.250362');
INSERT INTO "public"."tracker_sessions" VALUES ('3', '2017-01-11 05:31:13.113902', '2017-01-11 05:31:13.113902');
INSERT INTO "public"."tracker_sessions" VALUES ('4', '2017-01-11 07:44:35.904812', '2017-01-11 07:44:35.904812');
INSERT INTO "public"."tracker_sessions" VALUES ('5', '2017-01-11 07:48:29.913589', '2017-01-11 07:48:29.913589');
INSERT INTO "public"."tracker_sessions" VALUES ('6', '2017-01-11 07:48:30.155469', '2017-01-11 07:48:30.155469');
INSERT INTO "public"."tracker_sessions" VALUES ('7', '2017-01-11 09:42:02.411698', '2017-01-11 09:42:02.411698');
INSERT INTO "public"."tracker_sessions" VALUES ('8', '2017-01-11 09:42:05.031252', '2017-01-11 09:42:05.031252');
INSERT INTO "public"."tracker_sessions" VALUES ('9', '2017-01-12 02:22:21.323318', '2017-01-12 02:22:21.323318');
INSERT INTO "public"."tracker_sessions" VALUES ('10', '2017-01-12 05:34:17.19854', '2017-01-12 05:34:17.19854');
INSERT INTO "public"."tracker_sessions" VALUES ('11', '2017-01-13 02:17:07.743496', '2017-01-13 02:17:07.743496');
INSERT INTO "public"."tracker_sessions" VALUES ('12', '2017-01-13 02:17:07.790001', '2017-01-13 02:17:07.790001');
INSERT INTO "public"."tracker_sessions" VALUES ('13', '2017-01-14 05:01:45.057446', '2017-01-14 05:01:45.057446');
INSERT INTO "public"."tracker_sessions" VALUES ('14', '2017-01-14 05:01:45.800037', '2017-01-14 05:01:45.800037');
INSERT INTO "public"."tracker_sessions" VALUES ('15', '2017-01-15 03:14:38.874961', '2017-01-15 03:14:38.874961');
INSERT INTO "public"."tracker_sessions" VALUES ('16', '2017-01-15 03:14:39.594909', '2017-01-15 03:14:39.594909');
INSERT INTO "public"."tracker_sessions" VALUES ('17', '2017-01-15 08:44:47.764496', '2017-01-15 08:44:47.764496');

-- ----------------------------
-- Table structure for tracker_share_codes
-- ----------------------------
DROP TABLE IF EXISTS "public"."tracker_share_codes";
CREATE TABLE "public"."tracker_share_codes" (
"id" int4 DEFAULT nextval('tracker_share_codes_id_seq'::regclass) NOT NULL,
"user_id" int4,
"resource_type" varchar COLLATE "default",
"resource_id" int4,
"url" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tracker_share_codes
-- ----------------------------

-- ----------------------------
-- Table structure for tracker_user_relations
-- ----------------------------
DROP TABLE IF EXISTS "public"."tracker_user_relations";
CREATE TABLE "public"."tracker_user_relations" (
"id" int4 DEFAULT nextval('tracker_user_relations_id_seq'::regclass) NOT NULL,
"master_id" int4,
"slave_id" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tracker_user_relations
-- ----------------------------

-- ----------------------------
-- Table structure for tracker_visits
-- ----------------------------
DROP TABLE IF EXISTS "public"."tracker_visits";
CREATE TABLE "public"."tracker_visits" (
"id" int4 DEFAULT nextval('tracker_visits_id_seq'::regclass) NOT NULL,
"session_id" int4,
"action_id" int4,
"user_id" int4,
"resource_type" varchar COLLATE "default",
"resource_id" int4,
"url" varchar COLLATE "default",
"referer" varchar COLLATE "default",
"payload" text COLLATE "default",
"ip_address" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"user_agent_data" jsonb
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tracker_visits
-- ----------------------------
INSERT INTO "public"."tracker_visits" VALUES ('1', '9', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-12 02:22:55.708506', '2017-01-12 02:57:15.353521', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('2', '9', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-12 02:57:15.914837', '2017-01-12 03:13:30.968858', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('3', '9', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-12 03:13:31.251223', '2017-01-12 03:13:31.333936', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('4', '10', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-12 05:34:32.695117', '2017-01-12 05:34:54.61985', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('5', '10', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-12 05:34:55.092789', '2017-01-12 05:36:08.442108', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('6', '10', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-12 05:36:08.638842', '2017-01-12 09:32:58.558985', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('7', '10', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-12 09:32:59.871081', '2017-01-12 09:33:48.249943', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('8', '10', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-12 09:33:48.950962', '2017-01-12 09:34:16.973235', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('9', '10', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-12 09:34:17.464404', '2017-01-12 09:52:45.608374', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('10', '10', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-12 09:52:45.827057', '2017-01-12 09:53:32.552939', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('11', '10', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-12 09:53:32.977121', '2017-01-12 09:53:33.002852', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('12', '10', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-12 09:53:33.119933', '2017-01-12 09:53:33.144586', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('13', '12', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-13 02:18:00.226534', '2017-01-13 02:21:16.951718', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('14', '11', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-13 02:18:00.223007', '2017-01-13 02:18:00.503329', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('15', '12', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-13 02:21:17.967214', '2017-01-13 06:34:00.830712', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('16', '13', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-14 05:02:06.649939', '2017-01-14 05:02:06.88356', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('17', '14', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-14 05:02:06.653089', '2017-01-14 05:02:32.445529', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('18', '14', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-14 05:02:32.959628', '2017-01-14 06:56:29.191248', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('19', '14', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-14 06:56:29.570324', '2017-01-14 07:07:55.385278', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('20', '14', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-14 07:07:55.971204', '2017-01-14 07:07:55.994011', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('21', '15', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-15 03:14:58.669869', '2017-01-15 03:14:58.929124', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('22', '16', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-15 03:14:58.666202', '2017-01-15 03:15:26.817656', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('23', '16', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-15 03:15:27.564569', '2017-01-15 04:56:38.106906', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('24', '16', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-15 04:56:38.243515', '2017-01-15 06:19:01.878203', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('25', '17', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-15 08:45:02.170021', '2017-01-15 08:48:54.896605', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('26', '17', '2', null, null, null, 'http://localhost:5000/admin', null, null, '::1', '2017-01-15 08:48:55.425111', '2017-01-15 08:51:12.231902', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');
INSERT INTO "public"."tracker_visits" VALUES ('27', '17', '1', null, null, null, 'http://localhost:5000/', null, null, '::1', '2017-01-15 08:51:12.359878', '2017-01-15 08:51:12.381055', '{"platform": "Windows", "user_agent": "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36", "browser_name": "Chrome"}');

-- ----------------------------
-- Table structure for user_mobiles
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_mobiles";
CREATE TABLE "public"."user_mobiles" (
"id" int4 DEFAULT nextval('user_mobiles_id_seq'::regclass) NOT NULL,
"user_id" int4,
"phone_number" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_mobiles
-- ----------------------------
INSERT INTO "public"."user_mobiles" VALUES ('1', '1', '15328077520', '2017-01-11 05:21:42.636909', '2017-01-11 05:21:42.636909');
INSERT INTO "public"."user_mobiles" VALUES ('2', '2', '15328077521', '2017-01-11 05:21:42.916822', '2017-01-11 05:21:42.916822');
INSERT INTO "public"."user_mobiles" VALUES ('3', '3', '18080810818', '2017-01-11 05:21:43.181864', '2017-01-11 05:21:43.181864');

-- ----------------------------
-- Table structure for user_weixins
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_weixins";
CREATE TABLE "public"."user_weixins" (
"id" int4 DEFAULT nextval('user_weixins_id_seq'::regclass) NOT NULL,
"user_id" int4,
"uid" varchar COLLATE "default",
"name" varchar COLLATE "default",
"headshot" varchar COLLATE "default",
"city" varchar COLLATE "default",
"province" varchar COLLATE "default",
"country" varchar COLLATE "default",
"gender" int4,
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_weixins
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
"id" int4 DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
"nickname" varchar COLLATE "default",
"created_at" timestamp(6) NOT NULL,
"updated_at" timestamp(6) NOT NULL,
"email" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"encrypted_password" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"reset_password_token" varchar COLLATE "default",
"reset_password_sent_at" timestamp(6),
"remember_created_at" timestamp(6),
"sign_in_count" int4 DEFAULT 0 NOT NULL,
"current_sign_in_at" timestamp(6),
"last_sign_in_at" timestamp(6),
"current_sign_in_ip" varchar COLLATE "default",
"last_sign_in_ip" varchar COLLATE "default",
"username" varchar COLLATE "default",
"headshot" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('1', '管理员', '2017-01-11 05:21:42.553228', '2017-01-15 08:48:54.732701', '', '$2a$11$FVITmgkeCP7PnsvgT11iIextLtc.jgPg5A2JN7g25S2IeYgScYId.', null, null, null, '6', '2017-01-15 08:48:54.729885', '2017-01-15 03:15:26.619095', '::1', '::1', null, null);
INSERT INTO "public"."users" VALUES ('2', '商家', '2017-01-11 05:21:42.900226', '2017-01-11 05:21:42.900226', '', '$2a$11$eWghSVIjMYzXIqn6sGLaE.0QZb1Gd7gBpByh4rgP1HYJPgBbwJYEu', null, null, null, '0', null, null, null, null, null, null);
INSERT INTO "public"."users" VALUES ('3', '用户', '2017-01-11 05:21:43.164661', '2017-01-11 05:21:43.164661', '', '$2a$11$j4X4m6ncIz4BwkKLsat.penVFVdlY9qrhBRTlQaSNiNZxQJp4AOpu', null, null, null, '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."users_roles";
CREATE TABLE "public"."users_roles" (
"user_id" int4,
"role_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO "public"."users_roles" VALUES ('1', '2');
INSERT INTO "public"."users_roles" VALUES ('2', '3');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."audits_id_seq" OWNED BY "audits"."id";
ALTER SEQUENCE "public"."catalogs_id_seq" OWNED BY "catalogs"."id";
ALTER SEQUENCE "public"."ckeditor_assets_id_seq" OWNED BY "ckeditor_assets"."id";
ALTER SEQUENCE "public"."cms_channels_id_seq" OWNED BY "cms_channels"."id";
ALTER SEQUENCE "public"."cms_pages_id_seq" OWNED BY "cms_pages"."id";
ALTER SEQUENCE "public"."cms_sites_id_seq" OWNED BY "cms_sites"."id";
ALTER SEQUENCE "public"."image_item_relations_id_seq" OWNED BY "image_item_relations"."id";
ALTER SEQUENCE "public"."image_item_tags_id_seq" OWNED BY "image_item_tags"."id";
ALTER SEQUENCE "public"."image_items_id_seq" OWNED BY "image_items"."id";
ALTER SEQUENCE "public"."items_id_seq" OWNED BY "items"."id";
ALTER SEQUENCE "public"."material_management_details_id_seq" OWNED BY "material_management_details"."id";
ALTER SEQUENCE "public"."material_managements_id_seq" OWNED BY "material_managements"."id";
ALTER SEQUENCE "public"."members_id_seq" OWNED BY "members"."id";
ALTER SEQUENCE "public"."order_materials_id_seq" OWNED BY "order_materials"."id";
ALTER SEQUENCE "public"."order_products_id_seq" OWNED BY "order_products"."id";
ALTER SEQUENCE "public"."orders_id_seq" OWNED BY "orders"."id";
ALTER SEQUENCE "public"."produces_id_seq" OWNED BY "produces"."id";
ALTER SEQUENCE "public"."roles_id_seq" OWNED BY "roles"."id";
ALTER SEQUENCE "public"."sites_id_seq" OWNED BY "sites"."id";
ALTER SEQUENCE "public"."task_types_id_seq" OWNED BY "task_types"."id";
ALTER SEQUENCE "public"."tasks_id_seq" OWNED BY "tasks"."id";
ALTER SEQUENCE "public"."theme_configs_id_seq" OWNED BY "theme_configs"."id";
ALTER SEQUENCE "public"."themes_id_seq" OWNED BY "themes"."id";
ALTER SEQUENCE "public"."tracker_actions_id_seq" OWNED BY "tracker_actions"."id";
ALTER SEQUENCE "public"."tracker_sessions_id_seq" OWNED BY "tracker_sessions"."id";
ALTER SEQUENCE "public"."tracker_share_codes_id_seq" OWNED BY "tracker_share_codes"."id";
ALTER SEQUENCE "public"."tracker_user_relations_id_seq" OWNED BY "tracker_user_relations"."id";
ALTER SEQUENCE "public"."tracker_visits_id_seq" OWNED BY "tracker_visits"."id";
ALTER SEQUENCE "public"."user_mobiles_id_seq" OWNED BY "user_mobiles"."id";
ALTER SEQUENCE "public"."user_weixins_id_seq" OWNED BY "user_weixins"."id";
ALTER SEQUENCE "public"."users_id_seq" OWNED BY "users"."id";

-- ----------------------------
-- Primary Key structure for table ar_internal_metadata
-- ----------------------------
ALTER TABLE "public"."ar_internal_metadata" ADD PRIMARY KEY ("key");

-- ----------------------------
-- Indexes structure for table audits
-- ----------------------------
CREATE INDEX "associated_index" ON "public"."audits" USING btree ("associated_id", "associated_type");
CREATE INDEX "auditable_index" ON "public"."audits" USING btree ("auditable_id", "auditable_type");
CREATE INDEX "index_audits_on_created_at" ON "public"."audits" USING btree ("created_at");
CREATE INDEX "index_audits_on_request_uuid" ON "public"."audits" USING btree ("request_uuid");
CREATE INDEX "user_index" ON "public"."audits" USING btree ("user_id", "user_type");

-- ----------------------------
-- Primary Key structure for table audits
-- ----------------------------
ALTER TABLE "public"."audits" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table catalog_hierarchies
-- ----------------------------
CREATE UNIQUE INDEX "catalog_anc_desc_idx" ON "public"."catalog_hierarchies" USING btree ("ancestor_id", "descendant_id", "generations");
CREATE INDEX "catalog_desc_idx" ON "public"."catalog_hierarchies" USING btree ("descendant_id");

-- ----------------------------
-- Indexes structure for table catalogs
-- ----------------------------
CREATE INDEX "index_catalogs_on_parent_id" ON "public"."catalogs" USING btree ("parent_id");

-- ----------------------------
-- Primary Key structure for table catalogs
-- ----------------------------
ALTER TABLE "public"."catalogs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table ckeditor_assets
-- ----------------------------
CREATE INDEX "idx_ckeditor_assetable" ON "public"."ckeditor_assets" USING btree ("assetable_type", "assetable_id");
CREATE INDEX "idx_ckeditor_assetable_type" ON "public"."ckeditor_assets" USING btree ("assetable_type", "type", "assetable_id");
CREATE INDEX "index_ckeditor_assets_on_type" ON "public"."ckeditor_assets" USING btree ("type");

-- ----------------------------
-- Primary Key structure for table ckeditor_assets
-- ----------------------------
ALTER TABLE "public"."ckeditor_assets" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cms_channels
-- ----------------------------
CREATE INDEX "index_cms_channels_on_short_title" ON "public"."cms_channels" USING btree ("short_title");
CREATE INDEX "index_cms_channels_on_site_id" ON "public"."cms_channels" USING btree ("site_id");

-- ----------------------------
-- Primary Key structure for table cms_channels
-- ----------------------------
ALTER TABLE "public"."cms_channels" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cms_pages
-- ----------------------------
CREATE INDEX "index_cms_pages_on_channel_id" ON "public"."cms_pages" USING btree ("channel_id");
CREATE INDEX "index_cms_pages_on_short_title" ON "public"."cms_pages" USING btree ("short_title");

-- ----------------------------
-- Primary Key structure for table cms_pages
-- ----------------------------
ALTER TABLE "public"."cms_pages" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cms_sites
-- ----------------------------
ALTER TABLE "public"."cms_sites" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table image_item_relations
-- ----------------------------
CREATE INDEX "index_image_item_relations_on_image_item_id" ON "public"."image_item_relations" USING btree ("image_item_id");
CREATE INDEX "index_image_item_relations_on_relation_type_and_relation_id" ON "public"."image_item_relations" USING btree ("relation_type", "relation_id");

-- ----------------------------
-- Primary Key structure for table image_item_relations
-- ----------------------------
ALTER TABLE "public"."image_item_relations" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table image_item_tags
-- ----------------------------
CREATE INDEX "index_image_item_tags_on_image_item_id" ON "public"."image_item_tags" USING btree ("image_item_id");

-- ----------------------------
-- Primary Key structure for table image_item_tags
-- ----------------------------
ALTER TABLE "public"."image_item_tags" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table image_items
-- ----------------------------
CREATE INDEX "index_image_items_on_owner_type_and_owner_id" ON "public"."image_items" USING btree ("owner_type", "owner_id");

-- ----------------------------
-- Primary Key structure for table image_items
-- ----------------------------
ALTER TABLE "public"."image_items" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table item_relations
-- ----------------------------
CREATE INDEX "index_item_relations_on_master_id" ON "public"."item_relations" USING btree ("master_id");
CREATE INDEX "index_item_relations_on_slave_id" ON "public"."item_relations" USING btree ("slave_id");

-- ----------------------------
-- Indexes structure for table items
-- ----------------------------
CREATE INDEX "index_items_on_site_id" ON "public"."items" USING btree ("site_id");

-- ----------------------------
-- Primary Key structure for table items
-- ----------------------------
ALTER TABLE "public"."items" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table material_management_details
-- ----------------------------
CREATE INDEX "index_material_management_details_on_material_management_id" ON "public"."material_management_details" USING btree ("material_management_id");

-- ----------------------------
-- Primary Key structure for table material_management_details
-- ----------------------------
ALTER TABLE "public"."material_management_details" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table material_managements
-- ----------------------------
ALTER TABLE "public"."material_managements" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table members
-- ----------------------------
CREATE INDEX "index_members_on_site_id" ON "public"."members" USING btree ("site_id");
CREATE INDEX "index_members_on_user_id" ON "public"."members" USING btree ("user_id");

-- ----------------------------
-- Primary Key structure for table members
-- ----------------------------
ALTER TABLE "public"."members" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_materials
-- ----------------------------
CREATE INDEX "index_order_materials_on_order_id" ON "public"."order_materials" USING btree ("order_id");

-- ----------------------------
-- Primary Key structure for table order_materials
-- ----------------------------
ALTER TABLE "public"."order_materials" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_products
-- ----------------------------
CREATE INDEX "index_order_products_on_order_id" ON "public"."order_products" USING btree ("order_id");
CREATE INDEX "index_order_products_on_product_id" ON "public"."order_products" USING btree ("product_id");

-- ----------------------------
-- Primary Key structure for table order_products
-- ----------------------------
ALTER TABLE "public"."order_products" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table orders
-- ----------------------------
CREATE INDEX "index_orders_on_site_id" ON "public"."orders" USING btree ("site_id");
CREATE INDEX "index_orders_on_user_id" ON "public"."orders" USING btree ("user_id");

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table produces
-- ----------------------------
CREATE INDEX "index_produces_on_order_id" ON "public"."produces" USING btree ("order_id");

-- ----------------------------
-- Primary Key structure for table produces
-- ----------------------------
ALTER TABLE "public"."produces" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table roles
-- ----------------------------
CREATE INDEX "index_roles_on_name" ON "public"."roles" USING btree ("name");
CREATE INDEX "index_roles_on_name_and_resource_type_and_resource_id" ON "public"."roles" USING btree ("name", "resource_type", "resource_id");

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table schema_migrations
-- ----------------------------
ALTER TABLE "public"."schema_migrations" ADD PRIMARY KEY ("version");

-- ----------------------------
-- Indexes structure for table sites
-- ----------------------------
CREATE INDEX "index_sites_on_user_id" ON "public"."sites" USING btree ("user_id");

-- ----------------------------
-- Primary Key structure for table sites
-- ----------------------------
ALTER TABLE "public"."sites" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table task_types
-- ----------------------------
ALTER TABLE "public"."task_types" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tasks
-- ----------------------------
CREATE INDEX "index_tasks_on_resource_type_and_resource_id" ON "public"."tasks" USING btree ("resource_type", "resource_id");
CREATE INDEX "index_tasks_on_site_id" ON "public"."tasks" USING btree ("site_id");

-- ----------------------------
-- Primary Key structure for table tasks
-- ----------------------------
ALTER TABLE "public"."tasks" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table theme_configs
-- ----------------------------
CREATE INDEX "index_theme_configs_on_site_id" ON "public"."theme_configs" USING btree ("site_id");
CREATE INDEX "index_theme_configs_on_theme_id" ON "public"."theme_configs" USING btree ("theme_id");

-- ----------------------------
-- Primary Key structure for table theme_configs
-- ----------------------------
ALTER TABLE "public"."theme_configs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table themes
-- ----------------------------
ALTER TABLE "public"."themes" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tracker_actions
-- ----------------------------
ALTER TABLE "public"."tracker_actions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tracker_sessions
-- ----------------------------
ALTER TABLE "public"."tracker_sessions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tracker_share_codes
-- ----------------------------
CREATE INDEX "index_tracker_share_codes_on_resource_type_and_resource_id" ON "public"."tracker_share_codes" USING btree ("resource_type", "resource_id");
CREATE INDEX "index_tracker_share_codes_on_user_id" ON "public"."tracker_share_codes" USING btree ("user_id");

-- ----------------------------
-- Primary Key structure for table tracker_share_codes
-- ----------------------------
ALTER TABLE "public"."tracker_share_codes" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tracker_user_relations
-- ----------------------------
CREATE INDEX "index_tracker_user_relations_on_master_id" ON "public"."tracker_user_relations" USING btree ("master_id");
CREATE INDEX "index_tracker_user_relations_on_slave_id" ON "public"."tracker_user_relations" USING btree ("slave_id");

-- ----------------------------
-- Primary Key structure for table tracker_user_relations
-- ----------------------------
ALTER TABLE "public"."tracker_user_relations" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tracker_visits
-- ----------------------------
CREATE INDEX "index_tracker_visits_on_action_id" ON "public"."tracker_visits" USING btree ("action_id");
CREATE INDEX "index_tracker_visits_on_resource_type_and_resource_id" ON "public"."tracker_visits" USING btree ("resource_type", "resource_id");
CREATE INDEX "index_tracker_visits_on_session_id" ON "public"."tracker_visits" USING btree ("session_id");
CREATE INDEX "index_tracker_visits_on_user_id" ON "public"."tracker_visits" USING btree ("user_id");

-- ----------------------------
-- Primary Key structure for table tracker_visits
-- ----------------------------
ALTER TABLE "public"."tracker_visits" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table user_mobiles
-- ----------------------------
CREATE INDEX "index_user_mobiles_on_user_id" ON "public"."user_mobiles" USING btree ("user_id");

-- ----------------------------
-- Primary Key structure for table user_mobiles
-- ----------------------------
ALTER TABLE "public"."user_mobiles" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table user_weixins
-- ----------------------------
CREATE INDEX "index_user_weixins_on_user_id" ON "public"."user_weixins" USING btree ("user_id");

-- ----------------------------
-- Primary Key structure for table user_weixins
-- ----------------------------
ALTER TABLE "public"."user_weixins" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "public"."users" USING btree ("reset_password_token");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table users_roles
-- ----------------------------
CREATE INDEX "index_users_roles_on_user_id_and_role_id" ON "public"."users_roles" USING btree ("user_id", "role_id");

-- ----------------------------
-- Foreign Key structure for table "public"."image_item_relations"
-- ----------------------------
ALTER TABLE "public"."image_item_relations" ADD FOREIGN KEY ("image_item_id") REFERENCES "public"."image_items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."image_item_tags"
-- ----------------------------
ALTER TABLE "public"."image_item_tags" ADD FOREIGN KEY ("image_item_id") REFERENCES "public"."image_items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."items"
-- ----------------------------
ALTER TABLE "public"."items" ADD FOREIGN KEY ("site_id") REFERENCES "public"."sites" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."material_management_details"
-- ----------------------------
ALTER TABLE "public"."material_management_details" ADD FOREIGN KEY ("material_management_id") REFERENCES "public"."material_managements" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."members"
-- ----------------------------
ALTER TABLE "public"."members" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."members" ADD FOREIGN KEY ("site_id") REFERENCES "public"."sites" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."order_materials"
-- ----------------------------
ALTER TABLE "public"."order_materials" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."order_products"
-- ----------------------------
ALTER TABLE "public"."order_products" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."orders"
-- ----------------------------
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("site_id") REFERENCES "public"."sites" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."orders" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."produces"
-- ----------------------------
ALTER TABLE "public"."produces" ADD FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."tasks"
-- ----------------------------
ALTER TABLE "public"."tasks" ADD FOREIGN KEY ("site_id") REFERENCES "public"."sites" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."theme_configs"
-- ----------------------------
ALTER TABLE "public"."theme_configs" ADD FOREIGN KEY ("site_id") REFERENCES "public"."sites" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."theme_configs" ADD FOREIGN KEY ("theme_id") REFERENCES "public"."themes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."tracker_visits"
-- ----------------------------
ALTER TABLE "public"."tracker_visits" ADD FOREIGN KEY ("session_id") REFERENCES "public"."tracker_sessions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."tracker_visits" ADD FOREIGN KEY ("action_id") REFERENCES "public"."tracker_actions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."user_mobiles"
-- ----------------------------
ALTER TABLE "public"."user_mobiles" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."user_weixins"
-- ----------------------------
ALTER TABLE "public"."user_weixins" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
