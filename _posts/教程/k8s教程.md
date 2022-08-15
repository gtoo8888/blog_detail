---
title: shell 教程
date: 2022-08-11 10:15:04
tags:
- 教程
---


kubectl get rs my-name -n dev -o -wide 


-n 命名空间
-o 查看pod节点详情


# 查看脚本文件是dos还是unix


# 查看kubernetes的资源情况：
kubectl get ns

# 查看kubernetes集群状态：
 kubectl get cs

kubectl -n lookonce describe pods/web-588rc
查看pod的信息

# Etcd 数据持久化和复制
snap：用于存放快照数据。Etcd 为防止 WAL 文件过多会创建快照，snap 用于存储 Etcd 的快照数据状态。
wal：用于存放预写式日志，其最大的作用是记录整个数据变化的全部历程。在 Etcd 中，所有数据的修改在提交前，都要先写入 WAL 中。使用 WAL 进行数据的存储使得 Etcd 拥有故障快速回复和数据回滚这两个重要功能。

# 参考文献

[备份etcd](https://www.cnblogs.com/paul8339/p/15629241.html#:~:text=%E5%A4%87%E4%BB%BD%E6%93%8D%E4%BD%9C%E5%9C%A8etcd%E9%9B%86%E7%BE%A4%E7%9A%84%E5%85%B6%E4%B8%AD%E4%B8%80%E4%B8%AA%E8%8A%82%E7%82%B9%E6%89%A7%E8%A1%8C%E5%B0%B1%E5%8F%AF%E4%BB%A5%E3%80%82%20%E8%BF%99%E9%87%8C%E4%BD%BF%E7%94%A8%E7%9A%84%E6%98%AFetcd%20v3%E7%9A%84api%EF%BC%8C%E5%9B%A0%E4%B8%BA%E4%BB%8E%20k8s%201.13,%E5%BC%80%E5%A7%8B%EF%BC%8Ck8s%E4%B8%8D%E5%86%8D%E6%94%AF%E6%8C%81%20v2%20%E7%89%88%E6%9C%AC%E7%9A%84%20etcd%EF%BC%8C%E5%8D%B3k8s%E7%9A%84%E9%9B%86%E7%BE%A4%E6%95%B0%E6%8D%AE%E9%83%BD%E5%AD%98%E5%9C%A8%E4%BA%86v3%E7%89%88%E6%9C%AC%E7%9A%84etcd%E4%B8%AD%E3%80%82%20%E6%95%85%E5%A4%87%E4%BB%BD%E7%9A%84%E6%95%B0%E6%8D%AE%E4%B9%9F%E5%8F%AA%E5%A4%87%E4%BB%BD%E4%BA%86%E4%BD%BF%E7%94%A8v3%E6%B7%BB%E5%8A%A0%E7%9A%84etcd%E6%95%B0%E6%8D%AE%EF%BC%8Cv2%E6%B7%BB%E5%8A%A0%E7%9A%84etcd%E6%95%B0%E6%8D%AE%E6%98%AF%E6%B2%A1%E6%9C%89%E5%81%9A%E5%A4%87%E4%BB%BD%E7%9A%84%E3%80%82)
