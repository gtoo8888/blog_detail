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




https://blog.csdn.net/liuqiyao_01/article/details/41551075