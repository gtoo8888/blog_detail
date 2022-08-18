---
title: wsl 教程
date: 2022-08-02 10:01:26
tags:
- 教程
---


# 关键文件的位置
1. wsl配置文件的位置
C:\Users\<YourUserName>\.wslconfig
2. 开机启动文件的位置
英文路径名
C:\Users\<YourUserName>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
中文路径名
C:\Users\<YourUserName>\AppData\Roaming\Microsoft\Windows\「开始」菜单\程序\启动

# wsl的安装

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

4. 卸载
wsl --unregister Ubuntu-20.04-test-yzx-1

# 重启wsl
net stop LxssManager
net start LxssManager

下面的安装教程中拉下的步骤[^1]


wsl中需要重装openssh才可以连接


列出正在运行的wsl
wsl --list --running

wsl --shutdown彻底关闭Linux子系统后
再如要再次开启子系统需要使用wsl -d Ubuntu-20.04

# wsl 删除
wsl --unregister Ubuntu-20.04-test-yzx-1

# wsl 打包
打包之前一定要停止
wsl --terminate Ubuntu-20.04
打包子系统
> wsl --export Ubuntu-20.04 D:\Ubuntu-20.04-test-yzx.tar
> wsl --export Ubuntu-20.04 D:\Ubuntu-20.04.tar
还原子系统
> wsl --import Ubuntu-20.04-test-yzx-1 C:\WSL D:\Ubuntu-20.04-test-yzx.tar
> wsl --import ihouqi-Ubuntu-20.04 D:\ihouqi-Ubuntu-20.04 D:\Ubuntu-20.04.tar
设置默认wsl
wsl --setdefault Ubuntu-20.04
wsl --setdefault Ubuntu-20.04-test-yzx-1
wsl --setdefault ihouqi-Ubuntu-20.04

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
wsl --setdefault Ubuntu-20.04

# wsl 中查看运行的服务
service --status-all

# netsh


# 更改wsl端口映射

1. 查看wsl内ip地址
wsl -- ifconfig eth0

2. 将本机地址映射进去
```netsh interface portproxy add v4tov4 listenport=6899  listenaddress=0.0.0.0 connectport=2222 connectaddress=172.24.75.110```

3. 查看映射结果
netsh interface portproxy show all

#netsh interface portproxy add v4tov4 listenport=[win10端口] listenaddress=0.0.0.0 connectport=[虚拟机的端口] connectaddress=[虚拟机的ip]



netsh interface portproxy add v4tov4 listenport=6899  listenaddress=0.0.0.0 connectport=2222 connectaddress=172.24.77.53

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








# k8s

重启
kubeadm reset


原来的
kubeadm init  --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=10.1.0.181 --kubernetes-version=v1.21.5   > /tmp/k8s/token.txt

[WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd". Please follow the guide at https://kubernetes.io/docs/setup/cri/
error execution phase wait-control-plane: couldn't initialize a Kubernetes cluster
To see the stack trace of this error execute with --v=5 or higher


原来的
kubeadm init  --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=10.1.0.181 --kubernetes-version=v1.21.5 --v=5  > /tmp/k8s/token.txt


增加镜像
kubeadm init  --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=10.1.0.181 --kubernetes-version=v1.21.5 --image-repository=registry.aliyuncs.com/google_containers  > /tmp/k8s/token.txt 





kubeadm init 一直在等待
系统给的提示
Unfortunately, an error has occurred:
        timed out waiting for the condition

This error is likely caused by:
        - The kubelet is not running
        - The kubelet is unhealthy due to a misconfiguration of the node in some way (required cgroups disabled)

If you are on a systemd-powered system, you can try to troubleshoot the error with the following commands:
        - 'systemctl status kubelet'
        - 'journalctl -xeu kubelet'

Additionally, a control plane component may have crashed or exited when started by the container runtime.
To troubleshoot, list all containers using your preferred container runtimes CLI.

Here is one example how you may list all Kubernetes containers running in docker:
        - 'docker ps -a | grep kube | grep -v pause'
        Once you have found the failing container, you can inspect its logs with:
        - 'docker logs CONTAINERID'


docker配置

/etc/docker


systemctl restart docker
systemctl status docker



看版本
kubectl version -o json



kubectl get pod
The connection to the server localhost:8080 was refused - did you specify the right host or port?
[解决8080报错的问题],用了这个方法以后就是下面的结果
kubectl get pod
The connection to the server 10.1.0.181:6443 was refused - did you specify the right host or port?

现在看起来就要连接外面暴露的端口
netstat -ano | findstr LISTEN
10.1.0.181:139

获取日志
journalctl -xe


### C盘不够大，需要扩容的方法




# 参考文献
[配置 WSL 2 全局设置]https://dowww.spencerwoo.com/4-advanced/4-3-wslconfig.html
[下载ubuntu TSL 发行版 官方教程]https://docs.microsoft.com/zh-cn/windows/wsl/install-manual
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
[现在解决systemctl的方法]https://blog.allwens.work/wslSystemd/
[docker警告的解决方法]https://blog.csdn.net/qq_21127151/article/details/109269478
[解决8080报错的问题]https://discuss.kubernetes.io/t/the-connection-to-the-server-localhost-8080-was-refused-did-you-specify-the-right-host-or-port/1464
[如何在Windows中扩大C盘？4种方法！]https://www.disktool.cn/jiaocheng/extend-c-drive.html#:~:text=%E8%BE%93%E5%85%A5%E2%80%9C%20select%20volume%20c%20%E2%80%9D%E5%B9%B6%E6%8C%89%E9%94%AE%E7%9B%98%E4%B8%8A%E7%9A%84%E2%80%9C,%E5%9B%9E%E8%BD%A6%20%E2%80%9D%E6%9D%A5%E9%80%89%E6%8B%A9C%E7%9B%98%E3%80%82%20%E8%BE%93%E5%85%A5%E2%80%9C%20extend%20%5Bsize%3Dn%5D%20%E2%80%9D%E6%9D%A5%E5%B0%86C%E7%9B%98%E6%89%A9%E5%B1%95%E5%88%B0%E5%A4%A7%E5%B0%8F%E4%B8%BAn%E7%9A%84%E5%88%86%E5%8C%BA%E3%80%82
[WSL备份与还原（使用Win10自带工具）]https://blog.csdn.net/code_peak/article/details/118769378
[限制wsl内存的方法]https://zhuanlan.zhihu.com/p/345645621
















