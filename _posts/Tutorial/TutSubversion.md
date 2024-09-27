---
title: Subversion 教程
date: 2024-09-27 16:30:11
tags:
- 教程
---
sudo apt-get install subversion
svn --version
svn co [URL]
cd [repositories]

SVN Blamer


svn info [repositories]



svn help(h)


# 常用拉取仓库命令
svn checkout [URL]
svn info # 什么都不添加，就是本地仓库
svn info [URL]
svn info --xml

svn log
svn log -l 5 -v
svn log -v 查看变更文件

svn log -r 2:87 -v | grep src > svn.log
svn log -l 86 -v > svn.log
svn log -l 101 -v | grep src | awk {'print $2'}> svn.log

svn checkout(co) [URL] -r [版本号]
svn checkout(co) [URL] --revision [版本号]
svn update

svn diff -r r31:r32 src/tc_fun/tc_fun.c

# 本地修改命令
svn update # 查看当前本地修改
svn revert # 撤销所有本地修改
svn revert foo.c # 丢弃对文件的更改
svn revert --depth=infinity . # 还原整个目录的文件


# 查看远程仓库命令

svn cat [URL]
svn list(ls) 
