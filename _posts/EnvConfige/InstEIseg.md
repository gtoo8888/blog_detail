---
title: EIseg环境安装
date: 2023-03-23 14:00:50
tags:
- 环境配置
---

# 1. 安装python
勾选安装环境变量

# 2. 安装anaconda
1. 不要勾选安装环境变量


2. 安装后增加环境变量
E:\Anaconda 
E:\Anaconda\Scripts 
E:\Anaconda\Library\mingw-w64\bin
E:\Anaconda\Library\usr\bin 
E:\Anaconda\Library\bin

测试是否安装成功
```bash
conda --version
```
1. anaconda换源

   1. 先打开第一次anaconda，会创建.condarc
   2. 在C:\Users\{username} 文件夹下面修改.condarc

```bash
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

   3. conda clean -i
   
   
   4. 检测是否换源成功

```bash
conda config --show-sources # 仅查看所有镜像
```



```python
import torch # 如果pytorch安装成功即可导入
print(torch.cuda.is_available()) # 查看CUDA是否可用
print(torch.cuda.device_count()) # 查看可用的CUDA数量
print(torch.version.cuda) # 查看CUDA的版本号
```

# 3. 安装EIseg

1. 创建自己的环境


```bash
# 环境所用的python版本需要在后面指定，如果不指定默认Anaconda自带python版本
# doccano 是环境名称，可根据自己命名区分不同自己的环境
conda create -n eiseg_env python=3.10
# 激活自己的环境
conda activate ant
```

2. 切换到新创建的环境中，打开open Terminal

3. 安装PaddlePaddle，是依赖环境

```bash
pip3 install paddlepaddle -i https://mirror.baidu.com/pypi/simple
```


4. 安装EIseg
```bash
pip3 install eiseg -i https://mirror.baidu.com/pypi/simple
```

5. 启动
直接在命令行中输入eiseg


# 配置EIseg
1. 只保存彩色图片
2. 编辑快捷键
   1. 前后移动
   2. 自动保存
   3. 删除所有多边形
3. 保存路径不能有中文


# 基础操作
1. 正负样本点
2. 转化为矩形，拖动
3. 删除矩形

# 标注时候需要注意


# 每次打开操作
1. 选择保存类型，只保留伪彩色，coco格式
2. 加载模型
3. 打开文件夹
4. 载入标签
5. 标注
6. 空格，转化为矩形
7. 下一张


# 安装LabelImg

conda create -n labelimg python=3.10 -y
pip install labelimg -i https://pypi.tuna.tsinghua.edu.cn/simple


# anaconda常用指令
```bash
conda config --show # 查看conda的配置，确认channels
conda config --show-sources # 仅查看所有镜像
conda config --get channels # 查看已经添加的channels
conda config --show channels # 查看已经添加的channels
conda list # 当前安装的包列表

# 未查看
conda update -n base conda
conda install --yes --file requirements.txt
conda config --remove-key channels
```
conda install --use-local pytorch-0.4.0-py35_cuda8.0.61_cudnn7.1.2_1.tar.bz2
conda remove -n 环境名字 --all
# 参考资料
[Anaconda超详细安装教程（Windows环境下）]https://blog.csdn.net/fan18317517352/article/details/123035625 <br/>
[新手教程一：Anaconda新建开发环境]https://blog.csdn.net/qq_42573052/article/details/113770662 <br/>
[anaconda 换清华镜像源 windows](https://blog.csdn.net/jasneik/article/details/114227716) <br/>
[清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/) <br/>
[Anaconda之导出/导出配置好的虚拟环境](https://blog.csdn.net/qq_43382635/article/details/127124980) <br/>
[EISeg工具对应博文](https://blog.csdn.net/qq_37541097/article/details/120154543) <br/>
[EIseg官方安装说明](https://github.com/PaddlePaddle/PaddleSeg/blob/release/2.7/README_CN.md) <br/>
[飞桨安装参考文档](https://www.paddlepaddle.org.cn/documentation/docs/zh/install/index_cn.html) <br/>









