---
title: github 教程
date: 2022-10-29 13:40:28
tags:
---

如何将自己的代码传到github上
# 步骤一：注册账号
https://github.com/


# 步骤二：下载Git
https://git-scm.com/downloads


# 步骤三：生成ssh秘钥
git config --global user.name "XXX"
git config --global user.email "XXX"
## 1.生成公钥：
git命令：ssh-keygen  -m [密钥格式]  -t [密钥类型]  -C[密钥注解] 
```
ssh-keygen -m PEM -t ed25519 -C "your.email@example.com" // 创建新的 SSH 私钥与公钥秘钥对，输入你的邮箱作为标签
Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter] // 推荐使用默认地址
Enter passphrase (empty for no passphrase): // 此处直接回车即可；若设置密码，则每次使用 SSH 方式推送代码时都会要求输入密码
```
## 2.添加公钥
windows地址为（C:\Users\you\.ssh\id_ed25519.pub）
linux地址为（/home/user/.ssh/id_ed25519.pub）
linux地址为（/root/.ssh/id_ed25519.pub）
打开上文中生成的秘钥对的地址（默认地址通常为 ~/.ssh/）找到后缀为 pub 的公钥文件，使用 cat 命令输出所有内容并复制。

## 3.尝试使用ssh连接github
ssh -T git@github.com


## 4.在github中添加秘钥
1.右上角点击自己的头像
2.setting
3.SSH and GPG keys
4.New SSH keys  



# 步骤四：github上创建仓库



# 步骤五：将仓库下载到本地
git clone [ssh地址]



# 步骤六：上传代码
git add acm.cpp
git add .


git commit -m "init"


git push



# 参考资料

[如何把自己的代码上传到github上]https://blog.csdn.net/qq_43111389/article/details/125644132




























































