---
title: 猜想一下风暴之门的服务器设计以及RollBack机制
date: 2023-12-18 17:08:39
tags:
- 其他
---


# 1.开端

看了昨天二老风暴之门的解说，提到了使用了一个回滚机制可以消除消除游戏中的延迟，一直想不明白是怎么回事，自己本身对服务器通讯方面比较感兴趣，于是去找资料去了解了下。
后来发现他们为了增加玩家的服务器连接能力，还做了别的工作，下面依次介绍一下。
由于本人水平不是很高，有说错的地方，还请好兄弟们指正。

# 目录
1. SnowPlay引擎
2. 服务器搭建
3. RollBack机制

# 2. SnowPlay引擎
主要来自参考资料1，嘉宾提到游戏逻辑的运行速度是远低于画面渲染速度的，在星际争霸2发售时，默认游戏逻辑的处理速度是22.4Hz ，但是有的逻辑处理速度仅仅是8Hz，而且在最开始时候星际争霸2中的战争迷雾的逻辑处理速度只有4Hz。
现在风暴之门的所有游戏逻辑的处理渲染频率都是64Hz，包括战争迷雾也是，也就是每一次处理时间从44ms缩短到了16ms。

| 游戏名称  | 星际争霸2 | 风暴之门 | 
| --------- | -------- | -------- | 
| 渲染频率 | 22.4Hz | 64Hz |  
| 处理时间 | 44Ms | 16Ms     |  

在RTS游戏中，选手的APM从50-350不等，假如选手的APM是350，换算一下1s中操作6次左右，也就是平均每次操作的间隔是166ms，现在风暴之门的游戏逻辑处理比星际2更快了。James Anhalt原话是"By increasing the game loop rate the game needs to handle fewer actions， which reduces the chances to experience network jitter."(通过提高游戏循环速率，游戏需要处理的操作就会减少，从而降低出现网络抖动的几率)（这一段我不太明白我理解的是，循环速度变快了，在每次循环中，处理选手的操作数更少了。比如星际2每次执行游戏逻辑，需要处理选手2-3次操作，但是风暴之门每次执行游戏逻辑时候，只需要处理选手1次操作就可以了，如果数据丢包了，就丢了一次操作，这边有不对的欢迎大佬指正）


SnowPlay引擎不会像传统的引擎一样，不停和其他计算机同步，而是根据自己计算机的CPU、GPU和网络条件，以各自最大努力运行，减少延迟，每台机器和用户都应该从各自的设置中榨取更多的性能。

还有这个引擎别的方面的优化，比如寻路机制，它使用的内存比星际2少，同时支持复杂度是其两倍的地图；还有游戏逻辑完全独立于视觉处理，采用了多核优化还有等等更新，可以自己看参考资料2

# 3. 服务器搭建

从参考资料4看到，风暴之门在考虑混合匹配方法，使用一个全球玩家池，但在全球排行榜之上有区域阶梯和排行榜，仍保留某种天梯和排行榜的区域 MMR。但是由于睡眠时间的问题，不同大洲的人们依然会按照自然时间分组，比如中国的玩家总是会匹配到中国的玩家，美国人总是匹配到美国人。

他们提到，他们为他们的服务器搭建使用自动扩容功能，主要是和一个跨国企业Hathora云平台合作，就是服务器这块主要就是靠Hathora这个公司了。Hathora主要也是用了k8s那套东西，可以对应流量的扩缩容，说是比如应对玩家激增的情况，可以快速扩容服务器。

[![Fig1.Hathora](https://s11.ax1x.com/2023/12/18/piIezND.png)](https://imgse.com/i/piIezND)

去Hathora的官网看了下，Hathora就是主要给游戏服务器提供扩容服务，可以看到他们在日本和新加坡有节点。前几天老仙他们试玩的时候，用了日本代理，那应该就是用的Hathora的那个节点。国内的情况的话，看起来得代理谈下来再说了，不知道到时候能不能玩的流畅。

# 4. RollBack机制
RollBack机制主要是针对于网络中延迟问题，比如我们玩星际的时候，总是由于一个人的网卡，导致都整体游戏变卡了。
它的工作原理是预测玩家会做什么并把它显示出来，如果系统的预测是正确的，那么它就会继续原样，但如果系统不正确，它会很快回滚（因此得名）并显示实际发生的事情。该系统可以非常快速地回滚，这意味着无论它是否正确，玩家都将在整个过程中体验到流畅的游戏体验。


[![Fig2.PartinG](https://s11.ax1x.com/2023/12/18/piIeXB6.jpg)](https://imgse.com/i/piIeXB6)
从参考资料9可以看到，他们在10月份对风暴之门的RollBack机制进行了Alpha测试，各个职业选手表示运行的很好。被黄哥打败的SC2传奇人物PartinG表示十分不错。

[![Fig3.RollBack](https://s11.ax1x.com/2023/12/18/piIm99H.png)](https://imgse.com/i/piIm99H)
由于官方没有具体的技术说明，就说了主要是参考格斗游戏的，所以下面就是我根据现有的资料对RollBack机制猜测是怎么运行的


## 4.1 格斗游戏中的GGPO回滚网络
由于格斗游戏对实时性的要求特别高，所以很需要一个更加高效的同步技术，而不是玩家1来等待玩家2的网络，变得一卡一卡的。所以在2009年，格斗游戏中的回滚网络GGPO就被研发了出来，现在先说明一下GGPO网络运行的原理。
回滚网络机制主要是针对于网络中延迟问题，对于本地玩家的输入是100%正确的。
接下来的内容主要来自这篇文章Fight the Lag!  The Trick Behind GGPO's Low Latency Netcode，图片也都来自那里。
[![Fig4.GGPO1](https://s11.ax1x.com/2023/12/18/piIexAO.png)](https://imgse.com/i/piIexAO)
图1表示传统的网络传输情况。可以看到，在正常的本地玩家1输入4之后，远端玩家输入2才到达，这时候才能合成出当前状态，呈现出游戏帧，也就是本地输入1，2，3的时候游戏都是没有响应的，这就是我们看到的卡顿
[![Fig5.GGPO2](https://s11.ax1x.com/2023/12/18/piIejHK.png)](https://imgse.com/i/piIejHK)
图2表示使用了GGPO回滚网络的情况的网络传输情况，此时假设系统对远端玩家2的预测都是正确的。可以看到，每次本地玩家1输入之后，都叠加了系统对远端玩家2预测状态，所以每次输出都可以更新游戏的状态，看起来就是所有的操作都没有卡顿，都正常被执行了。
[![Fig6.GGPO3](https://s11.ax1x.com/2023/12/18/piImS4e.png)](https://imgse.com/i/piImS4e)
图3表示使用了GGPO回滚网络，但是假设系统对远端玩家2的预测都是错误了。假设在本地玩家1输入3之后，远端玩家输入1到达，但是经过校验发现，本地的预测错误了，此时虽然当前游戏的视频帧执行到了帧3，需要立刻回滚到帧1，也就是本地玩家输入1的状态，使用正确的远端输入1叠加本地玩家1的输入得到了正确状态，同时快速进行，本地输入1，2，3都是加速执行，直到本地玩家输入4的步骤，都变成正常了。


总而言之，GGPO回滚网络的原理，是将网络的延迟，放到了不会改变的动画的执行过程中。在格斗游戏中举了一个例子，比如对手在几帧前向你投掷了一个火球，那么这个火球的行为是完全确定的，不会受到对手未来输入的影响，此时本地就是预测对手未来的行动。

## 4.2 参考格斗游戏的回滚网络对于风暴之门中RollBack机制的猜测

玩家1是本地用户，玩家2是远程用户，下面模拟一下玩家2由于rollback机制的存在，对于玩家1的视角来说是没有延迟的。
[![Fig7.农民例子](https://s11.ax1x.com/2023/12/18/piImC3d.png)](https://imgse.com/i/piImC3d)
以游戏开局，需要派出农民探路的场景举例子
1. 在原始点A给工蜂下达了一个去往B点的指令，每一个箭头表示需要1s的时间到达，正常情况下，工蜂需要3秒到达B点。
2. 然而，1秒后，当工蜂到达O点时，玩家2下达指令让工蜂改变目标为C点。由于网络延迟，这个指令需要1秒本地玩家1才能接受到
3. 如果是没有使用RollBack机制，游戏会不停的校验，需要本地和远程数据一致，才能继续执行。
4. 引入rollback机制的情况下，对于本地玩家1来说，他的视角中工蜂会继续按照蓝色箭头的方向前进1秒。
5. 此时过了1s，远程玩家2的数据到达了，经过校验发现工蜂的行进路径出现偏差，应该前往C点。
6. Rollback机制检测到第一个出现偏差的点是O点，工蜂会瞬间回到O点，然后通过加速的方式尽快到达预期目标C点。
7. 正常情况下，从O到C需要2秒，但由于rollback机制，现在只需要1秒，最终工蜂从A到达C点，总共花费3秒，数据保持一致。

举的这个例子是为了帮助理解用了十分夸张的时间机制，实际游戏中，不会有这么长的检测时间。看报道中选手的体验比较良好，看起来效果不错


# 参考资料
## SnowPlay引擎
[1-James Anhalt & Tim Morten 访谈：SnowPlay技术和风暴之门](https://screenrant.com/james-anhalt-tim-morten-interview-snowplay-technology-stormgate/)<br/>
[2-Stormgate Technology & Art Reveal - December 2022 技术和美术访谈，提到了RollBack机制](https://www.youtube.com/watch?v=1m8Z8iVXfDM&t=119s)<br/>
[3-“这就像一辆 F1 赛车”：风暴之门内部游戏测试的独家外观](https://stormgatenexus.com/article/stormgate-pre-alpha-interview-neuro-exclusive)<br/>
## 服务器搭建
[4-地域认同是件好事，提到了sed老师和jim大神在中国赛区开发了凤凰巨像风格](https://stormgatenexus.com/article/regional-identity-is-a-good-thing)<br/>
[5-与冰霜巨人工作室合作的《风暴之门》官方游戏揭秘 AMA 线程-rediit](https://www.reddit.com/r/Stormgate/comments/14a7qu8/comment/jodmi65/)<br/>
[6-与冰霜巨人工作室合作的《风暴之门》官方游戏揭秘 AMA 线程-old.reddit](https://old.reddit.com/r/Stormgate/comments/14a7qu8/official_stormgate_gameplay_reveal_ama_thread/jodk9yt/)<br/>
[7-多人游戏的服务器编排公司](https://hathora.dev/)<br/>
[8-hathora 构建可无限扩展的多人游戏，使用Kubernetes 计算集群，部署可伸缩的游戏服务器](https://bullet-mania.vercel.app/)<br/>
## Rollback机制
[9-2023-10-11，风暴之门社区，新闻稿，风暴之门Rollback网络代码是RTS的巨大技术飞跃](https://stormgatehub.com/stormgate-rollback-netcode-monumental-technical-leap-rts/)<br/>
[10-为什么风暴之门使用回滚网络代码？](https://esi.si.com/news/stormgate-using-rollback-netcode)<br/>
[11-格斗游戏中使用的GGPO回滚网络机制](https://www.ggpo.net/)<br/>
[12-与滞后作斗争！GGPO低延迟网络代码背后的诀窍](https://drive.google.com/file/d/1cV0fY8e_SC1hIFF5E1rT8XRVRzPjU8W9/view)<br/>
[13-2023-10-11，风暴之门Rollback机制Alpha测试，reddit讨论帖](https://www.reddit.com/r/Stormgate/comments/174ty64/frost_giant_starts_testing_rollback_in_stormgate/)


