---
title: ubuntu通用教程
date: 2023-01-15 21:40:01
tags:
- 环境配置
---


# 装VMware中出现的问题

本地环境，win11+Vmware14
先安装了VMware14，安装过程没有问题，导入虚拟机，启动以后，电脑直接蓝屏，开机还是这个现象

网上搜索发现是没有启动虚拟工具



# 安装ubuntu后需要做的

1. 换源
2. 更换时区
3. 安装vim
4. 安装ipconfig
5. 安装ssh
6. 配置历史记录
   1. echo 'HISTTIMEFORMAT="%F %T "' >> ~/.bashrc
   2. source ~/.bashrc
7. 配置静态ip -- 不需要？
8. 安装git

# 换源
```
#添加阿里源
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
#添加清华源
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse multiverse
```


# 安装ssh

1. 准备工作
```bash
apt-get update
apt-get install sudo
apt-get install vim -y
passwd # 修改密码
```
2. 安装openssh
sudo apt-get install openssh-server openssh-client -y
3. 修改ssh配置文件 
sudo vi /etc/ssh/sshd_config
PermitRootLogin yes 
（默认为#PermitRootLogin prohibit-password）前面的#号要放开
4. 启动服务
/etc/init.d/ssh restart
5. 连接测试
ssh user@[ip] -p [端口]
ssh user@192.168.0.3 -p 22
6. vscode配置
```
Host 192.168.0.3
  HostName 192.168.0.3
  User username
```



https://golang.google.cn/dl/
wget https://golang.google.cn/dl/go1.19.5.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz

vim /etc/profile
source /etc/profile
export GOROOT=/usr/local/go
#export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin
export GOPATH=/yzx
export GOBIN=$GOPATH/bin
export GOPROXY=https://goproxy.cn/,direct


https://goproxy.io/zh/
https://goproxy.cn/


```shell
go mod init [工程名字]
go mod tidy  # 刷新mod
go mod vender
go get [跟着整个github目录]
```



# 遇到问题
下错版本
go1.19.5.linux-arm64.tar.gz
报错:
bash: /usr/local/go/bin/go: cannot execute binary file: Exec format error


VScode无法调试go
安装dlv


cgo: C compiler "gcc" not found: exec: "gcc": executable file not found in $PATH (exit status 2)

# 参考资料
[Ubuntu20.04软件源更换 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/142014944)
https://blog.csdn.net/liangcsdn111/article/details/115405223
https://www.jianshu.com/p/2802d71ab9e9