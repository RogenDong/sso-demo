drop schema if exists `sso_demo`;
create schema `sso_demo`;
use `sso_demo`;

create table `sys_account`
(
    `id`          bigint auto_increment primary key                              not null,
    `codename`    varchar(50)                                                    not null comment '登录号',
    `password`    varchar(68)                                                    not null comment '密码',
    `create_time` datetime default current_timestamp                             not null comment '创号时间',
    `modify_time` datetime default current_timestamp on update current_timestamp not null comment '发生最后一次修改的时间',
    constraint `sys_account_codename_u_index` unique (`codename`)
) comment '账户表';
# 密码使用 BCrypt 加密
# admin 123456
# test-user 112233
insert into `sys_account` (`codename`, `password`)
values ('admin', '$2y$10$f/IA9z5we52W9Jbk/LWMm.GD6w/6CqMlZ.CplnC7DkuCatYcjwqSK'),
       ('test-user', '$2y$12$iwOnZtGF5FcjB5.RNejWX.kQO/Xp0DnnK84tXEhhjhqQaYlSguW6a');
