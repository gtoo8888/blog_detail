---
title: vscode 教程
date: 2022-04-05 20:33:12
tags:
- 教程
---
# 代码里的左侧颜色标识:

红色，未加入版本控制; (刚clone到本地)
绿色，已经加入版本控制暂未提交; (新增部分)
蓝色，加入版本控制，已提交，有改动； (修改部分)
白色，加入版本控制，已提交，无改动；
灰色：版本控制已忽略文件。

git文件标识:

A: 增加的文件.
C: 文件的一个新拷贝.
D: 删除的一个文件.
M: 文件的内容或者mode被修改了.
R: 文件名被修改了。
T: 文件的类型被修改了。
U: 文件没有被合并(你需要完成合并才能进行提交)
X: 未知状态

# 使用VSCode远程调试linux

1. 准备工作
```
apt-get update
apt-get install sudo
apt-get install vim
passwd # 修改密码
```
2. 安装openssh
apt-get install openssh-server
apt-get install openssh-client
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

# 快捷键

| 快捷键 | 功能 | 
| :----: | :----: | 
| ctl + k + 0 | 快速收缩全部代码 | 
| ctl + k + j | 展开全部代码 | 
| ctl + shift + [ | 收缩当前代码 | 
| ctl + shift + ] | 展开当前代码 | 
| alt + left | 向后 | 
| alt + left | 向前 | 


# 参考文献


[在VScode中，代码提示左边的图标各自代表的含义]https://blog.csdn.net/qq_42838904/article/details/108222619
