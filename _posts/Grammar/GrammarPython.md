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


安装过程增加环境变量
E:\Anaconda 
E:\Anaconda\Scripts 
E:\Anaconda\Library\mingw-w64\bin
E:\Anaconda\Library\usr\bin 
E:\Anaconda\Library\bin


conda update -n base conda


conda install --yes --file requirements.txt


conda config --remove-key channels
conda config --show # 查看conda的配置，确认channels
conda config --show-sources # 仅查看所有镜像


查看已经添加的channels

conda config --get channels
conda config --show channels

## 修改文件
在C:\Users\{username} 文件夹下面修改.condarc
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


pip3 install paddlepaddle -i https://mirror.baidu.com/pypi/simple/

pip3 install eiseg -i https://mirror.baidu.com/pypi/simple/

# anaconda导出环境
conda env export > environment.yaml

导入环境
conda env create -f environment.yaml


# 安装anaconda环境


# pip3
pip3 安装在/usr/lib/python3/dist-packages
pip3 freeze # 查看安装了什么包
pip3 show <package_name>
pip3 list -v # 列出所有已安装包的位置
pip3 --version 查看 pip3 的默认安装位置



# Linux下安装Django
使用在线安装
sudo pip3 install django==2.2.28

使用离线安装包安装
```shell
apt-get install python3-setuptools -y  # setup.py中的依赖项
apt-get install python3-pip -y
tar -xvf Django-2.2.28.tar.gz 
cd Django-2.2.28/
python3 setup.py install
pip3 freeze |grep Django # 查看是否安装成功
```




# vscode调试python单个文件
只需要直接F5，自动生成的就可以了



# 常用命令
python3 manage.py runserver # 启动服务
python3 manage.py startapp # 创建应用
python3 manage.py migrate # 数据库迁移
python3 manage.py  # 列出所有Django子命令



# 项目结构
_init : Python包的初始化文件
wsgi.py : WEB服务网关的配置文件– Django正式启动时，需要用到
urls.py :项目的主路由配置- HTTP请求进入Django时，优先调用该文件
settings.py:项目的配置文件–包含项目启动时需要的配置


# 搭建第一个Django程序

1. 安装环境
2. django-admin startproject mysite1
3. 需要在setting中改为，ALLOWED_HOSTS = ["192.168.1.19"]
4. python3 manage.py runserver 0.0.0.0:8000 # 将所有IP的请求都接入进来
5. 成功连接

常见修改
LANGUAGE_CODE = 'zh-Hans'

TIME_ZONE = 'Asia/Shanghai'









matplotlib有很多主要的模块，例如：

matplotlib.figure: 用来创建和管理图像对象
matplotlib.axes: 用来创建和管理子图对象，提供大部分的绘图方法
matplotlib.pyplot: 用来提供类似于MATLAB的绘图接口，方便快速绘制图像
matplotlib.animation: 用来创建和保存动画
matplotlib.cm: 用来提供颜色映射相关的功能
matplotlib.colorbar: 用来添加颜色条到图像中
matplotlib.colors: 用来处理颜色相关的问题
matplotlib.image: 用来处理图像相关的问题
matplotlib.patches: 用来绘制各种形状的对象，如圆，矩形，多边形等
matplotlib.text: 用来绘制文本相关的对象，如标签，注释，数学公式等
matplotlib.ticker: 用来控制坐标轴刻度的格式和位置
matplotlib.transforms: 用来处理坐标变换相关的问题



|类型|描述|简写|
|---|---|---|
|int8|8位整数|'i1'|
|int16|16位整数|'i2'|
|int32|32位整数|'i4'|
|int64|64位整数|'i8'|
|uint8|8位无符号整数|'u1'|
|uint16|16位无符号整数|'u2'|
|uint32|32位无符号整数|'u4'|
|uint64|64位无符号整数|'u8'|
|float16|半精度浮点数|'f2'|
|float32|单精度浮点数|'f4'|
|float64|双精度浮点数|'f8'|
|complex64|由两个32位浮点数组成的复数|'c8'|
|complex128|由两个64位浮点数组成的复数|'c16'|
|bool_|布尔型|'bool'|
|object_|Python对象类型|'O'|
|string_|固定长度字符串|'S'|
|unicode_|固定长度unicode字符串|'U'|



‘r’：只读。该文件必须已存在。
‘r+’：可读可写。该文件必须已存在，写为追加在文件内容末尾。
‘rb’：表示以二进制方式读取文件。该文件必须已存在。
‘w’：只写。打开即默认创建一个新文件，如果文件已存在，则覆盖写（即文件内原始数据会被新写入的数据清空覆盖）。
‘w+’：写读。打开创建新文件并写入数据，如果文件已存在，则覆盖写。

‘wb’：表示以二进制写方式打开，只能写文件， 如果文件不存在，创建该文件；如果文件已存在，则覆盖写。
'ab': 追加写入二进制文件
‘a’：追加写。若打开的是已有文件则直接对已有文件操作，若打开文件不存在则创建新文件，只能执行写（追加在后面），不能读。

‘a+’：追加读写。打开文件方式与写入方式和'a'一样，但是可以读。需注意的是你若刚用‘a+’打开一个文件，一般不能直接读取，因为此时光标已经是文件末尾，除非你把光标移动到初始位置或任意非末尾的位置。（可使用seek() 方法解决这个问题，详细请见下文Model 8 示例）



# PyQt5


Name：Qt Designer.
  Program：D:\anaconda\envs\pyqt5\Lib\site-packages\qt5_applications\Qt\bin\designer.exe
  Arguments：不填写
  Working directory:$FileDir$

名称：PyUIC
工具设置
    程序：D:\anaconda\envs\pyqt5\Scripts\pyrcc5.exe
    实参： $FileName$ -o UI_$FileNameWithoutExtension$.py
    工作目录：$FileDir$

名称：PyRCC
工具设置
    程序：D:\anaconda\envs\pyqt5\Scripts\pyrcc5.exe
    实参：$FileName$ -o $FileNameWithoutExtension$_rc.py
    工作目录：$FileDir$

# -F 创建一个绑定的可执行文件
pyinstaller -F -i MeterTools.ico  -w main.py -n MeterTools


# 参考资料
## 基础语法
[Python命名规范-大小写]https://blog.csdn.net/quietbxj/article/details/107188786
[一篇搞懂python文件读写操作（r/r+/rb/w/w+/wb/a/a+/ab /w/wt / r/rt ）](https://blog.csdn.net/a12355556/article/details/112122670)
[解锁 Python 类方法的精髓：@classmethod 的应用技巧！](https://blog.csdn.net/wuShiJingZuo/article/details/136304733)
[Python 抽象基类 ABC ：从实践到优雅](https://segmentfault.com/a/1190000045678933)
[__pycache__文件夹是什么东西？]https://zhuanlan.zhihu.com/p/476772186
## Pytorch
[Pytorch教程（一）：Pytorch安装教程-使用pip在conda里面装上了]https://zhuanlan.zhihu.com/p/88903659
[清华大学开源软件镜像站]https://mirrors.tuna.tsinghua.edu.cn/
[CUDA 11.7无法安装pytorch的GPU版本](https://blog.csdn.net/qq_46037444/article/details/125991109)
[pytorch官网]https://pytorch.org/get-started/locally/
[基于pytorch的yolov5运行报错warnings.warn(‘User provided device_type of ‘cuda‘, but CUDA is not available)](https://blog.csdn.net/weixin_50813961/article/details/122587255)
[安装PyTorch详细过程]https://blog.csdn.net/MCYZSF/article/details/116525159
[EISeg工具对应博文]https://blog.csdn.net/qq_37541097/article/details/120154543
## Anaconda
[Python使用conda安装requirement.txt的扩展包]https://blog.csdn.net/weixin_45092662/article/details/106906719
[anaconda启动非常慢，一直卡在Initializing(看起来没什么用，FQ马上打开了)]https://blog.csdn.net/qq_40051406/article/details/121365478
[Anaconda超详细安装教程（Windows环境下）]https://blog.csdn.net/fan18317517352/article/details/123035625
[新手教程一：Anaconda新建开发环境]https://blog.csdn.net/qq_42573052/article/details/113770662
[anaconda 换清华镜像源 windows](https://blog.csdn.net/jasneik/article/details/114227716)
[一打开终端就默认进入conda的base环境，取消方法](https://www.cnblogs.com/exmyth/p/17665778.html)
[Solving environment: failed with initial frozen solve. Retrying with flexible solve的解决](https://blog.csdn.net/Brookekitty/article/details/106226285)
[Anaconda之导出/导出配置好的虚拟环境](https://blog.csdn.net/qq_43382635/article/details/127124980)
## PyQt
[手把手教你学习PyQT5：打造精美、功能强大的桌面应用程序（更新中。。）](https://blog.csdn.net/weixin_42475060/article/details/130327901)
## Streamlit
[stackshare django-vs-streamlit](https://stackshare.io/stackups/django-vs-streamlit)
[Streamlit vs Flask vs Django comparison - November 2024](https://www.restack.io/docs/streamlit-knowledge-streamlit-vs-flask-vs-django)
[launching Streamlit from PyCharm](https://discuss.streamlit.io/t/version-1-5-0/21455/10)




