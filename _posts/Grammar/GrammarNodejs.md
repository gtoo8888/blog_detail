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
npm install cnpm -g # 全局安装一个包
npm install cnpm -(S)save # 安装的第三方包,放在文件package.json里面的"dependencies"
npm install cnpm -(D)save-dev # 安装的第三方包,放在文件package.json里面的"devdependencies"

# "dependencies"表示开发和上线都需要的第三方包，用-S
# "devdependencies"表示仅在开发阶段需要的第三方包，用-D


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
npm config get registry
# https://registry.npmjs.org/
npm config set registry https://registry.npmmirror.com # 切换淘宝镜像
npm install cnpm -g --registry=https://registry.npmmirror.com
npm config get prefix
npm config get cache  # 查看缓存配置，get后面可以跟任意配置项
npm config set prefix "E:\nodejs\node_global"
npm config set cache "E:\nodejs\node_cache"
npm config edit  # 直接编辑config文件，这个会打开文本
npm config get loglevel 

# 缓存相关
npm cache ls
npm cache clean 
npm cache clean --force
npm cache verify # 验证缓存文件夹的内容，垃圾收集任何不需要的数据，并验证缓存索引和所有缓存数据的完整性。

详情


set-ExecutionPolicy RemoteSigned # 无法运行x.ps的方法
get-ExecutionPolicy # 验证
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
cnpm install cnpm -g
cnpm install express nodemon ts-node hexo -g
cnpm install electron express typescript -g
cnpm install generator-code yo -g

```
# easychat项目

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

```powershell
ls -Name
Get-ChildItem -Name
dir 

Get-Alias
gal
Get-Alias ls

$profile
Set-Alias ll ls
```


# vue
1. ref
2. reactive
3. getCurrentInstance
4. nextTick





# 参考资料
[npm常用命令大全(非常详细)](https://blog.csdn.net/xinglun88/article/details/139987956)
[npmmirror 镜像站](https://npmmirror.com/)
https://npm.nodejs.cn/cli/v8/using-npm/logging


[Herry的easy云盘学习笔记](https://herryxiaoo.github.io/easypan/concent.html)
[PowerShell设置命令别名Alias](https://segmentfault.com/a/1190000015928399)

## 各种包
[一个 Vue 3 UI 框架 | Element Plus](https://element-plus.org/zh-CN/)
[Vite 下一代前端工具](https://vite.vuejs.ac.cn/)
[electron-vite 下一代 Electron 开发构建工具](https://cn.electron-vite.org/)
[Find and fix problems in your JavaScript code](https://eslint.org/)
[给 CSS 加点料](https://less.bootcss.com)























