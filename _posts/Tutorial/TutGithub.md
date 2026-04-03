---
title: github 教程
date: 2022-10-29 13:40:28
tags:
- 教程
---

# github 教程

## 一、注册账号

访问 [https://github.com/](https://github.com/) 注册。

## 二、下载 Git

下载地址：[https://git-scm.com/downloads](https://git-scm.com/downloads)

## 三、生成 SSH 密钥

```bash
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"
```

生成密钥对：
```bash
ssh-keygen -m PEM -t ed25519 -C "your.email@example.com" # 创建新的 SSH 私钥与公钥秘钥对，输入你的邮箱作为标签
# -m PEM: 指定密钥格式为 PEM
# -t ed25519: 指定密钥类型（Ed25519 算法，更安全、更短）
# -C: 注释，通常填邮箱

# 回车使用默认保存路径，直接回车跳过设置密码（每次 push 就不用再输密码）
Enter file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter] # 推荐使用默认地址
Enter passphrase (empty for no passphrase): # 此处直接回车即可；若设置密码，则每次使用 SSH 方式推送代码时都会要求输入密码
```

公钥文件位置：
- Windows：`C:\Users\<username>\.ssh\id_ed25519.pub`
- Linux：`~/.ssh/id_ed25519.pub`
  - /home/<username>/.ssh/id_ed25519.pub
  - /root/.ssh/id_ed25519.pub

复制公钥内容（Linux 下）：
```bash
cat ~/.ssh/id_ed25519.pub
```

## 四、在 GitHub 添加公钥

1. 右上角点击头像 → **Settings**
2. 左侧 **SSH and GPG keys**
3. 点击 **New SSH keys**，填入公钥内容

## 五、测试 SSH 连接

```bash
ssh -T git@github.com
```

## 六、创建仓库并上传代码

### 方法一：从 GitHub 克隆已有仓库
```bash
git clone [SSH地址]
```

### 方法二：本地新建仓库并关联远程

```bash
git init                                    # 初始化本地仓库
git add .                                   # 添加所有文件
git commit -m "init"                        # 提交
git remote add origin [SSH地址]              # 关联远程仓库
git push -u origin master                   # 推送到远程
```

> 注意：如果仓库主分支叫 `main` 而非 `master`，将 `master` 替换为 `main`。

### 常见报错

**报错：`fatal: remote origin already exists.`**
```bash
git remote -v                 # 查看已配置的远程仓库
git remote rm origin         # 移除旧的 origin
git remote add origin [SSH地址]  # 重新添加
```

**报错：`error: src refspec main does not match any`**
本地仓库为空文件导致，需确保 `git add .` 和 `git commit` 已执行。

## 七、GitHub 常用概念

| 概念 | 说明 |
|---|---|
| **Issue** | 议题，用于提 bug、提需求、提问 |
| **Milestones** | 里程碑，把多个 Issue 归入一个目标 |
| **Labels** | 标签，用于分类 Issue/PR |

常用 Labels 示例：

| 名称 | 用途 | 颜色 |
|---|---|---|
| bug | Something isn't working | #d73a4a |
| feature | 新功能 | #84b6eb |
| documentation | 改进文档 | #0075ca |
| enhancement | 增强功能 | #a2eeef |
| question | 提问 | #d876e3 |
| duplicate | 重复内容 | #cfd3d3 |
| test | 测试相关 | #009966 |
| ci | 持续集成 | #eee600 |

优先级标签：
- `low priority`：#9400d3
- `medium priority`：#ed9121
- `high priority`：#dc143c

## 参考资料

- [如何把自己的代码上传到 github 上](https://blog.csdn.net/qq_43111389/article/details/125644132)
- [CodeQL 从入门到放弃](https://www.freebuf.com/articles/web/283795.html)
- [使用 CodeQL 进行代码扫描](https://docs.github.com/zh/code-security/code-scanning/introduction-to-code-scanning/about-code-scanning-with-codeql)
