---
id: 870
title: macOS 下npm run dev 无法局域网访问
date: 2017-12-22T16:01:38+00:00
author: 愆伏
layout: post
guid: http://www.tortorse.com/?p=870
permalink: /archives/870
categories:
  - 技术
---
## 1. 原因

在localhost模式下，server不监听非本地请求

## 2. 解决方案

<https://github.com/webpack/webpack-dev-server/issues/147>

配置host为0.0.0.0