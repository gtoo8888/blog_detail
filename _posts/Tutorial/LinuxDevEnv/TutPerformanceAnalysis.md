---
title: C/C++性能分析工具
date: 2024-10-09 16:09:28
tags:
- 教程
---

# perf
perf record -F 100 -p 19083 -g -- sleep 30


# strace

# ptrace




# 参考资料
## perf
[系统性能分析工具：perf](https://zhuanlan.zhihu.com/p/186208907)
[Linux性能分析工具-perf并生成火焰图 ](https://www.cnblogs.com/panwenbin-logs/p/18177718)
[Graphviz](https://graphviz.org/)
## cflow
[GNU cflow](https://www.gnu.org/software/cflow/)
[cflow——C语言函数调用关系生成器](https://blog.csdn.net/lyndon_li/article/details/122163468)
## strace
[strace]https://www.cnblogs.com/ggjucheng/archive/2012/01/08/2316692.html
## 其他
[代码分析神器：understand、bouml](https://zhuanlan.zhihu.com/p/476563039)
[Calltree](https://directory.fsf.org/wiki/Calltree)
[静态分析C语言生成函数调用关系的利器——calltree](https://cloud.tencent.com/developer/article/1383773)