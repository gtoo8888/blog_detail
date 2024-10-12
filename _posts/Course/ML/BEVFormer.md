---
title: BEVFormer
date: 2022-10-11 16:16:20
tags:
- 课程
---


python=3.8
pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 -f https://download.pytorch.org/whl/torch_stable.html

matplotlib-3.7.2-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl
Pillow-10.0.0-cp38-cp38-manylinux_2_28_x86_64.whl
conda install numpy
conda create -n Bev_test python=3.10 -y
```bash
conda create -n Bev python=3.8 -y
conda activate Bev
pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 -f https://download.pytorch.org/whl/torch_stable.html # 或者torch>=1.9
conda install -c omgarcia gcc-6 # gcc-6.2
pip install mmcv-full==1.4.0
pip install mmdet==2.14.0
pip install mmsegmentation==0.14.1
git clone https://github.com/open-mmlab/mmdetection3d.git
cd mmdetection3d
git checkout v0.17.1 # Other versions may not be compatible.
python setup.py install
pip install timm


git clone https://github.com/fundamentalvision/BEVFormer.git
cd bevformer
mkdir ckpts
cd ckpts & wget https://github.com/zhiqi-li/storage/releases/download/v1.0/r101_dcn_fcos3d_pretrain.pth
```

## 需要安装的软件版本
mmcv_full-1.4.1
mmcv_full-1.4.1-cp38-cp38-manylinux1_x86_64.whl
cu111/torch-1.9.1%2Bcu111-cp38-cp38-linux_x86_64.whl


```python
# 测试pytorch是否好用
import torch
print(torch.__version__)
print(torch.cuda.is_available())
```
conda install --use-local pytorch-0.4.0-py35_cuda8.0.61_cudnn7.1.2_1.tar.bz2
gcc-6-6.1.0-2.tar.bz2
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

conda env list

conda install --use-local pytorch-0.4.0-py35_cuda8.0.61_cudnn7.1.2_1.tar.bz2
conda remove -n 环境名字 --all

conda clean -i

conda uninstall xxx 
```
tar -xzf pycharm-community-2021.1.3.tar.gz
sudo mkdir /opt/pycharm
sudo mv pycharm-community-2023.1.3 /opt/pycharm/
cd ~/anaconda3/pkgs/


cd /usr/lib/x86_64-linux-gnu
ln -s libmpfr.so.6.0.2  libmpfr.so.4
ln -s libisl.so.22 libisl.so.15


# 加快pip安装
pip install python-opencv -i https://pypi.tuna.tsinghua.edu.cn/simple

# 标注sa标注软件的问题

1. 如果没有模型，错误提示不友好
2. int报错
3. pycocotools安装难度较大，使用
conda install -c conda-forge pycocotools
4. 使用新模型直接闪退

# 参考资料
[pip install mmdet==2.14.0](https://pypi.org/project/mmdet/2.14.0/#files)
[mmcv](https://download.openmmlab.com/mmcv/dist/cu111/torch1.9.0/index.html)
[torch](https://download.pytorch.org/whl/torch_stable.html)
https://pypi.org/
https://anaconda.org/
https://repo.anaconda.com/archive/

https://zhuanlan.zhihu.com/p/101953103

https://blog.csdn.net/xiaowenshen/article/details/118760047

https://blog.csdn.net/hangtianlc/article/details/120007086


https://www.nvidia.com/Download/index.aspx?lang=en-us

https://developer.nvidia.com/cuda-toolkit-archive










