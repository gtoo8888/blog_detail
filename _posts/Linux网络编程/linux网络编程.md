---
title: linux网络编程
date: 2022-03-16 21:45:13
tags:
- Linux网络编程
---

用man pthread没有相应的解释
sudo apt-get install glibc-doc

sudo apt-get install manpages-posix-dev

man -k pthread 



sudo apt-get install mysql-server



service mysql start启动mysql


// 建立yourdb库
create database yourdb;

//创建user表
USE yourdb;
CREATE TABLE user(
    username char(50) NULL,
    passwd char(50) NULL
)ENGINE=InnoDB;

// 添加数据
INSERT INTO user(username, passwd) VALUES('name', 'passwd');


show databases;
显示数据库

use demo_test;
连接数据库

查看当前使用的数据库：
mysql> select database();

查看表
show tables;

获取表结构
desc user;

查询表中的数据
mysql> select * from user;
























