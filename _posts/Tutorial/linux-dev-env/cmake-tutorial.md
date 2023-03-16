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


# cmake使用时候的命名

cmake .. -DCMAKE_BUILD_TYPE=Debug

CMAKE_BUILD_TYPE
可选值包括：
Debug：用于在没有优化的情况下，使用带有调试符号构建库或可执行文件
Release：用于构建的优化的库或可执行文件，不包含调试符号
RelWithDebInfo：由于构建较少的优化库或可执行文件，包含调试符号
MinSizeRel：用于不增加目标代码大小的优化方式，来构建或可执行文件



# 交叉编译工具
CMAKE给交叉编译预留了一个变量CMAKE_TOOLCHAIN_FILE，它定义了一个.cmake文件的路径，该文件里面设置了一系列CMAKE变量和属性，比如C_COMPILER，CXX_COMPILER等。.cmake文件的好处是一次编写多次使用，不同平台架构的交叉编译工具链可以编写一个独立的toolchain.cmake文件，而工程的CMakeLists.txt可以编写为通用格式，对工具链不可见。cmake脚本可以如下形式：




add_library()：这是一个CMake函数，用于创建一个库文件。

add_executable()：这是一个CMake函数，用于创建一个可执行文件。

target_link_libraries()：这是一个CMake函数，用于指定链接的库文件。

include_directories()：这是一个CMake函数，用于指定头文件的搜索路径。


add_subdirectory():添加一个子目录并构建该子目录。


# 参考文献

[find_package讲解]https://blog.csdn.net/zhanghm1995/article/details/105466372
[C++连接mysql用cmake编译]https://blog.csdn.net/lbwanghr/article/details/111076593
[什么是交叉编译]https://zhuanlan.zhihu.com/p/77116555

