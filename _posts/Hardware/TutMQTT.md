---
title: MQTT
date: 2025-02-19 16:51:20
tags:
- 硬件
---


### MQTT
```bash
sudo vim /etc/mosquitto/mosquitto.conf
# 注释掉 websockets_log_level 0
touch /var/run/mosquitto.pid
chmod 777 /var/run/mosquitto.pid

mosquitto -v -c /etc/mosquitto/mosquitto.conf  
# 需要用配置文件启动
# 默认的配置文件不知道是什么，反正改了后没反应


打开一个终端，先启动mosquitto的服务端。
mosquitto -v

//终端1 -- 订阅主题“Topic”
mosquitto_sub -d -t Topic -p 1884

//终端2 -- 在主题“Topic”上发布消息“hello world”
mosquitto_pub -d -t Topic -m "hello world" -p 1884


sudo systemctl restart mosquitto
sudo vim /etc/mosquitto/mosquitto.conf



mosquitto_sub -h 194.168.1.22 -p 1884 -d -t Topic  
```


Kafka是为了数据集成的场景，与以往Pub/Sub消息总线不一样，通过分布式架构提供了海量消息处理、高容错的方式存储海量数据流、保证数据流的顺序等特性。可以参考云上的卡夫卡 - 数据工会。
MQTT是为了物联网场景而优化，不但提供多个QoS选项（exact once、at least once、at most once），而且还有层级主题、遗嘱等等特性。可以参考MQTT入门篇 - 数据工会。


```C++
libmosq_EXPORT int mosquitto_lib_init(void);

int mosquitto_lib_init(void);
struct mosquitto *mosquitto_new(const char *id, bool clean_session, void *obj);
int mosquitto_lib_cleanup(void);
void mosquitto_log_callback_set(struct mosquitto *mosq, void (*on_log)(struct mosquitto *, void *, int, const char *));
void mosquitto_connect_callback_set(struct mosquitto *mosq, void (*on_connect)(struct mosquitto *, void *, int));
void mosquitto_message_callback_set(struct mosquitto *mosq, void (*on_message)(struct mosquitto *, void *, const struct mosquitto_message *));
void mosquitto_disconnect_callback_set(struct mosquitto *mosq, void (*on_disconnect)(struct mosquitto *, void *, int));
int mosquitto_connect(struct mosquitto *mosq, const char *host, int port, int keepalive);
void mosquitto_destroy(struct mosquitto *mosq);
int mosquitto_publish(struct mosquitto *mosq, int *mid, const char *topic, int payloadlen, const void *payload, int qos, bool retain);
int mosquitto_subscribe(struct mosquitto *mosq, int *mid, const char *sub, int qos);
int mosquitto_loop_start(struct mosquitto *mosq);
int mosquitto_loop_forever(struct mosquitto *mosq, int timeout, int max_packets);
```

 sudo emqx start

 admin/public
 http://192.168.56.101:18083/


curl -s https://assets.emqx.com/scripts/install-emqx-deb.sh | sudo bash
sudo apt-get install emqx
sudo systemctl start emqx
sudo systemctl stop emqx

docker pull emqx/emqx:5.8.4

docker run -id --name emqx -p 1885:1883 -p 8083:8083 -p 8084:8084 -p 8883:8883 -p 18083:18083 emqx/emqx:5.8.4
http://127.0.0.1:18083/
1885


# 特殊机制
1. 遗嘱

# MQTT v3.3.1 和MQTT v5
MQTT 3.1.1：
这是MQTT协议的一个较早且广泛使用的版本。
它提供了基本的发布/订阅消息模式，支持一对多的消息发布，解除了应用程序的耦合。
基于TCP/IP提供网络连接，同时也有基于UDP的版本，称为MQTT-SN。
支持QoS（服务质量）等级，允许根据消息的重要性设置不同的服务质量等级。
具有小型传输、开销小的特点，协议交换最小化，以降低网络流量。
使用will遗嘱机制来通知客户端异常断线。
基于主题发布/订阅消息，对负载内容屏蔽的消息传输。
支持心跳机制以保持连接状态。
MQTT 5.0：
作为MQTT协议的最新版本，它在3.1.1版本的基础上增加了许多新特性和改进。
提供了更多的会话管理功能，如共享订阅和会话持久化。
增强了认证和授权机制，包括使用TLS加密连接和OAuth 2.0进行认证。
引入了新的QoS级别3，提供了更加可靠的消息传递保证。
增加了消息过期时间、主题别名和响应主题等特性，以优化消息传输和处理。
提供了更好的错误处理和恢复机制，以及更加灵活的连接和断开方式。


# 工具
EMQX
MQTT.fx


# 参考资料
[一文带你搞懂 MQTT](https://zhuanlan.zhihu.com/p/476556489)
[MQTT开源库--Mosquitto在Ubuntu下的安装与使用（一）](https://zhuanlan.zhihu.com/p/691800571)
[MQTT QoS 0、1、2 解析：快速入门指南](https://www.emqx.com/zh/blog/introduction-to-mqtt-qos)
[Download EMQX Open Source](https://www.emqx.com/en/downloads-and-install/broker?os=Ubuntu)
[Eclipse Mosquitto](https://mosquitto.org/)
[mosquitto.h](https://mosquitto.org/api/files/mosquitto-h.html)
[使用Mosquitto实现MQTT客服端C语言](https://www.cnblogs.com/jzcn/p/15252983.html)
[mosquitto的安装、配置、使用教程](https://www.cnblogs.com/qumogu/p/16007609.html)
[MQTT 遗嘱消息（Will Message）的使用](https://zhuanlan.zhihu.com/p/459926792)
http://www.steves-internet-guide.com/