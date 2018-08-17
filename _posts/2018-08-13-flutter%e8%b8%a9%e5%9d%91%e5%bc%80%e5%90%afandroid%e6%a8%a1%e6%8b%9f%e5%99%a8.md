---
id: 969
title: flutter踩坑:开启Android模拟器
date: 2018-08-13T15:54:46+00:00
author: 愆伏
layout: post
guid: https://www.tortorse.com/?p=969
permalink: /archives/969
categories:
  - 技术
tags:
  - flutter
---
按照[flutter官方教程](https://flutter.io/setup-windows/)进行到了`Android setup`中的`Set up the Android emulator`

一切就绪之后开始启动模拟器，一直报`error code 1`

网上找了一堆信息，好像都不是说这个问题。

问了身边的`Android`工程师，解释说可能是`JDK`没装

> 可是，`JDK`和模拟器有啥关系? 

根据以往踩坑经验`error code 1`都是系统层面的，想起之前在`linux` 上安装虚拟机踩过的坑，突然觉得是不是和硬件有关系? 顺藤摸瓜，发现这里面用到了`Intel`的虚拟化技术

重启，进BIOS，发现`Intel 虚拟化`没打开，打开后重新进入。

问题解决了。

官方文档中有一个[Enable VM acceleration](https://developer.android.com/studio/run/emulator-acceleration.html)

但是怎么Enable没有说的很清楚，所以如果发现以上问题先查下机器的设置。