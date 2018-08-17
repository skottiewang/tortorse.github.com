---
id: 868
title: mac 下使用ssh访问非22端口的gitlab
date: 2017-12-22T16:00:39+00:00
author: 愆伏
layout: post
guid: http://www.tortorse.com/?p=868
permalink: /archives/868
categories:
  - 技术
---
## 生成ssh key<pre data-language=>

<code class="language-bash ">ssh-keygen -t rsa -C "your.email@example.com" -b 4096
</code></pre> 

如果使用的不是默认key的话，需要添加一下<pre data-language=>

<code class="language-bash ">ssh-add ~/.ssh/other_id.rsa
</code></pre> 

## 测试ssh连接<pre data-language=>

<code class="language-bash ">ssh -T git@example.com
</code></pre> 

如果ok的话，会显示

> Welcome to Gitlab 

如果提示端口不正确的话，可以添加`-p`参数<pre data-language=>

<code class="language-bash ">ssh -T -p 443 git@example.com
</code></pre> 

## SourceTree使用问题

如果默认不是22端口，可以写一个config文件放在~/.ssh/里，内容如下<pre data-language=>

<code class="language-bash ">Host gitlab.com
Port 443
RSAAuthentication yes
IdentityFile ~/.ssh/config/private-key-filename
</code></pre>