---
title: VSCode 教程
date: 2022-04-05 20:33:12
tags:
- 教程
---

# VSCode 教程

## 一、文件颜色标识（Git 版本控制）

| 颜色 | 含义 |
|---|---|
| 红色 | 未加入版本控制（刚 clone 到本地） |
| 绿色 | 已加入版本控制，暂未提交（新增文件） |
| 蓝色 | 已提交，有改动（修改文件） |
| 白色 | 已提交，无改动 |
| 灰色 | 版本控制已忽略 |

Git 文件状态：
- `M`：文件被修改
- `U`：文件未合并（需完成合并才能提交）
- `D`：文件被删除
- `A`：新增文件
- `C`：文件的新拷贝
- `R`：文件名被修改
- `T`：文件类型被修改

## 二、远程调试 Linux

### 1. 服务器端配置
```bash
# 1. 准备工作
apt-get update
apt-get install sudo vim
passwd                               # 修改密码

# 2. 安装openssh
apt-get install openssh-server openssh-client

# 3. 修改 SSH 配置
sudo vi /etc/ssh/sshd_config
# 找到 PermitRootLogin，改为：
PermitRootLogin yes
#（默认为#PermitRootLogin prohibit-password）前面的#号要放开
# 4. 启动服务
/etc/init.d/ssh restart
5. 连接测试
ssh user@[ip] -p [端口]
ssh user@192.168.0.3 -p 22
```
6. VSCode 配置
```
Host 192.168.0.3
  HostName 192.168.0.3
  User username
```

## 三、远程调试 Linux 容器

1. 需要把容器的端口映射出来

容器内的ssh修改需要把root登录打开
sudo vi /etc/ssh/sshd_config
PermitRootLogin yes 
重启，连接测试，可以连接

```
Host 15.1.0.89      # 显示的名字
  HostName 15.1.0.89
  User root
  Port 38529        # 使用的端口号
  IdentityFile ~\.ssh\id_rsa
```

## 四、快捷键

| 快捷键 | 功能 |
|---|---|
| `Ctrl + K + 0` | 折叠全部代码 |
| `Ctrl + K + J` | 展开全部代码 |
| `Ctrl + Shift + [` | 折叠当前代码块 |
| `Ctrl + Shift + ]` | 展开当前代码块 |
| `Alt + left` | 后退导航 |
| `Alt + right` | 前进导航 |
| `Ctrl + G` | 跳转到指定行 |
| `Ctrl + B` | 关闭左侧栏 |
| `Ctrl + J` | 关闭底部栏 |
| `Ctrl + K + T` | 切换主题颜色 |

## 五、常用设置

### 启用 Code Runner 输入
设置 → Code-runner: Run In Terminal 开启，支持交互式输入。

### 开启 Live Server（前端热更新）
安装 Live Server 插件，保存后自动刷新页面，`Alt + K + O` 打开新窗口。

### 开启 Sticky Scroll（函数名附着）
`Sticky Scroll` 功能：代码滚动时顶部固定显示当前函数名，方便定位。

### C++ 不报错
设置 `C_Cpp.errorSquiggles` 为 `disabled` 可关闭报错提示（不推荐）。

# 代码滚动时候进行附着
sticky scroll
打开以后会把函数名进行附着


## 六、常用插件

| 插件 | 用途 |
|---|---|
| Remote - SSH | 远程连接服务器 |
| Live Server | 前端热更新 |
| C/C++ | C/C++ 语言支持 |
| Python | Python 语言支持 |
| GitLens | Git 增强 |

## 参考资料

- [VS Code 快捷键使用小技巧](https://zhuanlan.zhihu.com/p/22880087)
- [VSCode 文件图标含义](https://blog.csdn.net/qq_42838904/article/details/108222619)
- [Sticky Scroll 功能](https://dev.to/this-is-learning/sticky-scroll-in-vscode-44h2)
