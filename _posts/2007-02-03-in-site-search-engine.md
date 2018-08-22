---
id: 87
title: 替换LBS站内搜索为google/baidu引擎
date: 2007-02-03T10:10:58+00:00
author: 愆伏
layout: post
permalink: /archives/87
categories:
  - 技术
tags:
  - 产品
  - 互联网
---
LBS自带的搜索其实做的不错，但由于不是全文检索并存在日文字符溢出的问题，我决定把它换掉。
  
为了操作方便，准备使用现成的站内搜索引擎代码。还好百度和`google` 都提供有相应的代码。

![search](/wp-content/uploads/200702/03_110939_goodu.jpg)

## 1.百度的：
  
```html
<form action="http://www.baidu.com/baidu" target="_blank">
  <table bgcolor="#FFFFFF">
    <tbody>
    <tr>
      <td>
        <input name="tn" type="hidden" value="baidu"><br>
        <a href="http://www.baidu.com/"><img src="http://img.baidu.com/img/logo-80px.gif" alt="Baidu" align="bottom" border="0"></a><br>
        <input type="text" name="word" size="30"><br>
        <input type="submit" value="百度搜索">
      </td>
    </tr>
    </tbody>
  </table>
</form>
```
  
如果你不需要百度的logo的话，可以把

```html
<a href="http://www.baidu.com/"><img src="http://img.baidu.com/img/logo-80px.gif" alt="Baidu" align="bottom" border="0"></a><br>
```
去除

表单的样式也可以自行定义，你可以直接给 `<form>` 添加一个 `id`
  
例如：
  
```html
<form action="http://www.baidu.com/baidu" target="_blank" id="searchBar">
```
然后在你使用的css中，可以对 `searchBar`及其下的元素进行定义，如：

```css
#searchBar table{
  background:#f4f4f4;font-size:12px;
}
```

诸如此类。。。

改好之后，把它放在global.asp中合适的位置即可

## `google` 的

```html
<table bgcolor="#FFFFFF">
  <tbody>
  <tr>
    <td>
    <a href="http://www.google.com/intl/zh-CN/"><br>
    <img src="http://www.google.com/logos/Logo_40wht.gif" border="0" alt="Google" align="absmiddle"></a><br>
    <input type="text" name="q" size="31" maxlength="255" value=""><br>
    <input type="hidden" name="ie" value="GB2312"><br>
    <input type="hidden" name="oe" value="GB2312"><br>
    <input type="hidden" name="hl" value="zh-CN"><br>
    <input type="submit" name="btnG" value="Google 搜索">
    </td>
  </tr>
  </tbody>
</table>
```

和百度的一样，放在gloabal.asp里合适的位置就可以了