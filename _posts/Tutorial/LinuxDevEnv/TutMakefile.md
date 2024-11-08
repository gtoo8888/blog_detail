---
title: makefile 教程
date: 2022-04-05 20:34:26
tags:
- 教程
---



|自动化变量                        |   说明|
| ------ | ------ |
|$*                             |表示目标文件的名称，不包含目标文件的扩展名|
|$+                                |也是所有依赖目标的集合,这些依赖文件用空格分开，按照出现的先后为顺序，只是它不去除重复的依赖目标|
|$<                            |  规则中的第一个相关文件名|
|$?                            |  规则中日期新于目标的所有相关文件的列表，以空格分割|
|$@                            |  规则的目标所对应的文件名|
|$^                            |  规则中所有相关文件的列表，以空格分割|
|$(@D)                          | 目标文件的目录部分|
|$(@F)                         |  目标文件的文件名部分|




|常用变量                            | 说明  |默认值
| ------ | ------ |------ |
|AR                              | 归档维护程序         |ar  |
|AS                              | 汇编程序             |as  |
|CPP                            |  c预处理程序          |cpp  |
|CC                              |   c编译程序          |cc  |
|CXX                              |   c++编译程序          |g++  |                        
|RM                              | 文件删除程序         |rm -f  |
|ARFLAGS                         |  传给归档维护程序的标志|rv  |
|ASFLAGS                         | 传给汇编程序的标志   |无默认值  |
|CFLAGS                          | 传给c编译程序的标志  |无默认值  |
|CPPFLAGS                        | 传给c预处理程序的标志    |无默认值  |
|CXXFLAGS                        |  传给c++编译器的标志     |无默认值|
|LDFLAGS                         |传给链接程序（ld）的标志|无默认值  |



模式规则中，至少在规则的目标定义中要包含"%"，否则，就是一般的规则。目标中的"%"定义表示对文件名的匹配，"%"表示长度任意的非空字符串。例如："%.c"表示以".c"结尾的文件名（文件名的长度至少为3），而"s.%.c"则表示以"s."开头，".c"结尾的文件名（文件名的长度至少为5）。

如果"%"定义在目标中，那么，目标中的"%"的值决定了依赖目标中的"%"的值，也就是说，目标中的模式的"%"决定了依赖目标中"%"的样子。例如有一个模式规则如下：
    %.o : %.c 


markdown中的函数


BIN_SRCS := $(wildcard bin/*.cc)
获取匹配模式的文件名 wildcard
src = $(wildcard *.c)
wildcard把 指定目录 ./ 和 ./sub/ 下的所有后缀是c的文件全部展开。


模式替换函数 patsubst


循环函数 foreach



g++ -Wall -std=c++11 -pthread -O2 -g -iquote include/ -I../ -I/usr/local/include  -L lib/ -L/usr/local/lib -ltpc  bin/echo_client.cc lib/libtpc.a   -o bin/echo_client


# 输出信息
$(info "info here")
$(info "$(CFLAGS)")
# 输出变量
$(warning "CFLAGS = $(CFLAGS)")，


# 生成静态库文件
g++ test -c 
g++ test -o
ar -rcs libtest.a



# 常见编译选项
```makefile
BIN_SRCS := $(wildcard bin/*.cc)  # 选择所有文件
BIN_SRCS := $(filter-out bin/test.cc, $(BIN_SRCS)) # 单独去掉bin/test.cc
```


# 参考资料
https://blog.csdn.net/yi412/article/details/69941791
https://blog.csdn.net/marc07/article/details/62885868













































