---
title: VS2017 使用教程
date: 2023-01-02 20:56:46
tags:
- 项目
---


# 问题
## Qt相关

1. 无法打开源文件，找不到Qt的头文件
vs2017 E1696	无法打开 源 文件 "QtWidgets/QMainWindow"	





# VS2017问题相关

1. printf没有输出
链接器->系统->窗口 (/SUBSYSTEM:WINDOWS)


添加参数的工程-->属性-->配置属性-->调试->命令参数
各参数间用空格分离

```shell
$(ProjectDir)\include
$(ProjectDir)\lib

$(ProjectDir) 表示 xxx.vcxproj所在的目录
$(ProjectName) 代表具体的project 名称,
$(SolutionDir)
```

avcodec.lib
avformat.lib
avutil.lib
avdevice.lib
avfilter.lib
postproc.lib
swresample.lib
swscale.lib


```bash
MSBuild属性宏:
- $(OutDir):输出目录，用于存放生成的可执行文件或库文件
- $(ProjectName):项目名称，通常与项目文件名相同
- $(Configuration):当前项目配置，例如Debug或Release
- $(Platform):当前项目平台，例如Win32或x64
- $(SolutionDir):解决方案目录，包含解决方案文件所在的路径
- $(ProjectDir):项目目录，包含项目文件所在的路径

$(SolutionDir)
$(SolutionExt)
$(SolutionFileName)
$(SolutionName)
$(SolutionPath)
```








# 常规设置
## 显示空白符号
【选项】--->【文本编辑器】----->【显示】----->【查看空白】

## 将tab替换成四个空格

Tools>Options>Text Editor>All Languages>Tabs>

# 配置工程为C++14或者17

# 参考资料

[VS2015设置DLL和LIB的输出目录_zt_xcyk的博客-CSDN博客_lib的输出目录](https://blog.csdn.net/zt_xcyk/article/details/78006223)
