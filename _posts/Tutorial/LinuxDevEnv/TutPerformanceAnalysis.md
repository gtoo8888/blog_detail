---
title: C/C++性能分析工具
date: 2024-10-09 16:09:28
tags:
- 教程
---

# C/C++ 性能分析工具

## 一、perf（Linux 性能分析工具）

`perf` 是 Linux 内置的性能分析工具，可分析 CPU 周期、缓存命中率、函数调用关系等，配合火焰图可直观定位热点。

### 基本用法
```bash
# 录制 30 秒，采样频率 100Hz，分析指定进程
perf record -F 100 -p <PID> -g -- sleep 30

# 分析整个系统（需要 root）
perf record -a -g -- sleep 10

# 查看录制结果
perf report
```

### 生成火焰图（配合 FlameGraph）
```bash
perf record -F 99 -p <PID> --call-graph dwarf -o perf.data -- sleep 60
perf script -i perf.data | ./stackcollapse-perf.pl | ./flamegraph.pl > perf.svg
```

## 二、strace（系统调用追踪）

`strace` 追踪进程执行的所有系统调用，可用于排查程序卡死、文件/网络访问问题。

```bash
# 追踪程序所有系统调用
strace -f ./my_program

# 追踪指定进程（附加方式）
strace -p <PID>

# 统计每种系统调用耗时
strace -c -p <PID>

# 只追踪特定类型的调用（如 open/read/write）
strace -e trace=open,read,write -p <PID>

# 输出到文件
strace -o trace.log -p <PID>
```

## 三、ptrace（进程调试基础）

`ptrace` 是 Linux 下进程调试和系统调用追踪的底层接口，`strace`、`gdb` 等工具底层都依赖它。

```bash
# 附加到进程（需要 root）
ptrace -p <PID>
```

## 四、gprof（GCC 性能分析）

`gprof` 分析程序的函数调用次数和时间分布，需在编译时加 `-pg` 选项。

```bash
# 1. 编译时加 -pg
g++ -pg -o my_program my_program.cpp

# 2. 运行程序（会在当前目录生成 gmon.out）
./my_program

# 3. 分析
gprof my_program gmon.out > profile.txt
gprof -b my_program gmon.out   # 简洁输出
```

## 五、gcov（代码覆盖率）

`gcov` 是 GCC 内置的代码覆盖率工具，配合 lcov/gcovr 可生成 HTML 覆盖率报告。

```bash
# 编译时加覆盖率选项
gcc -fprofile-arcs -ftest-coverage -o my_program my_program.c

# 运行
./my_program   # 生成 .gcda 和 .gcno 文件

# 查看覆盖率
gcov my_program.c   # 生成 .gcov 文件

# 生成 HTML 报告
lcov -c -d build -o coverage.info
genhtml -o html_report coverage.info
```

## 六、valgrind（内存分析）

`valgrind` 是动态二进制插桩工具，最常用的是 `memcheck`（检测内存泄漏和越界访问）。

```bash
# 基本内存检查
valgrind --tool=memcheck ./my_program

# 完整泄漏报告
valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all ./my_program

# 堆分析（massif）
valgrind --tool=massif ./my_program
ms_print massif.out.* > massif.txt
```

## 七、cflow（函数调用关系）

`cflow` 分析 C 程序中的函数调用关系，生成调用树。

```bash
cflow my_program.c
cflow -o callgraph.txt my_program.c  # 输出到文件
```

## 八、工具对比

| 工具 | 用途 | 粒度 | 需要修改代码 |
|---|---|---|---|
| perf | CPU 热点分析 | 函数/指令级 | 否 |
| strace | 系统调用追踪 | 系统调用级 | 否 |
| ptrace | 进程调试 | 指令级 | 否 |
| gprof | 函数耗时分析 | 函数级 | 是（-pg） |
| gcov | 代码覆盖率 | 行级 | 是（-fprofile-arcs） |
| valgrind | 内存错误检测 | 内存访问级 | 否 |

## 参考资料

- [perf 系统性能分析](https://zhuanlan.zhihu.com/p/186208907)
- [perf 生成火焰图](https://www.cnblogs.com/panwenbin-logs/p/18177718)
- [Graphviz 火焰图工具](https://graphviz.org/)
- [GNU cflow](https://www.gnu.org/software/cflow/)
[cflow——C语言函数调用关系生成器](https://blog.csdn.net/lyndon_li/article/details/122163468)
- [strace 用法](https://www.cnblogs.com/ggjucheng/archive/2012/01/08/2316692.html)
## 其他
[代码分析神器：understand、bouml](https://zhuanlan.zhihu.com/p/476563039)
[Calltree](https://directory.fsf.org/wiki/Calltree)
[静态分析C语言生成函数调用关系的利器——calltree](https://cloud.tencent.com/developer/article/1383773)