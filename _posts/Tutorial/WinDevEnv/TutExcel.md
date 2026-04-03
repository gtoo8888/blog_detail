---
title: Excel教程
date: 2025-08-20 09:44:14
tags:
- 教程
---

## 快捷键

| 快捷键             | 功能描述                                        |
| ------------------ | ----------------------------------------------- |
| `Ctrl + ↓`         | 跳转到最后一行                                  |
| `Ctrl + ↑`         | 跳转到第一行                                    |
| `Ctrl + [`         | 追踪引用单元格                                  |
| `Ctrl + ]`         | 追踪从属单元格                                  |
| `Ctrl + D`         | 自动填充                                        |
| `Ctrl + G`         | 定位窗口                                        |
| `Ctrl + ;`         | 显示当前日期                                    |
| `Ctrl + Shift + :` | 显示当前时间                                    |
| `Ctrl + 0`         | 隐藏列                                          |
| `Ctrl + Shift + 0` | 取消隐藏列(无效)                                |
| `Ctrl + 9`         | 隐藏行                                          |
| `Ctrl + Shift + 9` | 取消隐藏行                                      |
| `Shift + 空格键`   | 选择整行                                        |
| `Ctrl + -`         | 删除选定的行/列                                 |
| `F2`               | 编辑                                            |
| `F4`               | 触发绝对和相对引用切换                          |
| `F9`               | 更新公式                                        |
| `Alt + =`          | 插入自动求和函数                                |
| `Ctrl + `` `       | 触发公式的显示和隐藏                            |
| `Ctrl+Alt+V`       | 选择性粘贴                                      |



## 数字格式化

| 快捷键              | 功能描述         |
| ------------------- | ---------------- |
| `Ctrl + Shift + $`  | 应用货币格式     |
| `Ctrl + Shift + %`  | 应用百分比格式   |
| `Ctrl + Shift + ^`  | 应用科学记数格式 |
| `Ctrl + Shift + #`  | 应用日期格式     |
| `Ctrl + Shift + @`  | 应用时间格式     |
| `Ctrl + Shift + !`  | 数字格式（无效） |


# 公式

## 常用计算
| 函数      | 语法                                       | 功能描述                     | 示例                     |
| --------- | ------------------------------------------ | ---------------------------- | ------------------------ |
| MAX       | =MAX(number1,[number2],...)                | 返回一组数值中的最大值       | =MAX(A1:A10)             |
| MIN       | =MIN(number1,[number2],...)                | 返回一组数值中的最小值       | =MIN(A1:A10)             |
| SUM       | =SUM(number1,[number2],...)                | 求和                         | =SUM(A1:A10)             |
| SUMIF     | =SUMIF(range,criteria,[sum_range])         | 对满足条件的单元格求和       | =SUMIF(A1:A10,">20")     |
| AVERAGE   | =AVERAGE(number1,[number2],...)            | 计算算术平均值               | =AVERAGE(A1:A10)         |
| AVERAGEIF | =AVERAGEIF(range,criteria,[average_range]) | 计算满足条件的单元格的平均值 | =AVERAGEIF(A1:A10,">20") |
| ROW       | =ROW([reference])                          | 返回引用的行号               | =ROW(A10) 返回 10        |
| COLUMN    | =COLUMN([reference])                       | 返回引用的列号               | =COLUMN(C1) 返回 3       |
| COUNT     | =COUNT(value1,[value2],...)                | 计算参数列表中数字的个数     | =COUNT(A1:A10)           |
| COUNTIF   | =COUNTIF(range,criteria)                   | 计算满足条件的单元格个数     | =COUNTIF(A1:A10,">20")   |


## 统计
| 函数         | 语法                            | 功能描述                                    | 示例                          |
| ------------ | ------------------------------- | ------------------------------------------- | ----------------------------- |
| STDEV        | =STDEV(number1,[number2],...)   | 估算基于样本的标准偏差                      | =STDEV(A1:A10)                |
| STDEV.S      | =STDEV.S(number1,[number2],...) | 估算基于样本的标准偏差                      | =STDEV.S(A1:A10)              |
| STDEV.P      | =STDEV.P(number1,[number2],...) | 估算基于总体的标准偏差                      | =STDEV.P(A1:A10)              |
| VAR          | =VAR(number1,[number2],...)     | 估算基于样本的方差 (旧函数，建议使用 VAR.S) | =VAR(A1:A10)                  |
| VAR.S        | =VAR.S(number1,[number2],...)   | 估算基于样本的方差                          | =VAR.S(A1:A10)                |
| VAR.P        | =VAR.P(number1,[number2],...)   | 计算基于总体的方差                          | =VAR.P(A1:A10)                |
| COVAR        | =COVAR(array1,array2)           | 估算基于样本的协方差 (旧函数)               | =COVAR(A1:A10, B1:B10)        |
| COVARIANCE.S | =COVARIANCE.S(array1,array2)    | 估算基于样本的协方差                        | =COVARIANCE.S(A1:A10, B1:B10) |
| COVARIANCE.P | =COVARIANCE.P(array1,array2)    | 计算基于总体的协方差                        | =COVARIANCE.P(A1:A10, B1:B10) |
| CORREL       | =CORREL(array1,array2)          | 返回两组数据的相关系数                      | =CORREL(A1:A10,B1:B10)        |


## 数学
| 函数        | 语法                          | 功能描述                     | 示例                          |
| ----------- | ----------------------------- | ---------------------------- | ----------------------------- |
| INT         | =INT(number)                  | 将数字向下舍入到最接近的整数 | =INT(8.9) 返回 8              |
| ROUND       | =ROUND(number,num_digits)     | 按指定位数对数字进行四舍五入 | =ROUND(2.15,1) 返回 2.2       |
| ROUNDUP     | =ROUNDUP(number,num_digits)   | 向上舍入数字                 | =ROUNDUP(3.141,2) 返回 3.15   |
| ROUNDDOWN   | =ROUNDDOWN(number,num_digits) | 向下舍入数字                 | =ROUNDDOWN(3.141,2) 返回 3.14 |
| MOD         | =MOD(number,divisor)          | 返回两数相除的余数           | =MOD(10,3) 返回 1             |
| RANDBETWEEN | =RANDBETWEEN(bottom,top)      | 返回指定范围内的随机整数     | =RANDBETWEEN(1,100)           |
| SQRT        | =SQRT(number)                 | 返回正平方根                 | =SQRT(16) 返回 4              |
| PI          | =PI()                         | 返回圆周率π的近似值          | =PI() 返回 3.141592654        |


## 文本
| 函数     | 语法                                            | 功能描述                                   | 示例                                         |
| -------- | ----------------------------------------------- | ------------------------------------------ | -------------------------------------------- |
| CLEAN    | =CLEAN(text)                                    | 删除文本中所有非打印字符                   | =CLEAN(A1)                                   |
| TRIM     | =TRIM(text)                                     | 删除文本中多余的空格（保留单词间单个空格） | =TRIM("  Hello  World  ") 返回 "Hello World" |
| LEN      | =LEN(text)                                      | 计算文本字符串中的字符个数                 | =LEN("Excel") 返回 5                         |
| LEFT     | =LEFT(text,[num_chars])                         | 从文本左侧开始提取指定数量的字符           | =LEFT("Excel",2) 返回 "Ex"                   |
| RIGHT    | =RIGHT(text,[num_chars])                        | 从文本右侧开始提取指定数量的字符           | =RIGHT("Excel",3) 返回 "cel"                 |
| MID      | =MID(text,start_num,num_chars)                  | 从文本指定位置开始提取指定数量的字符       | =MID("Excel",2,3) 返回 "xce"                 |
| VALUE    | =VALUE(text)                                    | 将文本格式的数字转换为数值                 | =VALUE("123") 返回 123                       |
| TEXT     | =TEXT(value,format_text)                        | 将数值转换为指定格式的文本                 | =TEXT(123.45,"0.0") 返回 "123.5"             |
| FIND     | =FIND(find_text,within_text,[start_num])        | 查找文本位置（区分大小写，不支持通配符）   | =FIND("e","Excel") 返回 4                    |
| SEARCH   | =SEARCH(find_text,within_text,[start_num])      | 查找文本位置（不区分大小写，支持通配符）   | =SEARCH("e","Excel") 返回 1                  |
| REPLACE  | =REPLACE(old_text,start_num,num_chars,new_text) | 替换文本中的特定字符                       | =REPLACE("Excel",1,1,"E") 返回 "Excel"       |
| REPT     | =REPT(text,number_times)                        | 重复显示文本指定次数                       | =REPT("*",5) 返回 "*****"                    |
| PHONETIC | =PHONETIC(reference)                            | 连接区域中的文本字符串                     | =PHONETIC(A1:A3)                             |

## 工程
| 函数    | 语法                      | 功能描述         | 示例                     |
| ------- | ------------------------- | ---------------- | ------------------------ |
| DEC2BIN | =DEC2BIN(number,[places]) | 十进制转二进制   | =DEC2BIN(10) 返回 "1010" |
| DEC2OCT | =DEC2OCT(number,[places]) | 十进制转八进制   | =DEC2OCT(10) 返回 "12"   |
| DEC2HEX | =DEC2HEX(number,[places]) | 十进制转十六进制 | =DEC2HEX(10) 返回 "A"    |
| BIN2DEC | =BIN2DEC(number)          | 二进制转十进制   | =BIN2DEC(1010) 返回 10   |
| BIN2OCT | =BIN2OCT(number,[places]) | 二进制转八进制   | =BIN2OCT(1010) 返回 "12" |
| BIN2HEX | =BIN2HEX(number,[places]) | 二进制转十六进制 | =BIN2HEX(1010) 返回 "A"  |

## 其他
| 函数 | 语法                                           | 功能描述               | 示例                     |
| ---- | ---------------------------------------------- | ---------------------- | ------------------------ |
| IF   | =IF(logical_test,value_if_true,value_if_false) | 条件判断函数           | =IF(A2=B2,"相同","不同") |
| RANK | =RANK(number,ref,[order])                      | 返回数字在列表中的排位 | =RANK(E2,$E$2:$E$12)     |


## 查找
| 函数    | 语法                                                                | 功能描述                     | 示例                                                  |
| ------- | ------------------------------------------------------------------- | ---------------------------- | ----------------------------------------------------- |
| INDEX   | =INDEX(array,row_num,[column_num])                                  | 返回表或区域中的值或值的引用 | =INDEX(A1:C10,2,3) 返回B2单元格的值                   |
| VLOOKUP | =VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup]) | 垂直查找函数                 | =VLOOKUP(G2,A:E,3,0) 在A:E区域查找G2，返回第3列匹配值 |
| MATCH   | =MATCH(lookup_value,<br>lookup_array,[match_type])                  | 返回指定数值在数组中的位置   | =MATCH("Excel",A1:A10,0) 返回"Excel"在区域中的位置    |


## 时间
| 函数        | 语法                                         | 功能描述                     | 示例                             |
| ----------- | -------------------------------------------- | ---------------------------- | -------------------------------- |
| DATEDIF     | =DATEDIF(start_date,end_date,unit)           | 计算两个日期之间的差值       | =DATEDIF(A2,B2,"d") 返回天数差   |
| NOW         | =NOW()                                       | 返回当前的系统日期和时间     | =NOW() 返回当前日期时间          |
| TODAY       | =TODAY()                                     | 返回当前的系统日期           | =TODAY() 返回当前日期            |
| DATE        | =DATE(year,month,day)                        | 返回特定日期的序列号         | =DATE(2023,12,25) 返回2023-12-25 |
| TIME        | =TIME(hour,minute,second)                    | 返回特定时间的序列号         | =TIME(14,30,0) 返回14:30:00      |
| YEAR        | =YEAR(serial_number)                         | 返回时间值的"年"部分         | =YEAR("2023-12-25") 返回2023     |
| MONTH       | =MONTH(serial_number)                        | 返回时间值的"月"部分         | =MONTH("2023-12-25") 返回12      |
| DAY         | =DAY(serial_number)                          | 返回时间值的"天"部分         | =DAY("2023-12-25") 返回25        |
| HOUR        | =HOUR(serial_number)                         | 返回时间值的"小时"部分       | =HOUR("14:30:00") 返回14         |
| MINUTE      | =MINUTE(serial_number)                       | 返回时间值的"分"部分         | =MINUTE("14:30:00") 返回30       |
| SECOND      | =SECOND(serial_number)                       | 返回时间值的"秒"部分         | =SECOND("14:30:45") 返回45       |
| NETWORKDAYS | =NETWORKDAYS(start_date,end_date,[holidays]) | 计算两个日期之间的工作日天数 | =NETWORKDAYS(A2,B2)              |

## 财务
| 函数 | 语法                                       | 功能描述                                     | 示例                                                       |
| ---- | ------------------------------------------ | -------------------------------------------- | ---------------------------------------------------------- |
| PV   | =PV(rate,nper,pmt,[fv],[type])             | 计算投资的现值                               | =PV(5%/12,10*12,-500,10000) 计算年金现值                   |
| FV   | =FV(rate,nper,pmt,[pv],[type])             | 计算投资的未来值                             | =FV(5%/12,10*12,-200,0) 计算定期存款终值                   |
| NPV  | =NPV(rate,value1,[value2],...)             | 计算净现值                                   | =NPV(10%,B2:B6)+B1 计算项目净现值                          |
| XNPV | =XNPV(rate, values, dates)                 | 计算现金流间隔不相同时的净现值               | =XNPV(10%, B1:B6, A1:A6) 基于非定期现金流计算净现值        |
| IRR  | =IRR(values, [guess])                      | 计算一系列现金流的内部收益率                 | =IRR(B1:B6) 计算投资的内部回报率                           |
| XIRR | =XIRR(values, dates, [guess])              | 计算现金流间隔不相同时的内部收益率           | =XIRR(B1:B6, A1:A6) 基于非定期现金流计算内部收益率         |
| MIRR | =MIRR(values, finance_rate, reinvest_rate) | 计算修改后的内部收益率，考虑融资和再投资利率 | =MIRR(B1:B6, 10%, 12%) 计算投资的修正内部收益率            |
| PMT  | =PMT(rate, nper, pv, [fv], [type])         | 计算等额分期偿还贷款的每期付款额             | =PMT(5%/12, 5*12, -20000) 计算贷款的月供金额               |
| IPMT | =IPMT(rate, per, nper, pv, [fv], [type])   | 计算在给定期间内支付的利息部分               | =IPMT(5%/12, 1, 5*12, -20000) 计算贷款第一个月的利息       |
| PPMT | =PPMT(rate, per, nper, pv, [fv], [type])   | 计算在给定期间内偿还的本金部分               | =PPMT(5%/12, 1, 5*12, -20000) 计算贷款第一个月的本金还款额 |
| RATE | =RATE(nper,pmt,pv,[fv],[type],[guess])     | 计算每期利率                                 | =RATE(60,-386.66,20000) 计算实际利率                       |
| NPER | =NPER(rate,pmt,pv,[fv],[type])             | 计算付款期数                                 | =NPER(5%/12,-386.66,20000) 计算还款期数                    |
| SLN  | =SLN(cost,salvage,life)                    | 直线法计算折旧                               | =SLN(10000,1000,10) 年折旧900                              |
| DB   | =DB(cost,salvage,life,period,[month])      | 余额递减法计算折旧                           | =DB(10000,1000,10,1) 第1年折旧                             |
| DDB  | =DDB(cost,salvage,life,period,[factor])    | 双倍余额递减法计算折旧                       | =DDB(10000,1000,10,1) 第1年折旧                            |


## Excel 2021 新函数
| 函数     | 语法                                                                                       | 功能描述                    | 示例                                  |
| -------- | ------------------------------------------------------------------------------------------ | --------------------------- | ------------------------------------- |
| XLOOKUP  | =XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode]) | 增强型查找函数，替代VLOOKUP | =XLOOKUP(G2,A:A,C:C,"未找到")         |
| UNIQUE   | =UNIQUE(array,[by_col],[exactly_once])                                                     | 提取区域中的唯一值          | =UNIQUE(A2:A100) 返回唯一值列表       |
| SEQUENCE | =SEQUENCE(rows,[columns],[start],[step])                                                   | 生成数字序列                | =SEQUENCE(10,5,100,2) 生成10行5列序列 |


# 参考资料
[230个最全Excel快捷键，看这一篇就够了！](https://zhuanlan.zhihu.com/p/408584770)