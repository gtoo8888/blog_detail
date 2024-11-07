---
title: Part7 磁盘与文件系统管理
date: 2022-03-12 21:27:18
tags:
- 鸟哥的Linux私房菜
---

# xfs_info 观察XFS文件系统

# 外围设备
在 Linux 中，外围设备都位于 /dev 挂载点，内核通过以下的方式理解硬盘：

/dev/hdX[a-z]: IDE 硬盘被命名为 hdX
/dev/sdX[a-z]: SCSI 硬盘被命名为 sdX
/dev/xdX[a-z]: XT 硬盘被命名为 xdX
/dev/vdX[a-z]: 虚拟硬盘被命名为 vdX
/dev/fdN: 软盘被命名为 fdN
/dev/scdN or /dev/srN: CD-ROM 被命名为 /dev/scdN 或 /dev/srN

# 7.2 档案系统的简单操作
## 7.2.1 df
用于显示目前在 Linux 系统上的文件系统磁盘使用情况统计
查看一下有没有usb设备在挂载使用
```bash
df -h # 查看当前磁盘使用情况
df -T # 输出文件系统类型
df -a # 包括伪、重复、不可访问的文件系统
```

## 7.2.1 du
用于显示目录或文件的大小
-h以K，M，G为单位，提高信息的可读性
-s或--summarize 仅显示总计


```bash
# 常用指令
du -h myfile # 当前文件夹的总大小
du -sh * # 查看当前文件夹下每个文件的大小

# 常用参数
du -a # 列出所有的档案与目录容量，因为预设仅统计目录底下的档案量而已。
du -h # 以人们较易读的容量格式（G/M）显示
du -s # 列出总量,不列出每个各别的目录占用容量
du -S # 不包括子目录下的总计，与-s有点差别
du -k # 以KBytes列出容量显示
du -m # 以MBytes列出容量显示
```

# 7.3 磁盘的分割、格式化、检验与挂载

## 7.3.1观察磁盘分割状态
### 1) lsblk 列出所有磁盘列表
list block device,列出所有储存装置

```bash
# 常用指令
lsblk -t # 列出该磁盘装置的详细数据，包括磁盘队列机制、预读写的数据量大小等
lsblk -m # 同时输出该装置在/dev底下的权限数据（rwx的数据）


lsblk -d # 仅列出磁盘本身，并不会列出该磁盘的分割数据
lsblk -f # 同时列出该磁盘内的档案系统名称
lsblk -i # 使用ASCII的线段输出，不要使用复杂的编码（再某些环境下很有用）
lsblk -p # 列出该装置的完整文件名！而不是仅列出最后的名字而已。

lsblk -o name,mountpoint,size,uuid # 查看UUID
```

### 2) blkid
对系统的块设备（包括交换分区）所使用的文件系统类型、LABEL、UUID等信息进行查询
```bash
# 常用指令
sudo blkid -s <tag>    显示指定信息，默认显示所有信息
sudo blkid # 列出系统中所有已挂载文件系统的类型
sudo blkid /dev/sdb # 指定设备挂载类型
sudo blkid -s UUID # 显示所有设备UUID
sudo blkid -s UUID /dev/sdb # 显示指定设备UUID
```

### 3) parted

## 7.3.2 磁盘分割gdisk/fdisk
fdisk创建MBR分区，最大支持2TB
gdisk创建GPT分区，最大支持18EB，1EB=1024PB，1PB=1024TB
MBR分割表请使用fdisk分割，GPT分割表请使用gdisk分割

### 1) gdisk

### 2）fdisk
用于磁盘分区的工具，可以创建、编辑、删除和显示硬盘分区

```bash
# 常用指令
sudo fdisk -l # 显示设备的分区表信息
sudo fdisk -l /dev/sdb # 示设备/dev/sda的分区表信息
sudo fdisk /dev/sdb # 进入交互界面，操作扇区
# 可以创建新的扇区、删除分区
```


## 7.3.3 磁盘格式化（建置档案系统）
格式化，建置档案系统，make filesystem，mkfs
### 1) mkfs.xfs
关于单位：没有加单位则为bytes值，可以用k，m，g，t，p（小写）等来解释
比较特殊的是s这个单位，它指的是sector的个数

```bash
# 常用指令
mkfs.xfs /dev/sdb 
blkid /dev/sdb
```

```bash
# 不常用指令
mkfs.xfs [-b bsize] [-d parms] [-i parms] [-l parms] [-L label] [-f] [-r parms] /dev/sdb
mkfs.xfs -f /dev/sdb # 强制格式化               
mkfs.xfs -b block_size(块大小) # 后面接的是block容量，可由512到64k，最大容量限制为Linux的4k喔
mkfs.xfs -d su=4k,sw=16 /dev/sdb 
mkfs.xfs -d sunit=128,swidth= sunit*数据盘个数  /dev/sdb
mkfs.xfs -f -d agcount=2 /dev/sdb

agcount=value # 设定需要几核格式化
agsize=value # 每个AG设定为多少容量的意思，通常agcount/agsize只选一个设定即可
file # 指的是『格式化的装置是个档案而不是个装置』的意思！（例如虚拟磁盘）
size=value:data # section的容量，亦即你可以不将全部的装置容量用完的意思
su=value # 当有RAID时，那个stripe数值的意思，与底下的sw搭配使用
sw=value # 当有RAID时，用于储存数据的磁盘数量（须扣除备份碟与备用碟）
sunit=value # 与su相当，不过单位使用的是『几个sector（512bytes大小）』
swidth=value # 就是su*sw的数值，但是以『几个sector（512bytes大小）』
noalign  # 忽略自动对齐


mkfs.xfs -i # 与inode有较相关的设定，主要的设定值有：

size=数值：最小是256bytes最大是2k，一般保留256就足够使用了！
internal=[0|1]:log装置是否为内置？预设为1内置，如果要用外部装置，使用底下设定
logdev=device :log装置为后面接的那个装置上头的意思，需设定internal=0才可！
size=数值：指定这块登录区的容量，通常最小得要有512个block，大约2M以上才行！

```

### 2) mkfs.xfs for raid

```bash
# 不常用指令
mkfs.xfs -f -d agcount=2,su=256k,sw=7 -r extsize=1792k /dev/vda4
mkfs.xfs -f -d agcount=2,sunit=512,swidth=3584 -r extsize=1792k /dev/vda4
```

### 3) mkfs.ext4
格式化为ext4文件系统
```bash
# 常用指令
mkfs.ext4 /dev/sdb
mkfs.ext4 -b 2048 /dev/sdb # 设定block的大小
mkfs.ext4 -L LinuxCool /dev/sdb # 添加卷标为LinuxCool

dumpe2fs -h /dev/sdb
```

### 4) mkfs
是一个综合指令，下面有各种参数
```bash
# 常用指令
mkfs[tab][tab]
# 鸟哥书上的
# mkfs         mkfs.btrfs   mkfs.cramfs  mkfs.ext2    mkfs.ext3    mkfs.ext4    
# mkfs.fat     mkfs.minix   mkfs.msdos   mkfs.vfat    mkfs.xfs
# Ubunut 18.04
# mkfs         mkfs.cramfs  mkfs.ext3    mkfs.fat     mkfs.msdos   mkfs.vfat
# mkfs.bfs     mkfs.ext2    mkfs.ext4    mkfs.minix   mkfs.ntfs

# 实际使用
mkfs -t vfat /dev/vda5 # 重新格式化为vfat格式
blkid /dev/vda5 # 查看格式类型
mkfs.ext4 /dev/vda5 # 重新格式化为ext4格式
blkid /dev/vda5 # 查看格式类型
```

## 7.3.4 档案系统检验
无论是xfs_repair或fsck.ext4，这都是用来检查与修正档案系统错误的指令
注意：
通常只有身为root且你的文件系统有问题的时候才使用这个指令，否则在正常状况下使用此一指令，可能会造成对系统的危害！
通常使用这个指令的场合都是在系统出现极大的问题，导致你在Linux开机的时候得进入单人单机模式下进行维护的行为时，才必须使用此一指令！
xfs_repair/fsck.ext4在扫瞄磁盘的时候，可能会造成部分filesystem的修订，执行xfs_repair/fsck.ext4时，被检查的partition务必不可挂载到系统上！需要先umount

### 1) xfs_repair

```bash
# 常用指令
xfs_repair -f /dev/sdb # 后面的装置其实是个档案而不是实体装置
xfs_repair -n /dev/sdb # 单纯检查并不修改档案系统的任何数据
xfs_repair -d # 通常用在单人维护模式底下，针对根目录（/）进行检查与修复的动作！很危险！不要随便使用

```

### 2) fsck.ext4
fsck 是个综合指令，fsck.ext4是针对ext4
```bash
# 常用指令
fsck.ext4 -p /dev/sdb # 当档案系统在修复时，若有需要回复y的动作时，自动回复y来继续进行修复动作。
fsck.ext4 -f /dev/sdb # 强制检查,如果fsck没有发现任何unclean的旗标，不会主动进入
fsck.ext4 -D /dev/sdb # 针对档案系统下的目录进行最佳化配置
fsck.ext4 -b 32768 /dev/sdb # -b后面接superblock的位置，如果superblock因故损毁时，通过这个参数即可利用档案系统内备份的superblock来尝试救援
# 一般superblock备份在：1K block放在8193，2K block放在16384，4K block放在32768

```



## 7.3.5 档案系统挂载与卸载

### 1) mount
```bash
# 常用指令
mount /dev/sde /data # 将磁盘挂载到指定为止
mount # 显示目前挂载的信息
mount -a  # 依照设定档/etc/fstab的数据将所有未挂载的磁盘都挂载上来
mount -l  # 增加列Label名称
# 常见的Linux支持类型有：xfs，ext3，ext4，reiserfs，vfat，iso9660（光盘格式），nfs，cifs，smbfs（后三种为网络档案系统类型）
mount -t  # 可以加上档案系统种类来指定欲挂载的类型
mount -t  ext4 LABEL='' /data
mount -t  ext4 UUID='' /data
mount -t  ext4 /dev/sde /data
# 在预设的情况下，系统会将实际挂载的情况即时写入/etc/mtab中
mount -n # 不将实际挂载情况写入/etc/mtab
mount -o # 设定挂载时参数
```

### 2) umount
```bash
# 常用指令
umount -f /dev/sdb1 /data # 强制卸载,可用在类似网络档案系统（NFS）无法读取到的情况下
umount -l /dev/sdb1 /data # 立刻卸载档案系统，比-f还强
umount -n /dev/sdb1 /data # 不更新/etc/mtab情况下卸载


# 卸载方式
mount # 查询挂载点
umount /dev/vda4 # 用装置文件名来卸载
umount /data/cdrom # 用挂载点来卸载
```



## 7.3.6 磁盘/档案系统参数修订
### 1) mknod
### 2) xfs_admin
### 3) uuidgen
### 4) tune2fs


# 7.4 设定开机挂载
开机挂载 /etc/fstab 及 /etc/mtab


```bash
# 常用指令
cat /etc/fstab
# Device                              Mount point  filesystem parameters    dump fsck

# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=b6cadca7-c9a1-4f04-8700-93b842e948ef /               ext4    errors=remount-ro 0       1
/swapfile                                 none            swap    sw              0       0
UUID=e7dac072-5f03-41c4-bca2-0745d8e33c38 /date_sdb       ext4    defaults   0      2
```
/etc/fstab文件中的内容
[装置/UUID等] [挂载点] [档案系统] [档案系统参数] [dump] [fsck]
1. 第一列：磁盘设备文件名/UUID/LABEL name
   1. 文件系统或磁盘的装置文件名，如/dev/vda2等
   2. 文件系统的UUID名称，如UUID=xxx，比较建议实用UUID，使用blkid或xfs_admin查询
   3. 文件系统的LABEL名称，例如LABEL=xxx
2. 第二列：挂载点（mount point）
   1. 要挂载到的文件位置
3. 第三列：磁盘分槽的文件系统
   1. 在手动挂载时可以让系统自动选择档案类型
   2. 但在这个档案当中我们必须要手动写入档案类型，包括xfs，ext4，vfat，reiserfs，nfs
4. 第四列：文件系统参数
   1. async/sync，异步/同步
      1. 配置磁盘是否以异步方式运作！默认为async（性能较佳）
   2. auto/noauto，自动/非自动
      1. 当下达mount -a时，此档案系统是否会被主动测试挂载。默认为auto
   3. rw/ro，可读写/只读
      1. 让该分割槽以可读写或者是唯读的型态挂载上来，如果你想要分享的数据是不给用户随意变更的，这里也能够设定为只读
      2. 则不论在此文件系统的文件是否设定w权限，都无法写入
   4. exec/noexec，可执行/不可执行
      1. 限制在此档案系统内是否可以运行可执行文件，如果是纯粹用来储存资料的目录，可以设定为noexec会比较安全
      2. 这个参数也不能随便使用，因为不知道该目录下是否默认会有执行文件
   5. user/nouser，允许/不允许用户挂载
      1. 是否允许用户使用mount指令来挂载呢
      2. 一般不希望user能使用mount挂载，因此这里应该要设定为nouser
   6. suid/nosuid，具有/不具有suid权限
      1. 该文件系统是否允许SUID的存在
      2. 如果不是执行文件放置目录，也可以设定为nosuid来取消这个功能
   7. defaults
      1. 同时具有rw，suid，dev，exec，auto，nouser，async等参数
      2. 基本上，默认情况使用defaults设定即可
   8. remount,重新挂载
      1. 在系统出错，或重新更新参数时
5. 第五栏：能否被dump备份指令作用
   1. dump是一个用来做为备份的指令
   2. 不过现在有太多的备份方案了，所以这个项目可以不要理会啦，直接输入0
6. 第六栏：是否以fsck检验磁区
   1. 早期启动的流程中，会有一段时间去检验本地的档案系统，看看文件系统是否完整（clean）
   2. 不过这个方式使用的主要是透过fsck去做的，我们现在用的xfs档案系统就没有办法适用
   3. xfs会自己进行检验，不需要额外进行这个动作，所以直接填0

/etc/fstab 是开机时的设定文件，不过，实际 filesystem 的挂载是记录到 /etc/mtab 与 /proc/mounts 这两个档案当中的


# 其他指令
ln 硬链接
parted 列出磁盘分区表类型与分区信息
Linux dump备份




# 参考资料
[一种基于内存的文件系统tmpfs](https://www.linuxprobe.com/tmpfs-linux.html)
[【ubuntu】将磁盘挂载到指定目录并设置开机自动挂载](https://blog.csdn.net/weixin_42301220/article/details/130078734)
[Linux fdisk命令详解：如何创建、编辑、删除和显示磁盘分区（附实例和注意事项）](https://blog.csdn.net/u012964600/article/details/134603643)

