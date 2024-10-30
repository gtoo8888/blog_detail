---
title: GDB 教程
date: 2024-09-27 16:19:23
tags:
- 教程
---


# gdb 启动
```shell
gdb调试选项
-g 
-ggdb # gdb调试专用开关
-g3 # 包含级别2中的调试信息和源代码中定义的宏
-g2 # 此时调试信息包括扩展的符号表，行号，局部或外部变量信息
-g1 # 不包含局部变量和与行号有关的调试信息，只能用于回溯跟踪和堆栈转储之用


gdb my_exe 
gdb my_exe -q # 静默启动，不显示开始信息
gdb my_exe -tui # 图形化模式，有的不支持
```



# 基本操作
```shell
r(run) # 开始运行，从头开始执行
n(next) # 逐过程，相当于F10，为了查找是哪个函数出错了
s(step) # 逐语句，相当于F11
fin(finish) # 退出当前函数
x(examine) # 查看内存
c(continue) # 从一个断点处，直接运行至下一个断点处【VS下不断按F5】
l(list) # 列出文件内容，按ENTER继续显示
b(break) 7 # 设置断点
q(quite) # 退出
i(info) b # 查看信息
d(delete) # 删除所有断点

```

# 查看信息
```shell
info frame # 查看栈帧
info inferiors # 查看进程
info threads  # 查看线程
info (b)breakpoint # 查看断点信息
info display # 查看变量信息
undisplay 1
bt # 看到底层函数调用的过程【函数压栈



l 
l + # 查看当前行之后
l - # 查看当前行之前
```


# 查看变量
```shell
p(print) CountNum
p/x CountNum # 按十六进制显示

# x 按十六进制格式显示变量
# d 按十进制格式显示变量
# u 按十六进制格式显示无符号整型
# o 按八进制格式显示变量
# t 按二进制格式显示变量
# a 按十六进制格式显示变量
# c 按字符格式显示变量
# f 按浮点数格式显示变量
```

```shell
info display # 查看变量信息
display var1 # 跟踪查看一个变量，每次停下来都显示它的值
display {var1,var2} # 查看多个变量的值
undisplay 1 # 指定不显示的变量的序号

# disable
disable display 1 # 使一个自动显示无效
disable display 1 2 3 # 使多个自动显示无效
disable display 10-15  # 使一个范围的自动显示无效
# enable
enable display 1 # 使一个自动显示有效
enable display 1 2 3 # 使多个自动显示有效
enable display 10-15  # 使一个范围的自动显示有效
# delete
delete display 1 # 删除编号1的自动显示
delete display 1 2 3 # 删除多个自动显示，编号1,2,3
delete display 10-15 # 删除范围自动显示，编号10-15
```

## 查看内存
```shell
x /nfu <addr>

# x 是 examine 的缩写，意思是检查。
# n表示要显示的内存单元的个数，比如：20
# f表示显示方式, 可取如下值：


# b表示单字节，
# h表示双字节，
# w表示四字节，
# g表示八字节

x /20xh 0x7fffffffe080
```

# 设置断点
```shell
b 7 # 在当前文件第七行打断点
b main.c:80 # 在指定文件打断点
b main.c:func # 在指定文件指定函数打断点
b thread_test.c:123 thread all # 在该处，所有线程中打断点
info b # 查看断点信息

disable b # 禁用所有断点
enable 1 # 启用断点
disable 1 # 禁用断点
enable once 1  # 启用断点一次
ignore 1 # 忽略1号断点
d(delete) # 删除所有断点
```

# 保存参数
```shell
save breakpoints break.cfg # 保存断点参数
source break.cfg
gcore # 生成core文件
```

# 目录相关
```shell
show dir
dir 目录
set dir 目录1:目录2:目录3
dir
pwd
cd 目录
set substitute-path from-path to-path
```

# 配置

```shell
set print pretty on # 格式化输出结构体


ulimit -c unlimited # 开启coredump
```



Backtrace stopped: previous frame identical to this frame (corrupt stack?)

info sharedlibrary 
disassemble func # 查看反汇编


# gdbserver


```shell
gdbserver 194.168.1.190:6666 infoManager


target remote 194.168.1.18:6666



-exec bt # vscode
```




# 参考资料
[GDB: The GNU Project Debugger](https://sourceware.org/gdb/)
[gdb调试解决找不到源代码的问题](https://blog.csdn.net/albertsh/article/details/107437084)
[linux进阶20——GDB（六）：查看变量命令（print和display）](https://blog.csdn.net/www_dong/article/details/117426132)
[05.用gdb查看和修改内存](https://blog.csdn.net/xiaoduan6/article/details/125082877)
[9.1 Printing Source Lines](https://sourceware.org/gdb/current/onlinedocs/gdb.html/List.html#List)
[gdb显示 (结构体)](https://www.cnblogs.com/friedCoder/articles/12359904.html)
[gdb调试断点的保存](https://blog.csdn.net/yang15225094594/article/details/29599117)
[gdb使用全面](https://blog.csdn.net/m0_37565736/article/details/88741603)
[Linux ulimit命令教程：如何查看和设置系统资源限制(附实例详解和注意事项)](https://blog.csdn.net/u012964600/article/details/137361523)
[linux中core dump开启使用教程](https://blog.csdn.net/javazhouchon/article/details/119335671)
[GCC优化级别以及GDB调试级别](https://c-cpp-note.readthedocs.io/zh-cn/latest/compile_debug)
[makefile工作笔记0002---gcc -O0 -O1 -O2 -O3 四级优化选项及每级分别做什么优化](https://blog.csdn.net/lidew521/article/details/109004007)
[项目经验之谈--栈破坏 -- 案例二](https://blog.csdn.net/LMmcu_2012/article/details/59035730)
[solib-absolute-prefix 和solib-search-path的区别](https://blog.csdn.net/caspiansea/article/details/16798735)
[gcov代码覆盖率测试-原理和实践总结](https://blog.csdn.net/yanxiangyfg/article/details/80989680)
[GDB反向调试：让程序逆序执行，代码调试原来这么简单！体验时光旅行的快感！](https://zhuanlan.zhihu.com/p/673279895)
[程序挂了，GDB调试只显示问号](https://blog.csdn.net/mseaspring/article/details/106346247)
[用图文带你彻底弄懂GDB调试原理](https://cloud.tencent.com/developer/article/1823078)
[Debug Console REPL](https://code.visualstudio.com/Docs/editor/debugging#_debug-console-repl)




