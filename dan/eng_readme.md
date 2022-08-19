auto_eng_tool,自动生成eng


使用方法
1. 定义环境变量
> export CI_BUILD_NUMBER=46789
> export MR_SUBMITTER_ID=19

程序会自定义上面两个环境变量，自己测试的时候自己定义一下
2. 调用dockerfile拉取docker镜像
> chmod 777 ./build_image.sh 
> ./build_image.sh

3. 创建一个输出的目录
> mkdir eng_fold
> cd eng_fold

4. 运行镜像，记得需要将文件映射映射出来，并且填写一下序列
> docker run -it  --name="eng2" -p 34267:22  -v $PWD:/myapp/output ihouqi-docker.pkg.coding.net/shipinanquan/lookonce/eng_tool:Merge-19-46789 /bin/bash

passwd

apt-get update
apt-get install openssh-server -y && apt-get install openssh-client -y && apt-get install vim -y


vim /etc/ssh/sshd_config

PermitRootLogin yes （默认为#PermitRootLogin prohibit-password）前面的#号要放开
PasswordAuthentication yes   #登录时候需要密码

/etc/init.d/ssh restart

ssh root@127.0.0.1 



5. 每次进入的时候需要做的
> docker start [docker name]
> docker exec -it [docker name] /bin/bash

6. 进入docker容器内部后此时在/myapp
> ./gen_eng.sh          # 根据提示，输入什么就输入什么
> docker run -it   -v $PWD:/myapp/output ihouqi-docker.pkg.coding.net/shipinanquan/lookonce/eng_tool:2-4 /bin/bash
