---
title: makefile 教程
date: 2022-04-05 20:34:26
tags:
- 教程
---

# 自动化变量

| 自动化变量 | 说明                  | 备注    |
| ----- | ------------------- | ----- |
| $@    | 目标文件的完整名称           |       |
| $^    | 所有目标依赖文件，不重复        | 以空格分割 |
| $?    | 所有时间戳比目标文件晚的的依赖文件   | 以空格分开 |
| $<    | 第一个依赖文件名            |       |
| $*    | 目标文件的名称，不包含目标文件的扩展名 |       |
| $+    | 所有目标依赖文件，重复         | 类似$^  |
| $(@D) | 目标文件的目录部分           |       |
| $(@F) | 目标文件的文件名部分          |       |




| 常用变量     | 说明            | 默认值      |
| -------- | ------------- | -------- |
| CC       | c编译程序         | gcc      |
| CPP      | c预处理程序        | $(CC) -E |
| CXX      | c++编译程序       | g++      |
| CFLAGS   | 传给c编译程序的标志    | 无默认值     |
| CPPFLAGS | 传给c预处理程序的标志   | 无默认值     |
| CXXFLAGS | 传给c++编译器的标志   | 无默认值     |
| LDFLAGS  | 传给链接程序（ld）的标志 | 无默认值     |
| AR       | 归档维护程序        | ar       |
| AS       | 汇编程序          | as       |
| RM       | 文件删除程序        | rm -f    |
| LD       |               | ld       |
| NM       |               | nm       |
| LDR      |               | ldr      |
| STRIP    |               | strip    |
| OBJCOPY  |               | objcopy  |
| OBJDUMP  |               | objdump  |
| ARFLAGS  | 传给归档维护程序的标志   | rv    |
| ASFLAGS  | 传给汇编程序的标志     | 无默认值  |


模式规则中，至少在规则的目标定义中要包含"%"，否则，就是一般的规则。目标中的"%"定义表示对文件名的匹配，"%"表示长度任意的非空字符串。例如："%.c"表示以".c"结尾的文件名（文件名的长度至少为3），而"s.%.c"则表示以"s."开头，".c"结尾的文件名（文件名的长度至少为5）。

如果"%"定义在目标中，那么，目标中的"%"的值决定了依赖目标中的"%"的值，也就是说，目标中的模式的"%"决定了依赖目标中"%"的样子。例如有一个模式规则如下：
    %.o : %.c 





g++ -Wall -std=c++11 -pthread -O2 -g -iquote include/ -I../ -I/usr/local/include  -L lib/ -L/usr/local/lib -ltpc  bin/echo_client.cc lib/libtpc.a   -o bin/echo_client


# 输出信息
$(info "info here")
$(info "$(CFLAGS)")
# 输出变量
$(warning "CFLAGS = $(CFLAGS)")，


# 生成静态库文件
g++ test -c 
g++ test -o
ar -rcs libtest.a


# 条件变量
```makefile
ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif
```


# 常见编译选项
```makefile
BIN_SRCS := $(wildcard bin/*.cc)  # 选择所有文件
BIN_SRCS := $(filter-out bin/test.cc, $(BIN_SRCS)) # 单独去掉bin/test.cc
```

# 常见函数

## wildcard 获取匹配模式的文件名
BIN_SRCS := $(wildcard bin/*.cc)
获取匹配模式的文件名 wildcard
src = $(wildcard *.c)
wildcard把 指定目录 ./ 和 ./sub/ 下的所有后缀是c的文件全部展开。


## patsubst 模式替换函数

## foreach 循环函数

## filter 

## firstword

## call
origin函数

export
 $(call if_changed,copy)


# tmp
MAKEFLAGS += -rR --no-print-directory

”-rR“表示禁用内置的隐含规则和变量定义

获取当前区域设置的数字格式习惯

```makefile
FORCE

u-boot: $(u-boot-init) $(u-boot-main) u-boot.lds FORCE

quiet_cmd_u-boot__ ?= LD      $@ 


quiet_cmd_mkimage = MKIMAGE $@
cmd_mkimage = $(objtree)/tools/mkimage $(MKIMAGEFLAGS_$(@F)) -d $< $@ \
	$(if $(KBUILD_VERBOSE:1=), >/dev/null)

u-boot.imx: u-boot.bin $(IMX_CONFIG) FORCE
	$(call if_changed,mkimage)


%.imx: %.bin
        $(Q)$(MAKE) $(build)=arch/arm/imx-common $@


$(warnings "$$$$$$$$$$$ += checkarmreloc before")


```


# 常用uboot短指令
    268 CC
     88 LD
     37 HOSTCC
     14 WRAP
      8 CLEAN
      8 AS
      4 OBJCOPY
      4 GEN
      3 UPD
      3 HOSTLD
      3 CHK
      2 cp
      1 LDS
      1 if
      1 fi
      1 else
      1 Configuring
      1 build_uboot
      1 AR





# 参考资料
https://blog.csdn.net/yi412/article/details/69941791
https://blog.csdn.net/marc07/article/details/62885868

[Makefile 官方参考](https://www.gnu.org/software/make/manual/html_node/)
[7.1 Example of a Conditional](https://www.gnu.org/software/make/manual/html_node/Conditional-Example.html)
[8.11 The origin Function](https://www.gnu.org/software/make/manual/html_node/Origin-Function.html)
[Learn Makefiles With the tastiest examples](https://makefiletutorial.com/)










































