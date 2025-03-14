---
title: Cpluspulus 语法
date: 2022-03-08 20:34:13
tags:
- 语法
---

# 不会的知识点的罗列


# C++11

# std::thread
C++11中加入了\<thread>头文件，此头文件主要声明了std::thread线程类



# std::mutex
C++11中新增了\<mutex>，它是C++标准程序库中的一个头文件，定义了C++11标准中的一些互斥访问的类与方法等


# explicit
explicit构造函数是用来防止隐式转换的



# noexcept
从C++11开始，我们能看到很多代码当中都有关键字noexcept。比如下面就是std::initializer_list的默认构造函数，其中使用了noexcept。

      constexpr initializer_list() noexcept
      : _M_array(0), _M_len(0) { }
该关键字告诉编译器，函数中不会发生异常,这有利于编译器对程序做更多的优化。
如果在运行时，noexecpt函数向外抛出了异常（如果函数内部捕捉了异常并完成处理，这种情况不算抛出异常），程序会直接终止，调用std::terminate()函数，该函数内部会调用std::abort()终止程序。



## Snowflake 雪花算法
分布式系统中ID生成方案，比较简单的是UUID（Universally Unique Identifier，通用唯一识别码），但是其存在两个明显的弊端：一、UUID是128位的，长度过长；二、UUID是完全随机的，无法生成递增有序的UUID。而现在流行的基于 Snowflake 雪花算法的ID生成方案就可以很好的解决了UUID存在的这两个问题


## numeric_limits
numeric_limits<double>::max ()是函数，返回编译器允许的 double 型数 最大值。
类似的 numeric_limits<int>::max () 返回 编译器允许的 int 型数 最大值。
需包含头文件 #include <limits>  imits是STL提供的头文件（包含numeric_limits模板类），limit.h是C语言提供的头文件（包含一些宏定义）


## std::lock_guard
lock_guard
锁守卫是一个管理mutex对象的对象，使其始终处于锁定状态。
在构造时，mutex对象被调用线程锁定，在销毁时，mutex被解锁。这是最简单的锁，作为一个自动持续时间的对象，它的作用特别大，可以持续到上下文结束。通过这种方式，它可以保证mutex对象在发生异常时被正确解锁。
但请注意，lock_guard对象并不以任何方式管理mutex对象的寿命：mutex对象的持续时间至少应延长到锁定它的lock_guard被破坏为止。
程序在std::lock_guard生命周期内加锁和解锁，其中加锁和解锁分别在构造函数和析构函数中完成，具体如何我们看下std::lock_guard的构造函数和析构函数。


## cv::gpu::GpuMat


## std::move



## std::enable_shared_from_this
在类的内部获取自己的 shared_ptr 这件事情而存在的。


## std::chrono::duration
std::chrono::duration(下文简称duration)是标准库中用来代表时间段的一个类模板



## std::unique_lock
功能比std::unique_group更多


## std::condition_variable
 condition_variable是一个类，搭配互斥量mutex来用，


# C++17

## 1.语法糖
### 结构化绑定
### 模板参数推导
### constexpr if
在编译时期就可以判断是否要用这个分支，根据输入的类型来判断分支的走向

### if初始化语句
可以像for一样，将一些变量的生命周期控制在if里面

## 2.性能提升
### shared_mutex

### string_view
在调用一些strcpy函数的时候，不会进行值传递，而是会复制引用


### try_emplace
在插入map之类的数组的时候，会先检查是否已经有元素存在了


## 3.类型系统
### any
代替了空类型void*，变得类型安全了

### optinal

### variant

## 4.其他

### apply

### make_from_tuple

### [[nodiscard]]

### 捕获*this

## 结构化绑定
auto [cur, pos] = qu.front();
https://blog.csdn.net/yaoshenjie/article/details/99288495


# 第三方库

## httplib库简介
httplib库简介
httplib库是一个以C++11特性编写的库，所以编译器也需要能支持C++11的。库在使用时只需包含一个头文件即可，非常方便。

下载地址

注意：此库为线程阻塞，使用时还请注意

##  jsoncpp库
#include <json/json.h>


# 注释规范

@brief  @param  @return @author @date @version是代码书写的一种规范
@brief  ：简介，简单介绍函数作用
@param  ：介绍函数参数
@return：函数返回类型说明
@exception NSException 可能抛出的异常.
@author zhangsan：  作者
@date 2011-07-27 22:30:00 ：时间
@version 1.0 ：版本  
@property ：属性介绍



# std::recursive_mutex
recursive_mutex



# 精确到ns的计时方法
std::chrono



# C++格式化工具 clang-format

llvm, google, chromium, mozilla, webkit

clang-format -style=Google -dump-config > .clang-format
clang-format -style=file -i utility/utilities.cpp

```bash
# win存储路径
C:\Users\<user>\.vscode\extensions\ms-vscode.cpptools-1.22.11-win32-x64\LLVM\bin\clang-format.exe
# linux存储路径
/home/<user>/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin
sudo ln -s ~/.vscode-server/extensions/ms-vscode.cpptools-1.23.6-linux-x64/LLVM/bin/clang-format /usr/bin/clang-format


sudo ln -s ~/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin/clang-tidy /usr/bin/clang-tidy
```

# VSCode使用clang-format配置

1. setting->搜索format->勾选format on save 
2. C_Cpp: Clang_format_fallback Style 
   1. 当设置clang-format且没有.clang-format文件时，会使用这里选择的默认设置来设置格式
3. C_Cpp: Clang_format_path：
   1. clang-format.exe的绝对路径
   2. /usr/bin/clang-format
4. C_Cpp: Clang_format_style：
   1. .clang-format 文件加载样式
   2. 文件目录下
5. 右下角{}
   1. 选择要使用的格式化格式
   2. 不要安装clang-format插件，会和C++的格式化插件冲突

# 在2周后，忽然vscode使用ctrl+s保存时无法格式化

1. 查看配置，上面的配置都正确Clang_format_path：/usr/bin/clang-format
2. 查看/usr/bin/中配置
```bash
cd /usr/bin/ 
ll | grep clang
clang-format -> /home/<username>/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin/clang-format # 查看当前链接
clang-format # 无效
cd /home/<username>/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin/ # 目录不存在
cd /home/<username>/.vscode-server/extensions/
ll # 由于vscode插件更新了，也由于自己的删除重装插件导致路径不正确
ms-vscode.cpptools-1.23.5-linux-x64
ms-vscode.cpptools-1.23.6-linux-x64
```
3. 由于vscode插件更新了，也由于自己的删除重装插件导致路径不正确
4. 删除原来链接，重新链接
```bash
cd /usr/bin/ 
sudo rm -rf clang-format
sudo ln -s ~/.vscode-server/extensions/ms-vscode.cpptools-1.23.6-linux-x64/LLVM/bin/clang-format /usr/bin/clang-format
```


# 暂存

C++11 default构造函数
#define __sched		__attribute__((__section__(".sched.text")))

C内 指针一般是这么写
int *arr = new int[5];
在C++中一般这么写
int* arr = new int[5];
但当在一行内声明多个指针的时候跟C写法相同以防止混淆
int *p, *q, r;    //p, q是int指针, r是int
int* a, b, c;     //a是int指针, b, c是int


# 头文件
```c++
// 常用
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <math.h>

#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <pthread.h>

#include <termio.h>

// 不常用
#include <ctype.h>
#include <stdint.h>
#include <time.h>
```

# stdlib
```c++
#include <stdlib.h>
// /usr/include/stdlib.h

// Dynamic memory management
void *malloc( size_t size );
void *calloc( size_t num, size_t size );
void *realloc( void *ptr, size_t new_size ); // 调整先前使用malloc(),calloc()或realloc()函数开辟的动态内存的大小
void free( void *ptr );
void *aligned_alloc( size_t alignment, size_t size );

```
在缩小内存占用的情况下，realloc往往比free再malloc的效率高，因为会原地缩小

# string

```c++
#include <string.h>

// Copying
void * memcpy ( void * destination, const void * source, size_t num );
void * memmove ( void * destination, const void * source, size_t num );
char * strcpy ( char * destination, const char * source );
char * strncpy ( char * destination, const char * source, size_t num );

// Concatenation
char * strcat ( char * destination, const char * source );
char * strncat ( char * destination, const char * source, size_t num );

// Comparison
int memcmp ( const void * ptr1, const void * ptr2, size_t num );
int strcmp ( const char * str1, const char * str2 );
int strncmp ( const char * str1, const char * str2, size_t num );

// Other
void * memset ( void * ptr, int value, size_t num );
size_t strlen ( const char * str );

```

```c++
#include <string.h>
// 内存操作函数
void * memcpy ( void * destination, const void * source, size_t num );
void * memmove ( void * destination, const void * source, size_t num );
int memcmp ( const void * ptr1, const void * ptr2, size_t num );
void * memset ( void * ptr, int value, size_t num );



// 字符串操作函数
char * strcpy ( char * destination, const char * source );
char * strcat ( char * destination, const char * source );
int strcmp ( const char * str1, const char * str2 );
size_t strlen ( const char * str );

```


```c++
#include <unistd.h>

// 系统调用
pid_t        fork(void);  // 创建一个子进程的副本
pid_t        getpid(void);  // 获取当前进程的进程ID
pid_t        getppid(void);  // 获取当前进程的父进程ID
int          chdir(const char *); // 改变当前工作目录
exec()：用于在当前进程上执行一个新的程序。
wait()：等待子进程结束。

// 文件操作
int          close(int); // 关闭文件描述符 
ssize_t      read(int, void *, size_t);  // 从文件描述符读取数据
ssize_t      write(int, const void *, size_t);  // 向文件描述符写入数据
off_t        lseek(int, off_t, int);

close()：

// 系统信息
int          gethostname(char *, size_t); // 获取主机名。
sysconf()：获取系统配置信息。

```
## 内核

mmap
ioctl
fstat
futex
brk
openat
access
read
stat
mknod

# 参考资料
[C++ explicit 关键字]https://zhuanlan.zhihu.com/p/52152355
[解决 VSCode 编写 C++11 代码报红问题]https://blog.csdn.net/weixin_42292229/article/details/113767569
[C++11 带来的新特性 （3）—— 关键字noexcept]https://www.cnblogs.com/sword03/p/10020344.html
[C++ limits头文件的用法numeric_limits]https://blog.csdn.net/CHYabc123456hh/article/details/117260306
[C++中lock_guard的学习]https://blog.csdn.net/CHYabc123456hh/article/details/111317404
[C++ std::lock_guard详解]https://jishuin.proginn.com/p/763bfbd6f671
[一文详解OpenCV中的CUDA模块]https://zhuanlan.zhihu.com/p/358648337
[「直播回放」腾讯工程师：C++17在业务代码中最好用的十个特性]https://www.zhihu.com/zvideo/1523417372937027584
[Qt开源作品21-日志重定向输出类]https://www.cnblogs.com/feiyangqingyun/p/12970350.html
[C++多线程之semaphore]https://blog.csdn.net/qq_41949047/article/details/108324225
[C++11中enable_shared_from_this的用法解析]https://blog.csdn.net/breadheart/article/details/112451022
[std::chrono::duration详解]https://blog.csdn.net/t114211200/article/details/78029553
[C++ 11 多线程下std::unique_lock与std::lock_guard的区别和用法]http://t.zoukankan.com/moodlxs-p-10111843.html
[C++ 条件变量(condition_variable)]https://cloud.tencent.com/developer/article/1584067
[httplib库的使用(支持http/https)（一）]https://blog.csdn.net/harry49/article/details/115763383
[注释规范：详细]https://www.cnblogs.com/lyggqm/p/4629711.html
[注释规范]https://blog.csdn.net/lxj362343/article/details/105711524/
[C++11 新的计时方法——std::chrono 大法好]https://blog.csdn.net/u013390476/article/details/50209603
[C++模板全特化、偏特化]https://blog.csdn.net/m_buddy/article/details/72973207
[C语言指针，*符号应该靠近类型写，还是靠近名称写](https://www.zhihu.com/question/492439854/answer/2176443328)
[enum和std::string的自动互相转换](https://zhuanlan.zhihu.com/p/607465499)
[深入C++ std:chrono设计原理并造一个简化版](https://zhuanlan.zhihu.com/p/608961346)
[Opening KeynoteMeetingC++2019 - HowardHinnant - Design Rationale for the chronoL](https://www.bilibili.com/video/BV18741127Ny/?vd_source=76dff3ae3b42b00d067c0921bf6859ca)
[Meeting C++ Slide listing](https://meetingcpp.com/mcpp/slides/)
## 代码格式化
[Clang-Format用法详解](https://zhuanlan.zhihu.com/p/641846308)
[Clang-Format Style Options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)
[Clang-Format用法详解](https://mp.weixin.qq.com/s/mwMsffSrouPaswzG9rgdmg)
[vs code 技巧：使用clang-format来格式化代码](https://www.cnblogs.com/simpleGao/p/17022517.html)
[VS Code + Clang-format 格式化代码](https://zhuanlan.zhihu.com/p/356143396)
## GUI显示
[使用 ncurses 在你的 Linux 屏幕上定位文本 | Linux 中国](https://zhuanlan.zhihu.com/p/407239430)
[Writing Programs with NCURSES](https://invisible-island.net/ncurses/ncurses-intro.html#introduction)
[交叉编译ncurses库](https://blog.csdn.net/zadile1/article/details/52025818)
[解决从源码编译ncurses6.0编译lib_gen.c报错的问题](https://www.cnblogs.com/kokoer-wu/p/5289843.html)
## 内核操作
[33 Linux内核高精度定时器实现延时](https://blog.csdn.net/chasing_chasing/article/details/90229183)
[一文入门linux内核高精度定时器hrtimer机制](https://zhuanlan.zhihu.com/p/450089796)
[open(2) — Linux manual page](https://www.man7.org/linux/man-pages/man2/open.2.html)
[深入了解Linux内核中文件系统之open函数（上）](https://zhuanlan.zhihu.com/p/636620782)
[openat与open的区别及用法示例](https://www.cnblogs.com/BinBinStory/p/7400993.html)
## cJSON
[cJSON解析json文件](https://www.cnblogs.com/lodger47/p/14758036.html)
[C/C++程序开发: cJSON的使用(创建与解析JSON数据)](https://cloud.tencent.com/developer/article/1933102)
[cjson库解析json文件](https://yang12342.github.io/articles/%E5%B8%B8%E8%A7%81%E6%96%87%E4%BB%B6%E6%96%B9%E6%B3%95/cjson/)
## 未分类
[关于c语言中malloc和remalloc函数的分析](https://blog.csdn.net/suliangkuanjiayou/article/details/83477415)
[mcheck(3) — Linux manual page](https://www.man7.org/linux/man-pages/man3/mcheck.3.html)
[__THROW是什么东西？](https://blog.csdn.net/lanmanck/article/details/6856168)
[【Linux系统编程】Linux的系统库中的unistd.h头文件的作用](https://blog.csdn.net/MonsterUFO/article/details/131745212)
[unistd.h(0p) — Linux manual page](https://www.man7.org/linux/man-pages/man0/unistd.h.0p.html)
[协程库项目（CPP） | 代码随想录知识星球](https://www.programmercarl.com/other/project_coroutine.html)
[新版C++学习路线](https://articles.zsxq.com/id_n4jcuih49kad.html)
[代码随想录项目精讲-协程库（CPP）正式发布。xck3582thl](https://wx.zsxq.com/group/88511825151142/topic/211425484228181)
https://github.com/youngyangyang04/coroutine-lib

[would learning Qt6 improve my overall C++ skills?](https://www.reddit.com/r/cpp_questions/comments/yedlyl/would_learning_qt6_improve_my_overall_c_skills/?rdt=61683)
[How can I boost my career as C++ Qt Developer](https://www.quora.com/How-can-I-boost-my-career-as-C++-Qt-Developer)
[[SOLVED] Beginner: How to use Qt and C++ the right way?](https://forum.qt.io/topic/25987/solved-beginner-how-to-use-qt-and-c-the-right-way)
[现代化 C++ 开发工具 CLion:从入门到精通](https://zhuanlan.zhihu.com/p/97175720)
## 好的网站
https://cppcon.org/
http://www.purecpp.cn/
https://isocpp.org/
https://www.fluentcpp.com/
https://awesomecpp.com/
https://abseil.io/tips/