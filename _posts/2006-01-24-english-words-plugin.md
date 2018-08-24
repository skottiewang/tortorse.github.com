---
id: 7
title: LBS在线背单词功能
date: 2006-01-24T13:36:54+00:00
author: 愆伏

permalink: /archives/7
categories:
  - 技术
tags:
  - 产品
  - 互联网
---

![english](/wp-content/uploads/200601/24_134302_eng.gif)

[文件包下载](/wp-content/uploads/200601/29_161905_.rar)

使用方法如下：

- 放在blog程序的根目录下

- 先修改 `Ft_word_flash.asp` 的数据库配置

```asp
dbbankword="data#v390/englishword.asp" //将引号中的配置改为你自己的
```
- 调用方法，打开LBS^2的default.asp，在想显示的地方加入代码

```html
<script src="Ft_word_flash.asp"></script>
```
