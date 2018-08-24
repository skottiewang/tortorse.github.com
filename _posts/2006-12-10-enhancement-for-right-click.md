---
id: 80
title: 给鼠标右键增加新建HTML、CSS文件功能
date: 2006-12-10T00:40:29+00:00
author: 愆伏

permalink: /archives/80
dsq_thread_id:
  - "3444278787"
categories:
  - 技术
tags:
  - 产品
  - 互联网
---
首先问从事网页设计的各位朋友一个问题：
你们平时是如何创建 `html` 文档的呢？
我一般是这样(图1)

![new file](/wp-content/uploads/200612/10_004532_1.jpg) 
  
然后将该文件的扩展名改 `.htm` 或 `.html`.

这样做的原因主要是因为自己机器配置本来就不高，又开了一些应用程序，此时如果打开一个 `IDE` 是相当的缓慢。
  
新建一个 `htm` 常常只是为了测试一个小效果，试完也就删了，用不着打开庞大的 `IDE`。
  
可是如果每次都这样新建文本文档再改名确实很不方便，而且一些固定的 `html` 元素还需要自己手动撰写。
  
那能不能像新建 `word` 文档那样，直接建立一个空的 `html` 文件呢？
  
当然可以！
  
1、首先为 `html` 和 `css` 文件各创建一个空白模板(我这里 [做好了一份](/wp-content/uploads/200612/10_010608_shellnew.zip))。并将其拷贝到系统的ShellNew文件夹下，如：

```shell
C:\WINDOWS\SHELLNEW\HTML.HTM
```
  
2、按下键盘上的<kbd>win</kbd> + <kbd>R</kbd>键进入运行框，输入 `regedit` (图2)

![regedit](/wp-content/uploads/200612/10_005231_2.jpg) 
  
3、进入注册表编辑器后，展开 `HKEY_CLASSES_ROOT` ,并找到 `.htm`项(图3)

![.htm](/wp-content/uploads/200612/10_005630_3.jpg)  
  
4、在.htm项上单击鼠标右键选择新建项，并将该项命名为 `ShellNew`(图4)

![item](/wp-content/uploads/200612/10_010038_4.jpg)
  
5、在 `ShellNew` 下新建一个字符串值，并将其命名为 `FileName` (图5)

![filename](/wp-content/uploads/200612/10_010418_5.jpg) 
  
6、双击该键值，填写 `htm` 模板存放地址，如：

```shell
C:\WINDOWS\SHELLNEW\HTML.HTM
```
7、CSS文件的创建类似
  
8、关闭注册表，在任意文件夹单击右键发现已可以增加这2种文件了(图6)

![create file](/wp-content/uploads/200612/10_011052_6.jpg)  

是不是很简单？新建 `html` 文件的操作也将变得更为便捷。
  
依次类推还可以创建 `.jsp`，`.php` 等等的新建菜单，这里不再赘述