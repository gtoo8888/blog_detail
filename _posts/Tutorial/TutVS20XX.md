---
title: VS2017 使用教程
date: 2023-01-02 20:56:46
tags:
- 教程
---

# VS2017 使用教程

## 一、常见问题

### Qt 相关

**报错：无法打开源文件 "QtWidgets/QMainWindow"**
在项目属性中添加 Qt 的 include 路径。

### printf 没有输出

**原因：** 链接器子系统设置问题。

**解决：** 链接器 → 系统 → 子系统 → 窗口 (`/SUBSYSTEM:WINDOWS`)

同时在项目属性 → 配置属性 → 调试 → 命令参数中添加所需参数。

### 添加包含目录和库目录

项目属性 → 配置属性 → 调试 → 命令参数：
```shell
$(ProjectDir)\include
$(ProjectDir)\lib
$(ProjectDir) 表示 xxx.vcxproj所在的目录
$(ProjectName) 代表具体的project 名称,
$(SolutionDir)
```

MSBuild 常用属性宏：
- `$(OutDir)`：输出目录，用于存放生成的可执行文件或库文件
- `$(ProjectName)`：项目名称，通常与项目文件名相同
- `$(Configuration)`：当前配置（Debug/Release）
- `$(Platform)`：当前平台（Win32/x64）
- `$(SolutionDir)`：解决方案目录，包含解决方案文件所在的路径
- `$(ProjectDir)`：项目文件所在目录，包含项目文件所在的路径
$(SolutionExt)
$(SolutionFileName)
$(SolutionName)
$(SolutionPath)

常用库：
```
avcodec.lib avformat.lib avutil.lib avdevice.lib
avfilter.lib postproc.lib swresample.lib swscale.lib
```

## 二、常规设置

### 显示空白符号
选项 → 文本编辑器 → 显示 → 查看空白

### Tab 替换为空格
工具 → 选项 → 文本编辑器 → 所有语言 → Tab
Tools>Options>Text Editor>All Languages>Tabs>

### 配置 C++ 标准
项目属性 → C/C++ → 语言 → C++ 语言标准 → 选择 C++14 或 C++17

## 参考资料

- [VS2015 设置 DLL 和 LIB 的输出目录](https://blog.csdn.net/zt_xcyk/article/details/78006223)
