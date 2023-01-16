---
title: 机器学习
date: 2022-09-16 16:23:50
tags:
- 课程
---

# 实用机器学习-李沐
## 1.2 如何获取数据
    找数据，生成数据

数据
数据集——已经处理好的数据

MNIST:手写数据集
ImageNet:引领深度学习，百万级，搜索引擎中找来的
AudioSet:youtube声音切片
Kinetics:声音切片
KITTI：无人驾驶
Amazon Review:亚马逊评论
SQuAD:Wikipedia上问答
LibriSpeech：有声读物


数据获取手段：
网上爬取
采集数据


paperswithcodes Datasets: academic datasets withleaderboard
Kaggle Datasets: ML datasets uploaded by datascientists
Google Dataset search: search datasets in the Web
Various toolkits datasets: tensorflow, huggingface
Various conference/company ML competitions
Open Data on AWS: 100+ large-scale raw data
Data lakes in your own organizationddd




生成数据,GANs  
数据增强

## 1.3 网页数据抓取

## 1.4 数据标注

监督学习
半监督学习
自学习
主动学习

弱监督学习——没钱没人——弱标号




## 2.1 探索性数据分析
## 2.2 数据清洗

图片分类
目标检测
语义分割
    有监督学习，对每个像素进行分割
    背景虚化
    路面分割




# 4.1 评估指标
准确率accuracy
精度precision
召回率recall
F1
AUC
CTR

lr学习率

loss: 0.5165 (0.7486)
损失函数

损失函数用来评价模型的预测值和真实值不一样的程度，损失函数越小，通常模型的性能越好。不同的模型用的损失函数一般也不一样。


# 5.2 Bagging
Bagging是并行式集成学习的最著名代表
它是基于自助采样法（Boostrap sampleing），Bagging也是同理.给定包含m个样本的数据集，先随机抽取一个样本放入采样集中，再把该样本放回，使得下次采样时该样本仍有机会被选中，这样经过m次采样，我们便从原始是数据集中抽取样本得到一个数据量同为m的数据集.
**有放回的抽样，最后取平均**

# 9.1 模型调参



# 动手学习pytorch
## 11 模型选择+过拟合、欠拟合
## 超参数
K-折交叉验证


参数名称 参数说明
学习率α 用于调整梯度下降的步幅
各层神经元数量Units 调整网络的宽度
Mini-Batch大小 单步迭代的效果
网络层数Layers 调整网络的深度
过滤器参数 过滤器数量~尺寸、步长及是否填充边距等
正则化方法 是否采用正则化，采用何种正则化方法
训练代数Epochs 决定梯度下降的迭代步数和训练持久程度
各层激励函数 影响模型各层之间的联系
优化算法 根据问题需要比较优化算法的效果
损失函数 评估模型误差的函数


# 10 多层感知机
## 11 过拟合、欠拟合
训练集是图片，标号是和他一样大小的图片，每个像素值对应标号

先过拟合了，然后再想办法把过拟合消除掉



# 46 语义分割和数据集
实例分割

Pascal VOC2012



VOC格式






[机器学习开篇之机器学习的分类]https://blog.csdn.net/Lion_Dreams/article/details/125269215
[计算机视觉 - 语义分割 （semantic segmentation）]https://blog.csdn.net/baidu_41617231/article/details/107739897
[机器学习：mAP评价指标]https://blog.csdn.net/qq_40765537/article/details/106394103
[PASCAL VOC2012数据集介绍]https://blog.csdn.net/qq_37541097/article/details/115787033
[损失函数（loss function）]https://blog.csdn.net/EmilyHoward/article/details/118367495
[标注工具的使用]https://www.bilibili.com/video/BV1ev411P7dR/?spm_id_from=333.999.0.0&vd_source=76dff3ae3b42b00d067c0921bf6859ca
[Labelme工具对应博文]https://blog.csdn.net/qq_37541097/article/details/120162702
[安装labelme教程]https://blog.csdn.net/weixin_43427721/article/details/107122775
[EISeg工具对应博文]https://blog.csdn.net/qq_37541097/article/details/120154543




[Azure Kinect DK 深度相机]https://blog.csdn.net/denkywu/article/details/103177559