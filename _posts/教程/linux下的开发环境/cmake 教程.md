---
title: cmake 教程
date: 2022-02-21 17:40:18
tags:
- 教程
---


# PROJECT 指令的语法
```
PROJECT(projectname [CXX] [C] [Java])
PROJECT (HELLO)
```
定义了工程的名称为HELLO


# SET 指令的语法
```
SET(VAR [VALUE] [CACHE TYPE DOCSTRING [FORCE]])
SET(SRC_LIST main.c t1.c t2.c)
SET(SRC_LIST main.c)也可以写成 SET(SRC_LIST “main.c”)
```
SET 指令可以用来显式的定义变量即可


# MESSAGE 指令的语法
```
MESSAGE([SEND_ERROR | STATUS | FATAL_ERROR] "message to display"
...)
MESSAGE(STATUS "This is BINARY dir " ${HELLO_BINARY_DIR})
```

由 PROJECT 指令定义的两个隐式变量HELLO_BINARY_DIR 和 HELLO_SOURCE_DIR。

**SEND_ERROR，产生错误，生成过程被跳过
SATUS，输出前缀为—的信息
FATAL_ERROR，立即终止所有 cmake 过程**


# ADD_EXECUTABLE 指令的语法
```
ADD_EXECUTABLE(hello ${SRC_LIST})
```
定义了这个工程会生成一个文件名为 hello 的可执行文件

# 变量
${}来引用变量，这是 cmake 的变量引用方式
如在 IF 控制语句，变量是直接使用变量名引用，而不需要${}。


# 清理
```
make clean
```
cmake 并不支持 make distclean，无法清理构建过程产生的中间文件




# 参考文献

[find_package讲解]https://blog.csdn.net/zhanghm1995/article/details/105466372
[C++连接mysql用cmake编译]https://blog.csdn.net/lbwanghr/article/details/111076593


