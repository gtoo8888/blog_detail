---
title: 音视频原理
date: 2023-12-21 22:23:49
tags:
---
### 1. 理解FFmpeg的基本概念
在深入学习API之前，确保你理解以下核心概念：
- 容器格式：如MP4、MKV等，用于存储音视频数据。
- 编解码器：如H.264、AAC等，用于压缩和解压缩音视频数据。
- 流（Stream）：媒体文件中的音视频轨道。
- 帧（Frame）：解码后的音视频数据单元。
- Packet：编码后的数据单元。


## 流媒体协议
rtmp
hls
httpflv
rtsp
rtp
rtcp



### 2. 阅读FFmpeg源码和示例
FFmpeg提供了丰富的示例代码，这些代码是学习API的最佳资源：
- 官方示例：在FFmpeg源码的 `doc/examples` 目录下有很多示例代码，如 `demuxing_decoding.c`、`decode_audio.c` 等。
- 源码注释：FFmpeg的源码注释非常详细，阅读源码可以帮助你理解API的设计思路。

推荐示例：
- `demuxing_decoding.c`：演示如何解封装和解码音视频流。
- `decode_audio.c`：演示如何解码音频流。




### 7. 参考项目
学习一些开源项目，了解FFmpeg在实际项目中的应用：
- VLC：一个广泛使用的开源媒体播放器，使用了FFmpeg。
- OBS Studio：一个直播软件，使用了FFmpeg进行音视频处理。



### 8. 逐步深入
- 初级阶段：掌握基本的解封装、解码和渲染流程。
- 中级阶段：学习音视频同步、滤镜（Filter）使用、硬件加速解码等。
- 高级阶段：深入研究FFmpeg源码，了解其内部实现机制。


### 9. 实践项目
通过实际项目巩固所学知识，例如：
- 实现一个简单的音视频播放器。
- 实现一个视频转码工具。
- 实现一个流媒体客户端。
- 音乐播放器


# 一些参考的知识



FFmpage
SRS
WebRTC


## 采集
音频采集
视频采集
## 编码
码率
帧率
## 传输
检测带宽
怎么传输数据
怎么发送数据



录制
推流
    修改码率
    修改帧率
拉流
    怎么做到低延时

# 参考资料

[秒懂音视频开发-M了个J](https://www.cnblogs.com/mjios/category/1938094.html?page=2)
[音视频开发中文网](https://avmedia.0voice.com/?cate=2)
[斗鱼 H5 直播原理解析，它是如何省了 80% 的 CDN 流量？](https://juejin.cn/post/7121513067728338975)
[以斗鱼直播流为例，谈谈高并发架构实践细节](https://www.bilibili.com/video/BV1Mw4m1S7aB)
[Docker部署KPlayer，实现24小时无人直播(B站、斗鱼、虎牙等)](https://juejin.cn/post/7292290711733567539)
[斗鱼：如何打造一个高性能、高可用直播系统架构](https://www.infoq.cn/article/we4dDaWLO7ZsHLij6AZ9)
