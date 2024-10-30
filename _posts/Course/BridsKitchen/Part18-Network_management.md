---
title: Part18 网络管理
date: 2024-10-30 17:15:32
tags:
- 鸟哥的Linux私房菜
---


## 1.2.2 netstat

```bash
# 常用指令
netstat -a # 所有的联机状态，包括tcp/udp/unix socket等
netstat -t # TCP封包的联机
netstat -u # UDP封包的联机
netstat -l # 在Listen（监听）的服务之网络状态
netstat -p # PID与Program的文件名
netstat -n # 禁用反向域名解析，加快查询速度
netstat -e # 用户名和进程的索引节点号
netstat -s # 各个协议下的网络统计数据（收发包数量等）
netstat -r # 内核路由信息
netstat -i # 网络接口信息
netstat -g # ipv4和ipv6的多组播信息
netstat -t -c 5 # 设定几秒钟后自动更新一次


# 常用组合
netstat -at # 所有TCP协议的连接
netstat -au # 所有UCP协议的连接
netstat -nat # 加速查询
netstat -ntl # 监听中的TCP连接
# 需要通过sudo查看进程号
sudo netstat -ntlp # 监听中的TCP连接,进程号
sudo netstat -ntlpe # 监听中的TCP连接,进程号,用户名和进程的索引节点号

netstat -ts # TCP协议下的网络统计数据
netstat -us # UDP协议下的网络统计数据
netstat -nr # 内核路由信息,和route命令输出信息差不太多
netstat -ie # 更详细的网络接口信息
```


## 1.2.3 netstat


```bash
# 常用指令
nmap -sTU localhost 


选项与参数：
[扫描类型]：主要的扫描类型有底下几种：
-sT：扫描TCP封包已建立的联机connect（）！
-sS：扫描TCP封包带有SYN标签的数据
-sP：以ping的方式进行扫描
-sU：以UDP的封包格式进行扫描
-sO：以IP的协定（protocol）进行主机的扫描
[扫描参数]：主要的扫描参数有几种：
-PT：使用TCP里头的ping的方式来进行扫描，可以获知目前有几部电脑存活（较常用）
-PI：使用实际的ping（带有ICMP封包的）来进行扫描
-p：这个是port range，例如1024-，80-1023，30000-60000等等的使用方式
-TN：指定延迟时间，可透过类似-T4来加快侦测速度（约4ms），性能会较好。
[Hosts位址与范围]：这个有趣多了，有几种类似的类型
192.168.1.100：直接写入HOST IP而已，仅检查一部；
192.168.1.0/24：为C Class的型态，
192.168.*.*：嘿嘿！则变为B Class的型态了！扫描的范围变广了！
192.168.1.0-50,60-100,103,200：这种是变形的主机范围啦！很好用吧！
```



## 1.2.4 route


traceroute 
ip addr show
ifconfig 

# 参考资料
[netstat命令详解](https://blog.csdn.net/Tony1154/article/details/142178125)
https://linux.vbird.org/linux_server/rocky9/0120cloudandvm.php#1.2
https://linux.vbird.org/linux_server/rocky9/0150networking.php#4.3.4






















