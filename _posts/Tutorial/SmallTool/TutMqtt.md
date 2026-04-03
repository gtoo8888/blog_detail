---
title: MQTT使用
date: 2022-08-23 15:49:26
tags:
- 教程
---

# MQTT使用

```bash
sudo apt-get install mosquitto mosquitto-clients mosquitto-dev -y
mosquitto -p 1883

mosquitto_pub -h localhost -t mqtt -m "haha" 
systemctl status mosquitto

mosquitto_sub -t mqtt -v


# mosquitto_sub -t 'test/topic' -v
# mosquitto_pub -t 'test/topic' -m 'hello world'

log_dest file C:\Program Files\mosquitto\log\mosquitto.log
log_dest stdout stderr 
log_type all
log_timestamp true
log_timestamp_format %Y-%m-%dT%H:%M:%S
connection_messages true
websockets_log_level 0
allow_anonymous false



cat install_manifest.txt | sudo xargs rm # 卸载
# 编译源码


sudo apt-get install libssl-dev xsltproc -y


sudo systemctl status mosquitto.service
```
