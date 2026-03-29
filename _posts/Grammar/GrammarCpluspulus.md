---
title: Cpluspulus 语法
date: 2022-03-08 20:34:13
tags:
- 语法
---

## C++11

### explicit

`explicit` 构造函数是用来防止隐式转换的。

### noexcept

从 C++11 开始，`noexcept` 关键字告诉编译器，函数中不会发生异常，有利于编译器做更多优化。如果在运行时 `noexcept` 函数向外抛出了异常，程序会直接终止，调用 `std::terminate()` -> `std::abort()` 终止程序。

```c++
constexpr initializer_list() noexcept
    : _M_array(0), _M_len(0) { }
```

### enable_shared_from_this

`std::enable_shared_from_this` 允许在类的内部获取自己的 `shared_ptr`。

### numeric_limits

```c++
#include <limits>
numeric_limits<double>::max()   // 编译器允许的 double 型数最大值
numeric_limits<int>::max()      // 编译器允许的 int 型数最大值
```

### 雪花算法（Snowflake）

分布式系统中 ID 生成方案。UUID 存在两个弊端：128 位过长、完全随机无法生成递增有序的 ID。Snowflake 雪花算法可以很好地解决这两个问题。

### std::chrono

C++11 新的计时方法。

### std::thread

```c++
std::thread::hardware_concurrency()  // 返回硬件线程数
std::this_thread::get_id()           // 获取当前线程 ID
```

### enum class

### std::shared_ptr / std::lock_guard / std::mutex / std::condition_variable / std::atomic

### constexpr

### static_cast

### std::function

### std::isalnum

### 仿函数与 lambda 表达式

### algorithm

```c++
std::copy_if
std::back_inserter
std::move
```

---

## C++17

### 语法糖

- **结构化绑定**：`auto [cur, pos] = qu.front();`
- **模板参数推导**
- **constexpr if**：在编译时期就可以判断是否要用这个分支，根据输入的类型来判断分支的走向
- **if 初始化语句**：可以像 for 一样，将一些变量的生命周期控制在 if 里面

### 性能提升

- **shared_mutex**
- **string_view**：调用 `strcpy` 函数时，不会进行值传递，而是复制引用
- **try_emplace**：在插入 map 之类的容器时，会先检查是否已经有元素存在了

### 类型系统

- **any**：代替空类型 `void*`，变得类型安全了
- **optional**
- **variant**

### 其他

- **apply**：`std::apply`
- **make_from_tuple**：`std::make_from_tuple`
- **[[nodiscard]]**
- **捕获 \*this**

### C++17 新增

- `std::optional`
- `std::any`
- `std::variant`

---

## 第三方库

### httplib

以 C++11 特性编写的 HTTP/HTTPS 库，使用时只需包含一个头文件。**注意**：此库为线程阻塞，使用时需注意。

### jsoncpp

```c++
#include <json/json.h>
```

---

## 代码注释规范

```c++
@brief   ：简介，简单介绍函数作用
@param   ：介绍函数参数
@return  ：函数返回类型说明
@exception NSException：可能抛出的异常
@author  ：作者
@date    ：时间
@version ：版本
@property：属性介绍
```

---

## clang-format 配置

clang-format 风格选项：llvm, google, chromium, mozilla, webkit。

```bash
clang-format -style=Google -dump-config > .clang-format
clang-format -style=file -i utility/utilities.cpp
```

### Windows 存储路径

```
C:\Users\<user>\.vscode\extensions\ms-vscode.cpptools-1.22.11-win32-x64\LLVM\bin\clang-format.exe
```

### Linux 存储路径

```
/home/<user>/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin
sudo ln -s ~/.vscode-server/extensions/ms-vscode.cpptools-1.23.6-linux-x64/LLVM/bin/clang-format /usr/bin/clang-format


sudo ln -s ~/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin/clang-tidy /usr/bin/clang-tidy
```

### VSCode 配置步骤

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

### 常见问题：vscode使用ctrl+s保存时无法格式化

1. 查看配置，上面的配置都正确Clang_format_path：/usr/bin/clang-format
2. 查看/usr/bin/中配置
```bash
cd /usr/bin/
ls -lh | grep clang
clang-format -> /home/<username>/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin/clang-format # 查看当前链接
clang-format # 无效
cd ~/.vscode-server/extensions/ms-vscode.cpptools-1.22.11-linux-x64/LLVM/bin/ # 目录不存在
cd ~/.vscode-server/extensions/
ls -lh | grep ms-vscode.cpptools # 由于vscode插件更新了，也由于自己的删除重装插件导致路径不正确
ms-vscode.cpptools-1.23.5-linux-x64
ms-vscode.cpptools-1.23.6-linux-x64
```
3. 由于vscode插件更新了，也由于自己的删除重装插件导致路径不正确
4. 删除原来链接，重新链接
```bash
cd /usr/bin/ 
sudo rm -rf clang-format
sudo ln -s ~/.vscode-server/extensions/ms-vscode.cpptools-1.26.3-linux-x64/LLVM/bin/clang-format /usr/bin/clang-format
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



# stdlib
```c++
#include <stdlib.h>

// Dynamic memory management
void *malloc( size_t size );
void *calloc( size_t num, size_t size );
void *realloc( void *ptr, size_t new_size );  // 调整先前使用 malloc()/calloc()/realloc() 开辟的动态内存的大小
void free( void *ptr );
void *aligned_alloc( size_t alignment, size_t size );

// 在缩小内存占用的情况下，realloc 往往比 free 再 malloc 的效率高，因为会原地缩小
```

### string

```c
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

---

## unistd / 系统调用

```c
#include <unistd.h>

// 系统调用
pid_t  fork(void);             // 创建一个子进程的副本
pid_t  getpid(void);           // 获取当前进程的进程ID
pid_t  getppid(void);          // 获取当前进程的父进程ID
int    chdir(const char *);    // 改变当前工作目录
exec();                        // 在当前进程上执行一个新的程序
wait();                        // 等待子进程结束

// 文件操作
int    close(int);             // 关闭文件描述符
ssize_t read(int, void *, size_t);   // 从文件描述符读取数据
ssize_t write(int, const void *, size_t);  // 向文件描述符写入数据
off_t   lseek(int, off_t, int);

// 系统信息
int    gethostname(char *, size_t);   // 获取主机名
sysconf();                             // 获取系统配置信息
```

---

## Linux 内核操作

```c
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
```

# C++
1. std::isalnum
2. void printPinInfoCol(void) const;
3. 仿函数
4. lambda表达式


# C++11
1. std::chrono
2. enum class
3. std::shared_ptr
4. std::thread
   1. std::thread::hardware_concurrency()
5. std::this_thread
   1. std::this_thread::get_id()
6. constexpr
7. static_cast
8. std::function

10. algorithm
   1. std::copy_if
   2. std::back_inserter
   3. std::move
11. 并发
   1. std::mutex
   2. std::condition_variable
   3. std::atomic<bool>
   4. std::lock_guard

constexpr 来定义常量和使用宏 #define

# C++17
1. std::optional
2. std::any
3. std::vairant
---

## cJSON

```c
// 解析 JSON 文件
// 参考文章：
// cJSON 解析 json 文件 - https://www.cnblogs.com/lodger47/p/14758036.html
// C/C++ 程序开发: cJSON 的使用(创建与解析 JSON 数据) - https://cloud.tencent.com/developer/article/1933102
```

---

## 其他

### 默认构造函数

```c
#define __sched __attribute__((__section__(".sched.text")))
```

### 指针声明

C 内指针一般这么写：

```c
int *arr = new int[5];
```

C++ 中一般这么写：

```c
int* arr = new int[5];
```

当在一行内声明多个指针的时候跟 C 写法相同以防止混淆：

```c
int *p, *q, r;    // p, q 是 int 指针，r 是 int
int* a, b, c;     // a 是 int 指针，b, c 是 int
```

### 头文件

```c
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

### 时间与延时

```c
time_t timep;
struct tm *p;

timep = time(NULL);
p = localtime(&timep);

struct timeval tv;
tv.tv_sec = milisec / 1000;
tv.tv_usec = (milisec % 1000) * 1000;
select(0, NULL, NULL, NULL, &tv);

sscanf
sprintf
snprintf
fprintf
vsnprintf
perror
```

### 线程与信号量

```c
pthread_mutex_t mutex;
pthread_mutex_init
pthread_mutex_lock/unlock
pthread_mutex_destroy

// 性能优化宏
      #include <termios.h>

       int tcflush(int fildes, int queue_selector);
       cfsetispeed
       tcgetattr
    struct termios   Opt;


dlopen
dlerror
dlsym
dlclose
dlerror

id = semget(ELOG_FILE_SEM_KEY, 1, IPC_CREAT | IPC_EXCL | 0666);
semctl
semid == -1 ? -1 : semop(semid, (struct sembuf *)&up, 1);
#define likely(x) __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)
```

### 文件操作

```c
fseek(fp2, 0L, SEEK_END);
system("cp -r /run/log/acMeter/UDP_Data.log /log/app/acMeter/");
file_size = ftell(fp2);
fp2 = fopen(local_cfg2.name, "w+");
fflush(fp);
fwrite(log, size, 1, fp2);
fclose(tmp_fp);

open()
close()
write()
lseek()
```

### 动态库

```c
dlopen
dlerror
dlsym
dlclose
dlerror
```

### IPC 信号量

```c
id = semget(ELOG_FILE_SEM_KEY, 1, IPC_CREAT | IPC_EXCL | 0666);
semctl
semid == -1 ? -1 : semop(semid, (struct sembuf *)&up, 1);
```

### 类型转换

```c
return (int)strtol(valstr, NULL, 0);
return (int)atof(valstr);
if (strchr(content, '=') != NULL)
```

---

# 参考资料

- [C++ explicit 关键字](https://zhuanlan.zhihu.com/p/52152355)
- [解决 VSCode 编写 C++11 代码报红问题](https://blog.csdn.net/weixin_42292229/article/details/113767569)
- [C++11 带来的新特性 （3）—— 关键字noexcept](https://www.cnblogs.com/sword03/p/10020344.html)
- [C++ limits头文件的用法numeric_limits](https://blog.csdn.net/CHYabc123456hh/article/details/117260306)
- [C++中lock_guard的学习](https://blog.csdn.net/CHYabc123456hh/article/details/111317404)
- [C++ std::lock_guard详解](https://jishuin.proginn.com/p/763bfbd6f671)
- [一文详解OpenCV中的CUDA模块](https://zhuanlan.zhihu.com/p/358648337)
- [「直播回放」腾讯工程师：C++17在业务代码中最好用的十个特性](https://www.zhihu.com/zvideo/1523417372937027584)
- [Qt开源作品21-日志重定向输出类](https://www.cnblogs.com/feiyangqingyun/p/12970350.html)
- [C++多线程之semaphore](https://blog.csdn.net/qq_41949047/article/details/108324225)
- [C++11中enable_shared_from_this的用法解析](https://blog.csdn.net/breadheart/article/details/112451022)
- [std::chrono::duration详解](https://blog.csdn.net/t114211200/article/details/78029553)
- [C++ 11 多线程下std::unique_lock与std::lock_guard的区别和用法](http://t.zoukankan.com/moodlxs-p-10111843.html)
- [C++ 条件变量(condition_variable)](https://cloud.tencent.com/developer/article/1584067)
- [httplib库的使用(支持http/https)（一）](https://blog.csdn.net/harry49/article/details/115763383)
- [注释规范：详细](https://www.cnblogs.com/lyggqm/p/4629711.html)
- [注释规范](https://blog.csdn.net/lxj362343/article/details/105711524/)
- [C++11 新的计时方法——std::chrono 大法好](https://blog.csdn.net/u013390476/article/details/50209603)
- [C++模板全特化、偏特化](https://blog.csdn.net/m_buddy/article/details/72973207)
- [C语言指针，*符号应该靠近类型写，还是靠近名称写](https://www.zhihu.com/question/492439854/answer/2176443328)
- [enum和std::string的自动互相转换](https://zhuanlan.zhihu.com/p/607465499)
- [深入C++ std:chrono设计原理并造一个简化版](https://zhuanlan.zhihu.com/p/608961346)
- [Opening KeynoteMeetingC++2019 - HowardHinnant - Design Rationale for the chronoL](https://www.bilibili.com/video/BV18741127Ny/?vd_source=76dff3ae3b42b00d067c0921bf6859ca)
- [Meeting C++ Slide listing](https://meetingcpp.com/mcpp/slides/)

## 代码格式化

- [Clang-Format用法详解](https://zhuanlan.zhihu.com/p/641846308)
- [Clang-Format Style Options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)
- [Clang-Format用法详解](https://mp.weixin.qq.com/s/mwMsffSrouPaswzG9rgdmg)
- [vs code 技巧：使用clang-format来格式化代码](https://www.cnblogs.com/simpleGao/p/17022517.html)
- [VS Code + Clang-format 格式化代码](https://zhuanlan.zhihu.com/p/356143396)

## GUI显示

- [使用 ncurses 在你的 Linux 屏幕上定位文本 | Linux 中国](https://zhuanlan.zhihu.com/p/407239430)
- [Writing Programs with NCURSES](https://invisible-island.net/ncurses/ncurses-intro.html#introduction)
- [交叉编译ncurses库](https://blog.csdn.net/zadile1/article/details/52025818)
- [解决从源码编译ncurses6.0编译lib_gen.c报错的问题](https://www.cnblogs.com/kokoer-wu/p/5289843.html)

## 内核操作

- [33 Linux内核高精度定时器实现延时](https://blog.csdn.net/chasing_chasing/article/details/90229183)
- [一文入门linux内核高精度定时器hrtimer机制](https://zhuanlan.zhihu.com/p/450089796)
- [open(2) — Linux manual page](https://www.man7.org/linux/man-pages/man2/open.2.html)
- [深入了解Linux内核中文件系统之open函数（上）](https://zhuanlan.zhihu.com/p/636620782)
- [openat与open的区别及用法示例](https://www.cnblogs.com/BinBinStory/p/7400993.html)

## cJSON

- [cJSON解析json文件](https://www.cnblogs.com/lodger47/p/14758036.html)
- [C/C++程序开发: cJSON的使用(创建与解析JSON数据)](https://cloud.tencent.com/developer/article/1933102)
- [cjson库解析json文件](https://yang12342.github.io/articles/%E5%B8%B8%E8%A7%81%E6%96%87%E4%BB%B6%E6%96%B9%E6%B3%95/cjson/)

## 未分类

- [关于c语言中malloc和remalloc函数的分析](https://blog.csdn.net/suliangkuanjiayou/article/details/83477415)
- [mcheck(3) — Linux manual page](https://www.man7.org/linux/man-pages/man3/mcheck.3.html)
- [__THROW是什么东西？](https://blog.csdn.net/lanmanck/article/details/6856168)
- [【Linux系统编程】Linux的系统库中的unistd.h头文件的作用](https://blog.csdn.net/MonsterUFO/article/details/131745212)
- [unistd.h(0p) — Linux manual page](https://www.man7.org/linux/man-pages/man0/unistd.h.0p.html)
- [协程库项目（CPP） | 代码随想录知识星球](https://www.programmercarl.com/other/project_coroutine.html)
- [新版C++学习路线](https://articles.zsxq.com/id_n4jcuih49kad.html)
- [代码随想录项目精讲-协程库（CPP）正式发布。xck3582thl](https://wx.zsxq.com/group/88511825151142/topic/211425484228181)
- [https://github.com/youngyangyang04/coroutine-lib](https://github.com/youngyangyang04/coroutine-lib)
- [would learning Qt6 improve my overall C++ skills?](https://www.reddit.com/r/cpp_questions/comments/yedlyl/would_learning_qt6_improve_my_overall_c_skills/?rdt=61683)
- [How can I boost my career as C++ Qt Developer](https://www.quora.com/How-can-I-boost-my-career-as-C++-Qt-Developer)
- [[SOLVED] Beginner: How to use Qt and C++ the right way?](https://forum.qt.io/topic/25987/solved-beginner-how-to-use-qt-and-c-the-right-way)
- [现代化 C++ 开发工具 CLion:从入门到精通](https://zhuanlan.zhihu.com/p/97175720)

## 好站推荐

- [C++ Conference](https://cppcon.org/)
- [Pure C++](http://www.purecpp.cn/)
- [ISO C++](https://isocpp.org/)
- [Fluent C++](https://www.fluentcpp.com/)
- [Awesome C++](https://awesomecpp.com/)
- [Abseil Tips](https://abseil.io/tips/)
