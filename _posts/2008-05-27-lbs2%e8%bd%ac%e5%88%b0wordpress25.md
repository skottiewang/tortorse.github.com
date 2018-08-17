---
id: 146
title: LBS^2转到wordpress2.5
date: 2008-05-27T00:17:44+00:00
author: 愆伏
layout: post
guid: http://www.tortorse.com/archives/146
permalink: /archives/146
dsq_thread_id:
  - "3444279195"
categories:
  - 技术
tags:
  - 互联网
  - wordpress
---
从03年写博客到现在已经5年了，第一年用的BSP是blogcn的。第二年由于学校提供免费的blog空间，于是就换成了猪飞飞的D-log，并按照[破废墟](http://poorfish.cn/)写的文章进行了一定的修改。由于D-log的一些漏洞难于修补，遂换到了loveyuki的L-blog。Sic在L-blog的基础上写了LBS^2,06年初我开始使用此系统至今。

LBS其实是个不错的单用户博客系统，如果不是不支持xml-RPC加上我asp空间到期的话，我也不会下这个决定。经过半天的努力，终于尘埃落定。LBS^2完美的换成了wordpress2.5。(鼓掌)

可能会有其他的朋友也有这样的打算，或者在迁移的过程中遇到了问题。我把迁移的过程写下来，希望能起到一些作用。

首先最好在本地搭建测试环境，远程调试的话比较麻烦。本地需要搭建的环境包括asp和php两部分。asp环境使用IIS搭建，用于运行LBS^2；php环境我使用的是WAMP(包含了php及mysql)用于运行wordpress。

在环境搭建好了以后，我们使用[转换程序](http://www.tortorse.com/wp-content/uploads/2008/05/convert.zip)进行数据库转换。按照文件中的要求进行配置，然后将LBS的.mdb文件和convert.asp放在相应目录中，使用本地asp环境运行convert.asp得到一个SQL文件，这个文件内容需要替换，具体参见本文结尾的参考文章。

这时候在php环境里面安装wordpress的2.0.7版本，下载地址是：<http://wordpress.org/wordpress-2.0.7.zip>，具体安装不在赘述。安装完毕后使用本地的mysql命令行进行导入

<coolcode linenum="off">use wp数据库名
  
source 刚才导出的sql文件路径</coolcode>

这样数据LBS的数据就被导入了。不要使用phpmyadmin导入，否则会乱码。

事情到此已经离成功不远了，打开本地的php环境浏览下wordpress，怎么样？是不是都移过来了？

还不够，现在的wordpress还是2.0.7版本的，我们还要给它升个级。下载最新的2.5版，覆盖原来的2.0.7的文件。运行wordpress目录下的wp-admin/upgrade.php完成升级

到这里就完了吗?还没有！如果你比较在意原来的文章的话，建议使用301转向对原来的url进行转向。这个问题请参见本文结尾的参考文章。需要注意的是使用该文转向的必须激活Permalink插件，服务器必须支持rewrite并且开启了buffer_header(否则lbs-wp写不了 header)

非常感谢LBS2WP先驱们的努力

<!--more-->

本文主要参考的文章有2篇   
[LBS to WordPress2.1 完美攻略 &#8211; 姿态永恒](http://www.awflasher.com/blog/archives/670)   
[LBS转WordPress全攻略](http://my.donews.com/zola/2005/12/23/lbs%e8%bd%acwordpress%e5%85%a8%e6%94%bb%e7%95%a5/)

目前feed部分还是出错，尚未找到解决办法。有知道的朋友提点一下。

<del datetime="2008-05-27T01:35:33+00:00">feed杀手原来是coolcode插件</del>

把coolcode禁用了也不解决问题，怀疑是数据库编码问题。wp还真不让人省心啊

**2008-06-02更新**，使用feedsky烧录后的feed替代wp自己的feed，基本上确定是wp自身文件的问题，与数据库无关，只好等到下个版本更新时修正这个问题了