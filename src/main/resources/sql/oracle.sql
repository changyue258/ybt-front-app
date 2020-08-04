
-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
CREATE TABLE t_permission (
  id 			varchar2(64) NOT NULL,
  name 			varchar2(30) DEFAULT NULL,
  pid 			varchar2(64) DEFAULT NULL,
  descpt 		varchar2(50) DEFAULT NULL,
  url 			varchar2(100) DEFAULT NULL,
  is_deleted 	INTEGER  DEFAULT (0),
  create_time 	date DEFAULT NULL,
  create_by 	varchar2(64) DEFAULT NULL,
  update_time 	date DEFAULT NULL,
  update_by 	varchar2(64) DEFAULT NULL
);

comment on table t_permission 
	is '菜单表';
comment on column t_permission.ID 
	is '序号';
comment on column t_permission.name 
	is '菜单名称';
comment on column t_permission.pid 
	is '父菜单id';
comment on column t_permission.descpt 
	is '描述';
comment on column t_permission.url 
	is '菜单url';
comment on column t_permission.is_deleted 
	is '0：常  1：删除';
comment on column t_permission.create_time 
	is '创建时间';
comment on column t_permission.create_by 
	is '创建人员';
comment on column t_permission.update_time 
	is '修改时间';
comment on column t_permission.update_by 
	is '修改人员';

-- Create/Recreate primary and foreign key constraints 

alter table t_permission
  add constraint pk_t_permission primary key (ID);

--创建序列
create sequence SEQ_PERMISSION
increment by 1
start with 1
 maxvalue 999999999999999999999999999
 minvalue 1
 nocache;
 
-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO t_permission VALUES ('1', '系统管理', '0', '系统管理', '', '0', null, null, null, null);
INSERT INTO t_permission VALUES ('2', '账号管理', '1', '账号管理', '/user/userList', '0', null, null, null, null);
INSERT INTO t_permission VALUES ('3', '角色管理', '1', '角色管理', '/role/roleList', '0', null, null, null, null);
INSERT INTO t_permission VALUES ('7', '权限管理', '1', '权限管理', '/permission/permissionList', '0', null, null, null, null);


-- ----------------------------
-- Table structure for t_role
-- ----------------------------
CREATE TABLE t_role (
  id 					varchar2(64) NOT NULL,
  role_name 			varchar2(30) NOT NULL ,
  role_desc 			varchar2(100) DEFAULT NULL,
  permissions 			varchar2(20) DEFAULT NULL ,
  role_status 			INTEGER  DEFAULT (1),
  is_deleted 			INTEGER  DEFAULT (0),
  create_time 			date DEFAULT NULL,
  create_by 			varchar2(64) DEFAULT NULL,
  update_time 			date DEFAULT NULL,
  update_by 			varchar2(64) DEFAULT NULL
);

comment on table t_role 
	is '系统用户角色表';
comment on column t_role.ID 
	is '权限角色ID';
comment on column t_role.role_name 
	is '角色名称';
comment on column t_role.role_desc 
	is '角色描述';
comment on column t_role.permissions 
	is '权限';
comment on column t_role.role_status 
	is '1：有效,0：无效';
comment on column t_role.is_deleted 
	is '0:正常,1:删除';
comment on column t_role.is_deleted 
	is '创建时间';
comment on column t_role.create_by 
	is '创建人员';
comment on column t_role.update_time 
	is '修改时间';
comment on column t_role.update_by 
	is '修改人员';
	
alter table t_role
  add constraint pk_t_role primary key (ID);

--创建序列
create sequence SEQ_T_ROLE
increment by 1
start with 1
 maxvalue 999999999999999999999999999
 minvalue 1
 nocache;
-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO t_role VALUES ('1', '系统管理员', '系统管理员', '1,9', '1', '0', null, null, null, null);
INSERT INTO t_role VALUES ('2', '普通管理员', '普通管理员', '9', '1', '0', null, null, null, null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
CREATE TABLE t_user (
  id 			INTEGER primary key,
  name 			varchar2(50) NOT NULL,
  pwd 			varchar2(250) DEFAULT NULL,
  role_id 		varchar2(64) DEFAULT NULL ,
  phone 		varchar2(11) NOT NULL,
  status 		INTEGER  DEFAULT (0),
  remark 		varchar2(255) DEFAULT NULL,
  is_deleted 	INTEGER  DEFAULT (0),
  create_time 	date DEFAULT NULL,
  create_by 	varchar2(64) DEFAULT NULL,
  update_time 	date DEFAULT NULL,
  update_by 	varchar2(64) DEFAULT NULL
) ;

comment on table t_user 
	is '系统管理员帐号';
comment on column t_user.ID 
	is '系统用户名称ID';
comment on column t_user.name 
	is '系统用户名称';
comment on column t_user.pwd 
	is '系统用户密码';
comment on column t_user.role_id 
	is '角色id';
comment on column t_user.phone 
	is '手机号';
comment on column t_user.status 
	is '状态（0：无效；1：有效）';
comment on column t_user.remark 
	is '备注信息';
comment on column t_user.is_deleted 
	is ' 0 :正常,  1:删除';
comment on column t_user.create_time 
	is '创建时间';
comment on column t_user.create_by 
	is '创建人员';
comment on column t_user.update_time 
	is '修改时间';
comment on column t_user.update_by 
	is '修改人员';
	
--创建序列
create sequence SEQ_T_USER
increment by 1
start with 1
 maxvalue 999999999999999999999999999
 minvalue 1
 nocache;
-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO t_user VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '1', '13411182215', '1', '密码admin', '0', to_DATE('2020-06-28 17:36:29','yyyy-MM-DD hh24:MI:SS'), null, null, null);
