---
title: Node.js 语法
date: 2024-11-08 16:43:13
tags:
- 语法
---



# nodejs
```bash
node -v     // 显示node.js版本
npm -v      // 显示npm版本
npm config get userconfig  ## 查看配置文件路径，
C:\Users\wellsun\.npmrc

npm config ls ## 查看简单的配置项
npm config ls -l  ##　查看所有配置项
npm config get cache  ## 查看缓存配置，get后面可以跟任意配置项
npm config edit  ## 直接编辑config文件，这个会打开文本

npm -g root


npm config set prefix "D:\nodejs\node_global"
npm config set cache "D:\nodejs\node_cache"

npm config get registry
https://registry.npmjs.org/


npm ls -g
npm ls --depth 1 -g
```



# 参考资料
