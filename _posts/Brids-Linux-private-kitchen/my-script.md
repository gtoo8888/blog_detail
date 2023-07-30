---
title: 自己用到的脚本
date: 2022-07-25 21:03:06
tags:
- 鸟哥的Linux私房菜
---


# 常用脚本
```bash
echo "统计文件中代码行数"
c1=$(find -name "*.cpp"  | wc -l)
h1=$(find -name "*.h"  | wc -l)
echo "文件个数：$(expr ${c1} + ${h1}),*.cpp:${c1},*.h:${h1}"
c2=$(find -name "*.cpp"  | xargs cat | wc -l)
h2=$(find -name "*.cpp"  | xargs cat | wc -l)
echo "总行数：$(expr ${c2} + ${c2}),*.cpp:${c2},*.h:${h2}"
c3=$(find -name "*.cpp"  | xargs cat | grep -v ^$| wc -l)
h3=$(find -name "*.cpp"  | xargs cat | grep -v ^$| wc -l)
echo "去掉空格行数：$(expr ${c3} + ${c3}),*.cpp:${c3},*.h:${h3}"
```

```bash
cat > "" << 'EOF'
加载文件
```


# set
```bash
set -e # 如果有一个命令失败立即退出脚本
set -u # 不能使用未定义的变量
set -x # 每一行执行后显示
set -o pipefail # 管道中的每个错误都会显示
```




# 参考文献
[cat << EOF]https://www.jianshu.com/p/df07d8498fa5
[Bash 脚本 set 命令教程](https://www.ruanyifeng.com/blog/2017/11/bash-set.html)

