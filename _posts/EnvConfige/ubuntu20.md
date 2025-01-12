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

# 安装Virtual Box配置选项

1. 安装增强工具
   1. 设备->安装增强工具
   2. 设置->系统->处理器->扩展特性->启用PAE/NX
   3. 常规->高级->共享粘贴板
2. 配置多个网卡
3. 导入硬盘

.\VBoxManage.EXE internalcommands sethduuid "D:\VirtualBos_Machine\Ubuntu18_1106\ubuntu18_1106\Ubuntu18_1106_1.vdi"  
如果是老的.vdi复制，会导入失败，需要修改UUID

# 安装ubuntu后需要做的

1. 安装工具集，开启ssh
2. 修改bashrc内容
   1. 配置历史记录
   2. source ~/.bashrc
3. 换源
4. 挂载硬盘
5. 安装开发工具
6. 安装zsh
7. 配置静态IP -- 不需要？
8. 修改时区


## 1. 安装工具集，开启ssh

```bash
sudo apt-get install vim openssh-server openssh-client net-tools git tree subversion -y
sudo apt-get install terminator iotop -y

sudo vi /etc/ssh/sshd_config
PermitRootLogin yes 
/etc/init.d/ssh restart
# ssh <name>@127.0.0.1
```

## 2. 修改bashrc内容（不断更新）

```bash
alias la='ls -A'
alias l='ls -CF' 
alias ll='ls -alF'
alias ls='ls --color=auto'
alias grep='grep --color=auto '
alias ..='cd ..;pwd'   
alias ...='cd ../..;pwd'   
alias ....='cd ../../..;pwd'   
# alias vim='vi '
alias tial='tail '

export HISTTIMEFORMAT="%F %T "
ifconfig -a | grep inet | grep -v 127.0.0.1 | grep -v inet6 
alias pse='ps -ef | grep -v grep | grep '


cd /data_sdb

alias clion='sh /date_sdb/tool/clion-2024.2.2/bin/clion.sh'
```

## 3. 换源

```bash
vim /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade

# 18.04
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse

deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiversedeb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse





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



# Debian 12 更换国内/本地源
deb https://mirrors.aliyun.com/debian/ bookworm main non-free non-free-firmware contrib
deb-src https://mirrors.aliyun.com/debian/ bookworm main non-free non-free-firmware contrib
deb https://mirrors.aliyun.com/debian-security/ bookworm-security main
deb-src https://mirrors.aliyun.com/debian-security/ bookworm-security main
deb https://mirrors.aliyun.com/debian/ bookworm-updates main non-free non-free-firmware contrib
deb-src https://mirrors.aliyun.com/debian/ bookworm-updates main non-free non-free-firmware contrib
deb https://mirrors.aliyun.com/debian/ bookworm-backports main non-free non-free-firmware contrib
deb-src https://mirrors.aliyun.com/debian/ bookworm-backports main non-free non-free-firmware contrib

```
## 4. 挂载硬盘

4. 挂载硬盘

```bash
df -h # 查看当前挂载情况
sudo dfisk -l # 查看所有硬盘
mount /dev/sdb /data_sdd
df -h
cat /etc/fstab # 开机启动
UUID=e7dac072-5f03-41c4-bca2-0745d8e33c38 /date_sdb       ext4    defaults   0      2
```

## 5. 安装开发工具

```bash
sudo apt-get install gcc g++ make openssl libssl-dev build-essential lcov -y
```
a1234567b
a1234567bb
## 6. 安装zsh

```bash
# 安装环境
sudo apt-get install nghttp2 libnghttp2-dev curl fasd -y
# 安装zsh
sudo apt-get install zsh -y
zsh --version
chsh -s /bin/zsh
# 安装ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
# 自己下载安装
./zsh_install.sh
# 安装扩展
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -r zsh-autosuggestions ~/.oh-my-zsh/plugins 
cp -r zsh-syntax-highlighting ~/.oh-my-zsh/plugins 

# 配置扩展
cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh

# 配置zshrc,添加扩展是在这个位置
vim ~/.zshrc
plugins=(
  z git zsh-autosuggestions zsh-syntax-highlighting
)
eval "$(fasd --init auto)"

alias ga='git add'
alias gb='git branch'
alias gba='git branch --all'
alias gsi='git submodule init'
alias gsu='git submodule update'
```

# 7. 配置静态IP

```bash
# ubuntu18配置方法
sudo vim /etc/network/interfaces

auto ens33
iface ens33 inet static
    address 192.168.1.25
    netmask 255.255.255.0
    gatway 192.168.1.1

sudo /etc/init.d/networking restart

# ubuntu20配置方法
cd /etc/netplan/
sudo vim 00-installer-config.yaml
network:
  version: 2
  renderer: NetworkManager
  ethernets:
      ens33:   # 网卡名称
        dhcp4: no     # 关闭dhcp
        dhcp6: no
        addresses: [192.168.1.25/24]  # 静态ip
        gateway4: 192.168.1.1     # 网关

sudo netplan apply

```


# 8. 修改时区

```bash
timedatectl status
# 所有的时区名称存储在/usr/share/zoneinfo文件中
timedatectl set-timezone "Asia/Shanghai"
timedatectl status
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

# golang相关

https://golang.google.cn/dl/
wget https://golang.google.cn/dl/go1.19.5.linux-amd64.tar.gz

tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz

vim /etc/profile
source /etc/profile
export GOROOT=/usr/local/go
#export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOROOT/bin
export GOPATH=/date
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
[Debian 12 更换国内/本地源](https://www.cnblogs.com/smlile-you-me/p/17727308.html)
[Ubuntu20.04软件源更换 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/142014944)
[ubuntu 安装go](https://blog.csdn.net/liangcsdn111/article/details/115405223)
[Golang调试工具Delve安装及使用](https://www.jianshu.com/p/2802d71ab9e9)
[快速跳转工具--FASD 简单介绍](https://segmentfault.com/a/1190000011327993)
[为Ubuntu 20.04 设置静态IP简明教程（和把大象装冰箱一样简单）](https://cloud.tencent.com/developer/article/1933335)
[Ubuntu 20.04设置DNS解析（解决resolve.conf被覆盖问题）](https://blog.csdn.net/lsc_1893/article/details/118696693)
[Ubuntu查看/修改系统时间](https://blog.csdn.net/lenmpeng/article/details/84313474)
