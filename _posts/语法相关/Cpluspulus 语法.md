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
[C++11中enable_shared_from_this的用法解析]https://blog.csdn.net/breadheart/article/details/112451022
[std::chrono::duration详解]https://blog.csdn.net/t114211200/article/details/78029553
[C++ 11 多线程下std::unique_lock与std::lock_guard的区别和用法]http://t.zoukankan.com/moodlxs-p-10111843.html
[C++ 条件变量(condition_variable)]https://cloud.tencent.com/developer/article/1584067
[httplib库的使用(支持http/https)（一）]https://blog.csdn.net/harry49/article/details/115763383
[注释规范：详细]https://www.cnblogs.com/lyggqm/p/4629711.html
[注释规范]https://blog.csdn.net/lxj362343/article/details/105711524/


