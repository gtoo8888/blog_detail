---
title: minio 环境配置
date: 2023-01-19 18:40:28
tags:
- 环境配置
---

## 安装 Docker

```bash
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
```

验证安装：

```bash
docker version
```

## 安装 MinIO

```bash
docker run -it -d -p 9000:9000 -p 9001:9001 --name minio \
  -e "MINIO_ACCESS_KEY=minio" \
  -e "MINIO_SECRET_KEY=minio123" \
  -v /home/admin/minio/data:/data \
  -v /home/admin/minio/config:/root/.minio \
  minio/minio server /data \
  --console-address ":9000" --address ":9001"
```

- `MINIO_ACCESS_KEY`：账号
- `MINIO_SECRET_KEY`：密码

访问地址：

- 远程：`http://39.106.72.165:9000`
- 本地：`http://127.0.0.1:9000`

## 参考资料

- [MinIO 部署教程](https://cloud.tencent.com/developer/article/2057224)
- [MinIO 官方下载](https://www.minio.org.cn/download.shtml#/linux)
