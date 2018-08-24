---
id: 104
title: 揣测google韩国首页动画效果
date: 2007-06-14T22:41:02+00:00
author: 愆伏

permalink: /archives/104
categories:
  - 技术
tags:
  - 互联网
  - 前端
  - google
---
[google韩国的首页](http://www.google.co.kr/ig?sp=korea&hl=ko) 前段时间很火
  
一来是因为 `google` 终于进入了韩国市场，二来是因为首页下部几个动画菜单
  
最关键的是据说只用了这一张图片就实现了动画的效果

![sprite](/wp-content/uploads/200706/14_224440_google.png)

于是乎牵扯出关于图片使用效率的话题 <http://blog.rexsong.com/?p=746>

本人不才，用 `css` 加上拙劣的 `js` 也写了类似效果
  
思路是这样的
  
使用 `background` 的 `postion` 属性来控制背景的滑动
  
用 `js` 的 `setTimeout()` 来创建动画效果
  
具体效果看[Demo](http://www.tortorse.com/demo/roll.html)
  

我的图片

![ball](/demo/images/ball.jpg)