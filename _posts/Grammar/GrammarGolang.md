---
title: Golang 语法
date: 2022-06-21 00:03:01
tags:
- 语法
---

## 常用框架

- **minio**：分布式存储
- **gRPC**：远程过程调用框架
- **GORM**：Go 语言 ORM 库

## context 包

Go 1.7 以后才支持，用在协程里面。

### 控制并发的两种方式

1. 使用 `WaitGroup`
2. 使用 `Context`

### 通用场景

多个 goroutine 执行同一件事情，主动通知停止：

```go
channel + select
```

如果有多个 goroutine，或者 goroutine 里面又有 goroutine，需要使用 context 控制。

### 例子

```go
client -> server#1 -> server#2
```

用户中间中断请求，那么中间的资源会全部浪费，当用户切断的时候，希望能马上停止。

```go
ctx := context.Background()
ctx, cancel := context.WithCancel(ctx)
```

## 参考资料

- [语法介绍](https://www.topgoer.com/)
- [Golang 的 time.Now() 给你的是什么时间？](https://www.jianshu.com/p/896cc3f4ee82)
- [Go by Example](https://gobyexample.com/)
- [项目 · Go语言中文文档](https://www.topgoer.com/项目/)
- [Go by Example 中文版](https://gobyexample-cn.github.io/)
