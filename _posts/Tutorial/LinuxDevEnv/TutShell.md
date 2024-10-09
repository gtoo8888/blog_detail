---
title: shell 教程
date: 2022-03-26 14:21:04
tags:
- 教程
---

ans_yn.sh: 2: [: missing ]
代码中的 ] 方括号内部必须要有个空格， [ "${yn}" == "Y" -o "${yn}" == "y"] 改成  [ "${yn}" == "Y" -o "${yn}" == "y" ] 即可
ans_yn.sh: 2: [: y: unexpected operator


后来发现，因为ubuntu默认的sh是连接到dash的,又因为dash跟bash的不兼容所以出错了.执行时可以把sh换成bash文件名.sh来执行.成功.dash是什么东西,查了一下,应该也是一种shell,貌似用户对它的诟病颇多。
修改sh默认连接到bash的一种方法：


sudo dpkg-reconfigure dash
选择no即可.



[ -d DIR ] 如果 FILE 存在且是一个目录则为真。
[ -z STRING ] 如果STRING的长度为零则为真 ，即判断是否为空，空即是真；


shell指令 
sh ./test.sh -i
-c 从字符串中读取命令 
-i 实现脚本交互 
-n 进行语法检查 
-v 显示执行过程详细信息 
-x 实现逐条语句的跟踪 
--help 显示帮助信息 
--version 显示版本信息


-eq       等于,如:if [ "$a" -eq "$b" ] 
-ne       不等于,如:if [ "$a" -ne "$b" ] 
-gt       大于,如:if [ "$a" -gt "$b" ] 
-ge       大于等于,如:if [ "$a" -ge "$b" ] 
-lt       小于,如:if [ "$a" -lt "$b" ] 
-le       小于等于,如:if [ "$a" -le "$b" ] 


# 参考资料
[解决 linux下编译.sh文件报错 “: XXXX: unexpected operator” 问题](https://blog.csdn.net/liuqiyao_01/article/details/41551075)
[h命令 – shell命令语言解释器](https://www.linuxcool.com/sh)


