---
title: Markdown 教程
date: 2022-02-12 16:44:29
tags:
- 教程
---

生成目录 [TOC]
[TOC]

# 标题
```
# 这是 <h1> 一级标题

## 这是 <h2> 二级标题

### 这是 <h3> 三级标题

#### 这是 <h4> 四级标题

##### 这是 <h5> 五级标题

###### 这是 <h6> 六级标题
```

# 斜体

```*这会是 斜体 的文字*``` *这会是 斜体 的文字*
```_这会是 斜体 的文字_``` _这会是 斜体 的文字_
```**这会是 粗体 的文字**``` **这会是 粗体 的文字**
```__这会是 粗体 的文字__``` __这会是 粗体 的文字__
```_你也 **组合** 这些符号_``` _你也 **组合** 这些符号_
```~~这个文字将会被横线删除~~``` ~~这个文字将会被横线删除~~```


# 列表
## 无序列表
- Item 1
- Item 2
  - Item 2a
  - Item 2b

```
- Item 1
- Item 2
  - Item 2a
  - Item 2b
```

## 有序列表
1. Item 1
1. Item 2
1. Item 3
   1. Item 3a
   1. Item 3b
```
1. Item 1
1. Item 2
1. Item 3
   1. Item 3a
   1. Item 3b
```
* 第一项      
* 第二项
* 第三项

+ 第一项
+ 第二项
+ 第三项

- 第一项
- 第二项
- 第三项

```
* 第一项      
* 第二项
* 第三项

+ 第一项
+ 第二项
+ 第三项

- 第一项
- 第二项
- 第三项
```

# 图片

```
![Alt text](图片链接 "optional title")
```
Alt text：图片的Alt标签，用来描述图片的关键词，可以不写。最初的本意是当图片因为某种原因不能被显示时而出现的替代文字，后来又被用于SEO，可以方便搜索引擎根据Alt text里面的关键词搜索到图片。 
图片链接：可以是图片的本地地址或者是网址。
"optional title"：鼠标悬置于图片上会出现的标题文字，可以不写。

![Hollow Knight](../img/1.jpg)

# 引用
```
> We're living the future so
> the present is our past.
```

# 分隔符
---
连字符
---
星号
---
下划线
---

# 代码块
你可以在你的代码上面和下面添加 ``` 来表示代码块。

```
printf("hello world") 
```


# 创建表格

## 默认表格
```
| 标题1 | 标题2 | 标题3 |
| ------ | ------ | ------ |
| 文本好短 | 文本不短也不长 | 文本好长文本好长文本好长 |
| 文本好长文本好长文本好长 | 文本好短 | 文本不短也不长 |
```
| 标题1 | 标题2 | 标题3 |
| ------ | ------ | ------ |
| 文本好短 | 文本不短也不长 | 文本好长文本好长文本好长 |
| 文本好长文本好长文本好长 | 文本好短 | 文本不短也不长 |

## 带有对齐格式的表格
```
| 左对齐 | 右对齐 | 居中对齐 |
| :-----| ----: | :----: |
| 文本好短 | 文本不短也不长 | 文本好长文本好长文本好长 |
| 文本好长文本好长文本好长 | 文本好短 | 文本不短也不长 |
```

| 左对齐 | 右对齐 | 居中对齐 |
| :-----| ----: | :----: |
| 文本好短 | 文本不短也不长 | 文本好长文本好长文本好长 |
| 文本好长文本好长文本好长 | 文本好短 | 文本不短也不长 |

## Markdown关于表格的语法
默认标题居中对齐，内容居左对齐
:-内容和标题栏居左对齐，:-:内容和标题栏居中对齐，-:内容和标题栏居右对齐
| - :之间多余的空格会被忽略，-的数量至少一个
内容和|之间多余的空格会被忽略

## 表格内换行
```<br>```

## 转义字符

``\<mutex>``
\<mutex>

# cmMarkdown[^code]
- [x] 有一个launch.json文件，会调用刚刚写的
- [ ] 支持以 PDF 格式导出文稿
- [ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率
- [x] 新增 Todo 列表功能
- [x] 修复 LaTex 公式渲染问题
- [x] 新增 LaTex 公式编号功能

> * 整理知识，学习笔记
> * 发布日记，杂文，所见所想
> * 撰写发布技术文稿（代码支持）
> * 撰写发布学术论文（LaTeX 公式支持）


// 引用
[^code]: 代码高亮功能支持包括 Java, Python, JavaScript 在内的，**四十一**种主流编程语言。


<i class="icon-adjust"></i> 主题：内置了黑白两种模式的主题，试试 **黑色主题**，超炫！
<i class="icon-desktop"></i> 阅读：心无旁骛的阅读模式提供超一流的阅读体验
<i class="icon-fullscreen"></i> 全屏：简洁，简洁，再简洁，一个完全沉浸式的写作和阅读环境



```python
@requires_authorization
def somefunc(param1='', param2=0):
    '''A docstring'''
    if param1 > param2: # interesting
        print 'Greater'
    return (param2 - param1 + 1) or None

class SomeClass:
    pass

>>> message = '''interpreter
... prompt'''
```


```cpp
#include "config.h"

Config::Config(){
    //端口号,默认9006
    PORT = 9006;
}
```

[md文件编写可以使用在线所见即所得编辑器]https://www.zybuluo.com/mdeditor
[md文件编写可以使用在线所见即所得编辑器](https://www.zybuluo.com/mdeditor)


# 参考文献
https://shd101wyy.github.io/markdown-preview-enhanced/#/zh-cn/markdown-basics
https://www.jianshu.com/p/280c6a6f2594
[md文件编写可以使用在线所见即所得编辑器]https://www.zybuluo.com/mdeditor

