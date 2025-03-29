---
title: Nginx 教程
date: 2022-02-12 18:18:12
tags:
- 教程
---

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


#启动脚本是在
# /usr/local/nginx/sbin/nginx
#启动,
sudo nginx -c /usr/local/nginx/conf/nginx.conf
#停止
sudo nginx -s stop
#重载
sudo nginx -s reload
#杀掉nginx
sudo nginx -s quit 

ps -ef | grep nginx

sudo ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx


nginx -c /date_sdb/soft/pro9_CarbonAccount/cct_all/conf/nginx.conf
