---
title: 源码安装Qt5.15
date: 2024-11-26 17:26:40
tags:
- 环境配置
---

# linux编译qt源码
```bash
sudo apt-get install build-essential libgl1-mesa-dev libglu1-mesa-dev libegl1-mesa-dev freeglut3-dev gperf flex bison -y

# libxcb*
sudo apt-get install libdrm-dev libxcomposite-dev libxcursor-dev libxi-dev libxtst-dev
sudo apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y # 好用

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

make
sudo make install


export QTDIR=/opt/qt-5.12.12/
export PATH=$QTDIR/bin:$PATH
export MANPATH=$QTDIR/man:$MANPATH
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

编译结束
tool/qt-5.15-build/qtbase/bin/qmake -install qinstall tool/qt-5.15-build/qttranslations/translations/qtwebsockets_en.qm /opt/qt-5.12.12/translations/qtwebsockets_en.qm
tool/qt-5.15-build/qtbase/bin/qmake -install qinstall tool/qt-5.15-build/qttranslations/translations/qtxmlpatterns_en.qm /opt/qt-5.12.12/translations/qtxmlpatterns_en.qm
make[2]: Leaving directory 'tool/qt-5.15-build/qttranslations/translations'
make[1]: Leaving directory 'tool/qt-5.15-build/qttranslations'
```
6.7G    qt-5.15-build
632M    qt-everywhere-opensource-src-5.15.16.tar.xz
4.1G    qt-everywhere-src-5.15.16

编译时间43：29


export QT_DEBUG_PLUGINS=1
ldd libqlinuxfb.so

qt.qpa.plugin: Could not find the Qt platform plugin "xcb" in ""
This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

Available platform plugins are: linuxfb, minimal, offscreen, vnc.


# 参考资料
[linux环境下编译Qt源码](https://blog.csdn.net/weixin_43742643/article/details/102835929)
[Building Qt Sources](https://doc.qt.io/qt-5/build-sources.html)
[Qt Configure Options](https://doc.qt.io/qt-5/configure-options.html)
[Linux系统下源码编译qt](https://www.cnblogs.com/yuanhaoblog/p/18083360)

[Ubuntu18.04下解决Qt出现qt.qpa.plugin:Could not load the Qt platform plugin “xcb“问题](https://www.cnblogs.com/leoking01/p/14803247.html)
[解决本地环境编译qt5.12.12源码没有libqxcb的问题](https://blog.csdn.net/weixin_42148156/article/details/138720548)
[Ubuntu18源码编译安装qt5.15.3和MeshLab踩坑](https://www.cnblogs.com/zxdplay/p/16743328.html)
