---
title: Qt5教程
date: 2022-12-31 13:34:44
tags:
- 课程
---

# Qt需要学习的知识点
QML
Qt Quick
Qpython

# Qt相关不了解的
QRegExp
QButtonGroup
QFactoryInterface
QStandardItemModel
Qt::WA_inputmethodenabled

QDomElement
QDomDocument
QDomNode

#include <QtXml/qtxmlglobal.h>

安装过滤器


Q_DECL_EXPORT
Q_DECL_IMPORT
Q_PROPERTY

qt的继承关系
# C++中不了解的
stdcall,cdecl,fastcall,
thiscall, naked call

afx_msg

afxwin.h
windows.h
ODBC类

stdafx.h

继承自己单例的数组
奇异递归模板模式CRTP

dynamic_cast<>()




# 其他需要了解的知识
Microsoft XNA
WPF
xaml
MFC
electron
Win32 SDK
STL,WTL
LCU客户端
CEF架构
WinForms
C++ builder
GTK+
libcef
Unity
桌面应用程序
桌面的客户端软件
Hive

# github
minicsv




# Qt文档学习

## 关键词汇
signals and slots
Qt Object Model
object trees


# 关键章节
Qt Widgets 

Qt GUI 
Qt Core 

C++ Classes
Animation Classes
Threading Classes
Container Classes
Plugin Classes
Implicitly Shared Classes
State Machine Classes
Input/Output Classes
Event Classes 

Qt Help 
Qt OpenGL 
Qt Test 
qmake Manual 
# 常见宏定义

Q_NULLPTR
QT_CONFIG

Q_OBJECT

Q_PROPERTY

Q_SLOTS
Q_SIGNALS


#ifdef Q_COMPILER_EXPLICIT_OVERRIDES
# define Q_DECL_OVERRIDE override
# define Q_DECL_FINAL final
#else

Q_DISABLE_COPY

/*
   Some classes do not permit copies to be made of an object. These
   classes contains a private copy constructor and assignment
   operator to disable copying (the compiler gives an error message).
*/
#define Q_DISABLE_COPY(Class) \
    Class(const Class &) Q_DECL_EQ_DELETE;\
    Class &operator=(const Class &) Q_DECL_EQ_DELETE;

Q_DECL_EQ_DELETE



#
QTest
QMediaPlayer
需要在工程上右键->属性->Qt Project Setting->Qt Modules->select Modules
#include <QMediaPlayer>













```C++
bool VideoDecode::open(const QString &url)
{
    if (url.isNull()) return false;

    AVDictionary* dict = nullptr;
    av_dict_set(&dict, "rtsp_transport", "tcp", 0);      // 设置rtsp流使用tcp打开，如果打开失败错误信息为【Error number -135 occurred】可以切换（UDP、tcp、udp_multicast、http），比如vlc推流就需要使用udp打开
    av_dict_set(&dict, "max_delay", "3", 0);             // 设置最大复用或解复用延迟（以微秒为单位）。当通过【UDP】 接收数据时，解复用器尝试重新排序接收到的数据包（因为它们可能无序到达，或者数据包可能完全丢失）。这可以通过将最大解复用延迟设置为零（通过max_delayAVFormatContext 字段）来禁用。
    av_dict_set(&dict, "timeout", "1000000", 0);         // 以微秒为单位设置套接字 TCP I/O 超时，如果等待时间过短，也可能会还没连接就返回了。

    // 打开输入流并返回解封装上下文
    int ret = avformat_open_input(&m_formatContext,          // 返回解封装上下文
        url.toStdString().data(),  // 打开视频地址
        nullptr,                   // 如果非null，此参数强制使用特定的输入格式。自动选择解封装器（文件格式）
        &dict);                    // 参数设置
// 释放参数字典
    if (dict)
    {
        av_dict_free(&dict);
    }
    // 打开视频失败
    if (ret < 0)
    {
        showError(ret);
        free();
        return false;
    }

    // 读取媒体文件的数据包以获取流信息。
    ret = avformat_find_stream_info(m_formatContext, nullptr);
    if (ret < 0)
    {
        showError(ret);
        free();
        return false;
    }
    qint64 totalTime = m_formatContext->duration / (AV_TIME_BASE / 1000);// 计算视频总时长（毫秒）
    mVideoFileInfo->mTotalTimeStamp = m_formatContext->duration;
#if PRINT_LOG
    qDebug() << QString("视频总时长：%1 ms，[%2]").arg(totalTime).
        arg(QTime::fromMSecsSinceStartOfDay(int(totalTime)).toString("HH:mm:ss zzz"));
#endif

    // 通过AVMediaType枚举查询视频流ID（也可以通过遍历查找），最后一个参数无用
    m_videoIndex = av_find_best_stream(m_formatContext, AVMEDIA_TYPE_VIDEO, -1, -1, nullptr, 0);
    if (m_videoIndex < 0)
    {
        showError(m_videoIndex);
        free();
        return false;
    }

    AVStream* videoStream = m_formatContext->streams[m_videoIndex];  // 通过查询到的索引获取视频流

    // 获取视频图像分辨率（AVStream中的AVCodecContext在新版本中弃用，改为使用AVCodecParameters）
    QSize mSize;
    mSize.setWidth(videoStream->codecpar->width);
    mSize.setHeight(videoStream->codecpar->height);
    qreal  mFrameRate;
    mFrameRate = rationalToDouble(&videoStream->avg_frame_rate);  // 视频帧率

    // 通过解码器ID获取视频解码器（新版本返回值必须使用const）
    const AVCodec* codec = avcodec_find_decoder(videoStream->codecpar->codec_id);
    int64_t mTotalFrames;
    mTotalFrames = videoStream->nb_frames;

    mVideoFileInfo->mSize = mSize;
    mVideoFileInfo->mFrameRate = mFrameRate;
    mVideoFileInfo->mTotalFrames = mTotalFrames;
    mVideoFileInfo->mCodecName = QString(codec->name);

#if PRINT_LOG
    qDebug() << QString("分辨率：[w:%1,h:%2] 帧率：%3  总帧数：%4  解码器：%5")
        .arg(mSize.width()).arg(mSize.height()).arg(mFrameRate).arg(mTotalFrames).arg(codec->name);
#endif

    // 分配AVCodecContext并将其字段设置为默认值。
    m_codecContext = avcodec_alloc_context3(codec);
    if (!m_codecContext)
    {
#if PRINT_LOG
        qWarning() << "创建视频解码器上下文失败！";
#endif
        free();
        return false;
    }

    // 使用视频流的codecpar为解码器上下文赋值
    ret = avcodec_parameters_to_context(m_codecContext, videoStream->codecpar);
    if (ret < 0)
    {
        showError(ret);
        free();
        return false;
    }

    m_codecContext->flags2 |= AV_CODEC_FLAG2_FAST;    // 允许不符合规范的加速技巧。
    m_codecContext->thread_count = 8;                 // 使用8线程解码

    // 初始化解码器上下文，如果之前avcodec_alloc_context3传入了解码器，这里设置NULL就可以
    ret = avcodec_open2(m_codecContext, nullptr, nullptr);
    if (ret < 0)
    {
        showError(ret);
        free();
        return false;
    }

    // 分配AVPacket并将其字段设置为默认值。
    m_packet = av_packet_alloc();
    if (!m_packet)
    {
#if PRINT_LOG
        qWarning() << "av_packet_alloc() Error！";
#endif
        free();
        return false;
    }
    // 分配AVFrame并将其字段设置为默认值。
    m_frame = av_frame_alloc();
    if (!m_frame)
    {
#if PRINT_LOG
        qWarning() << "av_frame_alloc() Error！";
#endif
        free();
        return false;
    }

    // 分配图像空间
    int size = av_image_get_buffer_size(AV_PIX_FMT_RGBA, mSize.width(), mSize.height(), 4);
    /**
     * 【注意：】这里可以多分配一些，否则如果只是安装size分配，大部分视频图像数据拷贝没有问题，
     *         但是少部分视频图像在使用sws_scale()拷贝时会超出数组长度，在使用使用msvc debug模式时delete[] m_buffer会报错（HEAP CORRUPTION DETECTED: after Normal block(#32215) at 0x000001AC442830370.CRT delected that the application wrote to memory after end of heap buffer）
     *         特别是这个视频流http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4
     */
    m_buffer = new uchar[size + 1000];    // 这里多分配1000个字节就基本不会出现拷贝超出的情况了，反正不缺这点内存
//    m_image = new QImage(m_buffer, m_size.width(), m_size.height(), QImage::Format_RGBA8888);  // 这种方式分配内存大部分情况下也可以，但是因为存在拷贝超出数组的情况，delete时也会报错
    m_end = false;
    return true;
}
```
用中文回答，上面函数的含义是什么，帮我解释一下，还有视频解码的总体流程是什么样的？这个open中主要做了什么操作？




























