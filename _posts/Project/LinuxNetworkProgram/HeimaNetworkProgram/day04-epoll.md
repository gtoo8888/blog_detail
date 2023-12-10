---
title: day04-epoll函数
date: 2022-04-02 19:39:01
tags:
- Linux网络编程
---


1了解poll函数
2熟练使用epoll多路IO模型
3了解epoll ET/LT触发模式并实现
4理解epoll,边缘非阻塞模式并实现
5了解epoll反应堆模型设计思想
6能看懂epoll反应堆模型的实现代码


# poll
poll是介于select与epoll之间的模型，实际开发的过程中用的比较少
和select相比没有本质的改变

linux下epoll
UNIX只能用select


 int poll(struct pollfd *fds, nfds_t nfds, int timeout);
函数说明:跟select类似，委托内核监控可读，可写，异常事件函数
参数:
```
    fds:一个struct pollfd结构体数组的首地址
    struct pollfd {
        int   fd;         //要监控的文件描述符，如果fd为-1表示内核不再监控
        short events;     //输入参数，表示告诉内核要监控的事件，读事件，写事件,异常事件
        short revents;    ;//输出参数，表示内核告诉应用程序有哪些文件描述符有事件发生
    };
    events/revents:
        POLLIN:可读事件
        POLLOUT:可写事件
        POLLERR:异常事件
    nfds:告诉内核监控的范围，具体是:数组下标的最大值+1
    timedout:
        =0:不阻塞，立刻返回
        -1:表示一直阻塞,直到有事件发生
        >0:表示阻塞时长，在时长范围内若有事件发生会立刻返回;
        如果超过了时长也会立刻返回
    函数返回值:
        >0:发生变化的文件描述符的个数
        =0:没有文件描述符发生变化
        -1:表示异常
```
说明:
1 当poll函数返回的时候，结构体当中的fd,和events没有发生变化，究竞有没有事件发生由revents.来判断，所以poll是请求和返回分离.
2 struct pollfd结构体中的fd成员若赋值为-1，则poll不会监控.
3相对于select, poll没有本质上的改变;但是poll可以突破1024的限制.
在/proc/svs/fs/file-max查看一个进程可以打开的socket描述符上限.
如果需要可以修改配置文件:/etc/security/limits.conf
s
加入如下配置信息，然后重启终端即可生效.
* soft nofile 1024
* hard nofile 10000o
soft和 hard分别表示ulimit命令可以修改的最小限制和最大限制



# 多路I0-epoll

将检测文件描述符的变化委托给内核去处理，然后内核将发生变化的文件描述符对应的事件返回给应用程序。
linux下编程，肯定用这个了
告诉有几个发生了变化，精准的告诉哪个有变化
epoll底层实现用的红黑二叉树，也就是平衡二叉树

## epoll_create()
int epoll_create(int size);
### 函数说明:
创建一棵epoll树,返回一个树根节点
### 函数参数:
size:必须传一个大于0的数
### 返回值:
返回个文件描述符,这个文件描述符就表示epoll树的树根节点.


## epoll_ctl()
int epoll_ctl(int epfd, int op, int fd, struct epoll_event *event);
### 函数说明:
将fd上epoll树,从树上删除和修改
### 函数参数:
epfd: epoll树的树根节点
op:
    EPOLL_CTL_ADD:上树操作
    EPOLL_CTL_MOD:修改
    EPOLL_CTL_DEL:从树上删除节点
    fd:要操作的文件描述符
event:
    Event.exents:
    EPOLLIN:可读事件
    EPOLLOUT:可写事件
    EPOLLERR:异常事件
```C++
typedef union epoll_data {
    void        *ptr;
    int          fd;
    uint32_t     u32;
    uint64_t     u64;
} epoll_data_t;

struct epoll_event {
    uint32_t     events;      /* Epoll events */
    epoll_data_t data;        /* User data variable */
};
```
```C++
Struct epoll_exent ev;
ex.events = EPOLLIN;
ex.data.fd = fd;
epoll_ctl(epfd, EPOLL_CTL_ADD, fd,&ey);
```


## epoll_wait
int epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout);
有返回了，就说明一定有事件发生了

### 函数说明
委托内核监控epoll树的事件节点
### 函数参数
epfd: epoll树根节点
events:传出参数,结构体数组
maxevents: events数组大小
timeout:
-1:表示阻塞
0:表示不阻塞
>0:表示阻塞超时时长
### 函数返回值：
只有在下面的情况下才会返回：
1. 有至少一个事件发生
2. 调用过程中被信号中断
3. 超时。
成功时，返回请求的I/O准备就绪的文件描述符的数目
发生错误时，返回-1并正确设置errno


epoll_wait返回的数组中的事件节点的值不会修改,是当时上epoll树的时候设置的值.




# 进阶epoll
epoll有两种工作模式ET和LT

水平触发：高电平代表1
- 只要缓冲区中有数据，就一直通知
- 缓冲区是内核的读缓冲区
边缘触发：电平有变化就代表1
- 缓冲区中有数据只会通知一次，之后再有数据才会通知
- 若是读数据的时候没有读完，则剩余的数据不会再通知，直到有新的数据到来
边缘非阻塞模式:提高效率


LT模式（水平触发）
ET模式（边沿触发）

epoll的LT和ET模式:
1. epoll默认情况下是LT模式，在这种模式下，若读数据一次性没有读完，缓冲区中还有可读数据，则epoll_wait还会再次通知
2. 若将epoll设置为ET模式，若读数据的时候一次性没有读完，则epoll_wait不再通知，直到下次有新的数据发来

思考:
1在ET模式下，如何在epoll_wait返回一次的情况下读完数据
循环读数据,直到读完数据,但是读完数据之后会阻塞.
2若能够一次性读完还需要设置什么?
将通信文件描述符设置为非阻塞模式


# epoll反应堆

typedef union epoll_data {
    void        *ptr;
    int          fd;
    uint32_t     u32;
    uint64_t     u64;
} epoll_data_t;

struct epoll_event {
    uint32_t     events;      /* Epoll events */
    epoll_data_t data;        /* User data variable */
};
触发了一个事件，产生了一连串的反应
epoll反应堆实际上是应用了c++的封装思想,—个事件的产生会触发一系列连锁反应,事件产生之后最终调用的是回调函数.
将数据和操作数据的方法封装到了一个类里面











