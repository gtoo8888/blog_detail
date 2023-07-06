---
title: ffmpeg
date: 2023-04-14 22:29:24
tags:
---

./configure --prefix=/usr/local/ffmpeg --enable-shared --disable-static --disable-doc  --enable-gpl --enable-libx264

fmpeg-master-latest-win64-gpl-shared.zip


avcodec.lib;avdevice.lib;avfilter.lib;avformat.lib;avutil.lib;swresample.lib;swscale.lib;postproc.lib








```
MSBuild属性宏:
- $(OutDir)：输出目录，用于存放生成的可执行文件或库文件。
- $(ProjectName)：项目名称，通常与项目文件名相同。
- $(Configuration)：当前项目配置，例如Debug或Release。
- $(Platform)：当前项目平台，例如Win32或x64。
- $(SolutionDir)：解决方案目录，包含解决方案文件所在的路径。
- $(ProjectDir)：项目目录，包含项目文件所在的路径。


$(SolutionDir)
$(SolutionExt)
$(SolutionFileName)
$(SolutionName)
$(SolutionPath)
```



FFmpeg一共包含8个库：
**avcodec：编解码（最重要的库）。**
**avformat：封装格式处理。**
avfilter：滤镜特效处理。
avdevice：各种设备的输入输出。
**avutil：工具库（大部分库都需要这个库的支持）。**
postproc：后加工。
swresample：音频采样数据格式转换。
**swscale：视频像素数据格式转换。**
其中加粗的库为本课程涉及到的库。


# 参考资料
[ffmpeg官网](https://ffmpeg.org/)

## linux
[Ubuntu上安装ffmpeg](https://blog.csdn.net/TracelessLe/article/details/107362505)
[Ubuntu下x264库编译安装](https://blog.csdn.net/TracelessLe/article/details/107522845)
[编译ffmpeg错误：ERROR: x264 not found using pkg-config](https://blog.csdn.net/qq_44054791/article/details/127861823)
[编译安装libx264库遇到Found no assembler Minimum version is nasm-](https://www.lixian.fun/4237.html)
[nasm官网](https://www.nasm.us/)
[nasm下载链接](https://www.nasm.us/pub/nasm/releasebuilds/)

## windows
[ffmpeg windows下载地址](https://github.com/BtbN/FFmpeg-Builds/releases)
[FFmpeg三种版本（static、shared、dev）和实际操作举例](https://blog.csdn.net/ustc_sse_shenzhang/article/details/102546753)




