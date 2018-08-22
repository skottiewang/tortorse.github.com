---
id: 83
title: '给blog程序做调整——LBS修改笔记[持续更新]'
date: 2007-01-19T21:53:25+00:00
author: 愆伏
layout: post
permalink: /archives/83
categories:
  - 技术
tags:
  - 互联网
---
有段时间没博了,弄的 [hubro](http://feed.hubro.net/) 把我给禁了
  
## 2007-11-10
  
1. 将默认字号增加到 `14px`,修改很简单,修改当前使用 `css` 里 `body` 的 `font-size:14px` 即可
  
2. 去除默认 `UBB` 标签 `[img]` 产生的链接,把 `class` 下面的 `ubbcode.asp` 文件中的 `[img]` 有关内容中的 `Anchor` 相关删除

## 2006-02-05
  
1. 修该 `rssfeed` 中的 `null@null.com` 为 `gmail`

## 2006-01-21
  
1. 文章日期、作者、评论显示
  
2. 非首页不显示友情链接  <http://www.lbsky.cn/forum/thread-68-1-1.html>

## 2006-01-19
  
下午有点空闲，把 `LBS` 又重新搞了一下
  
1. `flash` 音乐播放器采用 `dewplayer` 的 `multi` 版，支持多首歌曲播放(具体使用方法稍后奉上)
  
2. 修改了“统计数据”部分的文字样式和链接范围

3. 去除了“最新日志”的显示
  
4. [使用google的站内检索代替原来的检索功能，并调整了位置](/archives/87) 
  
5. 调整了日历部分的样式
  
6. 删除了 `Rss Feed` 图标，目前还未想好放在哪里
  
7. 将分类中的 `index` 删除，调整链接到“分类”上
  
8. 将“友情链接”进行分组显示
  
9. 压缩了数据库，由原来的 `5M` 压缩到现在的 `496k`( `access` 自带的压缩功能真猛！)
  
10. 将“分类”及“文章”链接的url改成形如"?id=xx"，利于 `SEO` <http://www.awflasher.com/blog/archives/717>
  
11. 去除未注册的用户的链接
  
12. 关闭了 `trackback`，防止恶心的 `SEO robot`