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
从03年写博客到现在已经5年了，第一年用的BSP是blogcn的。第二年由于学校提供免费的 `blog` 空间，于是就换成了猪飞飞的 `D-log`，并按照 [破废墟](http://poorfish.cn/) 写的文章进行了一定的修改。由于 `D-log` 的一些漏洞难于修补，遂换到了 `loveyuki` 的 `L-blog`。`Sic` 在 `L-blog` 的基础上写了 `LBS^2`,06年初我开始使用此系统至今。

LBS其实是个不错的单用户博客系统，如果不是不支持 `xml-RPC` 加上我 `asp` 空间到期的话，我也不会下这个决定。经过半天的努力，终于尘埃落定。LBS^2完美的换成了 `wordpress2.5`。(鼓掌)

可能会有其他的朋友也有这样的打算，或者在迁移的过程中遇到了问题。我把迁移的过程写下来，希望能起到一些作用。

首先最好在本地搭建测试环境，远程调试的话比较麻烦。本地需要搭建的环境包括 `asp` 和 `php` 两部分。`asp` 环境使用 `IIS` 搭建，用于运行 `LBS^2`；`php` 环境我使用的是 `WAMP` (包含了 `php` 及 `mysql`)用于运行 `wordpress`。

在环境搭建好了以后，我们使用 [转换程序](/wp-content/uploads/2008/05/convert.zip) 进行数据库转换。按照文件中的要求进行配置，然后将 `LBS` 的 `.mdb` 文件和`convert.asp` 放在相应目录中，使用本地 `asp` 环境运行`convert.asp` 得到一个 `SQL` 文件，这个文件内容需要替换，具体参见本文结尾的参考文章。

这时候在php环境里面安装 `wordpress` 的 `2.0.7` 版本，下载地址是：<http://wordpress.org/wordpress-2.0.7.zip>，具体安装不在赘述。安装完毕后使用本地的 `mysql` 命令行进行导入

```bash
$ use {wordpress的数据库名}
$ source {之前导出的sql路径}
```

这样数据LBS的数据就被导入了。不要使用 `phpmyadmin` 导入，否则会乱码。

事情到此已经离成功不远了，打开本地的 `php` 环境浏览下 `wordpress`，怎么样？是不是都移过来了？

还不够，现在的 `wordpress` 还是2.0.7版本的，我们还要给它升个级。下载最新的 `2.5` 版，覆盖原来的 `2.0.7` 的文件。运行 `wordpress` 目录下的 `wp-admin/upgrade.php` 完成升级

到这里就完了吗?还没有！如果你比较在意原来的文章的话，建议使用 `301` 转向对原来的 `url` 进行转向。这个问题请参见本文结尾的参考文章。需要注意的是使用该文转向的必须激活 `Permalink` 插件，服务器必须支持 `rewrite` 并且开启了 `buffer_header` ( 否则 `lbs-wp` 写不了 `header` )

非常感谢 `LBS2WP` 先驱们的努力


本文主要参考的文章有2篇
- [LBS to WordPress2.1 完美攻略 &#8211; 姿态永恒](http://www.awflasher.com/blog/archives/670)   
- [LBS转WordPress全攻略](http://my.donews.com/zola/2005/12/23/lbs%e8%bd%acwordpress%e5%85%a8%e6%94%bb%e7%95%a5/)

目前feed部分还是出错，尚未找到解决办法。有知道的朋友提点一下。

~~feed杀手原来是coolcode插件~~

把 `coolcode` 禁用了也不解决问题，怀疑是数据库编码问题。`wp` 还真不让人省心啊

***

2008-06-02更新

使用 `feedsky` 烧录后的 `feed` 替代 `wp` 自己的 `feed`，基本上确定是 `wp` 自身文件的问题，与数据库无关，只好等到下个版本更新时修正这个问题了