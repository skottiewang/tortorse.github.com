---
id: 107
title: CSS粘性底部
date: 2007-07-13T21:51:10+00:00
author: 愆伏
layout: post
permalink: /archives/107
dsq_thread_id:
  - "3444278976"
categories:
  - 技术
tags:
  - 互联网
  - 前端
---
原文： [A CSS sticky footer](http://ryanfait.com/sticky-footer/)
  
作者：Ryan Fait

我 `E` 文不好，不过代码看的懂
  
该文实现粘性居底的核心方法，就是负 `margin`。
先用一个容器 `wrapper` 包住除 `footer` 以外的内容。
将 `wrapper` 的高度设置为 `100%` ,再用负的 `margin` 空出 `footer` 高度。如此实际 `wrapper` 的高度应等于 `100%-footer.height`，效果达成。

作者在 `HTML` 中加了一个和 `footer` 一样高度的 `push` 容器
  
没理解什么意思，可能是用来 `hack` 的。谁知道的话，我们探讨一下

把代码贴上

```html
<html>
  <body>
    <div class="wrapper">
      <p>
        Your website content here.
      </p>
      <div class="push"></div>
    </div>
    <div class="footer">
      <p>
        Copyright (c) 2008
      </p>
    </div>
  </body>
</html>
```

```css
* {
  margin: 0;
}
html, body {
  height: 100%;
}
.wrapper {
  min-height: 100%;
  height: auto !important;
  height: 100%;
  margin: 0 auto -4em; /* the bottom margin is the negative value of the footer's height */
}
.footer, .push {
  height: 4em; /* .push must be the same height as .footer */
}
```