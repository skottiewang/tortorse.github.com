---
id: 921
title: NPM 撤回已发布的版本
date: 2018-05-15T11:59:18+00:00
author: 愆伏
layout: post
guid: http://www.tortorse.com/?p=921
permalink: /archives/921
categories:
  - 技术
tags:
  - NPM
---
```bash
npm unpublish $PackageName@$version
```

## 背景

之前写了一个UI组件库`ui-nuclear-mobile`，其`v1.0.8`版本上发现了一个`css`错误。此错误修复后，更新版本至`v1.0.9`。本以为到此万事大吉，结果发现在更新`v1.0.9`的过程中，引入了其他的`bug`。发现有一个使用方已经更新到了`v1.0.9，`只好让其回退到`v1.0.8`。

## 决策

为了防止线上有问题的`v1.0.9`不会被更多的人使用，有两个办法：

1. 快速修复好bug，发布新的版本
2. 撤回`v1.0.9`，修改好之后重新发布

如果选择`1`，定位bug和修复bug都需要时间。在这段时间内`v1.0.9`极有可能被使用方更新，之后再修复存在不确定性。整体时间周期和`2`方案没有本质性的差别。最终选择了方案`2`

```bash
npm unpublish ui-nuclear-mobile@1.0.9
```

## 反思

后续引入的bug，应该在被Merge进开发分支时被发现。说明测试和代码review还存在着很多不足。后续的事实证明，该bug是可以被测试出来的。

流程控制依然是安全生产中一个比较重要的环节，该事件引以为戒