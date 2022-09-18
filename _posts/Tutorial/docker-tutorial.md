---
title: docker 教程
date: 2022-06-19 23:39:25
tags:
- 教程
---


# docker 安装教程

# 一、docker 镜像命令

## 镜像查看
docker images -a            #列出本地所有的镜像
docker images -q            #只显示镜像ID
docker images --digests     #显示镜像的摘要信息
docker images --no-trunc    #显示完整的镜像信息

NAME            #名称
DESCRIPTION     #描述
STARS           #点赞，关注度，类似GitHub
OFFICIAL        #是否官方
AUTOMATED       #是否自动构建 请确认输入了正确的用户名和密码。

## 镜像下载
docker pull tomcat      #从Docker Hub上下载tomcat镜像，默认是最新版本。等价于：docker pull tomcat:latest
docker pull tomcat:8  # 选择指定版本下载

## 镜像运行
此时从镜像变成了容器
docker run 镜像名
docker run 镜像名:Tag

--name="nginx-lb": 为容器指定一个名称；
-P：随机映射
    -P后不能指定参数，随机选一个对外端口映射出去
-p: 指定端口映射，格式为：主机(宿主)端口:容器端口
    -p 8888:6379
    -p 8888:6379 解析 将容器内部的 6379端口与docker 宿主机（docker装在哪太服务器 那台服务器 就是其数组机）8888 端口进行映射 那通过外部访问宿主机8888端口 即可访问到 docker 容器 6379 端口了
-d: 后台运行容器，并返回容器ID；
-i: 以交互模式运行容器，通常与 -t 同时使用；
-t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用；
 --privileged
    大约在0.6版，privileged被引入docker。
    使用该参数，container内的root拥有真正的root权限。
    否则，container内的root只是外部的一个普通用户权限。
    privileged启动的容器，可以看到很多host上的设备，并且可以执行mount。
    甚至允许你在docker容器中启动docker容器

docker run -it --privileged -v D:\test\:/output -d -p 8010:22 -p 50001:50051 -p 50002:50052 -p 50005:55555 e9e8789a3024

docker run -it --name="u1" -v $PWD:/myapp ubuntu:latest /bin/bash

在端口映射以后，需要测试一下映射是否成功
ssh root@127.0.0.1 -p 8010

## 镜像删除
docker rmi java
#强制删除(删除正在运行的镜像，注：以后台方式运行的不能被强制删除)
docker rmi -f java
#多个镜像删除，不同镜像间以空格间隔
docker rmi -f java tomcat nginx
#删除本地全部镜像
docker rmi -f $(docker images -q)

# 二、docker 容器命令

## 查看容器
查看正在运行容器列表
docker ps
查看所有容器 -----包含正在运行 和已停止的
docker ps -a


## 停止容器
docker stop 容器名/容器ID

## 进入容器
docker exec -it 容器名/容器ID /bin/bash
docker exec -it test01 /bin/bash

## 启动容器
docker start 容器ID/容器名
docker start t1


## 删除容器
#删除一个容器
docker rm -f 容器名/容器ID
#删除多个容器 空格隔开要删除的容器名或容器ID
docker rm -f 容器名/容器ID 容器名/容器ID 容器名/容器ID
#删除全部容器
docker rm -f $(docker ps -aq)

## 查看容器端口映射

docker port [容器名]
需要这个容器被启动，才能查看到他的端口映射情况



# 参考资料
[Ubuntu20.04安装docker]https://blog.csdn.net/m0_59092234/article/details/123816391#:~:text=Ubuntu20.04%20%E5%AE%89%E8%A3%85Docker%201859%20%E7%AC%AC%E4%B8%80%E6%AD%A5%EF%BC%9A%201%E3%80%81%E5%85%88%E6%9B%B4%E6%96%B0%E5%BA%93%E6%BA%90%20sudo%20apt-get%20update,2%E3%80%81%E7%84%B6%20%E5%90%8E%20%E7%9B%B4%E6%8E%A5%20sudo%20apt%20install%20docker.io%20%2F3%E3%80%82
[docker hub]https://hub.docker.com/


