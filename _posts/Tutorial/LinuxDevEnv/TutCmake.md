---
title: CMake教程
date: 2022-02-21 17:40:18
tags:
- 教程
---

# CMake例子

## 最简单的CMake文件
```c++
cmake_minimum_required(VERSION 3.0) # 设置最低的 CMake 版本要求
project(SimpleProject) # 设置项目名称
add_executable(main main.cpp) # 添加可执行文件
```
```bash
cmake -S . -B build
cmake --build build
```
## 添加动态库，静态库，生成动态库静态库，可执行文件
```c++
cmake_minimum_required(VERSION 3.0) # 设置最低的 CMake 版本要求
project(MyProject) # 设置项目名称

add_subdirectory(src) # 添加源文件目录
include_directories(include) # 添加头文件目录

add_library(MyLibrary SHARED src/add.cpp) # 生成动态库
add_library(MyStaticLibrary STATIC src/add.cpp) # 生成静态库

add_executable(MyExecutable src/main.cpp) # 添加可执行文件
target_link_libraries(MyExecutable MyLibrary) # 链接动态库到可执行文件 
target_link_libraries(MyExecutable MyStaticLibrary) # 链接静态库到可执行文件
```
```bash
cmake -S . -B build
cmake --build build
```
## 添加CMake test
```c++
cmake_minimum_required(VERSION 3.0) # 设置最低的 CMake 版本要求
project(MyProject) # 设置项目名称

add_subdirectory(src) # 添加源文件目录
include_directories(include) # 添加头文件目录

add_library(MyLibrary SHARED src/add.cpp) # 生成动态库
add_library(MyStaticLibrary STATIC src/add.cpp) # 生成静态库

add_executable(MyExecutable src/main.cpp) # 添加可执行文件
target_link_libraries(MyExecutable MyLibrary) # 链接动态库到可执行文件 
target_link_libraries(MyExecutable MyStaticLibrary) # 链接静态库到可执行文件



enable_testing() # 添加测试
add_executable(TestExecutable src/test.cpp) # 添加测试用例
target_link_libraries(TestExecutable MyLibrary)
add_test(NAME MyTest COMMAND TestExecutable) # 添加测试到 CTest

```


```bash
cmake -S . -B build
cmake --build build
cd build
ctest
```

## CMake常见指令
### cmake_minimum_required
### project
```C++
PROJECT(projectname [CXX] [C] [Java])
PROJECT (HELLO)
```
定义了工程的名称为HELLO


# SET 指令的语法
```C++
SET(VAR [VALUE] [CACHE TYPE DOCSTRING [FORCE]])
SET(SRC_LIST main.c t1.c t2.c)
SET(SRC_LIST main.c)也可以写成 SET(SRC_LIST “main.c”)
```
SET 指令可以用来显式的定义变量即可


# MESSAGE 指令的语法
```C++
MESSAGE([SEND_ERROR | STATUS | FATAL_ERROR] "message to display"
...)
MESSAGE(STATUS "This is BINARY dir " ${HELLO_BINARY_DIR})
```

由 PROJECT 指令定义的两个隐式变量HELLO_BINARY_DIR 和 HELLO_SOURCE_DIR。

**SEND_ERROR，产生错误，生成过程被跳过
SATUS，输出前缀为—的信息
FATAL_ERROR，立即终止所有 cmake 过程**


# ADD_EXECUTABLE 指令的语法
```C++
ADD_EXECUTABLE(hello ${SRC_LIST})
```
定义了这个工程会生成一个文件名为 hello 的可执行文件

# 变量
${}来引用变量，这是 cmake 的变量引用方式
如在 IF 控制语句，变量是直接使用变量名引用，而不需要${}。


# 清理
```bash
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





# Command-Line Tools
1. cmake(1)
   1. CMake Command-Line
2. ctest(1)
3. cpack(1)

# Reference Manuals
1. cmake-buildsystem(7)
2. cmake-commands(7)
   1. add_library()之类的指令
3. cmake-compile-features(7)
4. cmake-configure-log(7)
5. cmake-cxxmodules(7)
6. cmake-developer(7)
7. cmake-env-variables(7)
   1. 全局使用的环境变量
8. cmake-file-api(7)
9.  cmake-generator-expressions(7)
10. cmake-generators(7)
11. cmake-language(7)
12. cmake-modules(7)
13. cmake-packages(7)
    1.  find_package
14. cmake-policies(7)
    1.  每个版本的更新策略
15. cmake-presets(7)
    1.  预设
16. cmake-properties(7)
    1.  属性
17. cmake-qt(7)
18. cmake-server(7)
19. cmake-toolchains(7)
    1.  跨平台使用的工具链
20. cmake-variables(7)——important
    1.  CMAKE_开头的变量
21. cpack-generators(7)

# Interactive Dialogs
cmake-gui(1)
ccmake(1)

## 2. cmake-commands

### Scripting Commands
```C++
file(GLOB SOURCES "src/*/*.c")

set(<variable> <value>... [PARENT_SCOPE])

```



### Project Commands

```C++
# add_library();# 用于创建一个库文件
# add_executable()：用于创建一个可执行文件

add_executable(<name> <options>... <sources>...)

// <name>对应于逻辑目标名称，在项目中必须是全局唯一的。构建的可执行文件的实际文件名是基于本机平台的约定（如<name>.exe或仅<name>）构建的。
```



用于指定链接的库文件
```C++
target_link_libraries() 

target_link_libraries(<target> ... <item>... ...)


target_link_libraries(<target>
                      <PRIVATE|PUBLIC|INTERFACE> <item>...
                     [<PRIVATE|PUBLIC|INTERFACE> <item>...]...)

target_link_libraries(<target>
                      <LINK_PRIVATE|LINK_PUBLIC> <lib>...
                     [<LINK_PRIVATE|LINK_PUBLIC> <lib>...]...)

# include_directories()：用于指定头文件的搜索路径。
# add_subdirectory():添加一个子目录并构建该子目录。


add_test(NAME <name> COMMAND <command> [<arg>...]
         [CONFIGURATIONS <config>...]
         [WORKING_DIRECTORY <dir>]
         [COMMAND_EXPAND_LISTS])
```

### CTest Commands
### Deprecated Commands



## 20. cmake-variables

### 20.1 Variables that Provide Information
### 20.2 Variables that Change Behavior
### 20.3 Variables that Describe the System
### 20.4 Variables that Control the Build

EXECUTABLE_OUTPUT_PATH
### 20.5 Variables that Change Behavior

CMAKE_BUILD_TYPE


### 20.6 Variables for Languages
1. CMAKE_C_STANDARD
2. CMAKE_CXX_STANDARD
3. CMAKE_<LANG>_FLAGS_DEBUG
   1. CMAKE_C_FLAGS_DEBUG
4. CMAKE_<LANG>_COMPILER
   1. CMAKE_C_COMPILER

# 参考资料
[CMake org](https://cmake.org/)
[CMake Reference Documentation — CMake latest Documentation](https://cmake.org/cmake/help/git-master/index.html)
[Getting Started with CMake](https://cmake.org/getting-started/)
[Mastering CMake](https://cmake.org/cmake/help/book/mastering-cmake/index.html)

[find_package讲解]https://blog.csdn.net/zhanghm1995/article/details/105466372
[C++连接mysql用cmake编译]https://blog.csdn.net/lbwanghr/article/details/111076593
[什么是交叉编译]https://zhuanlan.zhihu.com/p/77116555
[CMake中的链接权限详解：深入理解PRIVATE、PUBLIC与INTERFACE](https://zhuanlan.zhihu.com/p/663367171)
[CMake应用：模块化及库依赖](https://zhuanlan.zhihu.com/p/373363335)
