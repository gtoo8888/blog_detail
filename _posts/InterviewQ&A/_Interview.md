---
title: 面经
date: 2022-10-24 21:24:32
tags:
- 面试
---

1. 针对lambda捕获变量，怎么保证他是有效的呢
捕获引用时候，需要注意引用对象的作用域。


C++一般用啥编译工具？
make、cmake 
有什么工具，能查看编译后可执行文件的函数？
objdump 
其他想不到了，失忆了（寄） 
你用到了protobuf，知道protobuf是怎么存的吗？（指的是底层怎么进行的序列化）
不知道，只知道序列化后是二进制的 
用protobuf的好处
八股文 
看过什么开源库（关于存储的）
我可不敢说leveldb，省的被怼死 
就说没看过 


# 参考文献
[字节跳动 基础架构 分布式存储 日常实习 二面挂经]https://articles.zsxq.com/id_1zq91uc3zg46.html
[WebServer服务器项目可能会被问到的问题（一）]https://www.nowcoder.com/discuss/934904?type=all&order=recall&pos=&page=2&ncTraceId=&channel=-1&source_id=search_all_nctrack&gio_id=939FED971E9FCC25B724B4054BF9953A-1661177959694
[c++ Lambda表达式使用过程中可能遇到的坑]https://juejin.cn/post/6844903879818084359
[Can the [this] pointer captured by a lambda be invalidated before the lambda runs?]https://stackoverflow.com/questions/58257802/can-the-this-pointer-captured-by-a-lambda-be-invalidated-before-the-lambda-run
[c++ - lambda 捕获的 [this] 指针能否在 lambda 运行之前失效？]https://www.coder.work/article/6243761
https://blog.csdn.net/qq_38233258/article/details/124723604?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522168354901916800184177636%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=168354901916800184177636&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~baidu_landing_v2~default-6-124723604-null-null.142^v86^insert_down1,239^v2^insert_chatgpt&utm_term=%E8%85%BE%E8%AE%AF%E4%BA%91%E6%99%BA%E9%9D%A2%E7%BB%8F&spm=1018.2226.3001.4187
[腾讯云实习1，2，3面](https://blog.csdn.net/wqc_qwertyuiop/article/details/125509735?ops_request_misc=&request_id=&biz_id=102&utm_term=%E8%85%BE%E8%AE%AF%E4%BA%91%E6%99%BA%E9%9D%A2%E7%BB%8F&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduweb~default-0-125509735.142^v86^insert_down1,239^v2^insert_chatgpt&spm=1018.2226.3001.4187)
