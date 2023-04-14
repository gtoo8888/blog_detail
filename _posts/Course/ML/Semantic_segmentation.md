---
title: 语义分割
date: 2022-10-11 16:16:20
tags:
- 课程
---



语义分割(semantic segmentation)FCN
实例分割( Instance segmentation)Mask R-CNN
全景分割(Panoramic segmentation) Panoptic FPN

# 3-13采集数据的注意点
1. 不要迎着光拍摄
2. 最好有云台支持
<!-- 3. 采集的图片，虽然分文件夹，但是文件名还是得处理，不然重名了 -->
4. 需要增加人站着的识别
   1. 人不要太近
   2. 
5. 要考虑拍照的时间，白天还是下午，看起来最好是早上，阴天
6. 需要考虑照相机摆放的位置


# 3-22采集数据的注意点
1. 可以拍摄不同角度的，比如竖着的也拍摄一点



3.15下次拍照需要注意的：


脏数据的影响

# 标注中出现的问题
训练的时候，IoU出现了Nan
1. 学习率过大或过小：学习率过大会导致模型参数更新过快，模型无法收敛或者在训练过程中出现梯度爆炸、梯度消失等问题；学习率过小则可能导致模型收敛缓慢或者无法收敛，从而导致 IoU 变成 NaN。
2. 数据集中出现空白区域：如果数据集中存在一些空白区域（即标注中的像素值全部为 0），那么计算 IoU 的时候可能会出现分母为 0 的情况，从而导致 IoU 变成 NaN。
3. 模型架构或训练方式问题：如果模型架构设计不合理或者训练方式不当，可能会导致训练过程中出现梯度爆炸、梯度消失等问题，从而导致 IoU 变成 NaN。
4. 数据集标注问题：数据集标注问题也可能导致 IoU 变成 NaN。比如，在数据集标注过程中出现了错误的标注，可能导致 IoU 计算错误。

出现了脏数据




# 语义分割评价指标

## 混淆矩阵

TP（True Positive）：真正例，模型预测为正例，实际是正例（模型预测为类别1，实际是类别1）
FP（False Positive）：假正例，模型预测为正例，实际是反例 （模型预测为类别1，实际是类别2）
FN（False Negative）：假反例，模型预测为反例，实际是正例 （模型预测为类别2，实际是类别1）
TN（True Negative）：真反例，模型预测为反例，实际是反例 （模型预测为类别2，实际是类别2）

## 交并比（Intersection over Union，IoU）
含义：模型对某一类别预测结果和真实值的交集与并集的比值

## 平均交并比（Mean Intersection over Union，MIoU）
含义：模型对每一类预测的结果和真实值的交集与并集的比值，求和再平均的结果
只有一个数值，对于每个类的IoU取平均





# 参考资料
[机器学习开篇之机器学习的分类]https://blog.csdn.net/Lion_Dreams/article/details/125269215
[计算机视觉 - 语义分割 （semantic segmentation）]https://blog.csdn.net/baidu_41617231/article/details/107739897
[机器学习：mAP评价指标]https://blog.csdn.net/qq_40765537/article/details/106394103
[PASCAL VOC2012数据集介绍]https://blog.csdn.net/qq_37541097/article/details/115787033
[损失函数（loss function）]https://blog.csdn.net/EmilyHoward/article/details/118367495
[标注工具的使用]https://www.bilibili.com/video/BV1ev411P7dR/?spm_id_from=333.999.0.0&vd_source=76dff3ae3b42b00d067c0921bf6859ca
[Labelme工具对应博文]https://blog.csdn.net/qq_37541097/article/details/120162702
[安装labelme教程]https://blog.csdn.net/weixin_43427721/article/details/107122775
[EISeg工具对应博文]https://blog.csdn.net/qq_37541097/article/details/120154543
[batch size设置技巧]https://blog.csdn.net/zqx951102/article/details/88918948
[Azure Kinect DK 深度相机]https://blog.csdn.net/denkywu/article/details/103177559
[【语义分割】评价指标：PA、CPA、MPA、IoU、MIoU详细总结和代码实现](https://blog.csdn.net/sinat_29047129/article/details/103642140)
[ADE20K](https://groups.csail.mit.edu/vision/datasets/ADE20K/)

## 图像标定
[张正友标定法-完整学习笔记-从原理到实战](https://zhuanlan.zhihu.com/p/136827980)
[生成标定纸](https://calib.io/pages/camera-calibration-pattern-generator)



