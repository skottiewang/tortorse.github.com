---
id: 978
title: 低成本打造个人独立博客
date: 2018-09-14T17:29:20+00:00
author: 愆伏
permalink: /archives/978
categories:
  - 技术
tags:
  - 博客
---

## 写在前面

如果你比较幸运看到了这篇文章，说明已经不需要我为你解释「为什么要写博客」，我也默认认为你知道「什么是博客」。如果你对「独立博客」这个概念不是很明白的话，可以自行`百度`或 `google`。

搭建独立博客有很多不同的办法，以下所述是我目前认为成本最低的一种方式。如果你发现还有其他成本更低的方式，欢迎在本文留下评论。

## 注册`github`

[github](http://github.com) 是全球最大的男性交友网站，它和「博客」好像没什么关系。但是它提供了一个 pages 服务，这个我们需要用到，并且这个服务是 `免费` 的。

那么现在开始注册吧-> [注册github](https://github.com/join?source=header-home)

既然是低成本，所以我们选择 `Plan` 的时候都选 个人(individual)/免费(free)/公开(public) 字眼的，这些不收费。

注册完了以后，`github`会给你发一封确认邮件，这个不重要。

重新打开 <https://github.com> 选择 `Sign In`, 用你的帐户登录进去。然后会看到一些提示，现在不用太关心。我们继续下一步。

## 创建博客仓库

「仓库」在 `github` 里是表明存放代码的地方，我们写博客不用理解这些。

这个时候你有两个选择：

1. 自己创建一个空仓库，然后自己部署 `jekyll`
2. 使用一个现成的模板，直接开始写博客

如果你只是想写博客，而不想折腾的话。选 `2`

好，你已经选择了`2`，请访问-> [jekyll-theme-next](https://github.com/simpleyyt/jekyll-theme-next)

点击右上角的那个「弹弓」一样的 `fork` 按钮, 稍等片刻，这个模板会被自动拷贝到你的名下，而且页面也会跳转到你自己的「仓库」中。

找到页面中的 `⚙ Settings` 找到 `Repository name`，在输入框内输入

```bash
你的github帐户名.github.com
```

比如我的`github用户名`是`tortorse`，这里就填

```bash
tortorse.github.com
```

不要只填用户名，后面的`github.com`也需要，这个和你后面产生的域名有关。

## 启用`Github pages`

页面向下滚动，找到 `GitHub Pages` 下面有个 `Source`,这时候你有4个选择

1. gh-pages branch
2. master branch
3. master branch /docs folder
4. none

如果你一句也看不懂，请继续选 `2`，然后点击 `Save`

这个时候不要乱点、乱滚页面，还是找到`GitHub Pages` 部分，你会发现一段被浅蓝色包裹的字

```bash
Your site is ready to be published at http://你的用户名.github.io
```

点击这个字里面的链接，这就是你博客的地址，你会发现这个博客不是你的，并且里面好像已经有人写过文章了?

不要惊慌，这些都是正常的。因为我们还没有对模板进行设置，那几篇文章是模板自带的。

## 配置博客模板

配置模板同样也有很多种办法，现在你又有了2个选择

1. 使用`github`在线配置
2. 使用本地配置，使用本地配置需要你会使用 `git` 你会吗？

选 `2`, 你一定要选 `1` 也可以，可以参考下面的 `本地备份`，现在我们按 `1` 来

回到 `github` ，在 `repository` 里找到你刚刚建的 `你的github用户名.github.com` 。找不到？仔细找!

进入以后会看到一堆文件和文件夹一样的东西，找到 `_config.yml` 点击它

进入该文件后，再点击右上角的 ✏️ 按钮编辑这个文件

里面一堆乱七八糟的东西看不明白，那请先查阅 [主题配置说明](http://theme-next.simpleyyt.com/getting-started.html)

先把博客名字改成你自己的，用我自己的配置举个🌰

```yaml
# Site
title: 愆伏 //写你的博客名字
subtitle: 互联网杂谈 //副标题
description: 一个浸淫互联网行业多年的斜杠中年，通过博客表达自己的所思所想以及所经历的历史进程 //博客简介
author: tortorse //作者名字
# Support language: de, en, fr-FR, id, ja, ko, pt-BR, pt, ru, zh-Hans, zh-hk, zh-tw
language: zh-Hans //使用中文
date_format: '%Y-%m-%d' //日期格式
```

改完以后发现保存要填好多东西啊，随便填，比如 

```bash
chore: 修改博客模板配置
```

然后点那个绿色的 `Commit Changes` 按钮, 稍微等一会你的博客就变成你的了。

## 开始写文章

现在你的博客已经搭建完毕，里面也有了文章。如果你不想继续写，这个博客就这样留在世界上好了。

哦，你要继续写啊，那你就和改配置采用同样的方法，找到 `_posts` 文件夹，这里面有几篇默认的文章，随便打开一篇，把里面的内容改成你的文章就好了。

你还要新增文章？

那就在`_posts`文件夹里 `Create new file` , 按照默认提供的几篇文章格式写就好了。

> 注意: 文件名都要类似 `2018-09-14博客名.md`，前面是日期，中间是博客名称(支持中文)，最后是文件格式 `.md`或`markdown`

每新增一个`.md`文件，你的博客就会多一篇文章。

Done.

你还想知道更多？ 下面的部分下次再写


## 本地备份

## 绑定域名

## 启用`HTTPS`

## 从`Wordpress`迁移

