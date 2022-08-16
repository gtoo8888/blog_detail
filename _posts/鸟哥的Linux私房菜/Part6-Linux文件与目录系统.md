---
title: Part6 Linux文件与目录系统
date: 2022-03-29 22:16:54
tags:
- 鸟哥的Linux私房菜
---




# 6.5命令的文件与查找

## 6.5.1脚本文件的查找

### which
which [-a] command
选项或参数：
-a ：将所有由 PATH 目录中可以找到的命令均列出，而不止第一个被找到的命令名称

which ifconfig


## 文件查找

### whereis
**在特定的目录中查找文件**
whereis [-bmsu] 文件或目录名

|选项 | 含义|
|---|---|
|-b    |只找 binary 格式的文件|
|-m    |只找在说明档 manual 路径下的文件|
|-s    |只找 source 来源文件|
|-u    |搜寻不在上述三个项目当中的其他特殊文件|

### locate
locate [-ir] keyword

|选项 | 含义|
|---|---|
|-i  |忽略大小写的差异|
|-r  |后面可接正规表示法的显示方式|


### find
find [PATH] [option] [action]
选项与参数：
1. 与时间有关的选项：共有 -atime, -ctime 与 -mtime ，以 -mtime 说明
   -mtime  n ：n 为数字，意义为在 n 天之前的『一天之内』被更动过内容的文件；
   -mtime +n ：列出在 n 天之前(不含 n 天本身)被更动过内容的文件档名；
   -mtime -n ：列出在 n 天之内(含 n 天本身)被更动过内容的文件档名。
   -newer file ：file 为一个存在的文件，列出比 file 还要新的文件档名

2. 与使用者或群组名称有关的参数：
-uid n ：n 为数字，这个数字是使用者的帐号 ID，亦即 UID ，这个 UID 是记录在
        /etc/passwd 里面与帐号名称对应的数字。这方面我们会在第四篇介绍。
-gid n ：n 为数字，这个数字是群组名称的 ID，亦即 GID，这个 GID 记录在
        /etc/group，相关的介绍我们会第四篇说明～
-user name ：name 为使用者帐号名称喔！例如 dmtsai 
-group name：name 为群组名称喔，例如 users ；
-nouser    ：寻找文件的拥有者不存在 /etc/passwd 的人！
-nogroup   ：寻找文件的拥有群组不存在於 /etc/group 的文件！
            当你自行安装软件时，很可能该软件的属性当中并没有文件拥有者，
            这是可能的！在这个时候，就可以使用 -nouser 与 -nogroup 搜寻。


3. 与文件权限及名称有关的参数：
   -name filename：搜寻文件名称为 filename 的文件；
   
   find . -name "*.log"

   -size [+-]SIZE：搜寻比 SIZE 还要大(+)或小(-)的文件。这个 SIZE 的规格有：
                   c: 代表 byte， k: 代表 1024bytes。所以，要找比 50KB
                   还要大的文件，就是『 -size +50k 』
   -type TYPE    ：搜寻文件的类型为 TYPE 的，类型主要有：一般正规文件 (f),
                   装置文件 (b, c), 目录 (d), 连结档 (l), socket (s), 
                   及 FIFO (p) 等属性。
   -perm mode  ：搜寻文件权限『刚好等於』 mode 的文件，这个 mode 为类似 chmod
                 的属性值，举例来说， -rwsr-xr-x 的属性为 4755 ！
   -perm -mode ：搜寻文件权限『必须要全部囊括 mode 的权限』的文件，举例来说，
                 我们要搜寻 -rwxr--r-- ，亦即 0744 的文件，使用 -perm -0744，
                 当一个文件的权限为 -rwsr-xr-x ，亦即 4755 时，也会被列出来，
                 因为 -rwsr-xr-x 的属性已经囊括了 -rwxr--r-- 的属性了。
   -perm +mode ：搜寻文件权限『包含任一 mode 的权限』的文件，举例来说，我们搜寻
                 -rwxr-xr-x ，亦即 -perm +755 时，但一个文件属性为 -rw-------
                 也会被列出来，因为他有 -rw.... 的属性存在！

4. 额外可进行的动作：
   -exec command ：command 为其他命令，-exec 后面可再接额外的命令来处理搜寻到
                   的结果。
   -print        ：将结果列印到萤幕上，这个动作是默认动作！