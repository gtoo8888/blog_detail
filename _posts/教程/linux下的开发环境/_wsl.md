---
title: wsl 教程
date: 2022-08-02 10:01:26
tags:
- 教程
---



1.powershell

2.wsl --install

wsl --list --online

PS D:\> wsl --list --online
以下是可安装的有效分发的列表。
请使用“wsl --install -d <分发>”安装。

NAME            FRIENDLY NAME
Ubuntu          Ubuntu
Debian          Debian GNU/Linux
kali-linux      Kali Linux Rolling
openSUSE-42     openSUSE Leap 42
SLES-12         SUSE Linux Enterprise Server v12
Ubuntu-16.04    Ubuntu 16.04 LTS
Ubuntu-18.04    Ubuntu 18.04 LTS
Ubuntu-20.04    Ubuntu 20.04 LTS

3. wsl --install -d Ubuntu-20.04
FQ(VPN)


# 重启wsl
net stop LxssManager
net start LxssManager

下面的安装教程中拉下的步骤[^1]


wsl中需要重装openssh才可以连接


列出正在运行的wsl
wsl --list --running





# openssh配置
-v显示详细参数
ssh yzx@192.168.75.174 -p 2222 -v

## 免密登录
1. 在自己的Linux系统上生成SSH密钥和公钥
ssh-keygen -b 4096 -t rsa

2. 将SSH公钥上传到Linux服务器
ssh-copy-id yzx@10.1.0.181 -p 6899

3. 再次登录输入密码
ssh yzx@10.1.0.181 -p 6899




# powershell输入wsl，只是一闪而过的问题

1. 打开powershell用命令查看目前wsl的默认distribution
wsl -l -v
>   NAME                   STATE           VERSION
> * docker-desktop-data    Stopped         2
>   Ubuntu-20.04           Stopped         2
>   docker-desktop         Running         2

2. 设置一下默认distribution就行了 
wsl --setdefault Ubuntu-18.04


# netsh


# 更改wsl端口映射

1. 查看wsl内ip地址
wsl -- ifconfig eth0

2. 将本机地址映射进去
```netsh interface portproxy add v4tov4 listenport=6899  listenaddress=0.0.0.0 connectport=2222 connectaddress=172.24.75.110```

3. 查看映射结果
netsh interface portproxy show all

#netsh interface portproxy add v4tov4 listenport=[win10端口] listenaddress=0.0.0.0 connectport=[虚拟机的端口] connectaddress=[虚拟机的ip]
netsh interface portproxy add v4tov4 listenport=80 listenaddress=0.0.0.0 connectport=80 connectaddress=172.29.41.233
netsh interface portproxy add v4tov4 listenport=18080  listenaddress=0.0.0.0 connectport=8080 connectaddress=172.29.156.2



netsh interface portproxy add v4tov4 listenport=22

netsh interface portproxy add v4tov4 listenport=6899  listenaddress=0.0.0.0 connectport=2222 connectaddress=192.168.78.45

netsh interface portproxy add v4tov4 listenport=6899  listenaddress=0.0.0.0 connectport=2222 connectaddress=172.24.75.110

listenport 本机映射的端口
listenaddress 本机映射的地址，0.0.0.0表示允许通过所有ip访问
connectport wsl内端口
connectaddress 第一步查看的wslip

netsh interface portproxy>add v4tov4 ?
用法: add v4tov4 [listenport=]<integer>|<servicename>
            [connectaddress=]<IPv4 address>|<hostname>
            [[connectport=]<integer>|<servicename>]
            [[listenaddress=]<IPv4 address>|<hostname>]
            [[protocol=]tcp]
参数:
        标记            值
        listenport      - IPv4 侦听端口。
        connectaddress  - IPv4 连接地址。
        connectport     - IPv4 连接端口。
        listenaddress   - IPv4 侦听地址。
        protocol        - 使用的协议。现在只支持 TCP。



# windows开启openssh

Start-Service sshd
net start sshd



# 关闭公用网络的防火墙





# 单兵安装流程


wsl ssh 2222
windows 6899->2222


1. windows开启ssh
net start sshd
2. wsl开启ssh
sudo su
/etc/init.d/ssh restart
3. windows->wsl
ssh [wsl用户名]@[wsl内的ip] -p [端口]
example:
ssh yzx@172.24.75.110 -p 2222
4. linux->windows
ssh [windows用户名]@[windows内的ip] 
example:
ssh HOULAI@10.1.0.181 
5. linux->windows(映射)->wsl
这一步需要关闭防火墙
ssh [wsl用户名]@[windows内的ip]  -p [windows映射端口]
ssh yzx@10.1.0.181  -p 6899








# 参考文献
[下载ubuntu TSL 发行版]https://docs.microsoft.com/zh-cn/windows/wsl/install-manual
[基础设置]https://blog.csdn.net/weixin_43718675/article/details/106844150
[windows安装opnessh]https://docs.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse
[wsl重装openssh](https://blog.csdn.net/diyiday/article/details/105321630#:~:text=%E9%80%9A%E8%BF%87%20xshell%20%E8%BF%9E%E6%8E%A5ubuntuonwindows%28WSL%29%E8%BF%99%E9%87%8C%E4%B8%BB%E8%A6%81%E8%AE%B2%E5%87%A0%E4%B8%AA%E5%85%B3%E9%94%AE%E6%AD%A5%E9%AA%A41.%202.%20%E5%AE%89%E8%A3%85%20sshserversudo%20apt-get,install%20openssh-server%203.%20%E4%BF%AE%E6%94%B9%20sshserver%20%E9%85%8D%E7%BD%AEsudo%20vim%20%2Fetc%2Fssh%2Fsshd_config)
[wsl安装docker]https://blog.csdn.net/weixin_36182972/article/details/104898438
[wsl的.conf配置]https://docs.microsoft.com/zh-cn/windows/wsl/wsl-config#wslconf
[给 WSL2 设置静态 IP 地址]https://zhuanlan.zhihu.com/p/380779630
[内网穿透]https://zhuanlan.zhihu.com/p/303175108
[wsl.exe无法启动的问题]https://zhuanlan.zhihu.com/p/337361570
[netsh]https://docs.microsoft.com/zh-cn/windows-server/networking/technologies/netsh/netsh-contexts
[端口映射]http://www.ahanwhite.com/archives/wsl-port-nat
[局域网中连接时，关闭防火墙]https://zhuanlan.zhihu.com/p/425312804


















