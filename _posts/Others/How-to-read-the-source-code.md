---
title: 如何阅读源码
date: 2022-02-25 12:44:36
tags:
- - 其他
---

# 0.确定阅读源码的目的

1.通过编译，能跑起来。
有的时候环境比较复杂，搭建调试环境的时候就需要花很多时间。
先通过搜索把调试环境搭建起来，这一步就能积累很多经验。



2.精简调试环境，减少干扰信息
python用pycharm
C\C++类的代码，使用Vim+Ctags+Cscope来

3.调试手段

- 加调试语句。为了做到这一点，你需要先了解项目如何加调试日志，可能需要修改项目的日志级别支持输出一些在调试级别的日志，等等。

- 断点调试。并不是所有项目代码，跑起来之后都自带调试信息能够断点调试的。所以在自己的调试环境里需要先确定这一点。

# 利用好测试用例
好的项目都会自带不少用例，这类型的例子有：etcd、google出品的几个开源项目。

如果测试用例写的很仔细，那么很值得好好去研究一下。原因在于：测试用例往往是针对某个单一的场景，独自构造出一些数据来对程序的流程进行验证。所以，其实跟前面的“情景分析”一样，都是让你从大的项目转而关注具体某个场景的手段之一。

# 厘清核心数据结构之间的关系
虽然说“程序设计=算法+数据结构”，然后我实际中的体会，数据结构更加重要。

因为结构定义了一个程序的架构，结构定下来了才有具体的实现。

Linus说： “烂程序员关心的是代码。好程序员关心的是数据结构和它们之间的关系。”

因此，在阅读一份代码时，厘清核心的数据结构之间的关系尤其重要。这个时候，需要使用一些工具来画一下这些结构之间的关系，我的源码分析类博客中有很多这样的例子，比如《Leveldb代码阅读笔记》、《Etcd存储的实现》等等。

需要说明的是，情景分析、厘清核心数据结构这两步并没有严格的顺序关系，不见得是先做某事再做某事，而是交互进行的。

比如，你如果现在刚接手某个项目，需要简单的了解一下项目，可以先阅读代码了解都有哪些核心数据结构。理解了之后，如果不清楚某些情景下的流程，可以使用情景分析法。总而言之，交替进行直到解答你的疑问为止。


# 3整体和细节
阅读代码的过程中，需要在整体和细节之间做权衡。

比如，有时候你需要大体了解一个整体的框架、轮廓、流程之后，才能再针对具体的细节深入进去。这个时候，不宜针对具体的函数实现、算法等深入分析。而细节的分析，又不能缺少，否则一些东西的理解又流于表面。

所以，如何把握整体和细节是一个需要累积阅读代码经验才能把握好的。我的建议是：过程中还是以整体为首，在不理解整体的前提之前，不要太过深入某个细节。把某个函数、数据结构当成一个黑盒，知道它们的输入、输出就好，只要不影响整体的理解就暂且放下接着往前看。

# 3多问自己几个问题
学习的过程中离不开交互。

如果阅读代码只是输入（Input），那么还需要有输出（Output）。只有简单的输入好比喂东西给你吃，而只有更好的消化才能变为自己的营养，而输出就是更好消化知识的重要手段。

其实这个思想很常见，比如学生上课（Input）了需要做练习作业（Output），比如学了算法（Input）需要自己编码练习（Output），等等。简而言之，输出是学习过程中的一种及时反馈，质量越高学习效率越高。

输出的手段有很多，在阅读代码时，比较建议的是自己能够多问自己一些问题，比如：

为什么选择这个数据结构来描述这个问题？类似的场景下，其他项目是怎么设计的？都有哪些数据结构做这样的事情？
如果由我来设计这样的项目，我会怎么做？
等等等等。越是主动积极的思考，就越有更好的输出，输出质量与学习质量成正比关系。


4.写自己的代码阅读笔记
我从开始写博客，就是写不少各种项目的代码解读类文章，网名“codedump”也源于想把“code内部的实现原理dump出来”之意。

前面提到学习质量与输出质量成正比关系，这是我自己的深刻体会。也因为如此，所以才要坚持阅读源码之后写自己的分析类笔记。

写这类笔记，有以下几个需要注意的地方。

虽然是笔记，但是要想象着在向一个不太熟悉这个项目的人讲解原理，或者想象一下是几个月甚至几年后的自己回头来看这个文章。在这种情况下，会尽量的把语言组织好，循循善诱的解释。

尽量避免大段的贴代码。我认为在这类文章中，大段贴上代码有点自欺欺人：就是看上去自己懂了，其实并不见得。如果真要解释某段代码，可以使用伪代码或者缩减代码的方式。记住：不要自欺欺人，要真的懂了。如果真的想在代码上加上自己的注释，我有一个建议是fork出来一份该项目某个版本的代码，提交到自己的github上，上面随时可以加上自己的注释并且保存提交。比如我自己注释的etcd 3.1.10代码：etcd-3.1.10-codedump，类似的我阅读的其他项目都会在github上fork出一个带上codedump后缀的项目。

多画图，一图胜千言，使用图形展示代码流程、数据结构之间的关系。我最近才发现画图能力也是很重要的能力，自己在从头学习如何使用图像来表达自己的想法。

写作是很重要的基础能力，我一个朋友最近教育我，大体的意思是说：如果你在某方面的能力很强，如果再加上写作好、英语好，那么将极大放大你在这方面的能力。而类似写作、英语这样的底层基础能力，不是一撮而就的，需要长时间保持练习才可以。而写博客，对于技术人员而言，就是一种很好的锻炼写作的手段。


必须找好切入点。你要解决什么问题。是要fix bug；还是要把这个系统和其它模块集成；还是要增加新功能。物理学家没有上来就研究整个宇宙的，必须选好分支。如果你有一个猜想，但是又和你的目标关联不太大，那就坚持这个猜想，直到出现明显反例。物理学有很多这样的例子，和数学不同，为了旁支猜想投入过多研究是不明智的。如果有明显证据证明你的某个旁支猜想大错特错，你就要放弃主要目标，暂时把解决旁支猜想作为主要目标。比如，你本来以为某个结构是LRU的cache，结果发现怎么做都不对，那就先放弃原来的目标，专门研究这个结构的用途。对于旁支猜想的不断切换，要做好自己的task stack保留。在旁支猜想解决之后，要根据结论尽快回到上次中断的任务。


很简单的第一，找准入口出口，不要直接跳进去看，任何代码都有触发点，无论是http request，还是服务器自动启动，还是main函数，还是其他的，先从入口开始。第二，手边一支笔一张纸，除非你是Jeff，否则你不会记得那么多跳转的。一个跳转就写下来函数/方法名和参数，读完一遍，就有了一个sequence diagram雏形第三，私有方法掠过，只要记住输入输出即可，无需看具体实现


常见的困难
在阅读源代码的过程中，会遇到不少的困难，常见的有：

成熟的开源项目往往自身的代码量很大，盲目地从入口文件开始阅读，会陷入到各种代码分支上，耗费大量时间不说，收获也甚微。
代码难以看懂，不清楚来龙去脉。
本人在阅读源代码的时候，走了不少的弯路，结合自己的实践谈谈自己是如何克服上述的困难。

阅读的目的
首先，做一件事件，要先明确目的。目的可以起到指引的作用，同时也可以检验自己是否已经完成。

阅读源代码也不例外。阅读源代码的目的可能是：

了解源代码的目录结构，学习开源项目是如何组织代码
开源项目有某些强大的功能，阅读源代码了解实现细节，以便更加全面的掌握。
在使用开源项目时，遇到一些问题，边阅读源码，边debug
其他
漫无目的的看源代码一般难以有收获。

事先准备
如果目的是通过阅读源代码，加深对技术细节的理解，做好以下几步，可以降低阅读源码的难度。

了解这门技术的历史，搞清楚这门技术是为了解决什么样的问题而发展起来的。
了解技术的架构，概念。优秀的开源项目源码实现和技术架构，概念都有清晰的联系。
如果没有在实际运用中使用过该技术，建议还是仔细阅读官网上的start指引，编写运行几个小的demo。
准备问题，试着在阅读官网文档或者编写demo的过程中提出几个问题，当然也可以参考别人提出的问题（常见的面试题也是不错的）。
在github上clone该项目到本地，保留项目完整的commit和tag。


## 参考链接


https://www.codedump.info/post/20190324-how-to-read-code/
https://www.zhihu.com/question/19625320/answer/12429108
https://www.zhihu.com/question/19625320/answer/307133854
https://github.com/zhangguixu/myblogs/issues/4
[英文能力与独立思考]https://www.raychase.net/6902