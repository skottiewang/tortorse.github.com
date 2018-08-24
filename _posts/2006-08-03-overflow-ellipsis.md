---
id: 67
title: 标题文字过长的截取
date: 2006-08-03T22:40:50+00:00
author: 愆伏

permalink: /archives/67
aktt_notify_twitter:
  - 'no'
categories:
  - 技术
tags:
  - 互联网
  - 前端
---
工作中经常碰到一些由于排版问题而无法显示完整的标题
  
如: 

- 这是一条新闻啊啊啊啊… 
- 这是一条新闻啊啊啊啊… 
- 这是一条新闻啊啊

最近正好遇到相关问题,总结出以下解决方法
  

  
## CSS:以前就用过,效果一般,仅ie6支持

```html
<style>
div {
  width: 100px;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
</style>
<div>
  我有多长我有多长我有多长我有多长我有多长我有多长
</div>
<div>
  我有多长我有多长我有多长我有多长我有多长我有多长
</div>
<div>
  我有多长我有多长我有多长我有多长我有多长我有多长
</div>
```

## javascript::今天上班时候搞的,原来js有substring啊

```html
<script language="JavaScript">
var str="有多长我有多长我有多长我有多长我有多长";
if (str.length<=5){
  document.write(str);
} else {
  document.write(str.substring(0,5)+"…");
}
</script>
```
  
## VBS:这个我也不了解,感觉和js类似

```vbscript
function phxLeft(s,u)
tempLeft=left(s,u)
Set regEx = New RegExp
regEx.Pattern="$[$^\x00-\xff$]$"
regEx.IgnoreCase = True
regEx.Global = True
Set Matches = regEx.Execute(tempLeft)
n=u-round(Matches.Count/2)
phxLeft=left(s,n)
end function
msgbox phxLeft("有多长我有多长我有多长我有多长我有多长",5)
msgbox phxLeft("abcdefgggsadabsnuh",10)
```
  
## asp:这个有问题,中英文混排就糟了,目前还没想到解决办法

```asp
text=rs("title") '将数据库字段值赋到某变量上 
i=20 '定义固定大小
if len(text)>i then '如果文本长度大于给定的值
text=left(text,i) '则提取前段的i位的字符串
response.write (text&”…”)
else
response.write (text)
end if
```