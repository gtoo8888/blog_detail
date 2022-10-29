---
title: 小工具的使用
date: 2022-08-23 15:49:26
tags:
- 教程
---

# Navicat12 Mysql可视化查看工具

破解的时候需要关闭软件本身

需要在k8s中开放端口
修改mysql开放及端口：
开放：alias b="kubectl -n namespace"
         b edit svc mysql -n mysql
      加spec-底部type: NodePort         # 从ClusterIP改过来
修改端口：ports-nodePort:31198

数据库：
host=[主机名],
user=[用户名],
passwd=[密码],
db=[想要访问的数据库],
charset="utf8",
port=[使用的端口]



host="10.1.0.42",
user="pigg",
passwd="123456",
db="ggip",
charset="utf8",
port=31198


## 查看表的情况
”设计表“
## 执行mysql语句以后的分析
剖析：

1）Opening tables 这个是表示这个SQL拿到这个表的使用权所占用的时间，如果在一个SQL中过长，则有可能表示当前表被锁，被一些其他线程占用，可以查一下当前表的状态。
2）Sending data包括两个部分，收集和发送数据。这里的关键是为什么要收集数据，原因在于：mysql使用“索引”完成查询结束后，mysql得到了一堆的行id，如果有的列并不在索引中，mysql需要重新到“数据行”上将需要返回的数据读取出来返回个客户端。如果这部分占用时间过程，有可能是索引问题，或者字段长度过大导致。


# gRPC调试工具

BloomRPC
可以调试utilserver这个特别复杂的服务
在调试的时候，需要把包含的文件，还有包含文件的包含文件全部导入



# kdevelop
CMake可视化调试工具


打开命令窗口:
1. 安装gcc(编译器)
    sudo apt-get build-dep gcc
    sudo apt-get install build-essential
    
2. 安装kdevelop
sudo apt-get install kdevelop

3. 安装cmake等
sudo apt-get install automake autoconf g++ libtool cmake

# 参考文献
[使用Navicat分析SQL性能]https://blog.csdn.net/weixin_43416686/article/details/121037223





