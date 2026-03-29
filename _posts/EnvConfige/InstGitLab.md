---
title: GitLab 安装教程
date: 2024-11-07 08:47:36
tags:
- 环境配置
---

## 主流 Git 托管工具

1. GitHub
2. GitLab
3. Gitea
4. Gogs

## 国产平台

1. Gitee
2. GitCode

## 安装 GitLab

```bash
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
sudo gitlab-ctl tail postgresql # 查看某一个服务的日志

# 查看密码
sudo cat /etc/gitlab/initial_root_password
# 随机的密码，一定时间后失效
# u4AWz0ZbPS6V7p0V6nCin6eaCs7WTCerzgtZmToeE+I=

root
a1234567b

dpkg -i gitlab-runner_amd64.deb
http://192.168.56.101:8077/api/v4/users?username=root

# root 忘记密码重置
gitlab-rails console -e production
user = User.where(id: 1).first
user.password = 'a1234567b'
user.password_confirmation = 'a1234567b'
user.save!
```

## GitLab Runner

```bash
ssh -T git@192.168.56.101

# 注册 Runner
gitlab-runner register --name my-runner --url http://gitlab.example.com --registration-token my-registration-token
gitlab-runner register --name my-runner --url http://192.168.56.101:8077 --token glrt-kAwh-mskRmjpz61qbxtS
gitlab-runner register --non-interactive <other-arguments>
gitlab-runner run  # 列出存储在配置文件中的所有 Runner

gitlab-runner verify # 检测注册的 Runner 是否可以连接到极狐GitLab，但不会校验其是否被极狐GitLab Runner 服务使用
gitlab-runner unregister # 使用极狐GitLab Runners API 取消已注册的 Runner
gitlab-runner unregister --url http://192.168.56.101:8077 --token glrt-f-ynh8x5XAsHd97WEBBr
gitlab-runner unregister --name shell2
gitlab-runner verify --delete # 删除以后用这个删除 list 中的文件，会校验 runner 是否有效

# run 以后才能运行
gitlab-runner unregister run

gitlab-runner list
gitlab-runner install
gitlab-runner uninstall
gitlab-runner start
gitlab-runner stop
gitlab-runner restart
gitlab-runner status
```

## Git 标签

```bash
git tag -a shell2 -m "里程碑1"
git push origin --tags
git push --tags

git tag -a gtest -m 'version 0.1'
git push origin --tags
```

## 常用 CI 变量

```bash
${CI_JOB_NAME}
${CI_COMMIT_REF_NAME}
${CI_COMMIT_SHA}
${CI_PROJECT_PATH}
${CI_JOB_STARTED_AT}
${CI_PIPELINE_CREATED_AT}
${CI_COMMIT_TIMESTAMP}
${CI_COMMIT_REF_SLUG}
```

## 进入 GitLab 操作步骤

1. 登录，修改密码。

## 常见报错

### PostgreSQL 服务挂了

```
run: alertmanager: (pid 2671) 1001s; run: log: (pid 2647) 1001s
run: gitaly: (pid 2668) 1001s; run: log: (pid 2658) 1001s
run: gitlab-exporter: (pid 2646) 1001s; run: log: (pid 2630) 1001s
run: gitlab-kas: (pid 2632) 1001s; run: log: (pid 2626) 1001s
run: gitlab-workhorse: (pid 2657) 1001s; run: log: (pid 2636) 1001s
run: logrotate: (pid 2653) 1001s; run: log: (pid 2634) 1001s
run: nginx: (pid 2628) 1001s; run: log: (pid 2624) 1001s
run: node-exporter: (pid 2664) 1001s; run: log: (pid 2643) 1001s
run: postgres-exporter: (pid 2665) 1001s; run: log: (pid 2639) 1001s
down: postgresql: 0s, normally up, want up; run: log: (pid 2625) 1001s
run: prometheus: (pid 2644) 1001s; run: log: (pid 2629) 1001s
run: puma: (pid 13803) 2s; run: log: (pid 2627) 1001s
run: redis: (pid 2656) 1001s; run: log: (pid 2635) 1001s
run: redis-exporter: (pid 2655) 1001s; run: log: (pid 2637) 1001s
run: sidekiq: (pid 13683) 13s; run: log: (pid 2645) 1001s

down: alertmanager: 125s, normally up; run: log: (pid 2647) 1131s
down: gitaly: 124s, normally up; run: log: (pid 2658) 1131s
down: gitlab-exporter: 123s, normally up; run: log: (pid 2630) 1131s
down: gitlab-kas: 113s, normally up; run: log: (pid 2626) 1131s
down: gitlab-workhorse: 113s, normally up; run: log: (pid 2636) 1131s
down: logrotate: 113s, normally up; run: log: (pid 2634) 1131s
down: nginx: 112s, normally up; run: log: (pid 2624) 1131s
down: node-exporter: 112s, normally up; run: log: (pid 2643) 1131s
down: postgres-exporter: 112s, normally up; run: log: (pid 2639) 1131s
run: postgresql: (pid 14385) 48s; run: log: (pid 2625) 1131s
down: prometheus: 107s, normally up; run: log: (pid 2629) 1131s
down: puma: 107s, normally up; run: log: (pid 2627) 1131s
down: redis: 106s, normally up; run: log: (pid 2635) 1131s
down: redis-exporter: 106s, normally up; run: log: (pid 2637) 1131s
down: sidekiq: 104s, normally up; run: log: (pid 2645) 1131s
```

### Runner 编译过程卡住

排查步骤：

1. 卡住阶段，`top` CPU 没负载，`iotop` IO 没负载。
2. 不是偶发，反复出现。
3. GitLab-Runner 日志显示正常。
4. 从某次提交开始持续卡住（该提交把 `./test` 改成了 `sudo ./test`）。
5. `sudo gitlab-runner run` 同样卡住。
6. 去掉 `sudo` 后，CI 正常运行。

## 参考资料

- [2023 最新 Ubuntu 安装部署 GitLab 详细教程](https://blog.csdn.net/m0_63230155/article/details/131952266)
- [GitLab CE Ubuntu 包](https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/bionic/gitlab-ce_16.0.10-ce.0_amd64.deb)
- [GitLab CE ARM64 包（树莓派）](https://packages.gitlab.com/gitlab/gitlab-ce/packages/debian/bookworm/gitlab-ce_17.3.6-ce.0_arm64.deb)
- [低配置服务器安装 GitLab](https://blog.csdn.net/leitingvre/article/details/108938882)
- [手动在 GNU/Linux 上安装极狐 GitLab Runner](https://gitlab.cn/docs/runner/install/linux-manually.html)
- [GitLab Runner 下载](https://gitlab-runner-downloads.s3.amazonaws.com/latest/index.html)
- [GitLab 搭建中常遇的问题与日常维护](https://www.cnblogs.com/youzhibing/p/12572598.html)
- [GitLab 忘记 root 用户密码解决办法](https://www.cnblogs.com/easonscx/p/12608486.html)
- [.gitlab-ci.yml 文件](https://gitlab.cn/docs/jh/ci/yaml/gitlab_ci_yaml.html)
- [GitLab-Runner CI/CD 实现自动化部署](https://blog.csdn.net/Lee_SmallNorth/article/details/109382552)
- [GitLab Runner 命令](https://gitlab.cn/docs/runner/commands/)
- [测试覆盖率可视化](https://gitlab.cn/docs/jh/ci/testing/test_coverage_visualization.html)
- [GitLab502--postgresql 服务 timeout 超时](https://blog.csdn.net/liangjiabao5555/article/details/106128231)
- [作业产物](https://gitlab.cn/docs/jh/ci/jobs/job_artifacts.html)
- [极狐 GitLab CI/CD](https://gitlab.cn/docs/jh/ci/)
