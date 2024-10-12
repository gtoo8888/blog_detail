---
title: VScode 环境安装
date: 2022-09-22 16:30:31
tags:
- 环境配置
---

# 一、官网下载vscode

# 二、安装

安装的时候记得把
将"通过 code打开"操作添加到 Windows资源管理器文件上下文菜单
打钩

# 三、常用的扩展

| 扩展名 | 功能 | 
| ---- | ---- | 
| **通用的** | 
| Chinese (Simplified) (简体中文) | 中文翻译 | 
| Code Runner | 展开全部代码 | 
| Markdown Preview Enhanced | Markdown查看 | 
| C++相关 | |
| **C/C++**| 写C++代码 | 
| C/C++ Extension | | 
| CMake |  | 
| CMake Tools |  | 
| C/C++ Extension Pack |  | 
| **HTML** | |
| Auto Rename Tag | 自动修改前后标签名 | 
| open in browser | 在浏览器中打开 | 
| CSS Peek | 追踪CSS样式 | 
| HTML CSS Support | HTML样式支持 | 
| **Vue** | |
| Live Server | 保存后动态显示 | 
| **Git** | |
| Git History | 查看git历史提交记录 | 
| GitLens  |  | 
| Git Graph  |  | 
| **GoLang** | |
| go | 语法支持 | 
| vscode-proto3  | 查看protobuf格式 | 
| **Jinja2** | |
| Jinja | jinja语法支持 | 
| **Shell** | |
| shell-format | 格式化工具 | 
| shellman | 代码提示工具 | 
| **远程控制** | |
| Remote - SSH | 远程ssh连接 | 
| Remote - Containers |  | 
|Remote - SSH: Editing Configuration Files | |


# 五、配置c/c++环境

1. 安装mingw
2. ctl+shift+P
C/C++: Edit Configurations (UI)
编译器路径
D:\MinGW\bin\gcc.exe

## c++调试的原理
1. 先使用tasks.json来创建一个任务
- tasks.json文件可以对程序进行编译，对于C++来说，可以使用gcc,g++,make,cmake,shell脚本
- 可以先测试task能否正常运行，这一步的测试就是测试程序是否能编译通过
2. 通过launch.json调用想要使用的任务
这是启动vscode的调试功能
需要做一些配置
再启动gdb调试器来进行调试
3. 添加c_cpp_properties.json增加C++的语言支持

## 使用步骤
创建一个.vscode文件夹

### 1.tasks.json
```json
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558 
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "cplusplustest",   //任务的名字，就是刚才在命令面板中选择的时候所看到的，可以自己设置
            "type": "shell",
            // "command": "g++ ./123.cpp -o 123 -g -std=c++11", // 可以使用一行命令的方法，不需要下面添加参数
            "command": "g++",   // 或者就只写g++,下面添加参数
            // "args": [//编译时候的参数
            //     "./123.cpp",    // 想要调试的文件，可以写相对路径也可以写绝对路径
            //     "-o",           // 指定生成可执行文件的名称
            //     "debug.exe",    // 如果不加后缀名，自动会添加.exe
            //     "-g",           // 添加gdb调试选项
            //     "-std=c++11"    // 使用C++11标准
            // ],
            "args": [
                "-g",
                "${file}",   // 自动查找当前执行的文件
                "-o",
                "${fileDirname}\\${fileBasenameNoExtension}.exe",   // 设置生成的文件名，可以为中文
                "-std=c++11",
                // "-fexec-charset=GBK" //解决中文乱码问题,还没有遇到过
            ],
            "problemMatcher": {
                // "owner": "cpp",
                // "fileLocation": [
                //     "relative",
                //     "${workspaceRoot}"
                // ],
                // "pattern": {
                //     "regexp": "^(.*):(\\d+):(\\d+):\\s+(warning|error):\\s+(.*)$",
                //     "file": 1,
                //     "line": 2,
                //     "column": 3,
                //     "severity": 4,
                //     "message": 5
                // }
            },   // 问题分析器,还不太会用
            "group": {
                "kind": "build",
                "isDefault": true   //表示快捷键Ctrl+Shift+B可以运行该任务
            },
        }
    ]
}

```

### 2.launch.json
```json
{
    // 使用 IntelliSense 了解相关属性。
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "preLaunchTask": "cplusplustest", //调试会话开始前执行的任务，一般为编译程序。与tasks.json的label相对应
            "name": "(gdb) Debug",       //配置文件的名字，可以随便起
            "type": "cppdbg",           //调试的类型，Vscode现在支持很多，我这里主要是C，所以只能是cppdbg
            "request": "launch",        //配置文件的请求类型，有launch和attach两种，具体看官方文档
            "targetArchitecture": "x64", //硬件内核架构，为64bit，如图设置
            // "program": "${workspaceFolder}/123.exe",   //可执行文件的路径和文件名称
            "program": "${fileDirname}/${fileBasenameNoExtension}.exe",   //可执行文件的路径和文件名称
            // 整个路径名中，必须全部是是英文名称才可以进行调试
            "args": [],                 //主函数调用时传入的参数
            "stopAtEntry": false,       //设为true时程序将暂停在程序入口处
            "cwd": "${workspaceFolder}/1-Algorithm_test",    //调试时的工作目录
            "environment": [],          //不知道干嘛的
            "internalConsoleOptions": "openOnSessionStart",
            "externalConsole": false,   //调试时是否显示控制台窗口
            "MIMode": "gdb",            //指定连接的调试器，可以省略不写
            "miDebuggerPath": "D:/Qt/Qt5.9.9/Tools/mingw530_32/bin/gdb.exe",    // 在windows调试的时候，需要加上gdb的路径
            "setupCommands": [
                {
                    "description": "为 gdb 启用整齐打印",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}

```

### 3.c_cpp_properties.json
```json
// https://code.visualstudio.com/docs/cpp/c-cpp-properties-schema-reference
//.vscode文件夹局部的配置c_cpp_properties.json
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [            // 这个是使用头文件时候vscode查找的路径，如果路径没有包含进来，头文件会有红色波浪线
                "${workspaceFolder}/**", // 当前工作目录下包含的所有文件
                "/vcpkg/x64-linux/installed/x64-linux/include/**",  // 路径错误或者不存在看起来可以运行
                "D:\\MinGW\\lib\\gcc\\mingw32\\9.2.0\\**"
            ],
            "defines": [// 这里定义的头文件在程序中使用的时候，#ifndef的内容不会灰色
                "F_OS_LINUX",         
                "_DEBUG",
                "UNICODE",
                "_UNICODE",
                "LOCAL"
            ],
            "cStandard": "c17",       // 指定c语言使用的语法版本
            "cppStandard": "c++17",   // 指定c++使用的语法版本
            "intelliSenseMode": "linux-gcc-x64", // 使用智能感知模式(IntelliSense)，映射到特定的体系
            // "intelliSenseMode": "windows-gcc-x86",   // windows中使用的配置
            "browse": { // 浏览选项，主要用在转跳#include文件的时候，可以做一些模糊搜索
                "path": [   // 需要查找的路径
                    "${workspaceFolder}",
                    "D:\\MinGW\\lib\\gcc\\mingw32\\9.2.0\\**",
                ],
                "limitSymbolsToIncludedHeaders": true,  // 如果为true,只解析${workspaceFolder}中的文件，false还会解析browse中的文件，存疑
                "databaseFilename": ""
            }
        }
    ],
    "version": 4
}
```


### 关于调试的一些疑问
1. 使用了C++11的语法，但是C++11的语句，比如auto还是会报错
c_cpp_properties.json中添加
```json
"cStandard": "c17",
"cppStandard": "c++17",
```
2. 使用了外部的库，比如opencv,QThread等库的时候，编译可以通过但是无法转跳
没有在include中增加包含库的路径

# 四、卸载
C:\Users\$用户名\.vscode
C:\Users\$用户名\AppData\Roaming\Code【注】这里的“$用户名”根据自己的用户名而定。

# 参考资料
[mingw安装教程](https://www.cnblogs.com/LIJIH/p/12533926)
[VSCode 任务配置参数及任务结果分析-problemMatcher](https://geek-docs.com/vscode/vscode-tutorials/vscode-task-configuration-parameters-and-task-results-analysis.html)
[VSCode配置C/C++环境]https://zhuanlan.zhihu.com/p/87864677
[VScode配置c/c++环境（无数试错版本）]https://blog.csdn.net/Pretty_Anno/article/details/126978142
[windwos11没有Hyper-V的解决方法]https://www.jianshu.com/p/96aa6eeacb56



