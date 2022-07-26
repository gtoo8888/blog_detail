---
title: 计算机网络 面经
date: 2022-11-02 13:39:59
tags:
- 面试
---

# 概述

## 1、OSI 的七层模型分别是？各自的功能是什么？

| 层数       | 作用                                                       | 传输数据的名称  |
| ---------- | :--------------------------------------------------------- | --------------- |
| 物理层     | 保证有物理上的连接的传输                                   | 比特流 （Bits） |
| 数据链路层 |                                                            | 帧 （Frames）   |
| 网络层     | 提供点对点的服务，可以找到对方的IP，就是找到对方主机的位置 | 包 （Packages） |
| 传输层     | 从传递到主机变成可以传递到进程之间                         | 段 （Segments） |
| 会话层     |                                                            |                 |
| 表示层     |                                                            |                 |
| 应用层     | 在隔绝下层的通信内容后，可以制作各种的应用                 |                 |

# 应用层

## 一、概述

## 应用层常见协议知道多少？了解几个？

| 应用层协议 | 传输层  | 端口    | 说明                                           |
| ---------- | ------- | ------- | ---------------------------------------------- |
| HTTP       | TCP     | 80      | 超文本传输协议                                 |
| FTP        | TCP     | 23      | 文件传输                                       |
| DNS        | UDP     | 53      | 域名服务器                                     |
| SMTP       |         | 465/994 | 邮件发送协议                                   |
| POP3       |         | 995     | 邮件接收协议，邮件存到本机，删除服务器上邮件   |
| IMAP       |         | 993     | 邮件接收协议，邮件存到本机，不删除服务器上邮件 |
| BitTorrent | TCP/UDP |         | P2P的文件共享协议                              |
| RTSP       | TCP/UDP |         | 主要用于拉取视频流，用在VLC                    |

## 二、HTTP

### 1)HTTP基础

#### 1.说一下一次完整的HTTP请求过程包括哪些内容？

1. 建立客户端和服务器的连接
2. 客户端发送消息给服务器
3. 服务器给客户端发送应答消息
4. 客户端收到消息，浏览器解析，给用户呈现

#### 2.HTTP长连接和短连接的区别

HTTP1.0默认使用短连接，每次HTTP连接完成以后，都会自动断开，下一次连接的时候的时候又会重新建立，十分的花费时间

HTTP1.1默认使用长连接，也就是**持久连接**

其中HTTP1.1报文首部中使用Connection:Keep-Alive字段，指定使用了长链接

#### 3.HTTP请求方法你知道多少？

| 方法       | 作用                       | HTTP1.0 | HTTP1.1      |
| ---------- | -------------------------- | ------- | ------------ |
| GET        | 主要为获取和查询数据       | √       | √            |
| POST       | 发送修改请求               | √       | √            |
| HEAD       | 获取响应首部               | √       | √            |
| DELETE     | 删除资源                   | √       | √            |
| PUT        | 传输文件                   | √       | √            |
| OPTION     | 查询对应的URL支持的方法    | ×       | √            |
| TRACE      | 将请求通信回路返回给客户端 | ×       | √            |
| CONNECT    | 使用隧道协议代理进行连接   | ×       | √            |
| ~~LINK~~   |                            | ×       | 现在被取消了 |
| ~~UNLINK~~ |                            | ×       | 现在被取消了 |

#### 4.常见的HTTP状态码有哪些？

| 状态码 | 具体状态码 | 类别                  | 原因短语               | 常见情况                                     |
| ------ | ---------- | --------------------- | ---------------------- | -------------------------------------------- |
| 1XX    |            |                       | 请求正在处理           | POST的请求中转时候使用                       |
| 2XX    |            |                       | 请求成功               |                                              |
|        | 200        | OK                    |                        |                                              |
|        | 204        |                       |                        |                                              |
|        | 206        |                       |                        |                                              |
| 3XX    |            |                       | 请求重定向             |                                              |
|        | 301        |                       |                        |                                              |
|        | 302        |                       |                        |                                              |
|        | 303        |                       |                        |                                              |
|        | 304        |                       |                        |                                              |
|        | 307        |                       |                        |                                              |
| 4XX    |            | Client Error          | 客户端错误             |                                              |
|        | 400        | Bad Request           | 错误请求               | 请求报文中存在语法问题                       |
|        | 401        |                       |                        |                                              |
|        | 403        | Forbidden             | 禁止访问               | 没有访问的权限                               |
|        | 404        | Not Found             | 服务器上没有请求的资源 |                                              |
| 5XX    |            | Server Error          | 服务器错误             |                                              |
|        | 500        | Internal Server Error | 服务器本身出错         | 对于URL请求过来，处理出现了BUG<br/>代码有bug |
|        | 503        | Service Unavilable    | 服务器正忙             |                                              |
|        |            |                       |                        |                                              |

#### 6.HTTP请求和响应报文有哪些主要字段？

请求报文：

请求行 ： 包括请求方法，URL，协议/版本，例如：GET HTTP/1.1

请求头部：User-Agent:

请求主体：body

响应报文：

状态行：HTTP/1.1 200 OK

响应头部：Content-Length:200

响应主体：<html></html>

#### 7.HTTPS是什么？

HTTPS不是一种新的协议，是在HTTP协议的下方通过SSL/TLS来提供加密服务，但是HTTP+SSL依然处在应用层

然后通过TCP协议将加密的信息发送给对方，从而达到，防窃听，防伪装，防篡改的目的

#### 8.SSL是什么？

SSL(Secure Socket Layer，安全套接字层)

TSL(Transport Layer Security，传输安全层)，前身是SSL

#### 9.HTTPS和HTTP的区别

1. HTTP是明文传输的，数据都没有进行加密，HTTPS通过SSL/TLS层提供了加密服务
2. HTTP只需要在TCP三次握手后就可以建立连接，只需要交换3个数据报，但是HTTPS除了需要TCP的三次握手之外，还需要SSL握手需要9个包，建立连接的速度比HTTP慢
3. HTTP需要到CA(证书颁发机构)申请证书，后才能使用，但是免费的证书比较少，而且需要一定的费用
4. HTTP和HTTPS使用的连接方式不同，使用的端口也不同，HTTP在80号端口，HTTPS在443号端口

#### 10.HTTP的缺点有哪些？

1. 使用明文传输，传输过程没有加密，传送内容容易被**窃听**
2. 不验证通信方的身份，通信方的身份可能遭遇**伪装**
3. 无法验证报文完整性，加密内容容易被**篡改**

#### 11.HTTPS采用的加密方式有哪些？是对称还是非对称？

#### 12.HTTP如何禁用缓存？如何确认缓存？

#### 13.URI和URL的区别

URI：Uniform Resource Identifier，统一资源**定位**符

URL：Uniform Resource Location，统一资源**标识**符

URI是用来标识一个资源的，可以通过这个知道资源是什么

URL是用来定位具体资源的，通过这个可以拉取到想要的资源

### 2)请求方法

#### 1.GET 和 POST 的区别，你知道哪些？

1. GET传输的内容在参数中传递，POST在body中传递参数
2. GET一般用于获取数据，POST一般用于修改数据，比如登录的场景
3. GET提交的数据，理论上长度为2K，POST传递的数据长度，理论上没有限制
4. GET请求会被浏览器缓存，POST一般情况下不会
5. GET是幂等的，POST不是幂等的

记忆：1.传参，2.作用，3.长度，4.缓存，5.幂等

幂等性的意思：对服务器的请求，请求一次的结果和请求多次的结果是一样的

GET查询一个数据，每次查询的结果是一样的，所以是幂等的

POST生成一个新的数据，比如生成一个博客，POST请求了两次，可能会生成两个页面

#### 2.GET 方法参数写法是固定的吗？

一般情况下，GET请求的参数都是写在?后面，通过&来连接多个参数

服务器解析的过程是，获取TCP连接传输过来的数据，通过正则表达式的方法获取Header和Body，从而提取到GET请求的参数

但这个参数的写法也是由客户端和服务器之间约定形成的，只要双方遵守约定的规则，都是可以解析的

#### 3.GET 方法的长度限制是怎么回事？

GET方法理论上没有长度的限制，HTTP协议没有对Body和URL进行长度限制

一般是浏览器或者服务器给GET方法添加的限制，一般为2K大小

服务器限制GET方法的长度的原因：1.从性能角度考虑，处理较长的URL消耗较多的资源，2.从安全角度考虑，防止恶意构造长的URL来攻击

#### 4.POST 方法比 GET 方法安全？

POST方法，传输的数据，从地址栏是不可见的，看起来比GET方法安全

但是HTTP都是明文传输的，只要进行数据抓包，就能抓到POST方法中Body的内容，所以其实也是不安全的

想要安全传输，还需要将HTTP改造成HTTPS

#### 5.POST 方法会产生两个 TCP 数据包？你了解吗？

HTTP协议中没有说POST会发送两次请求

是有些文章中提到使用POST会将head和body分开发送，先发送header，服务器返回100后再次发送body

但是实际上发现，在大多数情况下并不是这样

所以说POST产生两个TCP数据包的情况，是部分浏览器和框架的行为，不是POST的必然行为

#### 6.GET与POST传递数据的最大长度能够达到多少呢？

HTTP没有对GET和POST请求，传递数据的最大长度做规范

GET能传输的最大长度取决于URL的长度，一般浏览器的限制为2K，主要是服务器设计者从安全和性能的角度考虑的

POST的传输长度取决于body能传输多大，一般都是要求小于MB

### 3)状态管理

#### 1.Cookie是什么？

由于HTTP协议是无状态的，所以在HTTP/1.1中就引入了cookie来保存用户信息。

用来解决每次刷新一次页面都需要重新登录的情况

客户端向服务器发送请求后，服务器返回的消息中会携带一小段数据用于标识这个用户，之后每次客户端的请求都会带上这一小段cookie表示来自同一个用户的请求，会增加一些性能开销

#### 2.Cookie有什么用途？用途

1. 会话状态的管理，记住用户的登录状态，购物车信息，收藏夹内容
2. 个性化设置，电商页面的话会给用户做个性化推荐
3. 浏览器行为跟踪，跟踪分析用户的行为

#### 3.Session是什么？

除了将用户的cookie存在本地，还可以使用session将用户信息存储在服务器

sesion可以存储在服务器的文件，数据库，内存中，或者存在redis这种内存数据中，效率更高

#### Session 的工作原理是什么？/使用 Session 的过程是怎样的？

#### Cookies和Session区别是什么？Cookie与Session的对比

#### Session和cookie应该如何去选择（适用场景）？

1. cookie只能保存ASCII码值，cookie可以保存各种类型的信息，当存储的内容较复杂的时候，首选cookie
2. cookie存储在浏览器中，容易被恶意查看，容易造成隐私的泄漏，隐私数据应该存在session中
3. session对于大型网站，用户量十分大，储存的开销也是十分大的，只需要在sesion中保存重要信息


## 二、DNS

### 1.你知道DNS是什么？

DNS是一种域名解析服务器，可以将用户发送过来的域名转化为具体的IP地址

### 2.DNS的工作原理？

### DNS查询方式有哪些？











# 攻击方式

### SYN攻击是什么？

### DDos 攻击了解吗？

### XSS攻击是什么？（低频）

### CSRF攻击？你知道吗？

### 如何防范CSRF攻击







# 参考资料

[计算机网络-01-20 | 阿秀的学习笔记 (interviewguide.cn)](https://interviewguide.cn/notes/03-hunting_job/02-interview/03-01-net.html#_11%E3%80%81get-%E5%92%8C-post-%E7%9A%84%E5%8C%BA%E5%88%AB-%E4%BD%A0%E7%9F%A5%E9%81%93%E5%93%AA%E4%BA%9B)[

[面试必备：GET和POST 的区别详细解说 - 腾讯云开发者社区-腾讯云 (tencent.com)](https://cloud.tencent.com/developer/article/1498283)

[HTTP POST请求发送两个TCP包？_john-zeng的博客-CSDN博客_post 两个tcp](https://blog.csdn.net/zerooffdate/article/details/78962818)


































































































