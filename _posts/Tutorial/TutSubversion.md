---
title: Subversion 教程
date: 2024-09-27 16:30:11
tags:
- 教程
---

# Subversion 教程

## 一、安装

```bash
sudo apt-get install subversion
svn --version
```

## 二、基础命令

```bash
svn checkout [URL]                 # 拉取仓库（简写 co）
svn info [URL]                     # 查看仓库信息
svn info                            # 查看本地仓库信息
svn info --xml
svn log                             # 查看提交日志
svn log -l 5 -v                     # 查看最近 5 条详细日志
svn log -q                          # 只输出版本号、时间、作者

svn checkout [URL] -r [版本号]      # 拉取指定版本

svn diff -r r31:r32 src/tc_fun/tc_fun.c
```

## 三、本地修改

```bash
svn update (up)                     # 将远程仓库同步到本地
svn update -r 30                    # 回退到指定版本
svn revert                           # 撤销所有本地修改
svn revert foo.c                     # 撤销指定文件修改
svn revert --depth=infinity .        # 还原整个目录
```

## 四、查看远程仓库

```bash
svn cat [URL]                       # 查看指定文件内容
svn list (ls) [URL]                  # 列出目录内容
```

## 五、用户凭证管理

```bash
tree ~/.subversion/auth
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

# 如需清除凭证，删除对应目录：
rm -rf ~/.subversion/auth/svn.simple
```
如果有新用户的加入，尝试删除这个文件夹~/.subversion/auth/svn.simple
或者删除整个文件夹~/.subversion/auth

## 六、搭建 SVN 服务器

```bash
svnadmin create /path/to/repo
svnserve -d -r /path/to/repo        # 启动 SVN 服务
```

## 参考资料
### 各种工具
- [Apache Subversion](https://subversion.apache.org/)
- [VisualSVN Server](https://www.visualsvn.com/server/)
- [TortoiseSVN](https://tortoisesvn.subversion.org.cn/)
### 参考教程
- [Subversion Book](https://svnbook.red-bean.com/)
- [Subversion Network Model cached credentials](https://svnbook.red-bean.com/en/1.7/svn.serverconfig.netmodel.html#svn.serverconfig.netmodel.creds)
