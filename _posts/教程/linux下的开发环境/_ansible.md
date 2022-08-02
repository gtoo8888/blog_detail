---
title: ansible 教程
date: 2022-08-02 10:01:26
tags:
- 教程
---



# 安装

sudo apt update
apt list --upgradable



sudo apt install ansible

ansible --version


sudo apt install sshpass


# Ansible
什么是红帽 Ansible 自动化平台？
Ansible 自动化平台可提供一个企业框架，用于从混合云到边缘大规模构建和运维 IT 自动化。Ansible 自动化平台使整个企业的用户（从开发、运维到安全和网络团队）能够创建、共享和管理自动化。

IT 主管可以提供将自动化应用于各个团队的指导，自动化构建者可以利用现有知识编写任务。Ansible 自动化平台为部署端到端自动化奠定了更安全、更稳定的基础。



# Ansible-Playbook详解
用户通过ansible命令直接调用yml语言写好的playbook,playbook由多条play组成
每条play都有一个任务(task)相对应的操作,然后调用模块modules，应用在主机清单上,通过ssh远程连接
从而控制远程主机或者网络设备


Ansible Facts 是 Ansible 在被托管主机上自动收集的变量。它是通过在执行 Ad-Hoc 以及 Playbook 时使用 setup 模块进行收集的，并且这个操作是默认的。







# 参考文献
[ Ansible中文权威指南]http://www.ansible.com.cn/docs/playbooks.html


















