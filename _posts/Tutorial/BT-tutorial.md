---
title: 宝塔软件使用
date: 2022-11-03 16:49:44
tags:
---


wget -O install.sh http://download.bt.cn/install/install-ubuntu.sh && sudo bash install.sh
sudo apt-get install python-setuptools



停止
/etc/init.d/bt stop
启动
/etc/init.d/bt start
重启
/etc/init.d/bt restart
修改面板端口，如要改成 8881（centos 6 系统）
echo '8881' > /www/server/panel/data/port.pl && /etc/init.d/bt restart

# 参考资料

[Ubuntu18 安装宝塔面板出错 提示Pillow installation failed的解决办法 - 西昆云 (xikunyun.com)](https://www.xikunyun.com/news/content/1297.html)