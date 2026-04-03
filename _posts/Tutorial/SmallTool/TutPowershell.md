---
title: PowerShell使用
date: 2022-08-23 15:49:26
tags:
- 教程
---

# powershell

oh-my-posh

常见的powershell配置

C:\Users\wellsun\.condarc

添加auto_activate_base: false
C:\Users\<User>\Documents\WindowsPowerShell



```bash
$PSVersionTable

function prompt {
    $currentPath = (Get-Location).Path
    $time = Get-Date -Format "HH:mm:ss"
    return "[$time] $currentPath> "
}
```

# 参考资料
[配置和美化你的powershell终端](https://zhuanlan.zhihu.com/p/444165353)
