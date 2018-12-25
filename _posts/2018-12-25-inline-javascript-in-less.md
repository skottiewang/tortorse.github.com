---
id: 982
title: vue项目中的less加入javascript报错
date: 2018-12-25T16:14:20+00:00
author: 愆伏
permalink: /archives/982
categories:
  - 技术
tags:
  - 前端
  - Vue
  - iView
---

```bash
inline JavaScript is not enabled. Is it set in your options ?
```

我在使用 `iView` 的自定义主题时出现了以上报错。

之前做 [ui-nuclear-mobile](https://ladybirddev.github.io/ui-nuclear-mobile/) 也发现过 `Ant Design` 有同样的 `issue`。

众所周知 `Ant Design` 官方只有 `React` 的实现，而基于 `vue` 的 `iview` 为什么也会有同样的错误，并且提示去 `Antd` 的 `github` 找解决方案，你应该能懂。

解决方案有2个：

1. 把 `less` 降级到 `2.x` 版本
2. 配置 `less-loader`，让其支持 `inline-javascript`

解决方案1，我验证过可行，社区里也无异议。

解决方案2，社区里常常这样说:

> 我明明配置了，为什么还是报错?

因为社区都是教你去配置 `webpack` :

```javascript
module.exports = {
  css: {
    loaderOptions: { // 向 CSS 相关的 loader 传递选项
      less: {
        javascriptEnabled: true
      }
    }
  }
}
```

打开自己的 `Vue` 项目一看，瞬间懵逼，哪里配置 `webpack` ?

通过猜，可以找到 `\build\webpack.base.conf.js`，里面是这样的

```javascript
module: {
  rules: [
    {
      test: /\.vue$/,
      loader: 'vue-loader',
      options: vueLoaderConfig
    }
    ...
  ]
}
```

这...没有 `less` 啊

这里请注意 `vueLoaderConfig`，这玩意儿是来自于 `/build/vue-loader.conf` 的

打开 `vue-loader.conf`，发现里面是：

```javascript
module.exports = {
  loaders: utils.cssLoaders({
    sourceMap: isProduction
      ? config.build.productionSourceMap
      : config.dev.cssSourceMap,
    extract: isProduction
  }),
  transformToRequire: {
    video: 'src',
    source: 'src',
    img: 'src',
    image: 'xlink:href'
  }
}
```

还是没有 `less` 啊，请注意 `utils.cssLoaders`，这是来自于 `/build/utils.js` 的

这里面有一段:

```javascript
return {
  css: generateLoaders(),
  postcss: generateLoaders(),
  less: generateLoaders('less'),
  sass: generateLoaders('sass', { indentedSyntax: true }),
  scss: generateLoaders('sass'),
  stylus: generateLoaders('stylus'),
  styl: generateLoaders('stylus')
}
```
看一下 `generateLoaders`，发现其第一个参数是`loader`,第二个参数是 `loaderOptions`

看到这里，差不多明白了。稍微改动一下，增加一个 `Option`

```javascript
return {
  css: generateLoaders(),
  postcss: generateLoaders(),
  less: generateLoaders('less', { javascriptEnabled: true }),
  sass: generateLoaders('sass', { indentedSyntax: true }),
  scss: generateLoaders('sass'),
  stylus: generateLoaders('stylus'),
  styl: generateLoaders('stylus')
}
```

感觉 `generateLoaders` 有哪里不对。

loader 的名字居然是靠 `loader + '-loader'` 这样匹配的啊?

不管那么多了，总结一下：

在 `Vue-cli` 2.x 的版本下用 `webpack` 模板创建的项目，如果要在 `less` 里支持 `inline-javascript`，请修改 `/build/utils.js` 中的 `cssLoaders` 的 `return` 部分。

> 虽然去改一个 `utils` 感觉很诡异, 但目前这是行之有效的方法