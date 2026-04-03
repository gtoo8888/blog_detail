---
title: k8s教程
date: 2022-08-11 10:15:04
tags:
- 教程
---

# Kubernetes（K8s）教程

## 一、基础概念

- **Namespace**：命名空间，用于实现多套环境隔离或多租户资源隔离
- **Pod**：K8s 的最小调度单位，一个 Pod 可以包含一个或多个容器
- **Deployment**：无状态部署管理，支持滚动更新和回滚
- **StatefulSet**：有状态部署管理，适用于数据库等需要持久化的场景
- **Service**：服务发现和负载均衡
- **ReplicaSet**：确保指定数量的 Pod 副本运行

## 二、kubectl 常用命令

### 查看资源
```bash
kubectl get ns                    # 查看所有命名空间
kubectl get pods                  # 查看当前命名空间的 Pod
kubectl get pods -n <namespace>   # 查看指定命名空间的 Pod
kubectl get pods -A               # 查看所有命名空间的 Pod
kubectl get pod -n <ns> -o wide  # 查看 Pod 详细信息（节点、IP 等）
kubectl get rs -n <ns>           # 查看 ReplicaSet
kubectl get svc -n <ns>          # 查看 Service
kubectl get deployment -n <ns>   # 查看 Deployment

kubectl describe pod <pod-name> -n <namespace>  # 查看 Pod 详细信息
kubectl describe pods <pod-name> -n <namespace> # 同上

kubectl get endpoints -n <ns>     # 查看端点（Service 关联的 Pod IP）
```

### 应用资源
```bash
kubectl apply -f <yaml-file>      # 应用 YAML 配置
kubectl delete pod <pod-name> -n <namespace>   # 删除 Pod
kubectl edit deployment <name> -n <namespace> # 编辑 Deployment 配置

# StatefulSet 专用
kubectl edit statefulset <name> -n <namespace>   # 编辑 StatefulSet
```

### 扩缩容
```bash
kubectl scale deployment <name> --replicas=3 -n <namespace>  # 扩缩容
```

## 三、YAML 字段说明

### 重启策略（restartPolicy）

| 策略 | 说明 |
|---|---|
| `Always` | 容器终止后自动重启（默认） |
| `OnFailure` | 容器异常退出（非零退出码）时重启 |
| `Never` | 不重启 |

### 生命周期钩子（lifecycle hooks）

```yaml
lifecycle:
  postStart:    # 容器启动后执行
    exec:
      command: ["cat", "/tmp/healthy"]
    # 或 tcpSocket:
    #   port: 8080
    # 或 httpGet:
    #   path: /
    #   port: 80
    #   scheme: HTTP

  preStop:      # 容器停止前执行
    exec:
      command: ["sh", "-c", "sleep 10"]
```

## 四、查看集群状态

```bash
kubectl api-versions           # 查看支持的 API 版本
kubectl api-resources          # 查看所有资源类型
kubectl get cs                 # 查看集群组件状态
```

## 五、Etcd 数据目录

| 目录 | 说明 |
|---|---|
| `wal/` | 预写式日志，记录数据变化历程，用于故障恢复和数据回滚 |
| `snap/` | 快照数据，存储 Etcd 快照状态（防止 WAL 文件过多） |

## 六、参考资料

- [K8s 笔记](https://www.yuque.com/fairy-era/yg511q/szg74m)
- [备份 Etcd](https://www.cnblogs.com/paul8339/p/15629241.html)
- [StatefulSet 详解](https://www.cnblogs.com/tylerzhou/p/11027559.html)
