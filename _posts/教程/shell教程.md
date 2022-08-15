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



# 查看脚本文件是dos还是unix

查看脚本文件是dos格式还是unix格式，dos格式的文件行尾为^M$ ，unix格式的文件行尾为$
cat -A filename
把dos格式的文件转换为unix格式的文件
dos2unix filename


https://blog.csdn.net/liuqiyao_01/article/details/41551075