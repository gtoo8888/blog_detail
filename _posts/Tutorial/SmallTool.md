---
title: 小工具的使用
date: 2022-08-23 15:49:26
tags:
- 教程
---

# Navicat12 Mysql可视化查看工具

破解的时候需要关闭软件本身

需要在k8s中开放端口
修改mysql开放及端口：
开放：alias b="kubectl -n namespace"
         b edit svc mysql -n mysql
      加spec-底部type: NodePort         # 从ClusterIP改过来
修改端口：ports-nodePort:31198

数据库：
host=[主机名],
user=[用户名],
passwd=[密码],
db=[想要访问的数据库],
charset="utf8",
port=[使用的端口]



host="10.1.0.42",
user="pigg",
passwd="123456",
db="ggip",
charset="utf8",
port=31198


## 查看表的情况
”设计表“
## 执行mysql语句以后的分析
剖析：

1）Opening tables 这个是表示这个SQL拿到这个表的使用权所占用的时间，如果在一个SQL中过长，则有可能表示当前表被锁，被一些其他线程占用，可以查一下当前表的状态。
2）Sending data包括两个部分，收集和发送数据。这里的关键是为什么要收集数据，原因在于：mysql使用“索引”完成查询结束后，mysql得到了一堆的行id，如果有的列并不在索引中，mysql需要重新到“数据行”上将需要返回的数据读取出来返回个客户端。如果这部分占用时间过程，有可能是索引问题，或者字段长度过大导致。


# gRPC调试工具

BloomRPC
可以调试utilserver这个特别复杂的服务
在调试的时候，需要把包含的文件，还有包含文件的包含文件全部导入



# kdevelop
CMake可视化调试工具


打开命令窗口:
1. 安装gcc(编译器)
    sudo apt-get build-dep gcc
    sudo apt-get install build-essential
    
2. 安装kdevelop
sudo apt-get install kdevelop

3. 安装cmake等
sudo apt-get install automake autoconf g++ libtool cmake

# 打包工具

# inno setup

# filepack

# NSIS



doxygen
Sumatra PDF
obsidian
visual svn


# 清理存储空间
## Ubuntu清理存储空间
```bash
#!/bin/bash
set -ex

df -h 

rm -rf /var/log/journal/*
rm -rf ~/.cache/vscode-cpptools/*

snap list --all | awk '/disabled/{print $1, $3}' |
while read snapname revision; do
    snap remove "$snapname" --revision="$revision"
done

apt-get autoclean  -y # 将已经删除了的软件包的.deb安装文件从硬盘中删除掉
apt-get clean      -y # 删除包缓存中的所有包
apt-get autoremove -y # 删除为了满足其他软件包的依赖而安装的，但现在不再需要的软件包。

df -h 
```

## Windows清理存储空间
C:\Users\<User>\AppData\Local\pip\cache
C:\Users\<User>\AppData\Local
C:\Users\<User>\AppData\Local\TslGame\Saved\Crashes
C:\Users\<User>\AppData\Local\Temp
C:\Users\<User>\.gradle

## 通用大文件

### 1. vscode
### 2. python包管理
pip cache
pip cache dir purge
pip cache info


# MQTT使用

```bash
sudo apt-get install mosquitto mosquitto-clients mosquitto-dev -y
mosquitto -p 1883

mosquitto_pub -h localhost -t mqtt -m "haha" 
systemctl status mosquitto

mosquitto_sub -t mqtt -v


# mosquitto_sub -t 'test/topic' -v
# mosquitto_pub -t 'test/topic' -m 'hello world'

log_dest file C:\Program Files\mosquitto\log\mosquitto.log
log_dest stdout stderr 
log_type all
log_timestamp true
log_timestamp_format %Y-%m-%dT%H:%M:%S
connection_messages true
websockets_log_level 0
allow_anonymous false



cat install_manifest.txt | sudo xargs rm # 卸载
# 编译源码


sudo apt-get install libssl-dev xsltproc -y


sudo systemctl status mosquitto.service
```


## 增强bing搜索

https://cn.bing.com/search?q=%s&{bing:cvid}{bing:msb}{google:assistedQueryStats}
https://cn.bing.com/search?q=%s+-site:*.csdn.net+-site:*.wenku.baidu.com&{bing:cvid}{bing:msb}{google:assistedQueryStats}

vtk应用场景 -site:*.csdn.net -site:*.wenku.baidu.com

# bing国际版网址
https://global.bing.com/?setlang=en-us&setmkt=en-us


# powershell

oh-my-posh

常见的powershell配置

C:\Users\wellsun\.condarc

添加auto_activate_base: false
C:\Users\<User>\Documents\WindowsPowerShell



```bash
$PSVersionTable

function prompt {
    $currentPath = (Get-Location).Path
    $time = Get-Date -Format "HH:mm:ss"
    return "[$time] $currentPath> "
}
```


# 参考资料
[使用Navicat分析SQL性能]https://blog.csdn.net/weixin_43416686/article/details/121037223
## 清理存储空间
[如何清除 Pip 缓存？从而优化 Python 环境并释放磁盘空间](https://cloud.tencent.com/developer/article/2323457)
[Windows上pip缓存](https://blog.csdn.net/weixin_45653897/article/details/131254542)
[gradle瘦身/删除没有用的文件](https://blog.csdn.net/gqg_guan/article/details/130160022)
[轻量级的VsCode为何越用越大？为什么吃了我C盘10G？如何无痛清理VsCode缓存？手把手教你为C盘瘦身](https://blog.csdn.net/Tisfy/article/details/126082324)
[解决Antimalware Service Executable让CPU占用过高](https://www.bilibili.com/opus/976945853997514788)
## 杂项
[在国内怎么使用必应国际版？全英文的那种？](https://answers.fuyeor.com/zh-hans/question/5321)
[配置和美化你的powershell终端](https://zhuanlan.zhihu.com/p/444165353)

