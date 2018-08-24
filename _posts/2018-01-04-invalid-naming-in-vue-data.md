---
id: 880
title: Vue Data里面下划线命名无效并报错
date: 2018-01-04T15:41:40+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=880
permalink: /archives/880
categories:
  - 技术
---
## 使用下划线命名

```javascript
data () {
  _checked: false
}
```

## 产生报错

> [Vue warn]: Property or method "_check" is not defined on the instance but referenced during render. Make sure that this property is reactive, either in the data option, or for class-based components, by initializing the property. See: https://vuejs.org/v2/guide/reactivity.html#Declaring-Reactive-Properties.

## 原因

> 以 _ 或 $ 开头的属性 不会 被 Vue 实例代理，因为它们可能和 Vue 内置的属性、API 方法冲突。你可以使用例如 vm.$data._property 的方式访问这些属性。

具体参考:[官方文档中的解释](https://cn.vuejs.org/v2/api/#data)

## 解决方法

按规矩办事

```javascript
data () {
  isChecked: false
}
```