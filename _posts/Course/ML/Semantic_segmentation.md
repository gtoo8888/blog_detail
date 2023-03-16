---
title: 语义分割
date: 2022-10-11 16:16:20
tags:
- 课程
---



语义分割(semantic segmentation)FCN
实例分割( Instance segmentation)Mask R-CNN
全景分割(Panoramic segmentation) Panoptic FPN

# 采集数据的注意点
1. 不要迎着光拍摄
2. 最好有云台支持
<!-- 3. 采集的图片，虽然分文件夹，但是文件名还是得处理，不然重名了 -->
4. 需要增加人站着的识别
   1. 人不要太近
   2. 
5. 要考虑拍照的时间，白天还是下午，看起来最好是早上，阴天
6. 需要考虑照相机摆放的位置


3.15下次拍照需要注意的：


脏数据的影响

# 标注中出现的问题
训练的时候，IoU出现了Nan
1. 学习率过大或过小：学习率过大会导致模型参数更新过快，模型无法收敛或者在训练过程中出现梯度爆炸、梯度消失等问题；学习率过小则可能导致模型收敛缓慢或者无法收敛，从而导致 IoU 变成 NaN。
2. 数据集中出现空白区域：如果数据集中存在一些空白区域（即标注中的像素值全部为 0），那么计算 IoU 的时候可能会出现分母为 0 的情况，从而导致 IoU 变成 NaN。
3. 模型架构或训练方式问题：如果模型架构设计不合理或者训练方式不当，可能会导致训练过程中出现梯度爆炸、梯度消失等问题，从而导致 IoU 变成 NaN。
4. 数据集标注问题：数据集标注问题也可能导致 IoU 变成 NaN。比如，在数据集标注过程中出现了错误的标注，可能导致 IoU 计算错误。

出现了脏数据


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

