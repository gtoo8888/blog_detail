---
title: Part19 内核/驱动开发常用指令
date: 2025-07-07 13:15:33
tags:
- 鸟哥的Linux私房菜
---


# 1. 内核模块操作
### 常用指令
```bash
insmod      # 加载指定的内核模块到运行中的内核
modprobe    # 智能加载模块，会自动处理依赖关系
rmmod       # 从运行中的内核移除指定的模块
lsmod       # 列出当前已加载的所有内核模块,读取/proc/modules
modinfo     # 显示内核模块的信息，如作者、描述、参数等
depmod      # 生成模块依赖关系文件
mknod
```
### 不常用指令
```bash
modprobe -r # 移除模块及其依赖模块
modprobe --show-depends # 显示模块的依赖关系
modprobe -V # 查看版本号
insmod -f   # 强制加载模块(危险操作)
rmmod -f    # 强制移除模块(可能导致系统不稳定)
```
### 常用指令组合
```bash
modprobe -r <module> && modprobe <module>  # 重新加载模块
lsmod | grep <keyword>      # 查找特定模块是否已加载
modinfo <module> | grep description  # 查看模块描述信息
```


# 2. 设备与驱动信息
### 常用指令
```bash
lsdev       # 列出系统识别的设备信息
lspci       # 列出所有PCI设备详细信息
lsusb       # 列出所有USB设备信息
udevadm     # 管理udev设备管理器，查询设备信息
sysctl      # 查看和修改内核运行时参数
dmesg       # 查看内核环形缓冲区消息(设备驱动加载信息)
```
### 不常用指令
```bash
lspci -vvv  # 显示PCI设备的超详细信息
lsusb -t    # 以树状结构显示USB设备
udevadm monitor # 监控设备事件
sysctl -a   # 显示所有可用的内核参数
hwinfo      # 显示详细的硬件信息(需要额外安装)
```
### 常用指令组合
```bash
lspci -k | grep -A 3 <device>  # 查看设备及其使用的驱动
dmesg | grep -i <driver>       # 查看特定驱动的加载日志
udevadm info --query=all --name=/dev/<device>  # 获取设备详细信息
sysctl -w <parameter>=<value>  # 临时修改内核参数
```


# 3. 调试与日志
### 常用指令
```bash
dmesg      # 查看内核环形缓冲区日志
journalctl # 查询systemd日志(含内核消息)
strace     # 跟踪系统调用
ltrace     # 跟踪库函数调用
gdb        # 调试内核或模块
```
### 不常用指令
```bash
dmesg --human       # 人性化时间格式显示日志
journalctl --vacuum-size # 清理日志文件大小
strace -c           # 统计系统调用
ltrace -S           # 同时跟踪系统调用和库调用
gdb -ex             # 执行gdb初始化命令
```
### 常用指令组合
```bash
dmesg -T | grep -i error      # 带时间戳查找错误信息
journalctl -k --since "1h ago" # 查看过去1小时内核日志
strace -p <PID> -o output.txt # 跟踪进程并输出到文件
gdb vmlinux /proc/kcore       # 调试运行中的内核
```


# 4. 硬件与性能分析
### 常用指令
```bash
lshw      # 详细硬件信息
dmidecode # 读取DMI/SMBIOS信息
i2cdetect # 扫描I2C总线设备
perf      # 性能分析工具
```
### 不常用指令
```bash
lshw -html        # 生成HTML格式报告
dmidecode -t bios # 仅显示BIOS信息
i2cdump           # 读取I2C设备寄存器
perf annotate     # 源码级性能分析
```
### 常用指令组合
```bash
sudo lshw -short             # 简洁硬件摘要
dmidecode -t memory | grep Size # 查看内存大小
perf stat -a sleep 1         # 系统整体性能统计
```


# 5. 文件与符号工具
### 常用指令
```bash
file    # 分析文件类型
ldd     # 查看二进制文件依赖库
objdump # 反汇编目标文件
nm      # 列出符号表
readelf # 查看ELF文件信息
```
### 不常用指令
```bash
file -z    # 尝试查看压缩文件内容
ldd -v     # 显示详细版本信息
objdump -S # 混合源代码和汇编
nm -D      # 显示动态符号
readelf -s # 显示符号表
```
### 常用指令组合
```bash
file /dev/null          # 检查特殊文件类型
ldd /bin/ls | grep libc # 查找特定库依赖
objdump -d my_driver.ko > disasm.txt # 反汇编输出到文件
```

# 6. 内核配置与构建
### 常用指令
```bash
make menuconfig      # 图形化内核配置
make modules         # 编译内核模块
make modules_install # 安装编译好的模块
```
### 不常用指令
```bash
make xconfig       # 使用Qt图形界面配置
make oldconfig     # 基于旧配置更新
make localmodconfig # 仅编译当前加载的模块
```
### 常用指令组合
```bash
make menuconfig && make -j4      # 配置后并行编译
make M=drivers/net/ethernet      # 编译特定驱动目录
sudo make modules_install INSTALL_MOD_STRIP=1 # 安装时去除调试符号
```


# 其他指令
hexdump