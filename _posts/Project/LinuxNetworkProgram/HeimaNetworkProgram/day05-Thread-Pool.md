---
title: day05-线程池
date: 2022-04-02 17:01:50
tags:
- Linux网络编程
---

什么是线程池?
    是一个抽象的概念,若干个线程组合到一起,形成线程池.

为什么需要线程池?
多线程版服务器一个客户端就需要创建一个线程!若客户端太多，显然不太合适.

什么时候需要创建线程池呢?
简单的说，如果一个应用需要频繁的创建和销毁线程，而任务执行的时间又非常短，这样线程创建和销毁的带来的开销就不容忽视，这时也是线程池该出场的机会了。如果线程创建和销毁时间相比任务执行时间可以忽略不计，则没有必要使用线程池了。
实现的时候类似于生产者和消费者


线程池和任务池:
任务池相当于共享资源，所以需要使用互斥锁，当任务池中没有任务的时候需要让线程阻塞，所以需要使用条件变量.


线程相关函数:
1 pthread_create
2 pthread_detach
pthread_attr_t attr;
pthread_attr_init
pthread_attr_setdetachstate
3 pthread_exit

涉及到共享资源:(主线程和各个子线程共享任务池)
互斥锁相关函数:
pthread_mutex_t mutex;
pthread_mutex_init
pthread_mutex_lock/unlock
pthread_mutex_destroy

能够是线程引起阻塞的函数:
若任务池已满,主线程应该阻塞等待子线程处理任务,此时主线程需要阻塞等待
若任务池空了，子线程应该阻塞等待,等待主线程往任务池中添加任务;
pthread_cond_wait
pthread_cond_signal


子线程负责从任务池冲获取任务,每一个任务有一个回调函数每王个回调函数执行下同操作.


































