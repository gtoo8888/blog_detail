---
title: 计算机网络
date: 2022-10-20 20:14:20
tags:
- 课程
---


## 1.2网络边缘


### 1.2.1服务模式
C/S模式
可扩展性较差
P2P模式
迅雷、电驴



### 1.2.2服务模式


#### 1.2.2.1面向连接的服务
TCP
- 可靠的、按顺序的传送数据
- 流量控制
- 拥塞控制

#### 1.2.2.2面向无连接的服务
UDP 
- 无连接
- 不可靠数据传输
- 无流量控制
- 无拥塞控制





## 1.3网络核心

### 1.3.1电路交换
#### 1.3.1.2概述
- 独享资源：不同享
- 每个呼叫一旦建立起来就能够
保证性能
- 如果呼叫没有数据发送，被分配的资源就会被浪费 (no sharing)
- 通常被传统电话网络采用
#### 1.3.1.2分类
- 频分(Frequencydivision multiplexing)
- 时分(Time-division multiplexing)
- 波分(Wave-division multiplexing)
#### 1.3.1.3缺点
- 连接建立时间长
- 计算机之间的通信有突发性，如果使用线路交换，则浪费的片较多
- 即使这个呼叫没有数据传递，其所占据的片也不能够被别的呼叫使用
- 可靠性不高？

### 1.3.2分组交换
#### 1.3.2.1概述
适合于对突发式数据传输
资源共享
- 简单，不必建立呼叫
过度使用会造成网络拥塞：分组延时和丢失
- 对可靠地数据传输需要协议来约束：拥塞控制
Q: 怎样提供类似电路交换的服务？
- 保证音频/视频应用需要的带宽
- 一个仍未解决的问题(chapter 7)
#### 1.3.2.2分类
数据报
- 分组的目标地址决定下一跳
- 在不同的阶段，路由可以改变
- 在通信之前,无须建立起一个连接,有数据就传输
- 每一个分组都独立路由(路径不一样,可能会失序)
虚电路
- 每个分组都带标签（虚电路标识 VC ID），标签决定下一跳
- 在呼叫建立时决定路径，在整个呼叫中路径保持不变
- 路由器维持每个呼叫的状态信息
- X.25 和ATM


# 参考资料
[网络通信模式全解析：单播、广播、组播、任播](https://cloud.tencent.com/developer/article/2361411)
[NTP的工作模式](https://support.huawei.com/enterprise/zh/doc/EDOC1100138322/e20379e)
[【一文掌握】NTP时间同步协议原理详解以及ntpd和ntpdate安装与使用](https://blog.csdn.net/qq_27843945/article/details/140663499)
[Support NTP](https://support.ntp.org/Support/TroubleshootingNTP#Section_9.5)
[ntpq - standard NTP query program](https://www.eecis.udel.edu/~mills/ntp/html/ntpq.html)
































































































































































































