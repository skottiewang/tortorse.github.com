---
id: 363
title: wordpress换域名
date: 2011-10-20T22:37:08+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=363
permalink: /archives/363
categories:
  - 杂谈
tags:
  - wordpress
---
`之前的博客` 由于服务器停摆时间很长，收录已经被搜索引擎k完了。还好早先注册了自己的网名tortorse的域名，干脆迁移过来算了。担心之前访问的朋友找不到新的博客地址，所以直接做了301转向。方法很简单，利用apache的rewrite即可搞定。具体如下：

打开原博客根目录下的.htaccess文件，将其中内容修改为

```shell
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /log/
  RewriteRule ^(.*) https://www.tortorse.com 1 [L,R=301,QSA]
</IfModule>
```

原博客原先是放在域名下的log目录中，所以RewriteBase为 `/log/`。如果原来就是域名下的根目录，此条可以省略。

其实就一句RewriteRule就行了，这样就能把之前所有wordpress页面转过来。很简单，不是吗？