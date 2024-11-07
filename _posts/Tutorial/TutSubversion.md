---
title: Subversion 教程
date: 2024-09-27 16:30:11
tags:
- 教程
---

```bash
sudo apt-get install subversion
svn --version

svn info [URL]  --username ARG --password ARG # 需要修改用户名密码的操作 

svn co [URL]
cd [repositories]

SVN Blamer


svn info [repositories]



svn help(h)


# 切换不同的工作目录
svn switch (sw)


```

# 常用拉取仓库命令
```bash
svn checkout [URL]
svn info # 什么都不添加，就是本地仓库
svn info [URL]
svn info --xml

svn log
svn log -l 5 -v
svn log -v # 查看变更文件
svn log -q # 只输出版本号、时间、作者 而不输出日志

svn log -r 2:87 -v | grep src > svn.log
svn log -l 86 -v > svn.log
svn log -l 101 -v | grep src | awk {'print $2'}> svn.log

svn checkout(co) [URL] -r [版本号]
svn checkout(co) [URL] --revision [版本号]
svn update

svn diff -r r31:r32 src/tc_fun/tc_fun.c
```
# 本地修改命令
```bash
svn update(up) # 将远程仓库同步到本地
svn update -r 30 # 回退到指定版本
svn revert # 撤销所有本地修改
svn revert foo.c # 丢弃对文件的更改
svn revert --depth=infinity . # 还原整个目录的文件
```

# 查看远程仓库命令
```bash
svn cat [URL]
svn list(ls) 
```

# 用户凭证
```bash
tree ~/.subversion/auth # 存储的文件结构
├── auth
│   ├── svn.simple
│   │   └── fff4919b7eae4d98b311d31c84752167
│   ├── svn.ssl.client-passphrase
│   ├── svn.ssl.server
│   │   └── c3f23b7e56f97216d8160086311fb9af
│   └── svn.username
├── config
├── README.txt
└── servers

cat ~/.subversion/auth/svn.simple
```
如果有新用户的加入，尝试删除这个文件夹~/.subversion/auth/svn.simple
或者删除整个文件夹~/.subversion/auth


# 参考资料
## 各种工具
[Apache Subversion](https://subversion.apache.org/)
[VisualSVN Server](https://www.visualsvn.com/server/)
[TortoiseSVN](https://tortoisesvn.subversion.org.cn/)


## 参考教程
[Subversion book](https://svnbook.red-bean.com/)
[Subversion Network Model cached credentials](https://svnbook.red-bean.com/en/1.7/svn.serverconfig.netmodel.html#svn.serverconfig.netmodel.creds)
