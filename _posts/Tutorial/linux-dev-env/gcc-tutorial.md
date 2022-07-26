---
title: gcc 教程
date: 2022-03-11 14:11:23
tags:
- 教程
---

# GCC介绍

- GCC 原名为 GNU C语言编译器（GNU C Compiler）
- GCC（GNU Compiler Collection， GNU编译器套件）是由 GNU 开发的编程语言
译器。 GNU 编译器套件包括 C、 C++、 Objective-C、 Java、 Ada 和 Go 语言前
端，也包括了这些语言的库（如 libstdc++， libgcj等）
- GCC 不仅支持 C 的许多“方言”，也可以区别不同的 C 语言标准；可以使用命令行
选项来控制编译器在翻译源代码时应该遵循哪个 C 标准。例如，当使用命令行参数
`-std=c99` 启动 GCC 时，编译器支持 C99 标准。
- 安装命令 sudo apt install gcc g++ （版本 > 4.8.5）
- 查看版本 gcc/g++ -v/--version

# 语言流程

高级语言
编译
汇编语言
汇编
机器语言
运行
计算机

# GCC工作流程

源代码(预处理)->预处理后源代码(编译器)->汇编代码(汇编器)->目标代码(链接器)->可执行程序
.h.c.cpp
.i
.s
.exe.out

# gcc 和 g++ 的区别
gcc 和 g++都是GNU(组织)的一个编译器
- 误区一： gcc 只能编译 c 代码， g++ 只能编译 c++ 代码。两者都可以，请注意：
- 误区二： gcc 不会定义 __cplusplus 宏，而 g++ 会
- 误区三：编译只能用 gcc，链接只能用 g++


# GCC常用参数选项

| 输出       | 说明                | 汇编 | 编译 | 链接 | 文件名     |
| ---------- | ------------------- | ---- | ---- | ---- | ---------- |
|            | 没有指令            |      |      |      | a.out      |
| -E         | 预处理指定的源文件  | ×    | ×    | ×    | 屏幕输出   |
| -S         | 编译到汇编语言      | √    | ×    | ×    | 原文件名.s |
| -c         | 编译、汇编          | √    | √    | ×    | 原文件名.o |
| -o [file1] | 生成指定文件名file1 | √    | √    | √    | file1      |

|-o [file1][file2] [file2] | 将文件 file2 编译成可执行文件 file1||

gcc -o test
gcc -c -o test
将main.c和string.c编译成一个执行文件
gcc -o test mian.c string.c

|指令| 说明|
|---|---|
|-I |directory 指定 include 包含文件的搜索目录|
|---|---|
|-g |在编译的时候，生成调试信息，该程序可以被调试器调试|
|-D |在程序编译的时候，指定一个宏|
|-w |不生成任何警告信息|
|-Wall| 生成所有警告信息|
|-O n|n的取值范围： 0~3,编译器的优化选项的4个级别</br> -O 0表示没有优化， -O 1为缺省值， -O 3优化级别最高|
|-l |在程序编译的时候，指定使用的库|
|-L |指定编译的时候，搜索的库的路径。|
|-fPIC/fpic |生成与位置无关的代码|
|-shared |生成共享目标文件，通常用在建立共享库时|
|-std |指定C方言，如:-std=c++11， gcc默认的方言是GNU C|


# 库文件

- 库文件是计算机上的一类文件，可以简单的把库文件看成一种代码仓库，它提供给使用者一些可以直接拿来用的变量、函数或类。
- 库是特殊的一种程序，编写库的程序和编写一般的程序区别不大，只是库不能单独运行。
- 库文件有两种，静态库和动态库（共享库），区别是：静态库在程序的链接阶段被复制到了程序中；动态库在链接阶段没有被复制到程序中，而是程序在运行时由系统动态加载到内存中供程序调用。
- 库的好处： 1.代码保密 2.方便部署和分发

# 静态库的制作

- 命名规则：
    - Linux : libxxx.a
    - lib : 前缀（固定）
    - xxx : 库的名字，自己起
    - .a : 后缀（固定）
- Windows : libxxx.lib

- 静态库的制作：
- gcc 获得 .o 文件
- 将 .o 文件打包，使用 ar 工具（archive）
    - ar rcs libxxx.a xxx.o xxx.o
        - r – 将文件插入备存文件中
        - c – 建立备存文件
        - s – 索引







# 参考资料：
https://www.nowcoder.com/courses/cover/live/504
[100个gdb小技巧]https://wizardforcel.gitbooks.io/100-gdb-tips/content/index.html
