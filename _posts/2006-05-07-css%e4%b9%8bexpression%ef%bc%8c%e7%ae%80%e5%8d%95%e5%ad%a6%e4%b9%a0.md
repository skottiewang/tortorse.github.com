---
id: 49
title: CSS之Expression，简单学习
date: 2006-05-07T16:09:45+00:00
author: 愆伏
layout: post
permalink: /archives/49
aktt_notify_twitter:
  - 'no'
categories:
  - 技术
tags:
  - 互联网
  - 前端
---
之前看过一篇《CSS的Expression，尚难拥抱》，揣测这东东一定不太好用。最近又看到有关的东西，记录下来就当学习吧。

## 定义：

> IE5及其以后版本支持在CSS中使用expression，用来把CSS属性和Javas cript表达式关联起来，这里的CSS属性可以是元素固有的属性，也可以是自定义属性。就是说CSS属性后面可以是一段Javas cript表达式，CSS属性的值等于Javas cript表达式计算的结果。 在表达式中可以直接引用元素自身的属性和方法，也可以使用其他浏览器对象。这个表达式就好像是在这个元素的一个成员函数中一样。
    
> 给元素固有属性赋值 

例如，你可以依照浏览器的大小来安置一个元素的位置。

<pre><code class="language-css ">#myDiv {
position: absolute;
width: 100px;
height: 100px;
left: expression(document.body.offsetWidth - 110 + "px");
top: expression(document.body.offsetHeight - 110 + "px");
background: red;
}
</code></pre>

给元素自定义属性赋值
  
例如，消除页面上的链接虚线框。 通常的做法是：<pre data-language=HTML>

<code class="language-markup ">&lt;a href="link1.htm" onfocus="this.blur()"&gt;link1&lt;/a&gt;
&lt;a href="link2.htm" onfocus="this.blur()"&gt;link2&lt;/a&gt;
&lt;a href="link3.htm" onfocus="this.blur()"&gt;link3&lt;/a&gt;
</code></pre> 

粗看或许还体现不出采用expression的优势，但如果你的页面上有几十甚至上百个链接，这时的你难道还会机械式地Ctrl+C，Ctrl+V么，何况两者一比较，哪个产生的冗余代码更多呢？
  
采用expression的做法如下：<pre data-language=HTML>

<code class="language-markup ">&lt;style type="text/css"&gt;
a {star : expression(onfocus=this.blur)}
&lt;/style&gt;
&lt;a href="link1.htm"&gt;link1&lt;/a&gt;
&lt;a href="link2.htm"&gt;link2&lt;/a&gt;
&lt;a href="link3.htm"&gt;link3&lt;/a&gt;
</code></pre> 

说明：里面的star就是自己任意定义的属性，你可以随自己喜好另外定义，接着包含在expression()里的语句就是JS脚本，在自定义属性与expression之间可别忘了还有一个引号，因为实质还是CSS，所以放在style标签内，而非s cript内。OK，这样就很容易地用一句话实现了页面中的链接虚线框的消除。不过你先别得意，如果触发的特效是CSS的属性变化，那么出来的结果会跟你的本意有差别。例如你想随鼠标的移进移出而改变页面中的文本框颜色更改，你可能想当然的会认为应该写为<pre data-language=HTML>

<code class="language-markup ">&lt;style type="text/css"&gt;
input
{star : expression(onmouseover=this.style.backgroundColor="#FF0000";
onmouseout=this.style.backgroundColor="#FFFFFF")}
&lt;/style&gt;
&lt;style type="text/css"&gt;
input {star : expression(onmouseover=this.style.backgroundColor="#FF0000";
onmouseout=this.style.backgroundColor="#FFFFFF")}
&lt;/style&gt;
&lt;input type="text"&gt;
&lt;input type="text"&gt;
&lt;input type="text"&gt;
</code></pre> 

可结果却是出现脚本出错，正确的写法应该把CSS样式的定义写进函数内，如下所示：<pre data-language=HTML>

<code class="language-markup ">&lt;style type="text/css"&gt;
input {star : expression(onmouseover=function()
{this.style.backgroundColor="#FF0000"},
onmouseout=function(){this.style.backgroundColor="#FFFFFF"}) }
&lt;/style&gt;
&lt;input type="text"&gt;
&lt;input type="text"&gt;
&lt;input type="text"&gt; 
</code></pre>