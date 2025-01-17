---
title: docker 教程
date: 2022-06-19 23:39:25
tags:
- 课程
---


# docker 安装教程

# 一、docker 镜像命令
```bash
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
```
# 二、docker 容器命令
```bash
## 查看容器
docker ps # 查看正在运行容器列表
docker ps -a # 查看所有容器 

## 停止容器
docker stop 容器名/容器ID

## 进入容器
docker exec -it 容器名/容器ID /bin/bash
docker exec -it test01 /bin/bash

## 启动容器
docker start 容器ID/容器名
docker start t1

## 删除容器
docker rm -f ubuntu:v1.0 #删除一个容器
docker rm -f ubuntu:v1.1 ubuntu:v1.2  #删除多个容器 空格隔开要删除的容器名或容器ID
docker rm -f $(docker ps -aq) #删除全部容器

## 查看容器端口映射
docker port [容器名] # 需要这个容器被启动，才能查看到他的端口映射情况
```


# build
```bash
# 常用指令
docker build -t ubuntu:v1.0  # 构建的容器名称和tag
docker build -f Dockerfile2 # 依据指定的文件名称构建
docker build -q # 静默输出

# 常用组合指令
docker build -t ubuntu:v1.0 -f Dockerfile2 
```

## 常用指令

```bash
docker run --name my_u1 -dit u:v1.1 /bin/bash
```

# docker包的安装

```bash
REPOSITORY                     TAG          IMAGE ID       CREATED        SIZE
jenkins/jenkins                2.493        03347633fbe6   2 days ago     467MB
homeassistant/home-assistant   latest       dceda7130840   7 days ago     1.8GB
node                           23.6         38f9e6f7d426   9 days ago     1.12GB
redis                          7.4          4075a3f8c3f8   10 days ago    117MB
memcached                      1.6          39b1fb8d7053   3 weeks ago    84.8MB
minio/minio                    latest       6aed1b694901   4 weeks ago    179MB
rabbitmq                       4.0          d4093a263704   4 weeks ago    231MB
dpage/pgadmin4                 latest       199b8ca63523   5 weeks ago    507MB
mongo                          8.0          f08e39122805   5 weeks ago    855MB
python                         3.10         6b3e490e4343   6 weeks ago    1GB
python                         3.9          2ea5847b07f6   6 weeks ago    999MB
python                         3.11         d7a93f6b0abf   6 weeks ago    1.01GB
postgres                       17.2         9a0ce6be5dd4   8 weeks ago    435MB
mysql                          9.1          56a8c14e1404   3 months ago   603MB
mysql                          8.0          6c55ddbef969   3 months ago   591MB
ubuntu                         20.04        6013ae1a63c2   3 months ago   72.8MB
rabbitmq                       management   f24092b2eabe   3 months ago   267MB
python                         3.8          3ea6eaad4f17   4 months ago   995MB
nginx                          1.26         0dcfd986e814   5 months ago   188MB
gcc                            14.2         f1283bbe9368   5 months ago   1.42GB


docker save -o images.tar.gz ubuntu:20.04 minio/minio:latest nginx:1.26
docker load -i ubunut20.04.tar.gz
docker image inspect mysql:latest | grep -i version

ping -c 3 docker-0.unsee.tech # 测试镜像是否可用


docker stats --no-stream

docker run -id -p 80:80 --name nginx \
    nginx:1.26

docker run -id -p 80:80 --name nginx \
    -v /home/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
    -v /home/nginx/conf/conf.d:/etc/nginx/conf.d \
    -v /home/nginx/log:/var/log/nginx \
    -v /home/nginx/html:/usr/share/nginx/html \
    nginx:1.26
http://192.168.56.101:80 

docker run -id --name jenkins \
    -v /usr/local/docker/jenkins_home:/var/jenkins_home \
    -p 8099:8080 -p 50099:50000 \
    jenkins/jenkins:2.493
http://192.168.56.101:8099 


docker run -id --name=rabbitmq \
        -v /usr/local/docker/rabbitmq:/var/lib/rabbitmq \
        -p 15672:15672 -p 5672:5672 \
        -e RABBITMQ_DEFAULT_USER=admin \
        -e RABBITMQ_DEFAULT_PASS=admin \
        rabbitmq:management
http://192.168.56.101:15672


docker run -id --name postgres \
        -v /usr/local/docker/postgresql/data:/var/lib/postgresql/data \
        -p 5432:5432 \
        -e POSTGRES_PASSWORD=123456 \
        -e POSTGRES_USER=aderversa \
        -e POSTGRES_DB=testdb \
        postgres:17.2
docker exec -it postgres /bin/bash
http://192.168.56.101:5432

docker run -id -p 5433:80 --name pgadmin4 \
        -e PGADMIN_DEFAULT_EMAIL=test@123.com \
        -e PGADMIN_DEFAULT_PASSWORD=123456 \
        dpage/pgadmin4:latest
http://192.168.56.101:5433



docker run -id -p 27017:27017  --name mongo \
        --restart=always \
        -v /usr/local/docker/mongo/data:/data/db \
        -v /usr/local/docker/mongo/log:/data/log \
        -e TZ=Asia/Shanghai \
        -e MONGO_INITDB_ROOT_USERNAME=mongo \
        -e MONGO_INITDB_ROOT_PASSWORD=mongo \
        --privileged=true \
        mongo:8.0
http://192.168.56.101:27017

docker run -id -p 8123:8123 --name=homeassistant \
    -v /usr/local/docker/homeassistant:/config \
    -e "TZ=Asia/Shanghai" \
    homeassistant/home-assistant:latest
http://192.168.56.101:8123




sudo docker-compose -f all.yaml up -d
sudo docker-compose -f all.yaml stop
sudo docker-compose -f all.yaml rm -f
```


# 新的参考资料
ubunut:Alpine # 最精简的ubuntu包

```bash
docker pull docker.unsee.tech/istio/distroless
vim /etc/docker/daemon.json

{
   "registry-mirrors": [
      "https://docker.unsee.tech"
   ]
}
sudo systemctl daemon-reload && sudo systemctl restart docker

docker pull ubuntu:20.04

docker run  --name my_ubuntu -dit ubuntu:20.04 /bin/bash

docker exec -it my_ubuntu bash

docker info

查看docker存储默认位置

/var/lib/docker
/var/lib/docker/image/
```
/var/lib/docker


# 参考资料
[Ubuntu20.04安装docker]https://blog.csdn.net/m0_59092234/article/details/123816391
[docker hub]https://hub.docker.com/
[聊聊 Docker 的存储 Overlay2](https://zhuanlan.zhihu.com/p/587283618)
[Docker-Docker镜像存储位置(Windows/Mac/Linux)](https://blog.csdn.net/qq_24256877/article/details/123033703)
[在Docker中运行PostgreSQL + pgAdmin 4](https://www.cnblogs.com/xhznl/p/13155054.html)

