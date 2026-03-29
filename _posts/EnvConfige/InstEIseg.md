---
title: EIseg环境安装
date: 2023-03-23 14:00:50
tags:
- 环境配置
---

## 1. 安装 Python

勾选安装环境变量。

## 2. 安装 Anaconda

1. 不要勾选安装环境变量。
2. 安装后增加环境变量：
   - `E:\Anaconda`
   - `E:\Anaconda\Scripts`
   - `E:\Anaconda\Library\mingw-w64\bin`
   - `E:\Anaconda\Library\usr\bin`
   - `E:\Anaconda\Library\bin`

测试是否安装成功：

```bash
conda --version
```

### Anaconda 换源

1. 先打开第一次 Anaconda，会创建 `.condarc`。
2. 在 `C:\Users\{username}` 文件夹下面修改 `.condarc`：

```yaml
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

3. 换源后清理缓存：

```bash
conda clean -i
```

4. 检测是否换源成功：

```bash
conda config --show-sources # 仅查看所有镜像
```

### 测试 PyTorch

```python
import torch # 如果pytorch安装成功即可导入
print(torch.cuda.is_available()) # 查看CUDA是否可用
print(torch.cuda.device_count()) # 查看可用的CUDA数量
print(torch.version.cuda) # 查看CUDA的版本号
```

## 3. 安装 EIseg

### 创建环境

```bash
# 环境所用的python版本需要在后面指定，如果不指定默认Anaconda自带python版本
# doccano 是环境名称，可根据自己命名区分不同自己的环境
conda create -n eiseg_env python=3.10
# 激活自己的环境
conda activate eiseg_env
```

### 安装 PaddlePaddle

```bash
pip3 install paddlepaddle -i https://mirror.baidu.com/pypi/simple
```

### 安装 EIseg

```bash
pip3 install eiseg -i https://mirror.baidu.com/pypi/simple
```

### 启动

直接在命令行中输入 `eiseg`。

## 配置 EIseg

1. 只保存彩色图片。
2. 编辑快捷键：
   - 前后移动
   - 自动保存
   - 删除所有多边形
3. 保存路径不能有中文。

## 基础操作

1. 正负样本点。
2. 转化为矩形，拖动。
3. 删除矩形。

# 标注时候需要注意


# 每次打开操作
1. 选择保存类型，只保留伪彩色，coco格式
2. 加载模型
3. 打开文件夹
4. 载入标签
5. 标注
6. 空格，转化为矩形
7. 下一张

## 安装 LabelImg

```bash
conda create -n labelimg python=3.10 -y
pip install labelimg -i https://pypi.tuna.tsinghua.edu.cn/simple
```

## Anaconda 常用指令

```bash
conda config --show
conda config --show-sources
conda config --get channels
conda config --show channels
conda list
conda update -n base conda
conda install --yes --file requirements.txt
conda config --remove-key channels
conda config --set show_channel_urls yes
```

conda install --use-local pytorch-0.4.0-py35_cuda8.0.61_cudnn7.1.2_1.tar.bz2
conda remove -n 环境名字 --all
conda config --set show_channel_urls yes # 生成.condarc文件
pip install numpy -vvv # 显示安装日志

## 参考资料

- [Anaconda 超详细安装教程（Windows 环境）](https://blog.csdn.net/fan18317517352/article/details/123035625)
- [Anaconda 新建开发环境](https://blog.csdn.net/qq_42573052/article/details/113770662)
- [Anaconda 换清华镜像源（Windows）](https://blog.csdn.net/jasneik/article/details/114227716)
- [清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/)
- [EISeg 工具对应博文](https://blog.csdn.net/qq_37541097/article/details/120154543)
- [EIseg 官方安装说明](https://github.com/PaddlePaddle/PaddleSeg/blob/release/2.7/README_CN.md)
- [飞桨安装参考文档](https://www.paddlepaddle.org.cn/documentation/docs/zh/install/index_cn.html)
- [PyPI 软件仓库](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)
