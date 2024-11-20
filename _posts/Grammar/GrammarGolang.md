---
title: Golang 语法
date: 2022-06-21 00:03:01
tags:
- 语法
---



# 实习中用到的技术点



# 常用的框架

## minio分布式存储

## gRPC

## GORM

# context包
context上下文包解析

go 1.7以后才支持

用在协程里面

控制并发两种方式
	使用 WaitGroup
	使用Context

通用场景，多个goroutine执行同一件事情

主动通知停止
channel + select

如果有多个goroutine,或者goroutine里面又有goroutine

需要使用context控制


client -> server#1 -> server#2
请求 req
应答 res

用户中间中断请求，那么中间的资源全部浪费了，当用户切断的时候，能马上停止


ctx := context.Backgroud()

context.WithCancle(ctx)d


# 参考资料

[语法介绍]https://www.topgoer.com/
[Golang 的 time.Now() 给你的是什么时间？]https://www.jianshu.com/p/896cc3f4ee82

[Go by Example](https://gobyexample.com/)

[项目 · Go语言中文文档 (topgoer.com)](https://www.topgoer.com/%E9%A1%B9%E7%9B%AE/)

[Go by Example 中文版 (gobyexample-cn.github.io)](https://gobyexample-cn.github.io/)