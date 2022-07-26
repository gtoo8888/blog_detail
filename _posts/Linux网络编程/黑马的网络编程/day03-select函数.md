---
title: day03-select函数
date: 2022-04-02 17:02:00
tags:
- Linux网络编程
---


熟练掌握TCP状态转换图
熟练掌握端口复用的方法
了解半关闭的概念和实现方式
了解多路I0转接模型
熟练掌握select函数的使用
熟练使用fd_set相关函数的使用
能够编写select多路IO转接模型的代码



# 端口复用
解决端口复用的问题: bind error: Address already in use，发生这种情况是在服务端主动关闭连接以后，接着立刻启动就会报这种错误.
 int setsockopt(int sockfd, int level, int optname,
                      const void *optval, socklen_t optlen);

setsockopt(lfd, SOL_SOCKETPSO_REUSEADDR,&opt, sizeof(int));
setsockopt(lfd , SOL_SOCKET,SO_REUSEPORT,&opt, sizeof(int));

UNIX高级环境编程
这个函数写在socket之后，bind前













# 高并发服务器模型--select

一个进程支持多个客户端

 int select(int nfds, fd_set *readfds, fd_set *writefds,
                  fd_set *exceptfds, struct timeval *timeout);
函数作用:
委托内核监控可读,可写,异常事件

函数参数:
nfds:，输入参数,告诉内核要监控文件描述符的范围,一般取值为最大文件描述符+1
readfds:
-输入参数:告诉内核要监控哪些文件描述符
-输出参数:内核告诉应用程序哪些文件描述符有变化
writefds:
-输入参数:告诉内核要监控哪些文件描述符
-输出参数:内核告诉应用程序哪些文件描述符有变化
Exceptfds:
输入输出参数,一般表示异常事件
Timeout:
超时时间:
NULL:表示永久阻塞,直到有事件发生
0:表示不阻塞,不管有没有事件发生,都会立刻返回
>0:表示阻塞的时长,若没有超过时长,则一直阻塞;
若在时长内,有事件发生,则立刻返回,
若超过时长,则立刻返回
返回值:
成功返回发生变化的文件描述符个数.




fd_set set;
void FD_CLR(int fd, fd_set *set);
说明:从set集合中清除fd
int FD_ISSET(int fd, fd_set *set);
说明:判断fd是否在set集合中
void FD_SET(int fd, fd_set *set);
说明:将fd添加到set集合中
void FD_ZERO(fd_set *set);
说明:清空文件描述符集



关于select的思考:
问题:如果有效的文件描述符比较少，会使循环的次数太多.
解决办法:可以将有效的文件描述符放到一个数组当中，这样遍历效率就高了.


代码优化方向:
1将通信文件描述符保存到一个整形数组中，使用一个变量记录数组中最大元素的下标.
2如果数组中有无效的文件描述符，直接跳过



select优点:
1一个进程可以支持多个客户端
2 select支持跨平台

select缺点:
1代码编写困难
2会涉及到用户区到内核区的来回拷贝
3当客户端多个连接，但少数活跃的情况, select效率较低
例如:作为极端的一种情况,3-1023文件描述符全部打开，但是只有1023有发送数据, select就显得效率低下
4最大支持1024个客户端连接
select最大支持1024个客户端连接不是有文件描述符表最多可以支持1024个文件描述符限制的，需是由FD_SETSIZE=1024限制的.

FD_SETSIZE=1024 fd_set使用了该宏，当然可以修改内核，然后再重新编译内核，一般不建议这么做.

作业:
编写代码，让 select监控标准输入，监控网络，如果标准输入有数据就写入网络，如果网络有数据就读出网络数据，然后打印到标准输出.
注意: select不仅可以监控socket文件描述符，也可以监视标准输
























































































































































































