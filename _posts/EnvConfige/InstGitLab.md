---
title: GitLab 安装教程
date: 2024-11-07 08:47:36
tags:
- 环境配置
---


# 安装gitlab

```bash
ubuntu/bionic

curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
# sudo dpkg -x gitlab-ce_16.0.10-ce.0_amd64.deb /date_sdb/tool/gitlab # 解压到任意目录失败
sudo dpkg -i gitlab-ce_16.0.10-ce.0_amd64.deb


sudo vim /etc/gitlab/gitlab.rb
external_url 'http://192.168.56.101:8077'


sudo gitlab-ctl stop  # 停止gitlab服务 ​
sudo gitlab-ctl reconfigure  # 启动gitlab服务 ，一般这里就启动了​
sudo gitlab-ctl restart # 重启所有gitlab组件 ​
sudo gitlab-ctl start # 启动所有gitlab组件 
sudo systemctl enable gitlab-runsvdir.service # 启用开机自启动

#查看密码
sudo cat /etc/gitlab/initial_root_password
# 随机的密码，一定时间后失效
u4AWz0ZbPS6V7p0V6nCin6eaCs7WTCerzgtZmToeE+I=

root
a1234567b


dpkg -i gitlab-runner_amd64.deb

http://192.168.56.101:8077/api/v4/users?username=root


# root忘记密码重置密码
gitlab-rails console -e production
user = User.where(id: 1).first
user.password = 'a1234567b'
user.password_confirmation = 'a1234567b'
user.save!
```


# GitLab Runner
```bash
ssh -T git@192.168.56.101

gitlab-runner register --name my-runner --url http://gitlab.example.com --registration-token my-registration-token
gitlab-runner register --name my-runner --url http://192.168.56.101:8077  --token glrt-kAwh-mskRmjpz61qbxtS
gitlab-runner register --non-interactive <other-arguments>
gitlab-runner run  # 列出存储在配置文件中的所有 Runner

gitlab-runner verify # 检测注册的 Runner 是否可以连接到极狐GitLab， 但不会校验其是否被极狐GitLab Runner 服务使用

gitlab-runner unregister # 使用极狐GitLab Runners API 取消已注册的 Runner。
gitlab-runner unregister --url http://192.168.56.101:8077 --token glrt-mz2XmpyG6X7HYLeFevQu
gitlab-runner unregister --name test-runner

# run以后才能运行
gitlab-runner unregister run


gitlab-runner install
gitlab-runner uninstall
gitlab-runner start
gitlab-runner stop
gitlab-runner restart
gitlab-runner status
```

git tag -a shell2 -m "里程碑1"  
git push origin --tags
git push --tags

git tag -a gtest -m 'version 0.1'
git push origin --tags

# 进入gitlab操作步骤

1. 登录，修改密码



# 参考资料
[2023最新Ubuntu安装部署Gitlab详细教程（每个步骤均配图）](https://blog.csdn.net/m0_63230155/article/details/131952266)
[gitlab-ce_16.0.10-ce.0_amd64.deb](https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/bionic/gitlab-ce_16.0.10-ce.0_amd64.deb)
https://blog.csdn.net/leitingvre/article/details/108938882
[手动在 GNU/Linux 上安装极狐GitLab Runner ](https://gitlab.cn/docs/runner/install/linux-manually.html)
[GitLab Runner :: 17.5.3](https://gitlab-runner-downloads.s3.amazonaws.com/latest/index.html)
[GitLab → 搭建中常遇的问题与日常维护](https://www.cnblogs.com/youzhibing/p/12572598.html)
[Gitlab忘记root用户密码解决办法](https://www.cnblogs.com/easonscx/p/12608486.html)
[.gitlab-ci.yml 文件](https://gitlab.cn/docs/jh/ci/yaml/gitlab_ci_yaml.html)
[花了两天，搞了Gitlab-Runner CI/CD实现自动化部署，可比Jenkins香太多啦！！！！](https://blog.csdn.net/Lee_SmallNorth/article/details/109382552)
[GitLab Runner 命令 ](https://gitlab.cn/docs/runner/commands/)
[测试覆盖率可视化](https://gitlab.cn/docs/jh/ci/testing/test_coverage_visualization.html#cc-%E7%A4%BA%E4%BE%8B)


