---
title: ORB_SLAM 环境安装
date: 2023-07-15 14:23:09
tags:
- 环境配置
---

## ROS 安装（小鱼一键）

使用小鱼一键安装工具，开机直接安装，自动换源，同时装好 OpenCV 和 Eigen3：

```bash
wget http://fishros.com/install -O fishros && . fishros
```

选择 `ros-melodic` → 1 → 1 → 2 → 1 → 1 → 完成安装后重启系统。

验证：

```bash
# 查看opencv和eigen是否安装成功
sudo apt list --installed | grep opencv
sudo dpkg -l | grep eigen
```

## 安装小工具

```bash
sudo apt-get install vim openssh-server openssh-client net-tools git -y
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
/etc/init.d/ssh restart
```

## D455 相机驱动

```bash
sudo apt-get install libudev-dev pkg-config libgtk-3-dev libusb-1.0-0-dev libglfw3-dev libssl-dev -y
sudo apt-get install terminator -y

mkdir build && cd build
cmake ../ -DBUILD_EXAMPLES=true
make -j 4
sudo make install

librealsene/Cmake/external_libcurl.cmake
GIT_REPOSITORY "https://github.com/curl/curl.git"
GIT_REPOSITORY "git@github.com:curl/curl.git" # 需要配置一下git拉取
```

测试相机：
（1）连接相机
（2）测试相机（方法1）
```bash
cd ~/librealsense-2.50.0/build/examples/capture
./rs-capture
```
（3）测试相机（方法2）
   cd /home/qinyibo/librealsense-2.50.0/build/tools/realsense-viewer
   sudo ./realsense-viewer
      //相机运行软件中出现出现相机拍摄窗口和IMU窗口并且可以设置模式与参数即为成功
      //右上角出现Dismiss错误时，可以重新插拔，但即使不出现错误，其Motion Module打开时依旧报错，但貌似不影响使用，暂时不管
         Severity:Error
         Description:Motion Module failure


## ORB-SLAM3 编译

依赖头文件位置：

- `/opt/ros/melodic/include`
- `/usr/include/pcl-1.8/`

编译示例：

```bash
cd ORB_SLAM3_detailed_comments/Examples/ROS/ORB_SLAM3/build/
source $HOME/orb_slam/ORB_SLAM3_detailed_comments/Examples/ROS/ORB_SLAM3/build/devel/setup.bash
```

## ROS 常用命令

```bash
# 查看内存
while true; do free -h | tail; sleep 1; done

# 查看话题
while true; do rostopic list; echo "-------------"; sleep 1; done
rostopic list | tail
```

## 跑 Bag 包测试

```bash
# 终端1：启动 roscore
roscore

# 终端2：运行 ORB-SLAM3
cd $HOME/orb_slam/ORB_SLAM3_detailed_comments/Examples/ROS/ORB_SLAM3/build/
source $HOME/orb_slam/ORB_SLAM3_detailed_comments/Examples/ROS/ORB_SLAM3/build/devel/setup.bash
cd $HOME/orb_slam/ORB_SLAM3_detailed_comments/
rosrun ORB_SLAM3 Mono Vocabulary/ORBvoc.txt Examples_old/Monocular-Inertial/EuRoC.yaml
//运行ORB-SLAM3,并在ORB_SLAM3下产生运行结果（关键帧轨迹文件）
//如果运行完记录包，出现跟踪局部地图失败提示，好像是因为运行快没有提取到特征点，目前解决方案是重新运行跑一次。
//跑完记录包，本运行终端不会停止运行，暂时只能Ctrl+C结束，会有qt报错和核心转储报错，暂时无法解决。


# 终端3：播放 bag
rosbag play --pause MH_01_easy.bag /cam0/image_raw:=/camera/image_raw /imu0:=/imu
```
//选择下载的Euroc数据集的ROS记录包
//设置发布的话题名称，要与ORB-SLAM3订阅的话题一样
//pause代表用space可以控制开始和暂停跑包

## 双系统常见问题

1. **没有网卡**：Intel AX211 160MHZ 驱动问题。
2. **没有显卡驱动**：需额外安装。
3. **没有输入法**：需另行安装。

换源：

```bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo vi /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade
```

## 常用命令

```bash
# 查看已安装包
apt list --installed
sudo apt list --installed | grep opencv
sudo dpkg -l | grep eigen

# 打包
tar -zcvf orb_slam.tar.gz orb_slam

# 安装依赖
sudo apt install libglew-dev
```

## 需要安装的包
Pangolin
opencv 
Eigen3

# 安装clash linux



# 关闭自动更新

打开软件安装，更新，永远停止




```bash
# os-specific listings first
yaml file:///home/<name>/rosdistro/rosdep/osx-homebrew.yaml osx

# generic
yaml file:///home/<name>/rosdistro/rosdep/base.yaml
yaml file:///home/<name>/rosdistro/rosdep/python.yaml
yaml file:///home/<name>/rosdistro/rosdep/ruby.yaml
gbpdistro file:///home/<name>/rosdistro/releases/fuerte.yaml fuerte
# newer distributions (Groovy, Hydro, ...) must not be listed anymore, they are being fetched from the rosdistro index.yaml instead
```
FUERTE_GBPDISTRO_URL = 'file:///home/<name>/rosdistro/' \
    'releases/fuerte.yaml'


REP3_TARGETS_URL = 'file:///home/<name>/rosdistro/releases/targets.yaml'

DEFAULT_INDEX_URL = 'file:///home/<name>/rosdistro/index-v4.yaml'


./Examples/Monocular-Inertial/mono_inertial_euroc ./Vocabulary/ORBvoc.txt ./Examples/Monocular-Inertial/EuRoC.yaml /home/<name>/MH01 ./Examples/Monocular-Inertial/EuRoC_TimeStamps/MH01.txt dataset-MH01_monoi


# 主要头文件所在位置
/opt/ros/melodic/include
/usr/include/pcl-1.8/

"${workspaceFolder}/**",
"/usr/include/**",
"/opt/ros/melodic/include/**"



## 第一个libtorch例子

```C++
#include <torch/torch.h>
#include <iostream>

int main() {
  torch::Tensor tensor = torch::eye(3);
  std::cout << tensor << std::endl;
}
```


```c++
cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(dcgan)

find_package(Torch REQUIRED)

add_executable(dcgan dcgan.cpp)
target_link_libraries(dcgan "${TORCH_LIBRARIES}")
set_property(TARGET dcgan PROPERTY CXX_STANDARD 14)
```

## 参考资料

- [Ubuntu 20.04 软件源更换](https://zhuanlan.zhihu.com/p/142014944)
- https://opclash.com/fenxiang/302.html
- https://blog.csdn.net/m0_58402697/article/details/122298129
- ttps://www.intel.com/content/www/us/en/support/articles/000005511/wireless.html
- [小鱼一键安装 ROS](https://fishros.org.cn/forum/topic/20/小鱼的一键安装脚本)
- [libtorch 总教程](https://pytorch.org/cppdocs/installing.html)
- [libtorch 简单介绍](https://pytorch.org/tutorials/advanced/cpp_frontend.html)
