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
接口测试方法
压力测试方法


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



如果你想写一个高性能的C++服务器，以下是一些建议：

1. 选择正确的框架：选择一个高性能的框架，例如Boost.Asio、libevent或者libuv。这些框架可以帮助你管理网络连接、事件处理和多线程。
2. 使用异步IO：异步IO可以提高服务器的响应速度和吞吐量。使用异步IO可以避免线程阻塞，提高服务器的效率。优化内存管理：使用内存池和对象池可以减少内存分配和释放的开销。另外，避免使用过多的动态内存分配，因为它们会导致内存碎片和性能下降。
3. 多线程：使用多线程可以充分利用多核CPU的性能。但是，要注意避免线程间的竞争条件，例如锁等待和死锁。
4. 优化算法：使用高效的算法可以减少CPU的负载，提高服务器的性能。例如，使用哈希表代替线性搜索可以提高查询速度。
5. 代码优化：使用编译器优化和代码优化技术可以提高代码的执行效率。例如，使用内联函数可以避免函数调用的开销。
6. 测试和性能优化：使用性能分析工具和压力测试工具可以发现性能瓶颈和优化点。使用这些工具可以帮助你优化服务器的性能，提高用户体验。




大体的高性能C++服务器的框架通常包括以下组件：

1. 网络层：负责处理网络连接和数据传输。常用的网络库包括Boost.Asio、libevent和libuv等。
2. 多线程管理：负责管理多线程和线程池。多线程可以提高服务器的并发处理能力，但是需要注意避免线程间的竞争条件。
3. 协议处理：负责解析和处理客户端发送的协议。常用的协议包括HTTP、WebSocket、TCP和UDP等。
4. 数据库访问：负责与数据库交互，包括查询、插入、更新和删除等操作。常用的数据库包括MySQL、PostgreSQL和MongoDB等。
5. 缓存管理：负责管理缓存，例如Redis、Memcached等。缓存可以提高服务器的读取速度和响应速度。
6. 日志管理：负责记录服务器的运行日志，包括错误日志、访问日志等。
7. 安全管理：负责保障服务器的安全性，包括防止DDoS攻击、SQL注入等。

以上组件可以根据具体业务需求进行选择和定制。同时，高性能C++服务器的框架需要考虑以下因素：

1. 高并发：需要支持高并发的处理能力，避免线程阻塞和死锁。
2. 高效率：需要尽可能地利用CPU和内存资源，避免资源浪费。
3. 可扩展性：需要支持水平和垂直扩展，以应对不同的业务需求。
4. 可靠性：需要具备高可靠性和容错能力，避免因为单点故障导致整个服务不可用。
5. 易用性：需要具备易用性和易维护性，方便开发人员进行开发和维护。



防止DDoS攻击是一个复杂的话题，需要综合考虑许多因素，包括网络安全、服务器性能、负载均衡等。以下是一些基本的防御措施，您可以在C++服务器中实现它们：
1. 限制连接速率：通过限制每个IP地址的连接速率来减轻服务器的负载。可以使用令牌桶算法或漏桶算法来实现这个功能。
2. IP黑名单：通过检测攻击流量的来源IP地址并将它们添加到黑名单中来减轻服务器的负载。
3. 限制请求大小：通过限制每个请求的大小来防止攻击者发送大量的请求，从而导致服务器负载过高。
4. 使用CDN：使用内容分发网络（CDN）可以将流量分散到多个地理位置的服务器，从而减轻攻击的影响。
5. 负载均衡：通过使用负载均衡技术，可以将流量分散到多个服务器上，从而减轻攻击的影响。
6. DDoS防护软件：使用专门的DDoS防护软件，可以自动检测和过滤攻击流量。
请注意，这些措施只是一些基本的防御措施，无法完全保护服务器免受DDoS攻击。因此，建议您与网络安全专家合作，制定更全面的防御策略。




令牌桶算法是一种常用的限流算法，可以用于限制每个IP地址的连接速率。以下是一个简单的C++实现令牌桶算法的例子：
```c++
#include <iostream>
#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable>

using namespace std::chrono;

class TokenBucket {
public:
    TokenBucket(int capacity, int rate) : capacity_(capacity), rate_(rate), tokens_(0) {
        last_refill_time_ = steady_clock::now();
    }

    bool TryConsume(int tokens) {
        std::unique_lock<std::mutex> lock(mutex_); 

        Refill();

        if (tokens_ >= tokens) {
            tokens_ -= tokens;
            return true;
        } else {
            return false;
        }
    }

private:
    void Refill() {
        auto now = steady_clock::now();
        auto time_since_last_refill = now - last_refill_time_;
        last_refill_time_ = now;

        int tokens_to_add = duration_cast<milliseconds>(time_since_last_refill).count() * rate_ / 1000;
        tokens_ = std::min(tokens_ + tokens_to_add, capacity_);
    }

    int capacity_;
    int rate_;
    int tokens_;
    std::mutex mutex_;
    std::condition_variable cv_;
    std::chrono::steady_clock::time_point last_refill_time_;
};

int main() {
    TokenBucket bucket(10, 2);

    for (int i = 0; i < 20; i++) {
        std::this_thread::sleep_for(milliseconds(500));

        if (bucket.TryConsume(1)) {
            std::cout << "Request " << i << " accepted." << std::endl;
        } else {
            std::cout << "Request " << i << " rejected." << std::endl;
        }
    }

    return 0;
}
```
在这个例子中，`TokenBucket`类维护了桶的容量、速率和当前的令牌数量。当一个请求到达时，它将尝试从桶中消耗指定数量的令牌。如果桶中有足够的令牌，请求将被接受，否则请求将被拒绝。

在`TryConsume`方法中，首先调用`Refill`方法以确保桶中有足够的令牌。然后，如果桶中有足够的令牌，它将扣除指定数量的令牌并返回`true`，否则它将返回`false`。

在`Refill`方法中，它计算从上次刷新以来的时间，并根据速率计算应该添加的令牌数量。然后，它将令牌数量限制在桶的容量内。

在`main`函数中，我们创建一个容量为10，速率为2的`TokenBucket`对象，并模拟20个请求，每500毫秒到达一个请求。如果请求被接受，它将输出“Request i accepted.”，否则它将输出“Request i rejected.”。

这个例子只是一个简单的演示，您可以根据自己的需求进行修改和扩展。



libavcodec是FFmpeg中的一个库，它是一个编解码器库，提供了对各种音视频编码和解码的支持。它包含了多种音视频编解码器，如H.264、MPEG-4、MPEG-2、VP9、AAC、MP3等。在FFmpeg中，libavcodec是非常重要的一部分，它提供了FFmpeg的核心功能之一，即音视频的编解码功能。

libavcodec可以将各种不同格式的音视频数据解码成FFmpeg内部的统一格式，也可以将FFmpeg内部的统一格式编码成各种不同格式的音视频数据，支持多种音视频编解码标准，同时具有高度的可扩展性和灵活性。此外，libavcodec还提供了一些优化的编解码实现，可以提高音视频编解码的效率。

在使用libavcodec时，我们可以通过调用其提供的API来完成音视频的编解码工作，同时也可以进行一些高级的音视频处理，如滤波、裁剪、缩放、色彩空间转换等。总之，libavcodec是FFmpeg中非常重要的一部分，它为FFmpeg提供了强大的音视频编解码能力，是众多音视频应用的重要基础。



以下是一些比较好的ffmpeg和C++结合的视频播放器的Github仓库：

1. mpv-player/mpv：一个基于FFmpeg和OpenGL的视频播放器，支持多种视频格式和音频格式，可以在Linux、Windows和macOS系统上运行。

2. VideoLAN/VLC：一个开源的跨平台媒体播放器，支持各种视频和音频格式，可以在Windows、Linux、macOS、Android和iOS等平台上运行。

3. Bilibili/ijkplayer：一个基于FFmpeg的Android/iOS视频播放器，支持多种视频格式和音频格式，提供了丰富的API和示例代码。

4. FFmpegPlayer/FFmpegPlayer：一个基于FFmpeg和SDL的视频播放器，支持多种视频格式和音频格式，提供了简单易用的API和示例代码。

这些仓库都提供了丰富的文档、示例代码和API，可以根据自己的需求进行定制和修改。


# 参考资料

[日志系统]https://mp.weixin.qq.com/s?__biz=MzI3NzE0NjcwMg==&mid=2650122657&idx=1&sn=c5ce1d8059c40e4cd6deb42a34f8fe49&chksm=f36bb480c41c3d96f69a9fbbc8e7e1515b8bbec87742f76fa3dfda0019a7b58aa282c3ef9bde&scene=21#wechat_redirect
[Reactor模型和Proactor模型]https://cloud.tencent.com/developer/article/1488120
[Reactor模型]https://www.cnblogs.com/CodeBear/p/12567022.html
[epoll 事件之 EPOLLRDHUP]https://yangwenbo.com/articles/epoll-event-epollrdhup.html

