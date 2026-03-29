---
title: docker安装教程
date: 2022-06-22 23:16:36
tags:
- 环境配置
---

在 Windows 中安装 Docker Desktop。

Win11 家庭版没有开启 Hyper-V 功能选项。在桌面新建 txt 文件，复制下面代码，然后改名 `hyper-v.cmd`，**管理员方式**执行：

```bash
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyper-v.txt
for /f %%i in ('findstr /i . hyper-v.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyper-v.txt
Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL
```

右键开始图标 -> 应用和功能 -> 左侧应用 -> 可选功能 -> 更多 Windows 功能 -> 开启 Hyper-V

## 参考资料

- [Windows 11 没有 Hyper-V 的解决方法](https://www.jianshu.com/p/96aa6eeacb56)
