---
id: 6
title: LBS的天气预报功能
date: 2006-01-20T17:52:02+00:00
author: 愆伏
layout: post
permalink: /archives/6
categories:
  - 技术
tags:
  - 产品
  - 互联网
---
## 使用iframe的话，方法就不多说了。

给几个现成的地址：

http://weather.news.qq.com/inc/ss244.htm

> qq的，界面大但功能全

http://weather.265.com/weather.htm
> 这个是根据IP显示地方的

## 另外一种就是利用xmlhttp了从别的网站上扒了。


使用方法:

* 先下载文件包 [天气预报程序包](/wp-content/uploads/200602/15_165128_t7.zip)
* 将文件包解压到LBS根目录下
* 打开global.asp，在适当的位置插入以下代码

```html
<script type="text/javascript" language="javascript" src="t7/weather.js"></script>
<div id="weather" class="panel">
  <h5>天气预报</h5>
  <div>
    <div>　城市：
      <select onChange="loadurl(this.value)" class="select">
        <option value="CHXX0166" selected="selected">镇江</option>
        <option value="CHXX0099">南京</option>
        <option value="CHXX0008">北京</option>
        <option value="CHXX0116">上海</option>
        <option value="CHXX0037">广州</option>
        <option value="CHXX0259">银川</option>
        <option value="CHXX0165">郑州</option>
        <option value="CHXX0013">长沙</option>
        <option value="CHXX0049">香港</option>
        <option value="CHXX0146">西安</option>
        <option value="CHXX0016">成都</option>
        <option value="CHXX0110">青岛</option>
        <option value="CHXX0039">贵阳</option>
        <option value="CHXX0064">济南</option>
        <option value="CHXX0448">合肥</option>
        <option value="CHXX0031">福州</option>
        <option value="CHXX0044">杭州</option>
        <option value="CHXX0138">武汉</option>
        <option value="CHXX0097">南昌</option>
        <option value="CHXX0502">海口</option>
        <option value="ITXX0042">米兰</option>
      </select>
      <span id="loadifo"></span>
      <div id="loading" style="PADDING-TOP: 5px; height:5px;" align="center">
        <img alt="加载天气中" src="t7/loading.gif" border="0" />
        <script type="text/javascript">
          setTimeout("loadurl('CHXX0099')", 2500)
        </script>
      </div>
    </div>
    <div id="prolist"></div>
  </div>
</div>
```