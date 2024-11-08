---
title: Typescript 语法
date: 2024-11-08 16:43:13
tags:
- 语法
---

# 编译运行

tsc hello.ts
node hello.js


tsc --init
tsc --watch hello.ts
tsc -watch -p .


# typescript 语法

ts-node

1. 回调函数
2. 类构造
3. async/await 异步等待 ES6
4. Promise对象
5. 泛型（函数泛型
6. 匿名函数
7. 存取器方法
   1. get
   2. set
8. readonly 修饰符
9. 属性索引
   1.  [s: string]: boolean | ((s: string) => boolean);
10. interface 接口或 type 别名



# vscode extension开发
```bash
npm install -g cnpm --registry=https://registry.npmmirror.com


npm install --global yo generator-code

Yeoman 

set-ExecutionPolicy RemoteSigned

yo code

package.json

# 全局安装 TypeScript
npm i -g typescript 

npm install -g nodemon
tsc -v
```

什么反应没有，vscode版本不匹配

# electron


```bash
npm install -g electron
```


# 参考资料

## 开发VScode扩展
[Your First Extension](https://code.visualstudio.com/api)
[国内npm源镜像（npm加速下载） 指定npm镜像](https://blog.csdn.net/qq_43940789/article/details/131449710)
[VS Code 插件开发中文文档](https://rackar.github.io/vscode-ext-doccn/extension-authoring/developing-extensions.html#%E7%BC%96%E8%AF%91typescript)