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

create database yzxtest;


方法一：进入数据库
create database yzx_test;
use yzx_test;
show database;
set names utf8;
source /data_hdd/backup/mysql/20220814_230002/lookonce.dump_20220814_230002.sql;


方法二：数据库外操作
mysql -u用户名 -p密码 数据库名 < 数据库名.sql


# 删除数据库

drop database yzx_test;


# 查看用户权限及权限管理
查看所有用户（用户名、给谁授权）

SELECT user,host FROM mysql.user;



# 查看整个表格的信息

SELECT * FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'yzx_test';




# TIDB 的恢复尝试




[TIDB-PD-RECOVER的恢复方式]https://blog.csdn.net/line_on_database/article/details/125938140
[jp官网]https://docs.pingcap.com/zh/tidb-in-kubernetes/stable/pd-recover

https://docs.pingcap.com/zh/tidb/stable/pd-recover#pd-recover-%E4%BD%BF%E7%94%A8%E6%96%87%E6%A1%A3


# 获取id
kubectl get tc basic -n tidb-cluster -o='go-template={{.status.clusterID}}{{"\n"}}'



wget https://download.pingcap.org/tidb-${version}-linux-amd64.tar.gz

wget https://download.pingcap.org/tidb-v4.0.8-linux-amd64.tar.gz


kubectl logs -n tidb-cluster basic-pd-2 | grep "init cluster id"

[2022/08/15 08:04:47.380 +00:00] [INFO] [server.go:343] ["init cluster id"] [cluster-id=7125293229949899697]
cluster-id=7125293229949899697

kubectl logs -n tidb-cluster basic-pd-0  | grep "idAllocator "

[2022/08/15 08:26:13.835 +00:00] [INFO] [id.go:110] ["idAllocator allocates a new id"] [alloc-id=35000]
alloc-id=35000


./pd-recover -endpoints http://10.101.154.54:2379 -cluster-id 7125293229949899697 -alloc-id 35002



# 输出两个需要的地址
kubectl logs -n tidb-cluster basic-pd-0 | grep "init cluster id"
kubectl logs -n tidb-cluster basic-pd-0  | grep "idAllocator "
t get svc
./pd-recover -endpoints http://10.102.215.78:2379 -cluster-id 7125293229949899697 -alloc-id 35002
t delete svc basic-pd



# 官方文档的恢复

kubectl patch tc basic -n tidb-cluster --type merge -p '{"spec":{"pd":{"replicas": 0}}}'


kubectl patch sts basic-pd -pd -n  tidb-cluster -p '{"spec":{"replicas": 0}}'



ihouqi-docker.pkg.coding.net/shipinanquan/pingcap/pd:v4.0.8

kubectl delete pvc -l app.kubernetes.io/component=pd,app.kubernetes.io/instance=pd-basic-pd-0 -n tidb-cluster

kubectl delete pvc -l ihouqi-docker.pkg.coding.net/shipinanquan/pingcap/pd:v4.0.8 -n tidb-cluster


kubectl patch tc basic -n tidb-cluster --type merge -p '{"spec":{"pd":{"replicas": 1}}}'


kubectl patch sts basic-pd -n tidb-cluster -p '{"spec":{"replicas": 1}}'



kubectl port-forward -n tidb-cluster svc/basic-pd 2379:2379

./pd-recover -endpoints http://10.102.215.78:2379 -cluster-id 7125293229949899697 -alloc-id 37002

~~不可以~~
~~./pd-recover -endpoints http://127.0.0.1:2379 -cluster-id 7125293229949899697 -alloc-id 39002~~


查看configmap
t describe cm basic-pd-6232343




kubectl patch tc basic -n tidb-cluster --type merge -p '{"spec":{"pd":{"replicas": 3}}}'


kubectl patch sts basic-pd -pd -n  tidb-cluster -p '{"spec":{"replicas": 3}}'



# 参考文献

https://blog.csdn.net/m0_67393039/article/details/123702111
https://blog.csdn.net/m0_51889436/article/details/123227451
[你常听说的WAL到底是什么]https://ost.51cto.com/posts/15404
[Ubuntu 20.04 MySQL 命令行导入导出数据库]https://blog.csdn.net/LZW15082682930/article/details/118554610
[Mysql快速比较两个表中的数据是否有差异]https://blog.csdn.net/usualheart/article/details/107403759
[最好用的 10 款 MySQL GUI 管理工具横向测评 - 免费和付费到底怎么选?]https://kalacloud.com/blog/best-mysql-gui-tools/?utm_medium=inside


[NSQ简明教程]https://jiajunhuang.com/articles/2020_08_15-nsq.md.html


