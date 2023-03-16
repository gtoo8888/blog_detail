---
title: python 语法
date: 2022-02-24 20:47:46
tags:
- 语法
---

# 语言规范


1. 变量名小写，下划线连接
   1. train_txt_file
2. 函数名一般小写，下划线连接
   1. def txt_save(self):
3. 类名称一般大驼峰
   1. class BatchRename():

# 基础

## inf
Python中可以用如下方式表示正负无穷
```
float("inf")  # 正无穷
float("-inf")  # 负无穷
```
 1. INF做加法、乘法等算数运算仍然会的到inf：
 2. 除了 INF 外的其他数除以 INF ，会得到0：
 3. 任何其他的数值除以 INF 都会得到 INF， 因为INF表示正无穷
 4. 如果 INF 涉及到 < 和 > 不等式的问题，所有数都比 -inf 大，所有数都比 +inf 小就可以了。

# Numpy

## np.mean()
np.mean()函数功能：求取均值
经常操作的参数为axis，以m * n矩阵举例：
axis 不设置值，对 m*n 个数求均值，返回一个实数
axis = 0：压缩行，对各列求均值，返回 1* n 矩阵
axis =1 ：压缩列，对各行求均值，返回 m *1 矩阵

```
np.mean(num1,0)
num1 = np.array([[1,2,3],[2,3,4],[3,4,5],[4,5,6]])
num2 = np.mat(num1)

ans = np.mean(num1,0)
3.5
ans = np.mean(num1,0) # 压缩行，对各列求均值
matrix([[ 2.5,  3.5,  4.5]])
ans = np.mean(num1,1) # 压缩列，对各行求均值
matrix([[ 2.],
        [ 3.],
        [ 4.],
        [ 5.]])
```

## np.fliplr()
将数组在左右方向上翻转
```
arr = np.array([[[0,1],[2,3]],[[4,5],[6,7]]], dtype=float)
print(arr)
print(np.fliplr(arr))

[[[0,1], [2, 3]]
 [[4,5], [6, 7]]]

[[[2, 3], [0, 1]]
 [[6, 7], [4, 5]] ]
```
    px, py = np.transpose(np.flipud(np.fliplr(path)))

## np.flipud()
翻转列表，将矩阵进行上下翻转
```
arr=np.diag([1,2,3,4]) #diag用于声明对角矩阵
print(arr)
print(np.flipud(arr))
[[1 0 0 0]
 [0 2 0 0]
 [0 0 3 0]
 [0 0 0 4]]

[[0, 0, 0, 4],
 [0, 0, 3, 0],
 [0, 2, 0, 0],
 [1, 0, 0, 0]]
```


## np.transpose()
transpose在不指定参数是默认是矩阵转置
```
arr = np.arange(4).reshape((2,2))
[[0, 1],
[2, 3]]

[[0, 2],
[1, 3]]
```




# 求维数，求长宽

data = np.array([
		[1,2,3],
		[4,5,6],
		[7,8,9],
		[0,0,0]
	])


print(data)
print(data.ndim)
print(data.shape) 

2
(4, 3)

# Math

## math.ceil()
ceil() 向上取整
```
ans = math.ceil(-45.17) : -45.0
ans = math.ceil(100.12) :  101.0
```

# anaconda

1. 打开anaconda,初始化自己的环境

```python
# 装python3.6版本，环境所用的python版本需要在后面指定，如果不指定默认Anaconda自带python版本
# doccano 是环境名称，可根据自己命名区分不同自己的环境
conda create -n labeme python=3.10
# 激活自己的环境
conda activate ant
```

2. 在pycharm中配置
file->setting->Project: Complete Coverage Pat...->Python Interpreter



conda update -n base conda


conda install --yes --file requirements.txt


conda config --remove-key channels
conda config --show # 查看conda的配置，确认channels
conda config --show-sources # 仅查看所有镜像


查看已经添加的channels

conda config --get channels
conda config --show channels

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

channel_priority: flexible

conda list

pip3 install torch torchvision -i https://pypi.mirrors.ustc.edu.cn/simple/



import torch

print(torch.__version__)
print(torch.cuda.is_available())


# argparse

# pycharm
1. python的编译过程

没有二进制文件，直接编译成字节码了






# 参考资料
[anaconda启动非常慢，一直卡在Initializing(看起来没什么用，FQ马上打开了)]https://blog.csdn.net/qq_40051406/article/details/121365478
[Anaconda超详细安装教程（Windows环境下）]https://blog.csdn.net/fan18317517352/article/details/123035625
[新手教程一：Anaconda新建开发环境]https://blog.csdn.net/qq_42573052/article/details/113770662
[Python命名规范-大小写]https://blog.csdn.net/quietbxj/article/details/107188786
[Solving environment: failed with initial frozen solve. Retrying with flexible solve的解决]https://blog.csdn.net/Brookekitty/article/details/106226285
[Python使用conda安装requirement.txt的扩展包]https://blog.csdn.net/weixin_45092662/article/details/106906719
[安装PyTorch详细过程]https://blog.csdn.net/MCYZSF/article/details/116525159
[清华大学开源软件镜像站]https://mirrors.tuna.tsinghua.edu.cn/
[Pytorch教程（一）：Pytorch安装教程-使用pip在conda里面装上了]https://zhuanlan.zhihu.com/p/88903659
[基于pytorch的yolov5运行报错warnings.warn(‘User provided device_type of ‘cuda‘, but CUDA is not available)]https://blog.csdn.net/weixin_50813961/article/details/122587255
[CUDA 11.7无法安装pytorch的GPU版本]https://blog.csdn.net/qq_46037444/article/details/125991109
[pytorch官网]https://pytorch.org/get-started/locally/
[__pycache__文件夹是什么东西？]https://zhuanlan.zhihu.com/p/476772186









