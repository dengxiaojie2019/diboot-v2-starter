-- 建表
create table "dictionary" (
   "id"                 INTEGER  generated as identity ( start with 100000 nocycle noorder)  not null,
   "parent_id"          INTEGER               not null,
   "type"               VARCHAR2(50)          not null,
   "item_name"          VARCHAR2(100)         not null,
   "item_value"         VARCHAR2(100),
   "comment"            VARCHAR2(200),
   "extdata"            VARCHAR2(200),
   "sort_id"            SMALLINT             default 99  not null,
   "system"             SMALLINT             default 0  not null,
   "editable"           SMALLINT             default 1  not null,
   "deleted"            SMALLINT             default 0  not null,
   "create_time"        TIMESTAMP            default CURRENT_TIMESTAMP  not null,
   constraint "PK_dictionary" primary key ("id")
);
-- 添加备注
comment on column "dictionary"."id" is 'ID';
comment on column "dictionary"."parent_id" is '父ID';
comment on column "dictionary"."type" is '字典类型';
comment on column "dictionary"."item_name" is '显示名';
comment on column "dictionary"."item_value" is '存储值';
comment on column "dictionary"."comment" is '备注';
comment on column "dictionary"."extdata" is '扩展JSON';
comment on column "dictionary"."sort_id" is '排序号';
comment on column "dictionary"."system" is '是否系统预置';
comment on column "dictionary"."editable" is '是否可编辑';
comment on column "dictionary"."deleted" is '删除标记';
comment on column "dictionary"."create_time" is '创建时间';

comment on table "dictionary" is '数据字典';

-- 创建索引
create index "idx_directory" on "dictionary" ("type", "item_value");


