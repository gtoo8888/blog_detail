---
title: webserver
date: 2022-07-25 00:41:31
tags:
- 项目
---


## 2022-7-24

1. task.josn和lanch.json可以跑起来了，可以用vscode远程连接调试
2. 使用cmake进行编译
3. cmake编译中添加了mysql,可以操作数据库了


## 2022-7-25

1. 学习了namespace和share_ptr是怎么使用的



# 2022-7-30
1. 之前发现使用语句，但是日志无法写入
fix:使用阻塞队列插入，但是自己还没有实现阻塞队列的内容，导致一直是空实现，就没法写进去了

2. 遗留的问题：单例模式在vscode中如何调试，因为进去就是一个instant()函数了





# 改进
使用vcpkg做包管理
cmake中使用vcpkg
使用httplib库
使用jsoncpp库


# epoll_event

EPOLLIN
        The associated file is available for read(2) operations.

EPOLLOUT
        The associated file is available for write(2) operations.

EPOLLRDHUP (since Linux 2.6.17) # 读取到一半连接关闭
        # 读关闭
        在使用 epoll 时，对端正常断开连接（调用 close()），在服务器端会触发一个 epoll 事件。在低于 2.6.17 版本的内核中，这个 epoll 事件一般是 EPOLLIN，即 0x1，代表连接可读。
        返回到上层以后，上层读取会EOF，报告错误。
        现在增加了这个以后，客户端断开连接，就可以在底层处理了
        Stream socket peer closed connection, or shut  down  writing  half  of
        connection.   (This  flag is especially useful for writing simple code
        to detect peer shutdown when using Edge Triggered monitoring.)

EPOLLERR
        # EPOLLERR 是服务器这边出错
        相关文件描述符上发生错误情况。 这个
         当读取结束时，管道的写入结束也会报告事件
         已被关闭。 epoll_wait(2) 将始终报告此事件； 它
         没有必要在事件中设置它。
        Error  condition  happened  on  the  associated file descriptor.  This
        event is also reported for the write end of a pipe when the  read  end
        has  been closed.  epoll_wait(2) will always report for this event; it
        is not necessary to set it in events.

EPOLLHUP
        # 读写都关闭
        Hang up happened on the  associated  file  descriptor.   epoll_wait(2)
        will  always  wait  for  this  event; it is not necessary to set it in
        events.

        Note that when reading from a channel such  as  a  pipe  or  a  stream
        socket,  this  event  merely indicates that the peer closed its end of
        the channel.  Subsequent reads from the channel will return 0 (end  of
        file)  only  after  all  outstanding data in the channel has been con‐
        sumed.

# 参考文献

[日志系统]https://mp.weixin.qq.com/s?__biz=MzI3NzE0NjcwMg==&mid=2650122657&idx=1&sn=c5ce1d8059c40e4cd6deb42a34f8fe49&chksm=f36bb480c41c3d96f69a9fbbc8e7e1515b8bbec87742f76fa3dfda0019a7b58aa282c3ef9bde&scene=21#wechat_redirect
[Reactor模型和Proactor模型]https://cloud.tencent.com/developer/article/1488120
[Reactor模型]https://www.cnblogs.com/CodeBear/p/12567022.html
[epoll 事件之 EPOLLRDHUP]https://yangwenbo.com/articles/epoll-event-epollrdhup.html

