---
title: FFmpeg 教程
date: 2023-04-14 22:29:24
tags:
- 音视频课程
---


# 总体介绍
FFmpeg一共包含8个库:
1. avcodec:编解码（最重要的库）
2. avformat:封装格式处理
3. avfilter:滤镜特效处理
4. avdevice:各种设备的输入输出
5. avutil:工具库（大部分库都需要这个库的支持）
6. postproc:后加工
7. swresample:音频采样数据格式转换
8. swscale:视频像素数据格式转换
9. 其他工具
   1.  ffmpeg：该项目提供的一个工具,可用于格式转换、解码或电视卡即时编码等
   2.  ffsever：一个 HTTP 多媒体即时广播串流服务器；
   3.  ffplay：是一个简单的播放器,使用ffmpeg 库解析和解码,通过SDL显示；

# linux安装FFmpeg
源码安装
官方linux包名称
ffmpeg_7.1.orig.tar.xz
```bash
# 安装x264
tar -vxjf x264-snapshot-20191217-2245.tar.bz2
./configure --enable-shared --enable-static --disable-asm   
make
sudo make install



# 安装ffmpeg
tar -xjvf ffmpeg-3.4.8.tar.gz 
cd ffmpeg-7.1/
./configure --prefix=/usr/local/ffmpeg --enable-shared --disable-static --disable-doc  --enable-gpl --enable-libx264
# 报错nasm/yasm not found or too old. Use --disable-x86asm for a crippled build
# 需要安装yasm
make 
make install


# 安装yasm
tar -xvzf yasm-1.3.0.tar.gz
cd yasm-1.3.0/
./configure
make
make install


# 报错 libavdevice.so.57: cannot open shared object file: No such file or directory
vim /etc/ld.so.conf
/usr/local/ffmpeg/lib
sudo ldconfig
vim ~/.zshrc
export PATH=/monchickey/ffmpeg/bin:$PATH
source ~/.zshrc
```


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
## ffmpeg
常用参数
```bash
# 指定输入文件
ffmpeg -i input.mp4
# 指定视频滤镜,将视频分辨率调整为640x360
ffmpeg -vf "scale=640:360"
# 指定视频编解码器
ffmpeg -c:v libx264
# 指定音频编解码器
ffmpeg -c:a aac
# 参数指定输出文件的持续时间(秒),"-t 10"表示只处理前10秒的内容
ffmpeg -t 10
# 参数指定开始处理的时间点(以秒或HH:MM:SS形式)
ffmpeg -ss 00:00:30
# 参数用于选择要包含在输出中的流例如,"-map 0"意味着复制所有来自第一个输入的所有流到输出文件
ffmpeg -map 0
# 参数指定音频质量,仅适用于某些音频编解码器,如MP3,值范围通常是0到9,其中0是最高质量
ffmpeg -q:a 0
# 参数指定使用的格式或协议这里的concat格式用于合并多个文件
ffmpeg -f concat
# no video
ffmpeg -vn
# copy是直接拷贝视频中的原始的音频，这里不会涉及音频的编解码
ffmpeg -c:a copy output.aac
```

使用形式
```bash
# 转换视频格式,将input.avi转换为output.mp4
ffmpeg -i input.mp4 output.avi
# 提取视频文件中的音频,并保存为MP3格式
# ffmpeg -i input.mp4 -q:a 0 -map a output.mp3
# 提取视频文件中的音频
ffmpeg -i input.mp4 -vn -c:a copy output.aac
# 提取视频文件中的视频
ffmpeg -i input.mp4 -an -c:v copy output.mp4
# 截取视频的前10秒并保存为新的文件
ffmpeg -i input.mp4 -t 10 -c copy output_clip.mp4
# 将多个音频或视频文件合并成一个文件,需要先创建一个文本文件inputs.txt,内容如下:
# file 'part1.mp4'
# file 'part2.mp4'
# 然后运行以下命令:
ffmpeg -f concat -safe 0 -i inputs.txt -c copy output.mp4
# 改变视频分辨率,比如将视频分辨率改为640x360
ffmpeg -i input.mp4 -vf scale=640:360 output.mp4
# 给视频添加字幕,假设字幕文件为subtitles.srt
ffmpeg -i input.mp4 -vf subtitles=subtitles.srt output_with_subtitles.mp4
```


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
// 用于传递额外的编解码器选项返回0表示成功,负数表示错误
int avcodec_open2(AVCodecContext *avctx, const AVCodec *codec, AVDictionary **options);
// 向编解码器发送一个压缩数据包进行解码如果编解码器是编码器,则该函数用于发送原始帧进行编码
int avcodec_send_packet(AVCodecContext *avctx, const AVPacket *avpkt);
//  释放与AVPacket相关的资源,包括未分配的数据和缓冲区,并重置AVPacket的内容
void av_packet_unref(AVPacket *pkt);
// 从编解码器接收一个解码后的帧（或编码后的包）这个函数应该在调用`avcodec_send_packet`之后调用,直到它返回错误代码`EAGAIN`或者`EOF`
int avcodec_receive_frame(AVCodecContext *avctx, AVFrame *frame);
// 释放与AVFrame关联的所有缓冲区并重置AVFrame的内容
void av_frame_unref(AVFrame *frame);


AVFormatContext* mFormatContext = nullptr;     // 解封装上下文
AVCodecContext* mCodecContext = nullptr;       // 解码器上下文
SwsContext* mSwsContext = nullptr;             // 图像转换上下文
AVPacket* mPacket = nullptr;                   // 数据包
AVFrame* mFrame = nullptr;                     // 解码后的视频帧
```


## avformat 封装格式处理
```c++
AVDictionary // 保存一组选项（如编码器或解码器参数）
 
// 这个函数用于设置AVDictionary中的一个条目
int av_dict_set(AVDictionary **pm, const char *key, const char *value, int flags);
// 用于释放由AVDictionary分配的所有内存,并将指向它的指针设为NULL
void av_dict_free(AVDictionary **pm);
// 该函数用于打开多媒体输入流并读取文件头信息
int avformat_open_input(AVFormatContext **ps, const char *url, AVInputFormat *fmt, AVDictionary **options);
// 在成功打开输入之后,使用这个函数可以获取到关于媒体文件内部各个流的详细信息
int avformat_find_stream_info(AVFormatContext *ic, AVDictionary **options);
// 在给定的媒体文件中查找最佳的指定类型的流
int av_find_best_stream(AVFormatContext *ic, enum AVMediaType type, int wanted_stream_nb, int related_stream, AVCodec **decoder_ret, int flags);
// 打印详细的媒体文件信息到标准输出,这对于调试非常有用
void av_dump_format(AVFormatContext *ic, int index, const char *url, int is_output);
```



## avutil 工具库

```c++
AVDictionary // 保存一组选项（如编码器或解码器参数）
 
// 这个函数用于设置AVDictionary中的一个条目
int av_dict_set(AVDictionary **pm, const char *key, const char *value, int flags);
// 用于释放由AVDictionary分配的所有内存,并将指向它的指针设为NULL
void av_dict_free(AVDictionary **pm);
// 该函数用于打开多媒体输入流并读取文件头信息
int avformat_open_input(AVFormatContext **ps, const char *url, AVInputFormat *fmt, AVDictionary **options);
// 在成功打开输入之后,使用这个函数可以获取到关于媒体文件内部各个流的详细信息
int avformat_find_stream_info(AVFormatContext *ic, AVDictionary **options);
// 在给定的媒体文件中查找最佳的指定类型的流
int av_find_best_stream(AVFormatContext *ic, enum AVMediaType type, int wanted_stream_nb, int related_stream, AVCodec **decoder_ret, int flags);

av_dict_get

av_get_media_type_string
```



以下是一些比较好的FFmpeg和C++结合的视频播放器的Github仓库：
1. mpv-player/mpv：一个基于FFmpeg和OpenGL的视频播放器,支持多种视频格式和音频格式,可以在Linux、Windows和macOS系统上运行
2. VideoLAN/VLC：一个开源的跨平台媒体播放器,支持各种视频和音频格式,可以在Windows、Linux、macOS、Android和iOS等平台上运行
3. Bilibili/ijkplayer：一个基于FFmpeg的Android/iOS视频播放器,支持多种视频格式和音频格式,提供了丰富的API和示例代码
4. FFmpegPlayer/FFmpegPlayer：一个基于FFmpeg和SDL的视频播放器,支持多种视频格式和音频格式,提供了简单易用的API和示例代码





# 参考资料
[FFmpeg官网](https://FFmpeg.org/)
[FFmpeg邮件列表](https://FFmpeg.org/contact.html)
[FFmpeg中文社区](https://FFmpeg.club/)
[FFmpeg API Documentation](https://FFmpeg.org/doxygen/trunk/index.html)
[FFmpeg官方下载网页](http://www.FFmpeg.org/download.html)
[FFmpeg-Builds,FFmpeg库文件下载地址](https://github.com/BtbN/FFmpeg-Builds/releases)

## 安装教程
### 官方下载链接
[x264, the best H.264/AVC encoder - VideoLAN](https://www.videolan.org/developers/x264.html)
[x264下载链接 Index of /x264/snapshots/](http://download.videolan.org/x264/snapshots/)
[yasm下载链接](https://github.com/yasm/yasm/releases/tag/v1.3.0)
[官网ffmpeg linux下载链接](https://launchpad.net/ubuntu/+source/ffmpeg)
[nasm官网](https://www.nasm.us/)
[nasm下载链接](https://www.nasm.us/pub/nasm/releasebuilds/)
### 安装教程
[Linux安装ffmpeg详细教程（超细）](https://blog.csdn.net/Number_oneEngineer/article/details/108848206)
[Ubuntu上安装FFmpeg](https://blog.csdn.net/TracelessLe/article/details/107362505)
[Ubuntu下x264库编译安装](https://blog.csdn.net/TracelessLe/article/details/107522845)
[编译FFmpeg错误:ERROR: x264 not found using pkg-config](https://blog.csdn.net/qq_44054791/article/details/127861823)
[编译安装libx264库遇到Found no assembler Minimum version is nasm-](https://www.lixian.fun/4237.html)

## windows
[FFmpeg windows下载地址](https://github.com/BtbN/FFmpeg-Builds/releases)
[FFmpeg三种版本（static、shared、dev）和实际操作举例](https://blog.csdn.net/ustc_sse_shenzhang/article/details/102546753)



# 萤石
[萤石 OpenSDK](https://open.ys7.com/doc/zh/pc/index.html)
https://open.ys7.com/help/1798
https://open.ys7.com/cn/s/download
https://open.ys7.com/help/46


