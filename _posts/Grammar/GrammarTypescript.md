---
title: Typescript 语法
date: 2024-11-08 16:43:13
tags:
- 语法
---

## 编译运行

```bash
tsc hello.ts
node hello.js
tsc --init
tsc --watch hello.ts
tsc -watch -p .
```

## TypeScript 语法

`ts-node` 可直接运行 TS 文件。

1. 回调函数
2. 类构造
3. async/await 异步等待（ES6）
4. Promise 对象
5. 泛型（函数泛型）
6. 匿名函数
7. 存取器方法（get / set）
8. readonly 修饰符
9. 属性索引：`[s: string]: boolean | ((s: string) => boolean);`
10. interface 接口或 type 别名

## VSCode Extension 开发

```bash
npm install -g cnpm --registry=https://registry.npmmirror.com
npm install -g yo generator-code
set-ExecutionPolicy RemoteSigned
yo code
```

### 安装 TypeScript

```bash
npm i -g typescript
npm install -g nodemon
tsc -v
```

## Electron

```bash
npm install -g electron
```

## 参考资料

- [Your First Extension](https://code.visualstudio.com/api)
- [国内 npm 源镜像](https://blog.csdn.net/qq_43940789/article/details/131449710)
- [VS Code 插件开发中文文档](https://rackar.github.io/vscode-ext-doccn/extension-authoring/developing-extensions.html)
