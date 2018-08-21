---
id: 305
title: js+css控制字体变换
date: 2010-01-04T20:49:35+00:00
author: 愆伏
layout: post
guid: http://www.tortorse.com/archives/305
permalink: /archives/305
dsq_thread_id:
  - "3444278099"
categories:
  - 技术
tags:
  - 互联网
  - 前端
---
好久没写了，`小客` 跟我说这里会荒废掉。其实本来有很多的打算，只不过话到嘴边又说不出口了。今天正好得个闲暇，写写比较说的清道的明的技术问题吧

今天打开百度知道发现她不知不觉的改版了。在用过 `搜搜问问`、`天涯问吧` 之后，感觉 `百度知道` 的体验一直是这几个当中最舒服的。刚刚正好看到了一个推荐给我的问题，就顺手回答了。(由此可知 `百度知道` 的推荐问题非常靠谱)

## 题目如下

> 有个区间文字，字号为h1，提供一个文本框，用户输入h1-h7，点击按钮后可以改变此区间的字号~

## 答案如下

很简单，首先制作 `h1-h7` 字体大小的 `css` 定义 `7` 个 `class`

```css
.c_h1{font-size:28px;}
.c_h2{font-size:24px;} 
.c_h3{font-size:20px;} 
.c_h4{font-size:16px;} 
.c_h5{font-size:14px;} 
.c_h6{font-size:12px;} 
.c_h7{font-size:11px;}
```
容器为
```html
<div class="{c_h1~c_h7之间的某个，一开始可以默认为c_h5}"></div>
```
然后用js判断填写的字体大小即可:

```javascript
function changeSize(){
  c_size = document.getElementById(“text_size”).value
  c_content = document.getElementById(“content”) 
  switch(c_size) { 
    case 'h1': c_content.className='c_h1'
     break 
    case 'h2': c_content.className='c_h2'
     break
    case 'h3': c_content.className='c_h3'
      break
    case 'h4': c_content.className='c_h4'
      break
    case 'h5': c_content.className='c_h5'
      break 
    case 'h6': c_content.className='c_h6'
      break
    case 'h7': c_content.className='c_h7' 
      break
    default: alert('你输入的字体大小有误')
  }
}
```

最后写两个input，一个用来输入，一个用来触发函数。[最终效果可以看这里的demo](/demo/changesize.html)

回头看看，其实这个例子并没有什么可行性。首先没有必要采用输入字体的方式，只有 `7` 个大小可以采用选择嘛。其次，代码也不严谨，超过h7或者其他输入的判断没有考虑完全，包括大小写的区分:)当然作为一个基本了解 `css`、`html`、`js` 相互工作的例子还是可以的