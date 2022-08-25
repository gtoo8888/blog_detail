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



# mysql

show status

3、Bytes_received，Bytes_sent，分别表示MySQL Server从客户端接收的字节数和发送给客户端的字节数，也能一定程度上反映MySQL服务的繁忙程度。

4、Com_xxxx。其中，xxxx指代的是一种statement，比如select，insert，update，truncate等，甚至是show status，show processlist这类命令也有。这个参数值表示statement被执行的次数。

5、Connections。尝试连接MySQL Server的连接数量，成功和失败的连接都算在内。



Handler_read_first

    Handler_read_first原意：The number of times the first entry in an index was read. If this value is high, it suggests that the server is doing a lot of full index scans; for example, SELECT col1 FROM foo, assuming that col1 is indexed.

    此选项表明SQL是在做一个全索引扫描，注意是全部，而不是部分，所以说如果存在WHERE语句，这个选项是不会变的。如果这个选项的数值很大，既是好事也是坏事。说它好是因为毕竟查询是在索引里完成的，而不是数据文件里，说它坏是因为大数据量时，即使是索引文件，做一次完整的扫描也是很费时间的。


 Handler_read_key

    Handler_read_key原意：The number of requests to read a row based on a key. If this value is high, it is a good indication that your tables are properly indexed for your queries.

    此选项数值如果很高，那么恭喜你，你的系统高效的使用了索引，一切运转良好。


Handler_read_last

    Handler_read_last的原意：The number of requests to read the last key in an index. With ORDER BY, the server will issue a first-key request followed by several next-key requests, whereas with ORDER BY DESC, the server will issue a last-key request followed by several previous-key requests. This variable was added in MySQL 5.6.1.

3.4 Handler_read_next

    Handler_read_next的原意：The number of requests to read the next row in key order. This value is incremented if you are querying an index column with a range constraint or if you are doing an index scan.

    此选项表明在进行索引扫描时，按照索引从数据文件里取数据的次数。

Handler_read_prev

    Handler_read_prev的原意：The number of requests to read the previous row in key order. This read method is mainly used to optimize ORDER BY ... DESC.

    此选项表明在进行索引扫描时，按照索引倒序从数据文件里取数据的次数，一般就是ORDER BY ... DESC。注意Handler_read_next是ORDER BY ... ASC的方式取数据。

Handler_read_rnd

    Handler_read_rnd的原意：The number of requests to read a row based on a fixed position. This value is high if you are doing a lot of queries that require sorting of the result. You probably have a lot of queries that require MySQL to scan entire tables or you have joins that do not use keys properly.

    简单的说，就是查询直接操作了数据文件，很多时候表现为没有使用索引或者文件排序。
Handler_read_rnd_next

    Handler_read_rnd_next表示“在数据文件中读下一行的请求数。如果你正进行大量的表扫描，该值较高。通常说明你的表索引不正确或写入的查询没有利用索引。”

    这个说明跟你的SQL语句有很大的关系，你可以通过explain工具或者是慢查询日志找出对应的慢SQL，并对执行慢的SQL语句进行调试，直到找到最优的执行计划，这样Handler_read_rnd_next的值就会往下降了。

    很多时候，为了完成一个查询任务，我们往往可以写出几种查询语句，这时，你不妨挨个按照上面的方式执行，根据结果中的Handler_read_*数值，你就能相对容易的判断各种查询方式的优劣。


# 索引


1、普通索引  mysql>ALTER TABLE `table_name` ADD INDEX index_name ( `column` )

　　普通索引（由关键字KEY或INDEX定义的索引）的唯一任务是加快对数据的访问速度。因此，应该只为那些最经常出现在查询条件（WHEREcolumn=）或排序条件（ORDERBYcolumn）中的数据列创建索引。只要有可能，就应该选择一个数据最整齐、最紧凑的数据列（如一个整数类型的数据列）来创建索引。

　　2、唯一索引 mysql>ALTER TABLE `table_name` ADD UNIQUE ( `column` )

　　普通索引允许被索引的数据列包含重复的值。比如说，因为人有可能同名，所以同一个姓名在同一个“员工个人资料”数据表里可能出现两次或更多次。

　　如果能确定某个数据列将只包含彼此各不相同的值，在为这个数据列创建索引的时候就应该用关键字UNIQUE把它定义为一个唯一索引。这么做的好处：一是简化了MySQL对这个索引的管理工作，这个索引也因此而变得更有效率；二是MySQL会在有新记录插入数据表时，自动检查新记录的这个字段的值是否已经在某个记录的这个字段里出现过了；如果是，MySQL将拒绝插入那条新记录。也就是说，唯一索引可以保证数据记录的唯一性。事实上，在许多场合，人们创建唯一索引的目的往往不是为了提高访问速度，而只是为了避免数据出现重复。

　　3、主索引 mysql>ALTER TABLE `table_name` ADD PRIMARY KEY ( `column` )

　　在前面已经反复多次强调过：必须为主键字段创建一个索引，这个索引就是所谓的“主索引”。主索引与唯一索引的唯一区别是：前者在定义时使用的关键字是PRIMARY而不是UNIQUE。

　　4、外键索引 mysql>ALTER TABLE `table_name` ADD FULLTEXT ( `column`)

　　如果为某个外键字段定义了一个外键约束条件，MySQL就会定义一个内部索引来帮助自己以最有效率的方式去管理和使用外键约束条件。

　　5、复合索引 mysql>ALTER TABLE `table_name` ADD INDEX index_name ( `column1`, `column2`, `column3` )

　　索引可以覆盖多个数据列，如像INDEX（columnA，columnB）索引。这种索引的特点是MySQL可以有选择地使用一个这样的索引。如果查询操作只需要用到columnA数据列上的一个索引，就可以使用复合索引INDEX（columnA,columnB）。不过，这种用法仅适用于在复合索引中排列在前的数据列组合。比如说，INDEX（A，B，C）可以当做A或（A,B）的索引来使用，但不能当做B、C或（B，C）的索引来使用。


# OFFSET
1. select* from article LIMIT 1,3

2. select * from article LIMIT 3 OFFSET 1

# Pluck仅仅摘取这个字段
var tmp1 []float32 // 需要用数组去保存，不然就是只有一个
s.db.Debug().Model(&CachedFeatureInfo{}).Where("temporary = 1 and created_at < ?", created_at_time).Pluck("quality_score", &tmp1)


# Find
排序一定要在Find之前，不然不起作用
s.db.Debug().Model(&CachedFeatureInfo{}).Where("temporary = 1 and created_at <= ?", created_at_time).Order("created_at desc").Find(&FeatureInfos).Limit(100)


s.db.Debug().Model(&CachedFeatureInfo{}).Where("temporary = 1 and created_at <= ?", created_at_time).Order("created_at desc").First(&FeatureInfos).Limit(100)


# delete
s.db.Debug().Where("temporary = 1 and created_at <= ?", deleteTime).Order("created_at asc").Limit(100).Delete(&CachedFeatureInfo{}) 	// 从最早的开始删




drop table是数据库中用于删除一个或多个数据表的命令，具体格式“DROP TABLE [IF EXISTS] 表名列表”；如果想要同时删除多个表，只要将表名依次写在后面，相互之间用逗号隔开即可。



# 参考文献

https://blog.csdn.net/m0_67393039/article/details/123702111
https://blog.csdn.net/m0_51889436/article/details/123227451
[你常听说的WAL到底是什么]https://ost.51cto.com/posts/15404
[Ubuntu 20.04 MySQL 命令行导入导出数据库]https://blog.csdn.net/LZW15082682930/article/details/118554610
[Mysql快速比较两个表中的数据是否有差异]https://blog.csdn.net/usualheart/article/details/107403759
[最好用的 10 款 MySQL GUI 管理工具横向测评 - 免费和付费到底怎么选?]https://kalacloud.com/blog/best-mysql-gui-tools/?utm_medium=inside
[mysql索引类型normal，unique，full text]https://blog.csdn.net/cuidiwhere/article/details/8452997
[MySQL的几个概念：主键，外键，索引，唯一索引]https://blog.51cto.com/wushank/1641308
[数据库逻辑设计之三大范式通俗理解，一看就懂，书上说的太晦涩]https://segmentfault.com/a/1190000013695030
[数据库范式那些事]https://www.cnblogs.com/CareySon/archive/2010/02/16/1668803.html

[NSQ简明教程]https://jiajunhuang.com/articles/2020_08_15-nsq.md.html
[0227浅谈MySQL之 Handler_read_*参数]https://www.cnblogs.com/qcfeng/p/6476392.html


