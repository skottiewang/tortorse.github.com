---
id: 976
title: Jekyll Serve 运行出错
date: 2018-08-17T13:21:20+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=976
permalink: /archives/976
categories:
  - 技术
tags:
  - jeklly
---
跟风准备把博客从 `wordpress` 迁移到 `jekyll` 上，其实主要原因还是因为省钱。毕竟每个月VPS要掏 `$7` (VPS `$5` + backup `2$`)，换成 `Github Pages` 免费。

按照[Jekyll QuickStart](https://jekyllbootstrap.com/usage/jekyll-quick-start.html)里的进行操作直到

```shell
$ jekyll serve
```

这时候报错了

```shell
$ Could not find gem 'jekyll-sitemap x64-mingw32' in any of the gem sources listed in your Gemfile.
```

网上搜索到了一个 [解决方案](https://github.com/jekyll/jekyll/issues/4972)

```shell
$ sudo gem install pygments.rb
$ gem install bundler
$ bundle install
```

问题解决