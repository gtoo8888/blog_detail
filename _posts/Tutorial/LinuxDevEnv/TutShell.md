---
title: shell 教程
date: 2022-03-26 14:21:04
tags:
- 教程
---

# Shell 教程

## 一、变量

```bash
# 定义变量（等号两边不能有空格）
name="Alice"
age=25

# 使用变量（加 $）
echo $name
echo "${name} is ${age} years old"

# 单引号 vs 双引号
# 单引号：原样输出，不解析变量
# 双引号：解析变量和转义字符
echo '$name'   # 输出：$name
echo "$name"   # 输出：Alice

# 只读变量
readonly PI=3.14159

# 删除变量
unset name
```

## 二、条件判断

```bash
# 字符串判断
[ -z "$str" ]      # 字符串长度为 0（空）
[ -n "$str" ]      # 字符串长度非 0（非空）
[ "$a" = "$b" ]    # 相等
[ "$a" != "$b" ]   # 不等

# 文件判断
[ -d /path/to/dir ]   # 目录存在
[ -f /path/to/file ]   # 普通文件存在
[ -r /path/to/file ]   # 可读
[ -w /path/to/file ]   # 可写
[ -x /path/to/file ]   # 可执行

# 数值判断
[ $a -eq $b ]   # 等于
[ $a -ne $b ]   # 不等于
[ $a -gt $b ]   # 大于
[ $a -lt $b ]   # 小于
[ $a -ge $b ]   # 大于等于
[ $a -le $b ]   # 小于等于

# 组合
[ "$a" = "yes" -o "$b" = "yes" ]   # 或
[ "$a" = "yes" -a "$b" = "yes" ]   # 与
[ ! -f "$file" ]                    # 非
```

> 注意：`[` 内部变量要加引号，否则空变量会报错；方括号内部两侧**必须留有空格**。

## 三、循环

```bash
# for 循环
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

for file in *.txt; do
    echo "Processing $file"
done

# while 循环
counter=0
while [ $counter -lt 5 ]; do
    echo $counter
    counter=$((counter + 1))
done

# 读取文件每一行
while read line; do
    echo "$line"
done < input.txt
```

## 四、函数

```bash
# 定义函数
hello() {
    echo "Hello, $1!"   # $1 是第一个参数
}

# 调用函数
hello "Alice"

# 带返回值
get_sum() {
    result=$(( $1 + $2 ))
    echo $result
}

sum=$(get_sum 3 5)
```

## 五、管道与重定向

```bash
# 管道：前一个命令的输出作为后一个命令的输入
cat /etc/passwd | grep root
ls -la | head -20

# 输出重定向
command > output.txt      # 覆盖
command >> output.txt     # 追加
command 2> error.txt      # 错误重定向
command &> all.txt        # 标准输出和错误都重定向

# 输入重定向
command < input.txt
```

## 六、常用命令

| 命令 | 说明 |
|---|---|
| `grep` | 文本搜索 |
| `sed` | 流编辑器（文本替换） |
| `awk` | 文本分析 |
| `find` | 文件查找 |
| `xargs` | 将管道输入转为命令参数 |
| `cut` | 切分字段 |
| `sort` / `uniq` | 排序去重 |

## 七、脚本选项

```bash
# -i 交互模式
sh script.sh -i

# -n 语法检查
sh -n script.sh

# -x 逐语句跟踪
sh -x script.sh
```

## 八、常见问题

### 方括号报错 "missing ]" 或 "unexpected operator"
```bash
# 错误写法
[ $a == "yes"-o $b == "yes" ]     # 缺少空格

# 正确写法（方括号内部两侧必须有空格）
[ "$a" == "yes" -o "$b" == "yes" ]
```

### sh 和 bash 不兼容
Ubuntu 默认的 `sh` 指向 `dash`，部分语法与 `bash` 不兼容。建议：
```bash
# 用 bash 执行
bash script.sh

# 或将 sh 改为指向 bash
sudo dpkg-reconfigure dash   # 选择 "No"
```

## 参考资料

- [解决 sh 脚本 "unexpected operator" 问题](https://blog.csdn.net/liuqiyao_01/article/details/41551075)
- [sh 命令文档](https://www.linuxcool.com/sh)
