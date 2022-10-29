---
title: mysql 教程
date: 2022-10-27 19:12:48
tags:
---

show global variables like 'port';

service mysql restart

cat /etc/mysql/debian.cnf

mysql -udebian-sys-maint -pCljM3ZnVZ3n3sycv

mysql -uroot -p123456


select User,Host from user;



select user, plugin from mysql.user;

select host,user from mysql.user;

SELECT host,user,authentication_string FROM mysql.user;


update mysql.user set authentication_string='' where user='root';
UPDATE mysql.user SET authentication_string=md5('123456') WHERE User='root'  AND Host ='localhost';
UPDATE mysql.user SET authentication_string=sha1('123456') WHERE User='root'  AND Host ='localhost';
UPDATE mysql.user SET authentication_string='123' WHERE User='root'  AND Host ='localhost';
update mysql.user set authentication_string=password('root') where User='root';

update user set host='%' where user='debian-sys-maint';

alter user'root'@'localhost' identified by '123';

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';


ALTER USER 'mysql.sys'@'localhost' IDENTIFIED WITH mysql_native_password BY '123';


flush privileges;



mysqld --console --skip-grant-tables --shared-memory；


 vi /etc/mysql/mysql.conf.d/mysqld.cnf

dpkg --configure -a




dpkg --list|grep mysql




https://cloud.tencent.com/developer/article/1165127

[Ubuntu20.04 安装和卸载MySQL8]https://www.cnblogs.com/zhangxuel1ang/p/13456116.html























































