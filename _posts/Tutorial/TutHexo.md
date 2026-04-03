---
title: hexo 教程
date: 2022-02-12 18:18:12
tags:
- 教程
---

# hexo 教程

## 一、常见博客种类

| 类型 | 代表 | 说明 |
|---|---|---|
| **动态博客** | WordPress（PHP）、SpringBoot | 全自建，需要服务器 |
| **静态博客** | Hexo（Node.js）、Jekyll（Ruby）、Hugo（Go） | 纯前端，托管到 GitHub Pages 等 |

## 二、hexo 安装

### 1. 下载 Node.js
去 [http://nodejs.cn/](http://nodejs.cn/) 下载长期支持版，安装后确认：
安装后有两个东西
node.js本身
npm包管理器
```bash
node -v
v16.13.1
npm -v
8.1.2
```

### 2. 使用 cnpm 代替 npm（国内加速）
```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm -v
```

### 3. cnpm安装hexo
```bash
cnpm install -g hexo-cli
hexo -v # 确认安装成功
```


# 三、搭建第一个hexo博客
## 1.新建一个文件夹
D盘随便新建一个文件夹blog
以后的东西都是在里面用的，如果出错了直接删掉找个文件夹重来就可以了
## 2.初始化博客
进入文件夹
hexo init
## 3.第一次启动博客
hexo s
粘贴网址，查看启动的博客
## 4.部署到github
安装一个git插件
npm install hexo-deployer-git --save
## 5.对hexo进行配置
打开blog文件夹下的_config.yml
拉到最底部
```
deploy:
  type: ''
```
改为
```
deploy:
  type: git
  repository: # github中仓库的地址
  branch: master/main # 参考github中主分支的名字
```
git config --global user.name  "name"
git config --global user.email  "emal"

hexo d # 推送上去，就推送到github了

## 6.在github中开启GitHub Pages服务
在最上面一行找到settings
找到Pages



## 四、hexo 常用命令
下次开始再次编辑的时候，在需要编辑的文件夹里面打开git bash，不需要hexo init,直接hexo s就可以启动本地页面

| 命令 | 说明 |
|---|---|
| `hexo init` | 初始化博客 |
| `hexo new "标题"` | 新建文章（默认布局为 post） |
| `hexo new [layout] "标题"` | 指定布局创建页面 |
| `hexo g` / `hexo generate` | 生成静态文件 |
| `hexo s` / `hexo server` | 启动本地预览服务器 |
| `hexo d` / `hexo deploy` | 部署到远程 |
| `hexo clean` | 清除缓存文件 |
| `hexo list <type>` | 列出网站资料（page/post/route/tag/category） |

> 文档：[https://hexo.io/zh-cn/docs/commands.html](https://hexo.io/zh-cn/docs/commands.html)

## 五、常见问题

### 1. hexo 下 Markdown 表格失效
表格和正文之间需空开一行。

### 2. 编码问题
使用 **UTF-8** 编码，GB2312 会乱码。

### 3. 文章标题
文件名不影响文章标题，标题由文章内容开头的 front matter 决定：
```yaml
---
title: day07123141
date: 2022-04-03 15:51:39
tags:
- Linux网络编程
---
```

### 4. 主题页面报错 `Cannot GET /xxx`
以 pure 主题为例，需要为主题的每个菜单项创建对应页面：

**步骤一：** 查看主题配置（`blog/theme/pure/_config.yml`）：
```yaml
menu:
  Home: .
  Archives: archives
  Categories: categories
  Links: links
  About: about
  Books: book    # 需要创建对应页面
```

**步骤二：** 创建页面文件：
```bash
hexo new page "book"
# 编辑 blog/source/book/index.md，添加 front matter 后生成
```

**步骤三：** 如显示中文 key（如 `menu.book`），进入主题语言文件（`themes/pure/languages/zh-CN.yml`）修改：
```yaml
menu:
  Home: 首页
  book: 书单
```

## 六、添加搜索功能

```bash
npm i -S hexo-generator-json-content
# 在你运行 hexo g 或者 hexo s 时生效，在 hexo g 生成站点时, 会在根目录下生成 content.json 该文件内容即为搜索内容。
# 你可以对搜索内容进行自定义的配置， 只要在 _config.yml 中配置
```

在 `_config.yml` 中配置：
```yaml
# 示例: 隐藏分类和标签的搜索
jsonContent:
  dateFormat: DD/MM/YYYY
  posts:
    title: true
    date: true
    path: true
    text: true
    raw: false
    content: false
    slug: false
    updated: false
    comments: false
    link: false
    permalink: false
    excerpt: false
    categories: false
    tags: false
    author: false
```

## 七、配置相关

### 语言设置
```yaml
language: zh-CN   # 中文
language: en     # 英文
```
需确认当前主题是否支持对应语言文件。

### pure 主题常用配置
```yaml
# 每页文章数
per_page: 20

# fancybox：图片点击放大（默认关闭，开启会导致友链页面打不开）
# profile：个人信息配置
```

## 参考资料
[B站羊哥的教程]https://www.bilibili.com/video/BV1Yb411a7ty?spm_id_from=333.337.search-card.all.click&vd_source=76dff3ae3b42b00d067c0921bf6859ca
[官方的链接参考] https://hexo.io/zh-cn/docs/commands.html
hexo下Markdown语法失效总结 https://blog.csdn.net/weixin_42932905/article/details/106153679?utm_medium=distribute.pc_aggpage_search_result.none-task-blog-2~aggregatepage~first_rank_ecpm_v1~rank_v31_ecpm-1-106153679.pc_agg_new_rank&utm_term=hexo+markdown%E4%B8%8D%E7%94%9F%E6%95%88&spm=1000.2123.3001.4430
大佬的一些教程 https://hwame.top/
[hexo博客出现“Cannot GET/xxxx”的错误]https://blog.csdn.net/weixin_30699831/article/details/96894620
[启用搜索功能]https://blog.plcent.com/2019/11/05/hexo-theme-pure/
[添加友链]https://github.com/cofess/hexo-theme-pure/blob/master/README.cn.md
[启用RSS订阅]https://wxnacy.com/2018/12/12/hexo-add-rss/
[启用RSS订阅]https://www.jianshu.com/p/2aaac7a19736