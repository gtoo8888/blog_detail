---
title: Cpluspulus 语法-并发
date: 2022-03-08 20:34:13
tags:
- 语法
---

## 线程管理

1. 启动线程
2. 等待线程
3. 向线程函数传递参数
4. 转移线程所有权
5. 运行时决定线程数量
6. 识别线程

```c++
std::thread()
join
detach
joinable
std::terminate()
std::thread::hardware_concurrency()
std::thread::id
std::this_thread::get_id()
```

## 线程间共享数据

## 同步并发操作

1. 等待一个事件或其他条件——条件变量
2. 使用期望等待一次性事件——异步编程

```c++
std::promise
std::async
std::future
std::shared_future
std::packaged_task
```

## 并发模型

- **CSP**（Communicating Sequential Processer，通讯顺序进程）
- **参与者模式**（Actor model）

## 参考资料
