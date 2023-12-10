---
title: libtorch 安装教程
date: 2023-07-30 23:29:09
tags:
- 环境配置
---

## 1 需要安装的东西
### 1.1 NVIDIA驱动
让显卡可以正确识别和配置的
名称一般都是：
NVIDIA-Linux-x86_64-535.54.03.run
在官网上可以查看到对应的版本，并且下载
https://www.nvidia.com/Download/index.aspx

### 1.2 CUDA Toolkit
CUDA Toolkit是由NVIDIA开发的一套用于并行计算的工具集
名称一般都是：
cuda_11.1.0_455.23.05_linux.run*
在cuda的网站进行下载
https://developer.nvidia.com/cuda-downloads
下面有
Archive of Previous CUDA Releases
可以查看更多版本的


CUDA Toolkit包含的内容
CUDA驱动程序（CUDA Driver）
CUDA Runtime API：
CUDA编译器（nvcc）：nvcc是CUDA的编译器，
CUDA Math库（cuMath）
CUDA示例和工具

### 1.3 cuDNN (CUDA Deep Neural Network library)
是CUDA Toolkit中的一个部分

是NVIDIA专门为深度学习而开发的一个高性能库。它是CUDA Toolkit的一部分，但是需要单独下载和安装。cuDNN提供了一系列的深度学习算法和函数，如卷积、池化、激活函数等，以及一些优化技术，如自动调整算法、半精度计算等，用于加速深度学习模型的训练和推理。

### 1.4 nvcc 
nvcc是CUDA的编译器

### 1.5 libtorch
pytorch的C++接口，使用了cuDNN提供的高性能深度学习算法和优化技术

### 1.6 总结需要安装的

- NVIDIA驱动：显卡能正常工作
- CUDA Toolkit：能进行cuda开发，提供了cuDNN，nvcc
- libtorch：使用pytorch的C++接口

问题：
如果使用自动安装NVIDIA驱动，装好以后会自动装上nvcc,cuDNN，所以最好手动一个一个安装


## 2. 安装教程

安装的总体思路：
1. 安装NVIDIA驱动
   1. 标志是nvidia-smi通过
2. 安装cuda,也就是cuda toolkit
   1. 标志是执行.sh以后不报错
3. 安装cuDNN,这个是cuda中用于神经网络的库
   1. 标志是nvcc -V有版本显示，并且是正确的
4. 安装libtorch
   1. 标志是#include <torch/torch.h>并且使用cmake编译没有报错
   2. 如果前面安装的有问题，那么中间会报错没有cuda,没有cuDNN


### 2.0 卸载
如果之前是用系统自带的安装的，需要先线束
删除cuda

sudo apt-get purge --auto-remove nvidia-cuda-toolkit

### 2.1 安装NVIDIA驱动
#### 2.1.1 禁用 Nouveau 驱动
安装之前报错
ERROR: The Nouveau kernel driver is currently in use by your system. This driver is incompatible with the NVIDIA driver……
解决方法：
禁用 Nouveau 驱动
```bash
# 检查 nouveau是否使用
lspci | grep nouveau
# 禁用nouveau
sudo vim /etc/modprobe.d/blacklist-nvidia-nouveau.conf
# 添加
blacklist nouveau 
options nouveau modeset=0

lspci | grep nouveau
```
#### 2.1.2 安装NVIDIA驱动
[NVIDIA显卡驱动官网](https://www.nvidia.com/Download/index.aspx)
搜索关键词为：**NVIDIA显卡驱动**
**NVIDIA-Linux-x86_64-535.54.03.run**
去官网下载自己显卡对应的驱动型号,然后安装驱动
```bash
# 添加可执行权限
sudo chmod a+x NVIDIA-Linux-x86_64-535.54.03.run
sudo ./NVIDIA-Linux-x86_64-535.54.03.run
# 查看是否安装成功
nvidia-smi
```
这个时候安装的cuda版本是12.2的是最新的版本的，待会需要重新安装适合自己的cuda版本
```bash
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.86.05              Driver Version: 535.86.05    CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA GeForce RTX 3060 ...    Off | 00000000:01:00.0  On |                  N/A |
| N/A   41C    P8              15W /  80W |   1024MiB /  6144MiB |     20%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
                                                                                         
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A      1310      G   /usr/lib/xorg/Xorg                           42MiB |
|    0   N/A  N/A      1404      G   /usr/bin/gnome-shell                        115MiB |
|    0   N/A  N/A      1619      G   /usr/lib/xorg/Xorg                          489MiB |
|    0   N/A  N/A      1744      G   /usr/bin/gnome-shell                         70MiB |
|    0   N/A  N/A      2794      G   ...sion,SpareRendererForSitePerProcess      137MiB |
|    0   N/A  N/A     23307      G   /usr/lib/firefox/firefox                    145MiB |
+---------------------------------------------------------------------------------------+
```
#### 2.1.3 nvidia-smi显示的cuda版本的思考
根据参考资料2的推断，ubuntu中安装的cuda是可以有两个版本的：
1. 驱动电脑显示屏显示，通过nvidia-smi中的cuda版本显示
2. 用来编写程序，进行cuda加速计算的，可以再安装一个自己的版本

实测得到，nvidia-smi中读取得到的cuda版本来自于以下的路径，如果删除以下路径这些.so文件，会造成nvidia-smi中cuda版本显示为N/A
```bash
/usr/lib/i386-linux-gnu/libcuda.so.1
/usr/lib/i386-linux-gnu/libcuda.so
/usr/lib/i386-linux-gnu/libcuda.so.535.86.05

/usr/lib/x86_64-linux-gnu/libcuda.so.470.182.03
/usr/lib/x86_64-linux-gnu/libcuda.so
/usr/lib/x86_64-linux-gnu/libcuda.so.535.86.05
```

### 2.2 安装cuda
所安装的cuda其实只是一个简写，其实是安装的CUDA Toolkit
[CUDA Toolkit官网](https://developer.nvidia.com/cuda-downloads)
搜索关键词为：**CUDA Toolkit**
**cuda_11.1.0_455.23.05_linux.run**
下载自己想要的cuda版本，这个版本需要和之后的libtorch版本对应
```bash
sudo chmod a+x cuda_11.1.0_455.23.05_linux.run
sudo ./cuda_11.1.0_455.23.05_linux.run  
```
等待的时间比较长，之后会显示一个图形界面
accept
Install
一般就可以安装完成了，安装失败：
Installation failed. See log at /var/log/cuda-installer.log for details.
只要能正常的显示输出，那就是安装成功了
可以去/usr/local/目录下面看，没有有自己cuda版本对应的文件夹
我的目录结构是这样的
local/
├── cuda -> /usr/local/cuda-11.1/
└── cuda-11.1

#### 2.2.1 报错解决

##### 报错1
│ Existing package manager installation of the driver found. It is strongly    
│ recommended that you remove this before continuing
报错原因：
有多个cuda，直接不允许继续安装了，我这边的尝试，只要继续安装一直是无法安装成功的
这个报错出现在使用系统自带的软件安装cuda,
解决方法：
1. 卸载安装的cuda，再次尝试是否可以安装，我这边的尝试是不行的
```bash
# 查找方法1
apt list --installed | grep "cuda" # 查找安装的cuda包
# 查找方法2
dpkg -l "*cuda*" # 使用dpkg自带的搜索，不使用grep过滤
# 连带依赖一起删除
sudo apt-get --purge remove "cuda*" # 把这些cuda相关的包都删除，--purge表示依赖关系也都删除
# 查看是否删除干净
apt list --installed | grep "cuda"
```
2. 卸载nvidia驱动，不使用系统安装的nvidia驱动，自己手动从官网下载安装
如果有是用独显做双屏显示的，记得先只显示一个屏幕
```bash
# 查找nvidia驱动有哪些
apt list --installed | grep "nvidia"
# 连带依赖一起删除
sudo apt-get --purge remove "nvidia*" 
sudo apt-get --purge remove "libnvidia*" 
# 查看是否删除干净
apt list --installed | grep "cuda"
# 重启
reboot
# 重启后使用nvidia-smi，提示找不到指令，说明卸载到了，从安装显卡驱动那一步开始安装
```

##### 报错2
Installation failed. See log at /var/log/cuda-installer.log for details.
参考下面的解决方法
[最终解决cuda安装问题的资料，去掉cuda driver](https://blog.csdn.net/weixin_49223002/article/details/120509776)
报错原因：
已经有一个cuda了，但是但是继续安装报错
解决方法：
在安装的过程中，Driver CUDA去掉
解决原理：
原有的cuda库是用于显示器驱动的，这个驱动的cuda库只能安装一个，只要不安装驱动类型的cuda，仅仅安装其余的，就可以解决报错


### 2.3 安装cnDNN

#### 2.3.1 安装
去官网或者别的渠道下载一个安装包，我下载的是
cudnn-11.1-linux-x64-v8.0.5.39.zip
```bash
# 解压
unzip cudnn-11.1-linux-x64-v8.0.5.39.zip
cd cudnn-11.1-linux-x64-v8.0.5.39/cuda
# 安装，实际上是把这些文件粘贴到cuda的路径下
# 如果前一步cuda安装失败，或者用的是系统安装cuda的方式，在/usr/local/文件夹下是没有cuda-XX.X文件夹的
sudo cp include/cudnn.h /usr/local/cuda-11.1/include/
sudo cp include/cudnn_version.h /usr/local/cuda-11.1/include/
sudo cp lib64/libcudnn* /usr/local/cuda-11.1/lib64/
sudo chmod a+r /usr/local/cuda-11.1/include/cudnn.h
sudo chmod a+r /usr/local/cuda-11.1/lib64/libcudnn*
```
#### 2.3.2 添加环境变量
```bash
vim ~/.bashrc
# 添加以下内容，保证cuDNN可以被找到
export CUDA_HOME=/usr/local/cuda
export PATH=$PATH:$CUDA_HOME/bin
export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}} 
source ~/.bashrc
```
#### 2.3.3 测试版本
```bash
# 查看安装的cnDNN版本
# 新版的版本信息放在了cudnn_version.h里面
cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_MAJOR -A 2
# 测试是否安装成功
nvcc -V
# 观察下面的版本，现在nvcc中对应的cuda版本是自己安装的11.1
# 如果是用nvidia-smi输出，此时还是12.2也就是现在安装了两个cuda版本
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2020 NVIDIA Corporation
Built on Tue_Sep_15_19:10:02_PDT_2020
Cuda compilation tools, release 11.1, V11.1.74
Build cuda_11.1.TC455_06.29069683_0
```


### 2.4 安装libtorch

#### 2.4.1 安装
官网只有最新版本的，从这个地址下载了需要的libtorch安装包
我下载的是这个版本
ibtorch-cxx11-abi-shared-with-deps-1.9.0+cu111.zip
libtorch里面提供了.so的动态库文件，还有.h文件，不需要安装，只需要制定路径就可以使用
```bash
# 制定文件夹解压
unzip -d ~/tools ibtorch-cxx11-abi-shared-with-deps-1.9.0+cu111.zip
```

#### 2.4.2 例子测试
参考如下，写一个简单的例子
[LibTorch简单的使用教程](https://blog.csdn.net/LconLu/article/details/128171775)

C++测试文件
```C++
#include <torch/torch.h> // 头文件导入成功，说明上面的所有都安装成功了
#include <iostream>
 
int main() {
  torch::Tensor tensor = torch::rand({2, 3}); //生成大小为2*3的随机数矩阵
  std::cout << tensor << std::endl;           //标准输出流打印至屏幕
}
```
cmake文件
```C++
cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(example-app)
 
find_package(Torch REQUIRED)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${TORCH_CXX_FLAGS}")
 
add_executable(example-app example-app.cpp)
target_link_libraries(example-app "${TORCH_LIBRARIES}")
set_property(TARGET example-app PROPERTY CXX_STANDARD 14)
```
编译过程
```bash
$mkdir build
$cd build
$cmake -DCMAKE_PREFIX_PATH=~/tools/libtorch ..
$make
```
编译成功，就说明上面的都安装成功了

#### 2.4.3 报错解决
##### 报错1
```bash
CMake Error at CMakeLists.txt:6 (find_package):
  By not providing "FindTorch.cmake" in CMAKE_MODULE_PATH this project has
  asked CMake to find a package configuration file provided by "Torch", but
  CMake did not find one.

  Could not find a package configuration file provided by "Torch" with any of
  the following names:

    TorchConfig.cmake
    torch-config.cmake
```
报错原因：
没有找到libtorch文件的路径
解决方法：
需要使用cmake -DCMAKE_PREFIX_PATH=~/tools/libtorch ..编译，看下自己的路径，是不是指定的正确



##### 报错2
```bash
CMake Error at cmake/public/cuda.cmake:318 (message):
  CUDA 9.1 is not compatible with std::tuple from GCC version >= 6.  Please
  upgrade to CUDA 9.2 or use the following option to use another version (for
  example):
    -DCUDA_HOST_COMPILER=/usr/bin/gcc-5
```
报错原因：
1. 通过报错信息的提示看到，是cuda版本的过低产生的，于是通过apt list --installed | grep "cuda"
2. 可以看到安装的nvidia-cuda-toolkit版本仅仅是9.1，同时查看/usr/bin/里面没有gcc-5,只有gcc-6还有gcc-7
3. 报错的根本原因是cuda版本过低导致的，需要卸载cuda toolkit重新安装才能解决
```bash
# 方法1：使用列出软件的所有来源
apt-cache madison nvidia-cuda-toolkit 
# 方法2：使用列出软件的所有来源
apt-cache policy nvidia-cuda-toolkit 
# 使用apt-cache showpkg列出软件的所有来源
apt-cache showpkg nvidia-cuda-toolkit 
# 模拟安装软件
apt-get install -s  nvidia-cuda-toolkit 
# 列出软件所有版本，并查看是否已经安装
apt-get install apt-show-versions
apt-show-versions -a nvidia-cuda-toolkit 
# 可以看到我使用的源，只有9.1这个版本，没有更高的了，所以需要手动安装
# 只要自己使用apt的方式安装nvidia-cuda-toolkit是始终无法解决这个问题的
nvidia-cuda-toolkit | 9.1.85-3ubuntu1 | https://mirrors.ustc.edu.cn/ubuntu bionic/multiverse amd64 Packages
# 通过apt-get安装指定版本软件
apt-get install package=version
```
4. 我最开始安装cuda的方式，是使用系统自带的Software & Updates选择推荐型号进行安装的，所以安装时候安装附带的nvidia-cuda-toolkit就使用源中的这个版本，导致出现了版本过低的问题
解决方法：
我的解决方式是，一直从2.1开始，删除cuda,删除nvidia显卡驱动，最终解决



### 报错3
```bash
Found cuDNN: v?
```
报错原因：
新版本cudnn的版本信息包含在cudnn_version.h中，而不是cudnn.h中
解决方法：
修改：libtorch/share/cmake/Caffe2/public/cuda.cmake，148行
```bash
file(READ ${CUDNN_INCLUDE_PATH}/cudnn.h CUDNN_HEADER_CONTENTS) # 替换前
file(READ ${CUDNN_INCLUDE_PATH}/cudnn_version.h CUDNN_HEADER_CONTENTS)  # 替换后
```




# 参考资料
## 各种安装包官网的下载地址
[NVIDIA显卡驱动官网](https://www.nvidia.com/Download/index.aspx)
[CUDA Toolkit官网](https://developer.nvidia.com/cuda-downloads)
[cuDNN官网下载地址-需要登录](https://developer.nvidia.com/rdp/cudnn-archive)
[[LibTorch & Linux] 各版本 LibTorch 下载](https://blog.csdn.net/weixin_43742643/article/details/114156298)
## 参考资料
[Ubuntu 安装 NVIDIA 显卡驱动详细步骤](https://blog.csdn.net/wohu1104/article/details/107032493)
[最终解决cuda安装问题的资料，去掉cuda driver](https://blog.csdn.net/weixin_49223002/article/details/120509776)
[LibTorch简单的使用教程](https://blog.csdn.net/LconLu/article/details/128171775)
[Found cuDNN: v?解决]https://zhuanlan.zhihu.com/p/370192639
[各版本CUDA toolkit和cuDNN官方下载地址-无需登录](https://zhuanlan.zhihu.com/p/544370871)
[使用apt-get查询安装指定版本的软件](https://blog.csdn.net/yjk13703623757/article/details/78945576)



