---
title: Node.js 语法
date: 2024-11-08 16:43:13
tags:
- 语法
---

## Node.js 基础

```bash
node -v     # 显示 node.js 版本
npm -v      # 显示 npm 版本
npm -g root # 查看全局包安装路径
```

## npm 常用指令

```bash
# 初始化
npm init  # 初始化一个新的 npm 项目，引导创建 package.json 文件

# 安装
npm install                          # 安装项目全部依赖
npm install cnpm                     # 安装指定名称的包
npm install cnpm -g                  # 全局安装一个包
npm install cnpm -S                  # 安装到 dependencies（开发和上线都需要）
npm install cnpm -D                  # 安装到 devDependencies（仅开发阶段需要）

# 卸载
npm uninstall cnpm                  # 移除依赖包，并从 package.json 中删除

# 查看
npm list / npm ls                   # 查看当前目录下已安装的 node 包
npm ls -g                            # 查看全局已安装过的 node 包
npm ls --depth 1 -g
npm view cnpm                        # 查看指定包的详细信息

# 更新
npm update cnpm                      # 更新指定包到最新版本

# 配置
npm config ls                        # 查看简单配置项
npm config ls -l                      # 查看所有配置项
npm config get userconfig             # 查看配置文件路径
# C:\Users\<username>\.npmrc
npm config get registry               # 查看当前镜像
# https://registry.npmjs.org/
npm config set registry https://registry.npmmirror.com   # 切换淘宝镜像
npm config get prefix
npm config get cache  # 查看缓存配置，get后面可以跟任意配置项
npm config set prefix "E:\nodejs\node_global"             # 设置全局安装路径
npm config set cache "E:\nodejs\node_cache"               # 设置缓存路径
npm config edit                      # 直接编辑配置文件
npm config get loglevel              # 查看日志级别

# 缓存相关
npm cache ls
npm cache clean                      # 清理缓存
npm cache clean --force
npm cache verify                     # 验证缓存有效性


```

### npm 登录与发布

```bash
npm login         # 登录 npm
npm whoami        # 查看当前登录的用户名
npm publish <包名> # 发布包到 npm 仓库
```

### npm 常用命令补充

```bash
npm cache clean              # 清理 npm 缓存
npm cache verify            # 检查 npm 缓存有效性
npm deprecate <包名> <消息> # 给包发布废弃警告
npm version <版本类型>      # 更新包的版本号（minor、major 等）
npm tag <包名> <标签名>     # 给包添加或修改标签
```

### 日志级别（loglevel）

默认值：`"notice"`

`silent` / `error` / `warn` / `notice` / `http` / `timing` / `info` / `verbose` / `silly`

### PowerShell 设置

```bash
set-ExecutionPolicy RemoteSigned    # 解决无法运行 .ps1 的问题
get-ExecutionPolicy                 # 验证当前策略

ls -Name                             # 查看当前目录文件名
Get-ChildItem -Name                 # 同上
Get-Alias / gal                      # 查看别名
Set-Alias ll ls                      # 设置别名
```

## 常用全局包

```bash
cnpm install cnpm express nodemon ts-node hexo electron -g
cnpm install generator-code yo -g
```

## EasyChat 项目

```bash
cnpm create @quick-start/electron@1.0.16 easychat-front
cd easychat-front
npm install
npm run dev

npm i element-ui -S
npm install element-plus --save
npm cache clear --force
npm install --package-lock-only
```

## Vue 3 响应式

1. `ref`
2. `reactive`
3. `getCurrentInstance`
4. `nextTick`

## 参考资料

- [npm 常用命令大全](https://blog.csdn.net/xinglun88/article/details/139987956)
- [npmmirror 镜像站](https://npmmirror.com/)
- [npm logging](https://npm.nodejs.cn/cli/v8/using-npm/logging)
- [Herry 的 easy 云盘学习笔记](https://herryxiaoo.github.io/easypan/concent.html)
- [PowerShell 设置命令别名 Alias](https://segmentfault.com/a/1190000015928399)

## 常用包推荐

- [Element Plus - Vue 3 UI 框架](https://element-plus.org/zh-CN/)
- [Vite - 下一代前端工具](https://vite.vuejs.ac.cn/)
- [electron-vite - Electron 开发构建工具](https://cn.electron-vite.org/)
- [ESLint - 找到并修复 JavaScript 问题](https://eslint.org/)
- [Less - CSS 预处理器](https://less.bootcss.com)
