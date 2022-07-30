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




# 参考文献：
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



