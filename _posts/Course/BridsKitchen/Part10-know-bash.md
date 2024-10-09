---
title: Part10 认识与学习bash && 管道命令
date: 2022-03-31 15:06:08
tags:
- 鸟哥的Linux私房菜
---



# 10.5 数据流重定向

标准输入　　(stdin) ：代码为 0 ，使用 < 或 << ；
标准输出　　(stdout)：代码为 1 ，使用 > 或 >> ；
标准错误输出(stderr)：代码为 2 ，使用 2> 或 2>> ；

1> ：以覆盖的方法将『正确的数据』输出到指定的文件或装置上；
1>>：以累加的方法将『正确的数据』输出到指定的文件或装置上；
2> ：以覆盖的方法将『错误的数据』输出到指定的文件或装置上；
2>>：以累加的方法将『错误的数据』输出到指定的文件或装置上；

/dev/null 垃圾桶黑洞装置与特殊写法

常见命令
daily.log 2>&1 &

2>&1 &
最后的&表示把条命令放到后台执行

2>&1

----

命令下达情况	说明
cmd1 && cmd2	1. 若 cmd1 运行完毕且正确运行($?=0)，则开始运行 cmd2。<br> 2. 若 cmd1 运行完毕且为错误 ($?≠0)，则 cmd2 不运行。
cmd1 || cmd2	1. 若 cmd1 运行完毕且正确运行($?=0)，则 cmd2 不运行。<br> 2. 若 cmd1 运行完毕且为错误 ($?≠0)，则开始运行 cmd2。

---

测试 /tmp/abc 是否存在，若不存在则予以创建，若存在就不作任何事情
ls /tmp/abc || mkdir /tmp/abc && touch /tmp/abc/hehe

ls /tmp/abc && touch /tmp/abc/hehe

# 10.6 管道命令

## 提取命令
### cut 将一行信息当中取出想要的
对同一行的数据进行分解，难以处理多个空格相连的情况
cut -d'分隔字符' -f fields

|选项 | 含义|
|---|---|
|-d  |后面接分隔字符。与 -f 一起使用；|
|-f  |取出第几段的意思|
|-c  |以字符 (characters) 的单位取出固定字符区间；|


### grep     
分析一行信息，提取整行
### 常用方法
```bash
grep [options] pattern [file ...]
grep -i "HISTORY" ~/.bashrc          # 查找指定的文件内容
ls -al | grep -i "HISTORY" ~/.bashrc # 通过字符串流过滤
```
### 常用指令
```bash
grep -i "HISTORY" ~/.bashrc       # 忽略大小写，默认是处理大小写的
grep -v "HISTORY" ~/.bashrc       # 反向匹配，显示不包含模式的行
grep -n "HISTORY" ~/.bashrc       # 显示匹配行的行号
grep -w "HISTORY" ~/.bashrc       # 仅匹配整个单词，而不是模式的一部分
grep -E "*HIS*"                   # 使用扩展正则表达式进行匹配,如果使用 grep "*HIS*"不会正确的匹配
grep -F "HISTORY" ~/.bashrc       # 将模式视为固定字符串，而不是正则表达式
```
**扩展正则表达式**
1. `.`：匹配任意单个字符（除了换行符）
2. `*`：匹配前面的字符零次或多次。
3. `+`：匹配前面的字符一次或多次。
4. `?`：匹配前面的字符零次或一次。
5. `|`：逻辑或，匹配两个模式中的任意一个。
6. `()`：用于分组，可以改变操作符优先级，并且匹配的内容可以在后续使用。
7. `{n}`：匹配前面的字符恰好 n 次。
8. `{n,}`：匹配前面的字符至少 n 次。
9. `{n,m}`：匹配前面的字符至少 n 次但不超过 m 次。
### 不常用指令
```bash
grep -r "install" /home         # 递归搜索目录及其子目录中的文件,类似vscode中的全局搜索,是搜索文件中的内容
grep -l "HISTORY" ~/.bashrc     # 只显示包含模式的文件名，而不显示具体匹配行
grep -A 2 "HISTORY" ~/.bashrc   # 显示匹配行及其后面 2 行的内容
grep -B 2 "HISTORY" ~/.bashrc   # 显示匹配行及其前面 2 行的内容
grep -C 2 "HISTORY" ~/.bashrc   # 显示匹配行及其前后各 2 行的内容
                                # 用在shell，返回一个退出码，检查退出状态码来判断是否找到了匹配的内容
grep -q "HISTORY" ~/.bashrc     # 静默模式，不输出任何信息
```
### 常用指令组合
```bash
grep -inE "*HIS*"               # i:忽略大小写，n:显示行号，E:使用扩展正则

grep -v '^$' filename               # 过滤空行
grep -i "apple" fruits.txt          # 在 fruits.txt 文件中忽略大小写查找 "apple"
grep -r "error" /var/log/           # 在 /var/log/ 目录及其子目录中递归搜索包含 "error" 的文件
grep -n "function" script.sh        # 在 script.sh 文件中查找包含 "function" 的行，并显示行号
grep -l "success" *.log             # 查找所有 .log 文件中包含 "success" 的文件名
grep -w "word" text.txt             # 在 text.txt 文件中查找整个单词 "word"
grep -A 2 "error" log.txt           # 显示 log.txt 文件中包含 "error" 的行及其后两行内容
grep -E "^[A-Za-z]+$" names.txt     # 使用扩展正则表达式查找 names.txt 文件中的字母名称
```

## 排序命令

### sort
进行排序
sort [-fbMnrtuk] [file or stdin]

|选项 | 含义|
| ------ | ------ | 
|-f  |忽略大小写的差异，例如 A 与 a 视为编码相同|
|-b  |忽略最前面的空格符部分|
|-M  |以月份的名字来排序，例如 JAN, DEC 等等的排序方法|
|-n  |使用『纯数字』进行排序(默认是以文字型态来排序的)|
|-r  |反向排序,原来是从小到大，-r后从大到小|
|-u  |就是 uniq ，相同的数据中，仅出现一行代表|
|-t  |分隔符，默认是用 [tab] 键来分隔|
|-k  |以那个区间 (field) 来进行排序的意思|

```
sort
1
10
11
12
13
2
20
3
4
sort -n # 如果不加n，就是用字典序排序了
1
2
3
4
10
11
12
13
20
sort -rn    
sort -t ':'  # 用冒号分割
```

### uniq
将重复的数据列出一行显示
uniq [-ic]

| 选项 | 含义 | 
| ------ | ------ | 
| -i | 忽略大小写字符的不同行 | 
| -c | 进行计数 |

```
uniq -c | sort -rn | head -n 5  # 找到次数最多的几个
```

### wc
wc [-lwm]

| 选项 | 含义 | 
| ------ | ------ | 
| -l | 仅列出行 | 
| -w  | 仅列出多少字(英文单字) |
| -m  | 多少字符 |

```
cat /etc/passwd | wc -l   # 目前你的账号文件中有多少个账号时
```






# 参考文献

[Linux Shell >/dev/null 2>&1 &含义]https://www.silenceboy.com/2019/04/01/Linux-Shell-dev-null-2-1-%E5%90%AB%E4%B9%89/index.html
[深入理解Linux shell中2>&1的含义(全网最全，看完就懂)]https://segmentfault.com/a/1190000040086046





