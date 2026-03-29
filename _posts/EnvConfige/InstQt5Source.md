---
title: 源码安装 Qt5.15
date: 2024-11-26 17:26:40
tags:
- 环境配置
---

## 安装依赖

```bash
sudo apt-get install build-essential libgl1-mesa-dev libglu1-mesa-dev libegl1-mesa-dev freeglut3-dev gperf flex bison -y
sudo apt-get install libdrm-dev libxcomposite-dev libxcursor-dev libxi-dev libxtst-dev
sudo apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
```

## Configure 选项

```bash
./configure -release -prefix /opt/qt-5.12.5

../qt-everywhere-src-5.15.16/configure -h
../qt-everywhere-src-5.15.16/configure \
-opensource \
-prefix /opt/qt-5.12.12 \
-release \
-platform linux-g++ \
-feature-sql-sqlite \
-sqlite \
-gui \
-widgets \
-glib \
-inotify \
-make libs \
-cups \
-fontconfig \
-opengl \
-shared \
-pch \
-no-zlib \
-qt-libjpeg \
-qt-libpng \
-xcb \
-system-freetype \
-nomake examples \
-nomake tests \
-skip qtwebengine \
-skip qt3d \
-skip qtcanvas3d \
-skip qtdatavis3d
```

精简配置示例：

```bash
../qt-everywhere-src-5.15.16/configure \
-opensource \
-prefix /opt/qt-5.12.12 \
-release \
-platform linux-g++ \
-no-opengl \
-xcb \
-gui \
-widgets \
-inotify \
-make libs \
-shared \
-pch \
-no-zlib \
-nomake examples \
-nomake tests \
-skip qtwebengine \
-skip qtquick3d \
-skip qtcanvas3d \
-skip qtdatavis3d \
-skip qtgamepad \
-skip qtsensors \
-skip qtspeech \
-skip qtwayland \
-skip qtscxml \
-skip qtdoc \
--libpng=qt \
--libjpeg=qt \
--sqlite=qt \
-plugin-sql-sqlite \
-recheck-all
```

## 编译与安装

```bash
make
sudo make install
```

设置环境变量：

```bash
export QTDIR=/opt/qt-5.12.12/
export PATH=$QTDIR/bin:$PATH
export MANPATH=$QTDIR/man:$MANPATH
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
```

## 编译时间参考

- `qt-5.15-build` 目录大小：6.7 GB
- `qt-everywhere-opensource-src-5.15.16.tar.xz`：632 MB
- `qt-everywhere-src-5.15.16` 解压后：4.1 GB
- 编译耗时：约 43 分 29 秒

## 常见问题

### Qt 平台插件缺失

设置调试变量：

```bash
export QT_DEBUG_PLUGINS=1
ldd libqlinuxfb.so
```

错误信息：

```
qt.qpa.plugin: Could not find the Qt platform plugin "xcb" in ""
```

### Windows Qt 编译

```bash
qmake.exe .\01_HelloFFmpeg.pro -spec win32-g++ "CONFIG+=debug" "CONFIG+=qml_debug"
mingw32-make Makefile qmake_all
mingw32-make -j20
```

## 参考资料

- [Linux 环境下编译 Qt 源码](https://blog.csdn.net/weixin_43742643/article/details/102835929)
- [Building Qt Sources](https://doc.qt.io/qt-5/build-sources.html)
- [Qt Configure Options](https://doc.qt.io/qt-5/configure-options.html)
- [Linux 系统下源码编译 Qt](https://www.cnblogs.com/yuanhaoblog/p/18083360)
- [Ubuntu 18.04 解决 Qt 出现 qt.qpa.plugin 问题](https://www.cnblogs.com/leoking01/p/14803247.html)
- [解决本地环境编译 Qt5.12.12 源码没有 libqxcb 的问题](https://blog.csdn.net/weixin_42148156/article/details/138720548)
- [Ubuntu 18 源码编译安装 Qt5.15.3 和 MeshLab 踩坑](https://www.cnblogs.com/zxdplay/p/16743328.html)
