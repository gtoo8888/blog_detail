---
title: docker安装教程
date: 2022-06-22 23:16:36
tags:
- 环境配置
---

在windows中安装docker desktop

win11家庭版，没有开启hyper-v功能选项
在桌面新建txt文件，复制下面代码，然后改名hyper-v.cmd，**管理员方式**执行
```
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL
```
右键开始图标->应用和功能->左侧应用->可选功能->更多windows功能->hyper-v开启





# 参考文献

[windwos11没有Hyper-V的解决方法]https://www.jianshu.com/p/96aa6eeacb56



