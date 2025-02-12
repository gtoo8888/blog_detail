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


# 参考资料

## 美化相关
[Qt|C++毛玻璃效果窗口Areo效果透明模糊窗口]https://www.bilibili.com/video/BV1x94y1N7f4/?vd_source=76dff3ae3b42b00d067c0921bf6859ca
[UI仓库]https://github.com/BFEMCC/Qt-widget-Fancy_UI
南开大学23C++


















