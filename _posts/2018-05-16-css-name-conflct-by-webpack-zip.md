---
id: 926
title: 通过webpack对css压缩后所引起的重名问题
date: 2018-05-16T15:10:54+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=926
permalink: /archives/926
categories:
  - 技术
tags:
  - vue
---
## 起因

我们维护了两个组件库，一套用于PC，另一套用于Mobile。有一个使用方同时引入了这两个库，这时候突然发现了一个诡异的现象：

> 一个`tag`组件凭空旋转起来，事实上没有给这个`tag`添加任何动画效果

## 发现

直接从页面表现来看，很难发现问题所在。我们进行了以下步骤进行排查

1. 通过`chrome`的animate面板，看执行的是什么动画。发现其动画名为`a`
2. 通过`vue`控制台/源码，发现其使用了`vue`的`transition`组件，并且其`transition`使用了PC组件库提供的`fade`动画。

## 分析

为什么`fade`动画会变成了旋转？我们在编译的`css`文件中寻找`tanslate`和`@keyframes`关键词，发现

```css
@keyframes a {
    translate:rotate(1turn)
}
```

```css
@keyframes a {
    0% {
        opacity:0;
    }
    100% {
        opacity:1;
    }
}
```

有2个名为`a`的动画，那么问题就清楚了，是两个动画冲突了。但是怎么会都叫`a`的呢。我们不太可能这么随意的起名。源码中也没有找到名为`a`的动画。那么有一种可能，就是在打包的时候被改名了。

找到`Vue`本身提供的`webpack.prod.conf.js`，发现里面是这样的：

```javascript
new OptimizeCSSPlugin({
  cssProcessorOptions: config.build.productionSourceMap
    ? { safe: true, map: { inline: false } }
    : { safe: true }
})
```

而我们用来发布包的`webpack.pack.conf.js`里面是这样的：

```javascript
new OptimizeCSSPlugin()
```

说明`pack`脚本是按照最大压缩方式进行压缩的，会对`css`进行改名，如果两个库都采用同样的方式进行压缩，自然会产生命名冲突。`vue`官方的配置很明显考虑到了这一点，所以直接采用了避免冲突的「安全」模式。

## 解决

将`css`压缩模式换为`safe`并重新打包，问题解决。