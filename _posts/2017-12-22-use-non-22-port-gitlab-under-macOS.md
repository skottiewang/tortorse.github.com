---
id: 868
title: mac 下使用ssh访问非22端口的gitlab
date: 2017-12-22T16:00:39+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=868
permalink: /archives/868
categories:
  - 技术
---
## 生成ssh key

```bash
ssh-keygen -t rsa -C "your.email@example.com" -b 4096
```
如果使用的不是默认key的话，需要添加一下

```bash
ssh-add ~/.ssh/other_id.rsa
```


## 测试ssh连接

```bash
ssh -T git@example.com
```

如果ok的话，会显示

> Welcome to Gitlab

如果提示端口不正确的话，可以添加`-p`参数

```bash
ssh -T -p 443 git@example.com
```

## SourceTree使用问题

如果默认不是22端口，可以写一个config文件放在~/.ssh/里，内容如下

```bash
Host gitlab.com
Port 443
RSAAuthentication yes
IdentityFile ~/.ssh/config/private-key-filename
```



