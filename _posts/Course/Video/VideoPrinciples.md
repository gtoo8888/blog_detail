---
title: 音视频原理
date: 2023-12-21 22:23:49
tags:
- 音视频课程
---

# 1. 视频编码
1. 颜色空间：RGB、YUV、HSV
2. 图片编码格式：BMP、JPEG、PNG、GIF、TIFF
3. 视频编码格式：H.264、H.265、MPEG2视频编码标准
4. 视频封装格式、视频文件容器：FLV、MP4、MOV、MKV、RTP、TS、AVI视频封装格式
5. 流媒体传输协议：RTMP、HLS、HTTP-FLV、RTSP、RTP、RTCP
6. 应用：解码、编码、转码、滤镜




# 2. 视频操作
1. 音频概念： 采样、量化、编码的环节
2. 音频编码格式：ACC、MPEG、MP3、FLAC、G711音频编码标准
3. 音频封装格式、音频文件容器：WAV、Ogg、AIFF、MP3音频封装格式



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

