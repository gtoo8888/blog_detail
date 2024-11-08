---
title: Golang 面试
date: 2022-06-27 23:29:24
tags:
- 面试
---



Go实现了两种并发形式
第一种是，多线程共享内存。就是C++中实现的并发模型，他们线程间通信都是通过共享内存的方式来进行的。在访问共享数据（例如数组、Map、或者某个结构体或对象）的时候，通过锁来访问。Go中也实现了传统的线程并发模型。
另外一种是Go语言特有的，也是Go语言推荐的：CSP（communicating sequential processes）并发模型。


Go的CSP并发模型，是通过goroutine和channel来实现的。

goroutine 是Go语言中并发的执行单位。有点抽象，其实就是和传统概念上的”线程“类似，可以理解为”线程“。
channel是Go语言中各个并发结构体(goroutine)之前的通信机制。 通俗的讲，就是各个goroutine之间通信的”管道“，有点类似于Linux中的管道。




# GMP模型介绍一下
go runtinue使用了一个MPG模型来实现
M指的是Machine，一个M直接关联了一个内核线程。所有的G(goroutine)任务最终都会在M上执行。
P指的是processor，代表了M所需的上下文环境，也是处理用户级代码逻辑的处理器。它负责衔接M和G的调度上下文，将等待执行的G与M对接。
1．代表一个处理器，每个运行的M都必须绑定一个P。P的个数是GOMAXPOCS，最大为256，在程序启动时固
定，一般不去修改。
2.GOMAXPOCS默认值是当前电脑的核心数，单核CPU就只能设置为1，如果设置>1，在GOMAXPOCS函数中
也会被修改为1。
3.M和P的个数不一定一样多，M>=P，每一个P都会保存本地的G任务队列，另外还有一个全局的G任务队列。G
任务队列可以认为线程池中的线程队列。

G指的是Goroutine，代表一个goroutine对象，每次go调用的时候都会创建一个G对象，其实本质上也是一种轻量级的线程。包括了调用栈，重要的调度信息，例如channel等。

# go rutine调度流程
1. 启动一个goroutine
也就是创建一个G对象，然后加入到本地队列或者全局队列中

goroutineฎ按照抢占式进⾏调度，一个goroutine最多执行10ms就会换下一个
2. 查找是否有空闲的P
如果没有就直接返回
如果有，就用系统API创建一个M(线程)
3. 由这个刚创建的M循环执行能找到的G任务
4. G任务执行的循序
先从本地队列找，本地没有找到就从全局队列找，如果还没有找到就去其他P中找
5. 所有的G任务的执行是按照go的调用顺序执行的
6. 如果一个系统调用或者G任务执行的时间太长，就会一直占用这个线程



# slice 底层和扩容

# defer 应用和底层

# 内存管理

# 垃圾回收

# 

熟悉docker，k8s，了解两者基本原理，了解devops实施方案，CICD，服务发现，灰度发布等

# 语法关键点

defer关键字
defer和go一样都是Go语言提供的关键字。defer用于资源的释放，会在函数返回之前进行调用。一般采用如下模式：
defer是在return之前执行的。这个在 官方文档中是明确说明了的。要使用defer时不踩坑，最重要的一点就是要明白，return xxx这一条语句并不是一条原子指令!
函数返回的过程是这样的：先给返回值赋值，然后调用defer表达式，最后才是返回到调用函数中。
defer表达式可能会在设置函数返回值之后，在返回到调用函数之前，修改返回值，使最终的函数返回值与你想象的不一致。
https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.4.html

make关键字
chan关键字

反射机制

多进程go机制


# 参考资料
[全面的golang教程]http://c.biancheng.net/golang/
[defer关键字]https://tiancaiamao.gitbooks.io/go-internals/content/zh/03.4.html
[GORM docs]https://gorm.io/zh_CN/docs/index.html



