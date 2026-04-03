---
title: Nginx 教程
date: 2022-02-12 18:18:12
tags:
- 教程
---

# Nginx 教程

## 一、目录结构

| 路径 | 说明 |
|---|---|
| `/usr/local/nginx/sbin/nginx` | 主程序 |
| `/usr/local/nginx/conf/nginx.conf` | 主配置文件 |
| `/usr/local/nginx/logs/nginx.pid` | PID 文件 |
| `/usr/local/nginx/logs/error.log` | 错误日志 |
| `/usr/local/nginx/logs/access.log` | 访问日志 |
| `/var/lib/docker` | Docker 存储默认位置 |

nginx path prefix: "/usr/local/nginx"
nginx binary file: "/usr/local/nginx/sbin/nginx"
nginx modules path: "/usr/local/nginx/modules"
nginx configuration prefix: "/usr/local/nginx/conf"
nginx configuration file: "/usr/local/nginx/conf/nginx.conf"
nginx pid file: "/usr/local/nginx/logs/nginx.pid"
nginx error log file: "/usr/local/nginx/logs/error.log"
nginx http access log file: "/usr/local/nginx/logs/access.log"
nginx http client request body temporary files: "client_body_temp"
nginx http proxy temporary files: "proxy_temp"
nginx http fastcgi temporary files: "fastcgi_temp"
nginx http uwsgi temporary files: "uwsgi_temp"
nginx http scgi temporary files: "scgi_temp"

drwx------  2 nobody root 4096 Feb 26 10:47 client_body_temp/
drwxr-xr-x  2 root   root 4096 Feb 26 10:46 conf/
drwx------  2 nobody root 4096 Feb 26 10:47 fastcgi_temp/
drwxr-xr-x  2 root   root 4096 Feb 26 10:46 html/
drwxr-xr-x  2 root   root 4096 Feb 26 10:59 logs/
drwx------  2 nobody root 4096 Feb 26 10:47 proxy_temp/
drwxr-xr-x  2 root   root 4096 Feb 26 10:46 sbin/
drwx------  2 nobody root 4096 Feb 26 10:47 scgi_temp/
drwx------  2 nobody root 4096 Feb 26 10:47 uwsgi_temp/

/usr/local/nginx/

## 二、基本命令

```bash
#启动脚本是在 /usr/local/nginx/sbin/nginx
sudo nginx -c /usr/local/nginx/conf/nginx.conf # 启动
sudo nginx -s stop # 停止
sudo nginx -s reload # 重载配置
sudo nginx -s quit # 杀掉进程
ps -ef | grep nginx # 查看进程
sudo ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx # 软链接到 PATH，方便直接调用
```

## 三、热加载自定义配置

```bash
nginx -c /date_sdb/soft/pro9_CarbonAccount/cct_all/conf/nginx.conf
```

## 参考资料

- [Nginx 官方文档](https://nginx.org/en/docs/)
