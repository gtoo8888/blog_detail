---
title: GNU教程
date: 2024-10-09 16:15:17
tags:
- 教程
---

# GNU 工具链

GNU 项目提供了整套 C/C++ 开发工具链，是 Linux 下软件编译的基础。
glibc  是 Linux 下的 GUN C 函数库。
libc Linux 下的 ANSI C 函数库

## 核心工具 Software development 

| 工具 | 说明 |
|---|---|
| **glibc** | GNU C 函数库，Linux 系统的标准 C 库（libc 的实现之一） |
| **libiconv** | 字符编码转换库 |
| **gcc** | GNU C/C++ 编译器 |
| **g++** | GNU C++ 编译器（实际上是对 gcc 的封装） |
| **gdb** | GNU 调试器 |
| **make** | 构建自动化工具 |
| **autoconf** | 自动生成 configure 脚本 |
| **patch** | 补丁应用工具 |
Bash
Cflow
Patch

## 归档与压缩 Archiving

| 工具 | 说明 |
|---|---|
| **tar** | 打包/解包工具，支持 gzip/bzip2/xz 压缩 |
| **gzip / gunzip** | GNU 压缩工具（.gz） |
| **cpio** | 归档工具，比 tar 更灵活 |

## 常用 Binutils（二进制工具）

| 工具 | 说明 |
|---|---|
| **as** | 汇编器 |
| **ld** | 链接器 |
| **ar** | 创建和管理静态库（.a 文件） |
| **nm** | 查看目标文件符号表 |
| **objcopy** | 复制和转换目标文件 |
| **objdump** | 反汇编目标文件/查看目标文件信息 |
| **readelf** | 读取 ELF 文件格式信息 |
| **size** | 查看程序各段大小 |
| **strings** | 查看文件中的可打印字符串 |
| **strip** | 去除符号表，减小可执行文件体积 |
| **addr2line** | 地址转文件名/行号 |
| **c++filt** | C++ 符号名解混淆 |

## 文本处理 Text creation and manipulation 

| 工具 | 说明 |
|---|---|
| **sed** | 流编辑器，用于文本替换和转换 |
| **less** | 分页查看文件（支持搜索） |

## 编辑器 Editors

| 工具 | 说明 |
|---|---|
| **emacs** | 功能强大的文本编辑器（近乎完整的开发环境） |
| **nano** | 简单易用的命令行文本编辑器 |

## 编码转换

```bash
# 查看支持的编码列表
iconv -l

# 转换文件编码
iconv -f GBK -t UTF-8 input.txt -o output.txt
```

## 参考资料

- [libc、glibc 和 glib 的关系](https://blog.csdn.net/yasi_xi/article/details/9899599)
- [glibc 源码分析：系统调用](https://zhuanlan.zhihu.com/p/28984642)
- [GNU Manuals Online](https://www.gnu.org/manual/manual.html)
