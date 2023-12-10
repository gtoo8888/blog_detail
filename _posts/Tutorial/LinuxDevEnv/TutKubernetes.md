---
title: k8s教程
date: 2022-08-11 10:15:04
tags:
- 教程
---



# 常见资源
## namspace
Namespace是kubernetes系统中的一种非常重要资源，它的主要作用是用来实现**多套环境的资源隔离**或者**多租户的资源隔离**


kubectl get namespace


kubectl get nc



kubectl get rs my-name -n dev -o -wide 


-n 命名空间
-o 查看pod节点详情

# 查看kubernetes的资源情况：
kubectl get ns

# 查看kubernetes集群状态：
 kubectl get cs

kubectl -n lookonce describe pods/web-588rc
查看pod的信息

# Etcd 数据持久化和复制
snap：用于存放快照数据。Etcd 为防止 WAL 文件过多会创建快照，snap 用于存储 Etcd 的快照数据状态。
wal：用于存放预写式日志，其最大的作用是记录整个数据变化的全部历程。在 Etcd 中，所有数据的修改在提交前，都要先写入 WAL 中。使用 WAL 进行数据的存储使得 Etcd 拥有故障快速回复和数据回滚这两个重要功能。

# 删除pod
kubectl delete pod basic-pd-0 -n tidb-cluster


# Statefulset

kubectl -n tidb-cluster describe pod basic-pd-0

t edit  StatefulSet basic-pd

# 查看一个pod的状态
t describe pods basic-pd-0


重启策略
restartPolicy: Never
Always:容器失效时，自动重启该容器，这也是默认值
OnFailure:容器终止运行且退出码不为0时重启
Never :不论状态为何，都不重启该容器


# 钩子函数
post start
pre stop


钩子处理器支持使用下面三种方式定义动作：

Exec命令：在容器内执行一次命令

……
  lifecycle:
    postStart: 
      exec:
        command:
        - cat
        - /tmp/healthy
……
TCPSocket：在当前容器尝试访问指定的socket

……      
  lifecycle:
    postStart:
      tcpSocket:
        port: 8080
……
HTTPGet：在当前容器中向某url发起http请求

……
  lifecycle:
    postStart:
      httpGet:
        path: / #URI地址
        port: 80 #端口号
        host: 192.168.5.3 #主机地址
        scheme: HTTP #支持的协议，http或者https
……


# 查看版本
kubectl api-versions

kubectl api-resources



t get endpoints


kubectl get pod -A

# 参考文献
[大佬做的笔记]https://www.yuque.com/fairy-era/yg511q/szg74m
[备份etcd](https://www.cnblogs.com/paul8339/p/15629241.html#:~:text=%E5%A4%87%E4%BB%BD%E6%93%8D%E4%BD%9C%E5%9C%A8etcd%E9%9B%86%E7%BE%A4%E7%9A%84%E5%85%B6%E4%B8%AD%E4%B8%80%E4%B8%AA%E8%8A%82%E7%82%B9%E6%89%A7%E8%A1%8C%E5%B0%B1%E5%8F%AF%E4%BB%A5%E3%80%82%20%E8%BF%99%E9%87%8C%E4%BD%BF%E7%94%A8%E7%9A%84%E6%98%AFetcd%20v3%E7%9A%84api%EF%BC%8C%E5%9B%A0%E4%B8%BA%E4%BB%8E%20k8s%201.13,%E5%BC%80%E5%A7%8B%EF%BC%8Ck8s%E4%B8%8D%E5%86%8D%E6%94%AF%E6%8C%81%20v2%20%E7%89%88%E6%9C%AC%E7%9A%84%20etcd%EF%BC%8C%E5%8D%B3k8s%E7%9A%84%E9%9B%86%E7%BE%A4%E6%95%B0%E6%8D%AE%E9%83%BD%E5%AD%98%E5%9C%A8%E4%BA%86v3%E7%89%88%E6%9C%AC%E7%9A%84etcd%E4%B8%AD%E3%80%82%20%E6%95%85%E5%A4%87%E4%BB%BD%E7%9A%84%E6%95%B0%E6%8D%AE%E4%B9%9F%E5%8F%AA%E5%A4%87%E4%BB%BD%E4%BA%86%E4%BD%BF%E7%94%A8v3%E6%B7%BB%E5%8A%A0%E7%9A%84etcd%E6%95%B0%E6%8D%AE%EF%BC%8Cv2%E6%B7%BB%E5%8A%A0%E7%9A%84etcd%E6%95%B0%E6%8D%AE%E6%98%AF%E6%B2%A1%E6%9C%89%E5%81%9A%E5%A4%87%E4%BB%BD%E7%9A%84%E3%80%82)
[kubernetes之StatefulSet详解]https://www.cnblogs.com/tylerzhou/p/11027559.html
