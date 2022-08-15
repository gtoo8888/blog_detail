---
title: MySql教程
date: 2022-06-23 00:40:45
tags:
- 教程
---

# 导出数据库用mysqldump命令
1、导出数据和表结构：
　　mysqldump -u用户名 -p密码 数据库名 > 数据库名.sql
　　mysqldump -uroot -p dbname > dbname .sql
　　敲回车后会提示输入密码


2、只导出表结构
　　mysqldump -u用户名 -p密码 -d 数据库名 > 数据库名.sql
　　mysqldump -uroot -p -d dbname > dbname .sql


# mysql导入数据库

方法一：进入数据库
create database yzx-test;
use yzx-test;
show database;
set names utf8;
source 
/data_hdd/backup/mysql/20220814_230002/lookonce.dump_20220814_230002.sql;


方法二：数据库外操作
mysql -u用户名 -p密码 数据库名 < 数据库名.sql


# 参考文献

https://blog.csdn.net/m0_67393039/article/details/123702111
https://blog.csdn.net/m0_51889436/article/details/123227451
[你常听说的WAL到底是什么]https://ost.51cto.com/posts/15404
[Ubuntu 20.04 MySQL 命令行导入导出数据库]https://blog.csdn.net/LZW15082682930/article/details/118554610


