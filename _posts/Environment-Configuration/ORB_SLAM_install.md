---
title: ORB_SLAM
date: 2023-07-15 14:23:09
tags:
- 环境配置
---

# 安装系统完成

# 小鱼一键安装ros
装好系统，直接使用小鱼一键安装，开机就直接安装
会帮助换源
同时装好了opencv，Eigen3
```bash
wget http://fishros.com/install -O fishros && . fishros  
```
ros-melodic
1
1
2
1
1
重启一下系统

查看一下opencv和eigen是否安装成功
sudo apt list --installed | grep opencv
sudo dpkg -l | grep eigen

## 安装小工具
```bash
sudo apt-get install vim openssh-server openssh-client net-tools git -y
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
# sudo vi /etc/ssh/sshd_config
# PermitRootLogin yes 
/etc/init.d/ssh restart
# ssh yzx@127.0.0.1
```
## 一键安装ORB-SLAM3

24GB = 24576MB
28GB = 28672MB



# 安装D455驱动


sudo apt-get install libudev-dev pkg-config libgtk-3-dev libusb-1.0-0-dev libglfw3-dev libssl-dev -y
sudo apt-get install terminator -y # 安装多窗口终端

mkdir build && cd build
cmake ../ -DBUILD_EXAMPLES=true
make -j 4 # 需要保证git clone https是通的
sudo make install


librealsene/Cmake/external_libcurl.cmake
GIT_REPOSITORY "https://github.com/curl/curl.git"
GIT_REPOSITORY "git@github.com:curl/curl.git" # 需要配置一下git拉取



（1）连接相机
（2）测试相机（方法1）
   cd ~/librealsense-2.50.0/build/examples/capture
   ./rs-capture
      //出现相机拍摄窗口和IMU窗口且终端显示相机参数即为安装成功
（3）测试相机（方法2）
   cd /home/qinyibo/librealsense-2.50.0/build/tools/realsense-viewer
   sudo ./realsense-viewer
      //相机运行软件中出现出现相机拍摄窗口和IMU窗口并且可以设置模式与参数即为成功
      //右上角出现Dismiss错误时，可以重新插拔，但即使不出现错误，其Motion Module打开时依旧报错，但貌似不影响使用，暂时不管
         Severity:Error
         Description:Motion Module failure


while true; do free -h | tail ; sleep 1; done
while true; do rostopic list;echo "-------------"  ; sleep 1; done

rostopic list | tail
## 跑bag包测试
1. roscore

cd $HOME/orb_slam/ORB_SLAM3_detailed_comments/Examples/ROS/ORB_SLAM3/build/
2. source $HOME/orb_slam/ORB_SLAM3_detailed_comments/Examples/ROS/ORB_SLAM3/build/devel/setup.bash

source $HOME/orb_slam/ORB_SLAM3_pigg/Examples_old/ROS/ORB_SLAM3_dense_yolo/build/devel/setup.bash

cd $HOME/orb_slam/ORB_SLAM3_detailed_comments/
1. rosrun ORB_SLAM3 Mono Vocabulary/ORBvoc.txt Examples_old/Monocular-Inertial/EuRoC.yaml
//运行ORB-SLAM3,并在ORB_SLAM3下产生运行结果（关键帧轨迹文件）
//如果运行完记录包，出现跟踪局部地图失败提示，好像是因为运行快没有提取到特征点，目前解决方案是重新运行跑一次。
//跑完记录包，本运行终端不会停止运行，暂时只能Ctrl+C结束，会有qt报错和核心转储报错，暂时无法解决。

1. 在ROS记录包目录下打开终端3，运行记录包
rosbag play –pause MH_01_easy.bag /cam0/image_raw:=/camera/image_raw /imu0:=/imu
//选择下载的Euroc数据集的ROS记录包
//设置发布的话题名称，要与ORB-SLAM3订阅的话题一样
//pause代表用space可以控制开始和暂停跑包

## 双系统的问题
1. 没有网卡
   1. AX211 160MHZ
2. 没有显卡驱动
3. 没有输入法

```bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo vi /etc/apt/sources.list
sudo apt-get update # 更新软件包列表,从软件源中获取最新的软件包信息，并将其存储在本地的软件包列表中。
sudo apt-get upgrade # 升级已安装的软件包的命令，它会检查本地软件包列表中的软件包是否有更新的版本，如果有的话就会将其升级到最新版本。
```


# 

ps aux 命令会显示所有用户的所有进程，并且以用户为基础显示进程的详细信息。
sudo dpkg -i XXX(你下载的安装包名).deb

sudo apt list --installed | grep opencv
sudo dpkg -l | grep eigen


apt list # 列出所有已安装的软件包。
apt list --installed # 列出所有已安装的软件包。
apt list --upgradable # 列出可升级的软件包


tar -zxvf FileName.tar.gz               # 解压
tar -zcvf FileName.tar.gz DirName       # 将DirName和其下所有文件（夹）压缩

tar -zcvf orb_slam.tar.gz orb_slam


sudo apt install libglew-dev

## 需要安装的包
Pangolin
opencv 
Eigen3

# 安装clash linux



# 关闭自动更新

打开软件安装，更新，永远停止

set -e
set -u # 不能使用未定义的变量
# set -x # 每一行执行后显示
# set -o pipefail # 管道中的每个错误都会显示





# os-specific listings first
yaml file:///home/yzx/rosdistro/rosdep/osx-homebrew.yaml osx

# generic
yaml file:///home/yzx/rosdistro/rosdep/base.yaml
yaml file:///home/yzx/rosdistro/rosdep/python.yaml
yaml file:///home/yzx/rosdistro/rosdep/ruby.yaml
gbpdistro file:///home/yzx/rosdistro/releases/fuerte.yaml fuerte
# newer distributions (Groovy, Hydro, ...) must not be listed anymore, they are being fetched from the rosdistro index.yaml instead

FUERTE_GBPDISTRO_URL = 'file:///home/yzx/rosdistro/' \
    'releases/fuerte.yaml'


REP3_TARGETS_URL = 'file:///home/yzx/rosdistro/releases/targets.yaml'

DEFAULT_INDEX_URL = 'file:///home/yzx/rosdistro/index-v4.yaml'


./Examples/Monocular-Inertial/mono_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/EuRoC.yaml /home/yzx/MH01 ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH01.txt dataset-MH01_monoi


df -h 查看空间大小

# 

# 参考资料
[Ubuntu20.04软件源更换 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/142014944)

https://opclash.com/fenxiang/302.html

https://fishros.org.cn/forum/topic/20/%E5%B0%8F%E9%B1%BC%E7%9A%84%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E7%B3%BB%E5%88%97


https://blog.csdn.net/m0_58402697/article/details/122298129
https://www.intel.com/content/www/us/en/support/articles/000005511/wireless.html


