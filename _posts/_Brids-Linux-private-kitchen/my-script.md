---
title: 自己用到的脚本
date: 2022-07-25 21:03:06
tags:
- 鸟哥的Linux私房菜
---

```
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

```
cat > "" << 'EOF'
加载文件
```


# 参考文献
[cat << EOF]https://www.jianshu.com/p/df07d8498fa5
