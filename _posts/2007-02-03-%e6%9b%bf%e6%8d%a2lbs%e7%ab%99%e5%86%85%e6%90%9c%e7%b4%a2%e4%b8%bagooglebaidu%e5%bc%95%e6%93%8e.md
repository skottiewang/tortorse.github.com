---
id: 87
title: 替换LBS站内搜索为google/baidu引擎
date: 2007-02-03T10:10:58+00:00
author: 愆伏
layout: post
permalink: /archives/87
categories:
  - 技术
tags:
  - 产品
  - 互联网
---
LBS自带的搜索其实做的不错，但由于不是全文检索并存在日文字符溢出的问题，我决定把它换掉。
  
为了操作方便，准备使用现成的站内搜索引擎代码。还好百度和google都提供有相应的代码。

<a href="/wp-content/uploads/200702/03_110939_goodu.jpg" target="_blank"><img src="/wp-content/uploads/200702/03_110939_goodu.jpg" alt="/wp-content/uploads/200702/03_110939_goodu.jpg" /></a>

1.百度的：
  
<coolcode lang="html">

</coolcode>
  
如果你不需要百度的logo的话，可以把
  
<coolcode lang="html">[<img src="http://img.baidu.com/img/logo-80px.gif" alt="Baidu" align="bottom" border="0" />](http://www.baidu.com/)</coolcode>去除

表单的样式也可以自行定义，你可以直接给<form>添加一个id
  
例如：
  
<coolcode lang="html">

</center>
  
<!-- Search Google --></coolcode>和百度的一样，放在gloabal.asp里合适的位置就可以了