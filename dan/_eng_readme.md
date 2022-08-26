自动生成eng

auto-eng-tool单独的调试方法
# 步骤一：服务器上生成容器
## 1.定义环境变量
```
export CI_BUILD_NUMBER=46790
export MR_SUBMITTER_ID=19
```

自己调试的时候需要自定义，上面两个环境变量

## 2.build_image.sh调用dockerfile生成docker镜像
```chmod 777 ./build_image.sh && ./build_image.sh```

[**可选项**]生成的镜像不推送到服务器<br/>
1.可以选择修改build_image.sh，删除buildx和--push，生成的镜像不推送到服务端<br/>
2.在后来docker push流程的时候直接ctrl+c，直接终止掉


## 3.创建输出目录
模型文件都会在这里生成
```mkdir eng_fold && cd eng_fold```

## 4.运行镜像，记得需要将文件映射出来，并且填写一下序列
查找刚刚根据自己环境变量生成的镜像
1. docker images -a | grep eng_tool
输出：ihouqi-docker.pkg.coding.net/shipinanquan/lookonce/eng_tool                  Merge-19-46790                       6c0e6beaff9b   5 hours ago     11.4GB

2. docker run -it  --name=[名字] -p [一个没有被占用的端口,需要用vscode远程调试需要这个]:22  -v [此时在刚刚生成的eng_fold目录里]:/myapp/output ihouqi-docker.pkg.coding.net/shipinanquan/lookonce/eng_tool:[对应版本] /bin/bash<br/>
ex：<br/>
docker run -it  --name="eng1" -p 34268:22  -v $PWD:/myapp/output ihouqi-docker.pkg.coding.net/shipinanquan/lookonce/eng_tool:Merge-19-46790 /bin/bash

## 备注：退出后重新进入镜像的方法
```
docker start [docker name]
docker exec -it [docker name] /bin/bash
```

# 步骤二：进入容器使用
## 场景一：直接生成模型
## 1.进入docker容器内部后此时在/myapp
```
./gen_eng.sh          # 根据提示，要输出什么模型就输出什么模型
docker run -it   -v $PWD:/myapp/output ihouqi-docker.pkg.coding.net/shipinanquan/lookonce/eng_tool:Merge-19-46790 /bin/bash
```

## 场景二：需要vscode远程连接容器内部进行调试
## 1.设置容器root用户密码
passwd

## 2.安装必要软件
```
apt-get update 
apt-get install openssh-server -y && apt-get install openssh-client -y && apt-get install vim -y
```

## 3.修改ssh配置
```
vim /etc/ssh/sshd_config
PermitRootLogin yes （默认为#PermitRootLogin prohibit-password）前面的#号要放开
PasswordAuthentication yes   # 登录时候需要密码
```

## 4.重启ssh
> /etc/init.d/ssh restart

## 5.测试ssh是否启用成功
此时在容器内部，自己连接自己，套娃连接
> ssh root@127.0.0.1 

## 6.vscode的remote-SSH配置
点击Open SSH Configuration File...<br/>
点击C:\Users\<username>\.ssh\config打开配置文件<br/>
加入以下语句
```
Host [写一个容易看懂的名字就行，用来显示的]
  HostName [连接的ip]
  User [docker默认是root]
  Port [上面配置的端口映射]
  IdentityFile ~\.ssh\id_rsa
```
```
ex：
Host 10.1.0.41-docker-34268
  HostName 10.1.0.41
  User root
  Port 34268
  IdentityFile ~\.ssh\id_rsa
```
再次使用vscode进行远程连接，就可以连接上了



