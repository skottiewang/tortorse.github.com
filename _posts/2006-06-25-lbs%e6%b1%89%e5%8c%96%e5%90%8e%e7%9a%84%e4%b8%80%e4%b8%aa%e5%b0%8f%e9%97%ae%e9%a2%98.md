---
id: 56
title: LBS汉化后的一个小问题
date: 2006-06-25T23:18:07+00:00
author: 愆伏
layout: post
permalink: /archives/56
categories:
  - 技术
tags:
  - 产品
  - 互联网
---
今天偶然发现其他人使用的lbs在打开文章页后，都有一个文字缩放功能。
  
可我的blog里相关位置显示的却是: `| |`
  
打开article.asp,在行41找到

```asp
<%=lang["font_size"]%>:
: <%=lang["large"]%>“><%=lang["large"]%> |
: <%=lang["medium"]%>“><%=lang["medium"]%> |
: <%=lang["small"]%>“><%=lang["small"]%>
```

发现可能有几个量没定义
  
再打开lang/blog.asp，
  
找到`t["quote"]="引用"`，在上面增加：

```asp
t[“font_size”]=”字体大小”;
t[“large”]=”大”;
t[“medium”]=”中”;
t[“small”]=”小”;
```
测试了一下，功能ok了。
  
总结原因：估计是最初安装的lbs汉化包修改了文件内的一些内容。
  
各位使用LBS汉化的小心检查一下吧