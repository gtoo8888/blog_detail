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


# 使用VSCode远程调试linux中的容器

1. 需要把容器的端口映射出来

容器内的ssh修改需要把root登录打开
sudo vi /etc/ssh/sshd_config
PermitRootLogin yes 
重启，连接测试，可以连接

```
Host 15.1.0.89      # 显示的名字
  HostName 15.1.0.89
  User root
  Port 38529        # 使用的端口号
  IdentityFile ~\.ssh\id_rsa
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
| ctl + g | 跳到指定行 | 
| ctl + b | 关闭左侧栏 | 
| ctl + j | 关闭下面栏 | 

# 一些设置
C++不报错
C_Cpp.errorSquiggles

# 调试相关的三个主要文件
调试的基本思路：
步骤一：
先有一个tasks.json文件可以对文件进行生成
对于C++来说，可以使用gcc,g++,make,cmake,shell脚本，都可以进行生成
可以先测试task能否正常运行，这一步的测试就是测试程序是否能编译通过
步骤二：
### tasks.json
```
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "compile",
            "type": "shell",
            "command": "./build.sh",
            "args": [],
            "problemMatcher": [],
            "group": "build"
        },
        {
            "label": "clean",
            "type": "shell",
            "command": "make",
            "args": [
                "clean",
            ],
        }
    ]
}
```

### launch.json


### c_cpp_properties.json

```
// https://code.visualstudio.com/docs/cpp/c-cpp-properties-schema-reference
//.vscode文件夹局部的配置c_cpp_properties.json
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [            // 这个是使用头文件时候vscode查找的路径，如果路径没有包含进来，头文件会有红色波浪线
                "${workspaceFolder}/**", //
                "/vcpkg/x64-linux/installed/x64-linux/include/**"
            ],
            "defines": [
              "F_OS_LINUX",         // 这里定义的头文件在程序中使用的时候，#ifndef的内容不会灰色
              "_DEBUG"
            ],
            "cStandard": "c17",       // 指定c语言使用的语法版本
            "cppStandard": "c++17",   // 指定c++使用的语法版本
            "intelliSenseMode": "linux-gcc-x64"
        }
    ],
    "version": 4
}
```
一些问题：
1. 使用了C++11的语法，但是C++11的语句，比如auto还是会报错
"cStandard": "c17",
"cppStandard": "c++17",
2. 使用了外部的库，比如opencv,QThread等库的时候，编译可以通过但是无法转跳




# 参考文献


[在VScode中，代码提示左边的图标各自代表的含义]https://blog.csdn.net/qq_42838904/article/details/108222619
[c_cpp_properties.json]https://code.visualstudio.com/docs/cpp/c-cpp-properties-schema-reference
