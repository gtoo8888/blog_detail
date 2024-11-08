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

npm -g root





```

# npm常用指令

```bash
npm -v      // 显示npm版本


# 初始化
# 初始化一个新的npm项目，并引导你创建一个`package.json`文件，该文件包含了项目的基本信息和依赖项。
npm init

# 安装
npm install # 安装项目所需的全部依赖（根据package.json文件）
npm install cnpm # 安装指定名称的包
npm install cnpm # 全局安装一个包

# 卸载
npm uninstall cnpm # 从项目中移除依赖包，并从package.json文件中删除指定的包。

# 查看
npm list(ls) # 查看当前目录下已安装的node包
npm ls -g  # 查看全局已经安装过的node包。
npm ls --depth 1 -g
npm ls --depth 1 -g

npm view cnpm # 查看指定包的详细信息

# 更新
npm update cnpm # 更新指定包到最新版本

# 配置
npm config ls # 查看简单的配置项
npm config ls -l  # 查看所有配置项
npm config get userconfig  # 查看配置文件路径
# C:\Users\<username>\.npmrc
npm config get cache  # 查看缓存配置，get后面可以跟任意配置项
npm config get registry
# https://registry.npmjs.org/
npm config set prefix "D:\nodejs\node_global"
npm config set cache "D:\nodejs\node_cache"
npm config edit  # 直接编辑config文件，这个会打开文本

```

未整理
```bash
npm login: 登录npm，输入用户名和密码。
 
npm whoami: 查看当前登录的用户名。
 
npm publish <包名>: 发布包到npm仓库。

# 常用命令

npm cache clean # 清理npm缓存。
npm cache verify # 检查npm缓存的有效性。
npm deprecate <包名> <消息> # 给包发布废弃警告。
npm version <版本类型> # 更新包的版本号（如minor、major等）。
npm tag <包名> <标签名> # 给包添加或修改标签。

```
loglevel 的默认值为 "notice"，但有多种级别/类型的日志可用，包括：
"silent"
"error"
"warn"
"notice"
"http"
"timing"
"info"
"verbose"
"silly"

# 常用的包
```bash
+-- cnpm@9.4.0
+-- electron@33.2.0
+-- express@4.21.1
+-- generator-code@1.11.4
+-- nodemon@3.1.7
+-- ts-node@10.9.2
+-- typescript@5.6.3
`-- yo@5.0.0
```

# 参考资料
[npm常用命令大全(非常详细)](https://blog.csdn.net/xinglun88/article/details/139987956)

https://npm.nodejs.cn/cli/v8/using-npm/logging