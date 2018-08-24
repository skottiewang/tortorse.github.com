---
id: 910
title: 数组转成字符串(css 属性)
date: 2018-04-11T17:51:30+00:00
author: 愆伏

guid: http://www.tortorse.com/?p=910
permalink: /archives/910
categories:
  - 技术
---
`css`里面有不少简写的属性，比如

```css
padding: 10px 2px 12px 4px
```

那么如果是通过`js`的数组来表达

```javascript
[10, 2, 12, 4]
```

从`js`转成`css`

```javascript
Array.from([10,2,12,4],x => x + 'px').toString().replace(/,/g, ' ')
// 10px 2px 12px 4px 
```