---
title: hexo 教程
date: 2022-02-12 18:18:12
tags:
- 教程
---

# 常见的博客种类的介绍

- 动态博客
    - 全都自己搭建
        - springboot +js+mysql
    - wordpress
        - docker
        - PHP

- 静态博客
    - 基于XXX的开源博客
    - hexo
        - 纯前端，纯js的展示界面
        - node.js
    - jekyllrb
        - Ruby
    - hugo
        - go语言
    - VuePress
    - solo
        - java

# 一、hexo 安装教程

## 1.下载node.js
去http://nodejs.cn/ 下载长期支持版
直接下一步安装即可
安装后有两个东西
node.js本身
npm包管理器
确认安装成功
```
node -v
v16.13.1
npm -v
8.1.2
```
## 2.安装cnpm代替npm
在国内npm比较慢
npm install -g cnpm --registry=https://registry.npm.taobao.org
确认安装成功
```
cnpm -v
```
## 3..cnpm安装hexo
cnpm install -g hexo-cli
确认安装成功
```
hexo -v
```
到这里，hexo博客的框架已经安装好了

# 二、搭建第一个hexo博客
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



# 三、hexo 常用命令
下次开始再次编辑的时候，在需要编辑的文件夹里面打开git bash，不需要hexo init,直接hexo s就可以启动本地页面

## 初始化
``` 
hexo init
```

## 创建新页面
``` 
hexo n "我的页面名称"
hexo new [layout] "我的页面名称"
```
您可以在命令中指定文章的布局（layout），默认为 post，可以通过修改 _config.yml 中的 default_layout 参数来指定默认布局。

## 生成静态文件
``` 
hexo g 
hexo generate
```

## 启动服务器
每次再次想要编辑网站的时候可以直接用这个命令
``` 
hexo s 
hexo server
```

## 部署网站
```
hexo d 
hexo deploy
```

## 清除缓存文件
```
hexo clean
```
## 列出网站资料
```
hexo list 
Usage: hexo list <type>
Arguments:
  type  Available types: page, post, route, tag, category
```

## 链接
```
https://hexo.io/zh-cn/docs/commands.html
直接放链接就可以了
```
# 四、修复一些问题
## hexo下markdown表格失效
表格和正文空开一行

## 编码
使用UTF-8编码
GB 2312会乱码

## 标题
文件名没有用，只有文章里面的内容的名字才有用
直接新建文件，开头用如下格式，就可以新建文章

```
---
title: day07123141
date: 2022-04-03 15:51:39
tags:
- Linux网络编程
---
```
## Cannot GET/xxxx
使用了pure主题以后，多出了很多的分类，比如友链，书单之类的，点进出会出现```Cannot GET /book```的错误，实际情况希望能获取到自己想要的页面修复方法
- 步骤一：
去主题目录下查看\blog\theme\pure\_config.yml
这就是当前左边的主标签
```
menu:
  Home: .
  Archives: archives  # 归档
  Categories: categories  # 分类
  Links: links  # 友链
  About: about  # 关于
  Books: book  # 关于
```
- 步骤二：
想要创建对应的标签的内容，以book举例
在控制台中执行
hexo new page "book"
\blog\source\book\index.md
index.md就是每个文件都要包含的文件，也是需要展示的内容
直接生成就可以了
- 步骤三：
如果需要建立新的标签，重复上面两个步骤
如果不改编码，会在左侧标签出现
menu.book的问题
由于使用了中文字符编码，所以需要进入主题中改一下yml文件
\blog\themes\pure\languages\
使用的是zh-CN.yml
```
menu:
  Home: 首页
  Archives: 归档
  Categories: 分类
  ...
  book: 书
  About: 关于
  Cat: 猫 # 自己添加的标签
```
将自己想要添加标签写上
重新生成

## 添加搜索功能
安装插件
npm i -S hexo-generator-json-content 
在你运行 hexo g 或者 hexo s 时生效，在 hexo g 生成站点时, 会在根目录下生成 content.json 该文件内容即为搜索内容。
你可以对搜索内容进行自定义的配置， 只要在 _config.yml 中配置
```
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

# 五、配置相关
## 配置语言
```
language: zh-CN  # 中文
language: en        # 英文
```
得查看当前使用的主题使用的什么配置
我使用的主题是pure里面有languages文件有配置文件名字zh-CN.yml，使用中文需要改成这个

## pure主题的改变
fancybox：实现点击图片放大的部件，默认关闭，打开后会导致友链打不开
profile：改变个人信息

### 改变每页的文章数目
per_page: 20

# 参考文献
[B站羊哥的教程]https://www.bilibili.com/video/BV1Yb411a7ty?spm_id_from=333.337.search-card.all.click&vd_source=76dff3ae3b42b00d067c0921bf6859ca
[官方的链接参考] https://hexo.io/zh-cn/docs/commands.html
hexo下Markdown语法失效总结 https://blog.csdn.net/weixin_42932905/article/details/106153679?utm_medium=distribute.pc_aggpage_search_result.none-task-blog-2~aggregatepage~first_rank_ecpm_v1~rank_v31_ecpm-1-106153679.pc_agg_new_rank&utm_term=hexo+markdown%E4%B8%8D%E7%94%9F%E6%95%88&spm=1000.2123.3001.4430
大佬的一些教程 https://hwame.top/
[hexo博客出现“Cannot GET/xxxx”的错误]https://blog.csdn.net/weixin_30699831/article/details/96894620
[启用搜索功能]https://blog.plcent.com/2019/11/05/hexo-theme-pure/