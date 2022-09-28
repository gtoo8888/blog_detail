---
title: k8s命令
date: 2022-09-25 20:26:56
tags:
- 课程
---


# 1. 命令式对象管理 kubectl命令

```
kubectl [command] [type] [name] [flags]
```
**comand**：指定要对资源执行的操作，例如create、get、delete
**type**：指定资源类型，比如deployment、pod、service
**name**：指定资源的名称，名称大小写敏感
**flags**：指定额外的可选参数

## 1.1 操作（command）

kubernetes允许对资源进行多种操作，可以通过--help查看详细的操作命令
kubectl --help


经常使用的操作有下面这些：

| 命令分类   | 命令         | 翻译                        | 命令作用                     |
| :--------- | :----------- | :-------------------------- | :--------------------------- |
| 基本命令   | create       | 创建                        | 创建一个资源                 |
|            | edit         | 编辑                        | 编辑一个资源                 |
|            | get          | 获取                        | 获取一个资源                 |
|            | patch        | 更新                        | 更新一个资源                 |
|            | delete       | 删除                        | 删除一个资源                 |
|            | explain      | 解释                        | 展示资源文档                 |
| 运行和调试 | run          | 运行                        | 在集群中运行一个指定的镜像   |
|            | expose       | 暴露                        | 暴露资源为Service            |
|            | describe     | 描述                        | 显示资源内部信息             |
|            | logs         | 日志输出容器在 pod 中的日志 | 输出容器在 pod 中的日志      |
|            | attach       | 缠绕进入运行中的容器        | 进入运行中的容器             |
|            | exec         | 执行容器中的一个命令        | 执行容器中的一个命令         |
|            | cp           | 复制                        | 在Pod内外复制文件            |
|            | rollout      | 首次展示                    | 管理资源的发布               |
|            | scale        | 规模                        | 扩(缩)容Pod的数量            |
|            | autoscale    | 自动调整                    | 自动调整Pod的数量            |
| 高级命令   | apply        | rc                          | 通过文件对资源进行配置       |
|            | label        | 标签                        | 更新资源上的标签             |
| 其他命令   | cluster-info | 集群信息                    | 显示集群信息                 |
|            | version      | 版本                        | 显示当前Server和Client的版本 |





## 1.2 资源类型（type）


kubernetes中所有的内容都抽象为资源，可以通过下面的命令进行查看:

```
kubectl api-resources
```
经常使用的资源有下面这些：

| 资源分类      | 资源名称                 | 缩写    | 资源作用        |
| :------------ | :----------------------- | :------ | :-------------- |
| 集群级别资源  | nodes                    | no      | 集群组成部分    |
|               | namespaces    | ns      | 隔离Pod |                 |
| pod资源       | pods                     | po      | 装载容器        |
| pod资源控制器 | replicationcontrollers   | rc      | 控制pod资源     |
|               | replicasets              | rs      | 控制pod资源     |
|               | deployments              | deploy  | 控制pod资源     |
|               | daemonsets               | ds      | 控制pod资源     |
|               | jobs                     |         | 控制pod资源     |
|               | cronjobs                 | cj      | 控制pod资源     |
|               | horizontalpodautoscalers | hpa     | 控制pod资源     |
|               | statefulsets             | sts     | 控制pod资源     |
| 服务发现资源  | services                 | svc     | 统一pod对外接口 |
|               | ingress                  | ing     | 统一pod对外接口 |
| 存储资源      | volumeattachments        |         | 存储            |
|               | persistentvolumes        | pv      | 存储            |
|               | persistentvolumeclaims   | pvc     | 存储            |
| 配置资源      | configmaps               | cm      | 配置            |
|               | secrets                  |         | 配置            |


## 1.3 应用示例
```shell
kubectl create namespace dev  # 创建一个namespace
kubectl get ns # 获取namespace
kubectl run pod --image=nginx:latest -n dev # 在此namespace下创建并运行一个nginx的Pod
kubectl get pod -n dev # 查看新创建的pod
kubectl delete pod pod-864f9875b9-pcw7x # 删除指定的pod
kubectl delete ns dev # 删除指定的namespace
```




# 2 常见资源
# 2.1 namspace

```shell
# 查看所有的命名空间
kubectl get namespace
kubectl get nc
# 查看指定的命名空间
kubectl get namespace default
kubectl get ns default
# 指定命名空间的输出格式
kubectl get ns default -o wide
kubectl get ns default -o json
kubectl get ns default -o yaml
# 查看命名空间的详情
kubectl describe namespace default
kubectl describe ns default
# 创建命名空间
kubectl create namespace dev
kubectl create ns dev
# 除命名空间
kubectl delete ns dev
```





# 3 Pod详解

## 3.1 Pod的配置



## 3.2 Pod的生命周期
## 3.3 Pod的调度


# 4 Pod控制器详解

- 在kubernetes中，按照Pod的创建方式可以将其分为两类：
  - 自主式Pod：kubernetes直接创建出来的Pod，这种Pod删除后就没有了，也不会重建。
  - 控制器创建Pod：通过Pod控制器创建的Pod，这种Pod删除之后还会自动重建。
- Pod控制器：Pod控制器是管理Pod的中间层，使用了Pod控制器之后，我们只需要告诉Pod控制器，想要多少个什么样的Pod就可以了，它就会创建出满足条件的Pod并确保每一个Pod处于用户期望的状态，如果Pod在运行中出现故障，控制器会基于指定的策略重启或重建Pod。
- 在kubernetes中，有很多类型的Pod控制器，每种都有自己的适合的场景，常见的有下面这些：
  - ReplicationController：比较原始的Pod控制器，已经被废弃，由ReplicaSet替代。
  - ReplicaSet：保证指定数量的Pod运行，并支持Pod数量变更，镜像版本变更。
  - Deployment：通过控制ReplicaSet来控制Pod，并支持滚动升级、版本回退。
  - Horizontal Pod Autoscaler：可以根据集群负载自动调整Pod的数量，实现削峰填谷。
  - DaemonSet：在集群中的指定Node上都运行一个副本，一般用于守护进程类的任务。
  - Job：它创建出来的Pod只要完成任务就立即退出，用于执行一次性任务。
  - CronJob：它创建的Pod会周期性的执行，用于执行周期性的任务。
  - StatefulSet：管理有状态的应用。

## 4.1 Pod控制器的介绍
## 4.2 ReplicaSet（RS）
## 4.3 Deployment（Deploy）
## 4.4 Horizontal Pod Autoscaler（HPA）
## 4.5 DaemonSet（DS）
## 4.6 Job
## 4.7 CronJob（CJ）
## 4.8 StatefulSet（有状态）



# 5 Service详解
在kubernetes中，Pod是应用程序的载体，我们可以通过Pod的IP来访问应用程序，但是Pod的IP地址不是固定的，这就意味着不方便直接采用Pod的IP对服务进行访问。

spec.type的说明：
- ClusterIP：默认值，它是kubernetes系统自动分配的虚拟IP，只能在集群内部访问。
- NodePort：将Service通过指定的Node上的端口暴露给外部，通过此方法，就可以在集群外部访问服务。
- LoadBalancer：使用外接负载均衡器完成到服务的负载分发，注意此模式需要外部云环境的支持。
- ExternalName：把集群外部的服务引入集群内部，直接使用。

## 5.1 ClusterIP类型的Service
## 5.2 HeadLiness类型的Service
## 5.3 NodePort类型的Service
## 5.4 LoadBalancer类型的Service
## 5.5 ExternalName类型的Service

## 5.1 Ingress介绍






# 6 k8s的数据存储
- 在前面已经提到，容器的生命周期可能很短，会被频繁的创建和销毁。那么容器在销毁的时候，保存在容器中的数据也会被清除。这种结果对用户来说，在某些情况下是不乐意看到的。为了持久化保存容器中的数据，kubernetes引入了Volume的概念。
- Volume是Pod中能够被多个容器访问的共享目录，它被定义在Pod上，然后被一个Pod里面的多个容器挂载到具体的文件目录下，kubernetes通过Volume实现同一个Pod中不同容器之间的数据共享以及数据的持久化存储。Volume的生命周期不和Pod中的单个容器的生命周期有关，当容器终止或者重启的时候，Volume中的数据也不会丢失。
- kubernetes的Volume支持多种类型，比较常见的有下面的几个：
  - 简单存储：EmptyDir、HostPath、NFS。
  - 高级存储：PV、PVC。
  - 配置存储：ConfigMap、Secret。

## 6.1 基本存储
### 6.1.1 EmptyDir
### 6.1.2 HostPath
### 6.1.3 NFS

## 6.2 高级存储
### 6.1.2 PV
### 6.1.3 PVC

## 6.3 配置存储
### 6.1.2 ConfigMap
### 6.1.3 Secret



# 7 高级部分（暂时不准备做）
## k8s的Helm
## k8s的安全认证
## 搭建DashBoard
## kubeadm安装高可用k8s集群
## k8s的项目部署





