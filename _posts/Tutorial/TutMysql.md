---
title: MySQL 教程
date: 2022-10-27 19:12:48
tags:
- 教程
---

# mysql 教程

## 一、基础命令

```bash
# 查看端口
show global variables like 'port';

# 重启 MySQL
service mysql restart

# 查看 debian 系统用户密码配置
cat /etc/mysql/debian.cnf

# 使用 debian-sys-maint 用户登录
mysql -udebian-sys-maint -p[密码]
```

## 二、用户管理

```bash
# 查看用户信息
select User, Host from mysql.user;
select User, plugin from mysql.user;
select Host, User from mysql.user;
SELECT Host, User, authentication_string FROM mysql.user;

# 修改 root 密码（多种方式）
update mysql.user set authentication_string='' where user='root';
UPDATE mysql.user SET authentication_string=md5('123456') WHERE User='root' AND Host='localhost';
UPDATE mysql.user SET authentication_string=sha1('123456') WHERE User='root' AND Host='localhost';
update mysql.user set authentication_string=password('root') where User='root';

# 允许 root 远程登录
update user set host='%' where user='debian-sys-maint';

# 修改认证方式并设置密码
alter user 'root'@'localhost' identified by '123';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';
ALTER USER 'mysql.sys'@'localhost' IDENTIFIED WITH mysql_native_password BY '123';

# 刷新权限
flush privileges;
```

## 三、跳过密码登录（紧急恢复）

```bash
mysqld --console --skip-grant-tables --shared-memory
```

## 四、配置文件位置

```bash
vi /etc/mysql/mysql.conf.d/mysqld.cnf
```

## 五、常见问题处理

```bash
# 修复损坏的包安装
dpkg --configure -a

# 查看已安装的 MySQL 包
dpkg --list|grep mysql
```

## 参考资料

- [Ubuntu 20.04 安装和卸载 MySQL8](https://www.cnblogs.com/zhangxuel1ang/p/13456116.html)
- [腾讯云开发者社区 - MySQL 相关](https://cloud.tencent.com/developer/article/1165127)
