---
title: python 语法
date: 2022-02-24 20:47:46
tags:
- 语法
---

## 语言规范

- 变量名小写，下划线连接：`train_txt_file`
- 函数名一般小写，下划线连接：`def txt_save(self):`
- 类名称一般大驼峰：`class BatchRename():`

## 基础

### 无穷大

```python
float("inf")   # 正无穷
float("-inf")  # 负无穷
```

- INF 做加法、乘法等运算仍然得到 INF
- 除以 INF 得到 0
- 任何数比 `-inf` 大，比 `+inf` 小

## NumPy

### np.mean()

```python
np.mean(num1, 0)   # axis=0：压缩行，对各列求均值
np.mean(num1, 1)  # axis=1：压缩列，对各行求均值
```

### np.fliplr()

将数组在左右方向上翻转。

### np.flipud()

翻转列表，将矩阵进行上下翻转。

```python
arr = np.diag([1, 2, 3, 4])
np.flipud(arr)
```

### np.transpose()

矩阵转置（不指定参数时默认转置）。

### dtype 数据类型表

| 类型 | 描述 | 简写 |
|------|------|------|
| int8 | 8位整数 | 'i1' |
| int16 | 16位整数 | 'i2' |
| int32 | 32位整数 | 'i4' |
| int64 | 64位整数 | 'i8' |
| uint8 | 8位无符号整数 | 'u1' |
| uint16 | 16位无符号整数 | 'u2' |
| uint32 | 32位无符号整数 | 'u4' |
| uint64 | 64位无符号整数 | 'u8' |
| float16 | 半精度浮点数 | 'f2' |
| float32 | 单精度浮点数 | 'f4' |
| float64 | 双精度浮点数 | 'f8' |
| complex64 | 两个32位浮点数组成的复数 | 'c8' |
| complex128 | 两个64位浮点数组成的复数 | 'c16' |
| bool_ | 布尔型 | 'bool' |
| object_ | Python对象类型 | 'O' |
| string_ | 固定长度字符串 | 'S' |
| unicode_ | 固定长度unicode字符串 | 'U' |

## Anaconda

### 基本操作

```bash
# 创建环境
conda create -n labeme python=3.10    # 指定 Python 版本
conda activate labeme                   # 激活环境

# 更新
conda update -n base conda

# 导入导出环境
conda env export > environment.yaml      # 导出环境
conda env create -f environment.yaml     # 导入环境

# 查看
conda list
conda config --show
conda config --show-sources
conda config --get channels

# 修改镜像源（.condarc）
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
```

### 安装 PyTorch

```bash
pip3 install torch torchvision -i https://pypi.mirrors.ustc.edu.cn/simple/

python
import torch
print(torch.__version__)
print(torch.cuda.is_available())
```

## pip

```bash
pip3 freeze                    # 查看已安装的包
pip3 show <package_name>       # 查看包信息
pip3 list -v                   # 列出所有已安装包的位置
pip3 --version                 # 查看 pip3 默认安装位置
```

## 文件操作

```python
# 文件打开模式
'r'    # 只读，文件必须已存在
'r+'   # 可读可写，文件必须已存在，写为追加在末尾
'rb'   # 以二进制方式读取，文件必须已存在
'w'    # 只写，打开即创建新文件（覆盖写）
'w+'   # 写读，打开创建新文件并写入
'wb'   # 以二进制写方式打开
'a'    # 追加写，文件不存在则创建新文件
'a+'   # 追加读写，可读但光标在末尾
```

## Django

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
### 常用命令

```bash
python3 manage.py runserver          # 启动服务
python3 manage.py startapp          # 创建应用
python3 manage.py migrate            # 数据库迁移
```

### 项目结构

- `__init__`：Python 包的初始化文件
- `wsgi.py`：WEB 服务网关配置文件
- `urls.py`：项目的主路由配置
- `settings.py`：项目的配置文件

### 快速启动

```bash
django-admin startproject mysite1
# 需在 settings 中改为 ALLOWED_HOSTS = ["192.168.1.19"]
python3 manage.py runserver 0.0.0.0:8000   # 将所有 IP 的请求都接入进来
```

## Matplotlib

| 模块 | 描述 |
|------|------|
| matplotlib.figure | 创建和管理图像对象 |
| matplotlib.axes | 创建和管理子图对象，提供大部分绘图方法 |
| matplotlib.pyplot | 提供类似于 MATLAB 的绘图接口 |
| matplotlib.animation | 创建和保存动画 |
| matplotlib.cm | 提供颜色映射相关功能 |
| matplotlib.colorbar | 添加颜色条到图像 |
| matplotlib.colors | 处理颜色相关问题 |
| matplotlib.image | 处理图像相关问题 |
| matplotlib.patches | 绘制各种形状对象（圆、矩形、多边形等） |
| matplotlib.text | 绘制文本相关对象 |
| matplotlib.ticker | 控制坐标轴刻度的格式和位置 |
| matplotlib.transforms | 处理坐标变换相关问题 |

## PyQt5

### 外部工具配置

**Qt Designer**：

- Name: `Qt Designer`
- Program: `D:\anaconda\envs\pyqt5\Lib\site-packages\qt5_applications\Qt\bin\designer.exe`

**PyUIC**（.ui 转 .py）：

- Program: `D:\anaconda\envs\pyqt5\Scripts\pyrcc5.exe`
- Arguments: `$FileName$ -o UI_$FileNameWithoutExtension$.py`

**PyRCC**（.qrc 转 .py）：

- Program: `D:\anaconda\envs\pyqt5\Scripts\pyrcc5.exe`
- Arguments: `$FileName$ -o $FileNameWithoutExtension$_rc.py`

### 打包

```bash
pyinstaller -F -i MeterTools.ico -w main.py -n MeterTools
```

## 代码分析工具

- **black**：代码格式化
- **flake8**：代码检查
- **ipython**：交互式 Python
- **mypy**：类型检查
- **pylint**：代码分析
- **pytest**：单元测试

## Streamlit

```python
# 对比 Django 优缺点
# 如何在 PyCharm 中使用？
# 如何部署？
```


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


## 其他
https://liaoxuefeng.com/books/python/introduction/index.html
https://zhuanlan.zhihu.com/p/680596253
https://www.zhihu.com/question/574776561/answer/55965549995


https://github.com/PiperLiu/CS-courses-notes


