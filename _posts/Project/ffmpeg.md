---
title: ffmpeg
date: 2023-04-14 22:29:24
tags:
- 项目
---


# 总体介绍
FFmpeg一共包含8个库:
avcodec:编解码（最重要的库）
avformat:封装格式处理
avfilter:滤镜特效处理
avdevice:各种设备的输入输出
avutil:工具库（大部分库都需要这个库的支持）
postproc:后加工
swresample:音频采样数据格式转换
swscale:视频像素数据格式转换






./configure --prefix=/usr/local/ffmpeg --enable-shared --disable-static --disable-doc  --enable-gpl --enable-libx264

fmpeg-master-latest-win64-gpl-shared.zip


avcodec.lib;avdevice.lib;avfilter.lib;avformat.lib;avutil.lib;swresample.lib;swscale.lib;postproc.lib


ffmpeg-n6.0-latest-win64-gpl-shared-6.0.zip


一定要使用extern
extern "C"
{
#include <libavcodec\avcodec.h>
}


# 相关资源
## 1. 官网
## 2. 文档
## 3. 论坛
## 4. 源码

# 常用指令
## ffprobe
```bash
# 显示多媒体文件的详细信息（包括元数据、流信息等）
ffprobe input.mp4
# 以 JSON 格式输出多媒体文件的详细信息
ffprobe -v quiet -print_format json -show_format -show_streams input.mp4
# 显示多媒体文件的格式信息
ffprobe -show_format input.mp4
# 显示多媒体文件的流信息（视频、音频、字幕等）
ffprobe -show_streams input.mp4
# 显示多媒体文件的帧信息
ffprobe -show_frames input.mp4
# 显示多媒体文件的包信息
ffprobe -show_packets input.mp4
# 显示多媒体文件的编解码器信息
ffprobe -codecs input.mp4
# 显示多媒体文件的像素格式信息
ffprobe -show_pixel_formats input.mp4
# 显示多媒体文件的帧率信息
ffprobe -show_frames -select_streams v -of csv=p=0 input.mp4 | awk -F',' '{print $6}'
# 显示多媒体文件的时长
ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 input.mp4
# 显示多媒体文件的比特率
ffprobe -v error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 input.mp4
# 显示多媒体文件的视频分辨率
ffprobe -v error -show_entries stream=width,height -of csv=p=0 input.mp4
# 显示多媒体文件的音频采样率
ffprobe -v error -show_entries stream=sample_rate -of default=noprint_wrappers=1:nokey=1 input.mp4
# 显示多媒体文件的音频通道数
ffprobe -v error -show_entries stream=channels -of default=noprint_wrappers=1:nokey=1 input.mp4
```



# 常见结构体

## avcodec 编解码
```c++
// 根据给定的编解码器ID查找对应的解码器
AVCodec *avcodec_find_decoder(enum AVCodecID id);
// 为指定的编解码器分配一个 AVCodecContext 上下文
AVCodecContext *avcodec_alloc_context3(const AVCodec *codec);
// 这个函数通常用于将流的参数（如分辨率、采样率等）复制到解码器上下文中
int avcodec_parameters_to_context(AVCodecContext *codec_ctx, const AVCodecParameters *par);
// 用于传递额外的编解码器选项。返回0表示成功，负数表示错误
int avcodec_open2(AVCodecContext *avctx, const AVCodec *codec, AVDictionary **options);
```


## avformat 封装格式处理
```c++
AVDictionary // 保存一组选项（如编码器或解码器参数）
 
// 这个函数用于设置AVDictionary中的一个条目
int av_dict_set(AVDictionary **pm, const char *key, const char *value, int flags);
// 用于释放由AVDictionary分配的所有内存，并将指向它的指针设为NULL
void av_dict_free(AVDictionary **pm);
// 该函数用于打开多媒体输入流并读取文件头信息
int avformat_open_input(AVFormatContext **ps, const char *url, AVInputFormat *fmt, AVDictionary **options);
// 在成功打开输入之后，使用这个函数可以获取到关于媒体文件内部各个流的详细信息
int avformat_find_stream_info(AVFormatContext *ic, AVDictionary **options);
// 在给定的媒体文件中查找最佳的指定类型的流
int av_find_best_stream(AVFormatContext *ic, enum AVMediaType type, int wanted_stream_nb, int related_stream, AVCodec **decoder_ret, int flags);
```

以下是一些比较好的ffmpeg和C++结合的视频播放器的Github仓库：
1. mpv-player/mpv：一个基于FFmpeg和OpenGL的视频播放器，支持多种视频格式和音频格式，可以在Linux、Windows和macOS系统上运行。
2. VideoLAN/VLC：一个开源的跨平台媒体播放器，支持各种视频和音频格式，可以在Windows、Linux、macOS、Android和iOS等平台上运行。
3. Bilibili/ijkplayer：一个基于FFmpeg的Android/iOS视频播放器，支持多种视频格式和音频格式，提供了丰富的API和示例代码。
4. FFmpegPlayer/FFmpegPlayer：一个基于FFmpeg和SDL的视频播放器，支持多种视频格式和音频格式，提供了简单易用的API和示例代码。








# 参考资料
[ffmpeg官网](https://ffmpeg.org/)
[FFmpeg邮件列表](https://ffmpeg.org/contact.html)
[Stack Overflow](https://stackoverflow.com/questions/tagged/ffmpeg)
[FFmpeg中文社区](https://ffmpeg.club/)
[FFmpeg API Documentation](https://ffmpeg.org/doxygen/trunk/index.html)
[ffmpeg官方下载网页](http://www.ffmpeg.org/download.html)
[FFmpeg-Builds,ffmpeg库文件下载地址](https://github.com/BtbN/FFmpeg-Builds/releases)

## linux
[Ubuntu上安装ffmpeg](https://blog.csdn.net/TracelessLe/article/details/107362505)
[Ubuntu下x264库编译安装](https://blog.csdn.net/TracelessLe/article/details/107522845)
[编译ffmpeg错误:ERROR: x264 not found using pkg-config](https://blog.csdn.net/qq_44054791/article/details/127861823)
[编译安装libx264库遇到Found no assembler Minimum version is nasm-](https://www.lixian.fun/4237.html)
[nasm官网](https://www.nasm.us/)
[nasm下载链接](https://www.nasm.us/pub/nasm/releasebuilds/)

## windows
[ffmpeg windows下载地址](https://github.com/BtbN/FFmpeg-Builds/releases)
[FFmpeg三种版本（static、shared、dev）和实际操作举例](https://blog.csdn.net/ustc_sse_shenzhang/article/details/102546753)


# 第三方资料
[雷霄骅系列博客汇总](https://blog.csdn.net/mytzs123/article/details/122262837)
[雷霄骅](https://blog.csdn.net/leixiaohua1020)
[李超 音视频直播技术专家](https://www.zhihu.com/people/garrylea)

[VLC-Qt](https://vlc-qt.tano.si/)

# 萤石
[萤石 OpenSDK](https://open.ys7.com/doc/zh/pc/index.html)
https://open.ys7.com/help/1798
https://open.ys7.com/cn/s/download
https://open.ys7.com/help/46


