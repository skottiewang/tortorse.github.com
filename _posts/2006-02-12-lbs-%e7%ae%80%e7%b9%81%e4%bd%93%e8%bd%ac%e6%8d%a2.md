---
id: 19
title: LBS 简繁体转换
date: 2006-02-12T16:07:14+00:00
author: 愆伏
layout: post
permalink: /archives/19
categories:
  - 技术
tags:
  - 产品
  - 互联网
---
PJblog里抄来的。具体安装方法如下

## 安装文件

- 下载 [简繁体转换程序包](/wp-content/uploads/200602/12_172751_script.rar)
- 将该包里的 `Std_StranJF.js` 解压到LBS根目录下

## 修改配置

找到LBS的global.asp，查找

```asp
<%=lang["guestbook"]%>
```
在下面添加

```asp
<%=lang["gb2big5"]%>
```

找到LBS的lang\blog.asp，查找

```asp
t[“indexsidebar”]=”Index”;
```

在下面添加一行

```asp
t[“gb2big5″]=”繁體中文”;
```