---
title: Cpluspulus 语法
date: 2022-03-08 20:34:13
tags:
- 语法
---




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


# 参考文献：
vscode配置C++11问题

https://blog.csdn.net/weixin_42292229/article/details/113767569
https://www.cnblogs.com/sword03/p/10020344.html


