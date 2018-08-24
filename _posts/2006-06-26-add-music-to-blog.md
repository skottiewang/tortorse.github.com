---
id: 57
title: 给LBS^2添加flash音乐播放器
date: 2006-06-26T11:50:56+00:00
author: 愆伏

permalink: /archives/57
categories:
  - 技术
tags:
  - 产品
  - 互联网
---
有不少人问我的blog上为什么不弄点音乐，不是我不想弄，是我不会。。
单纯的加个embed又觉得没什么技术含量,用iframe调外部页面更不符合我的风格。
于是想到 [白鸦blog](http://www.uicom.net/blog) 上的那个睽违已久的flash播放器。
  
今天仔细看了一下发现原来就一个swf文件，估计是调用参数来访问外部资源的。
  
baidu之，发现了该播放器的 [官方网站](http://www.alsacreations.fr/mp3-dewplayer.html)
  
按部就班的弄好了
  
调用方法很简单
  
先下载dewplayer.swf，并上传到blog目录下
  
然后到global.asp里加一句

```html
<object type="application/x-shockwave-flash" data="dewplayer.swf?son=votre_son.mp3" width="200" height="20" bgcolor="#xxxxxx"><param name="movie" value="dewplayer.swf?son=votre_son.mp3"><param name="bgcolor" value="#xxxxxx"></object>
```
把里面的`votre_son.mp3`换成你要的音乐URL,把`#xxxxxx`换成你要的背景颜色。
  
完工！
  
不过更新仍然是比较静态的，需要手动修改参数。