---
id: 876
title: 使用sublime中的正则处理数据格式
date: 2017-12-29T13:47:05+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=876
permalink: /archives/876
categories:
  - 杂谈
---
具体的正则匹配规则请看[正则表达式30分钟入门教程](https://deerchao.net/tutorials/regex/regex.htm#mission)

## 源数据

一条`key:value`的数据

```javascript
'check': '<svg viewBox="0 0 44 44"><path fill-rule="evenodd" d="M34.538 8L38 11.518 17.808 32 8 22.033l3.462-3.518 6.346 6.45z"/></svg>'
```

## 目标数据

转换为一个html数据

```html
<symbol id="check" viewBox="0 0 44 44"><path fill-rule="evenodd" d="M34.538 8L38 11.518 17.808 32 8 22.033l3.462-3.518 6.346 6.45z"/></symbol>
```

## 思路

### 1.  把`svg`替换为`symbol`,并且去除`''`

```shell
find: svg
where: <currentFile>
replace: symbol
```

执行结果
```javascript
'check': '<symbol viewBox="0 0 44 44"><path fill-rule="evenodd" d="M34.538 8L38 11.518 17.808 32 8 22.033l3.462-3.518 6.346 6.45z"/></symbol>'
```

### 2.  把外面的`check`移动到`symbol`里面去，并填充在`viewBox`前面

```shell
find: '(.*)':[空格]'<symbol[空格]
where: <currentFile>
replace: <symbol id="$1"[空格]
```
> `[空格]`为实际空格

执行结果
```html
<symbol id="check"viewBox="0 0 44 44"><path fill-rule="evenodd" d="M34.538 8L38 11.518 17.808 32 8 22.033l3.462-3.518 6.346 6.45z"/></symbol>'
```

### 3. 清理
发现多了一个`'`，去除掉
```shell
find: symbol>'
where: <currentFile>
replace: symbol>
```

执行结果
```html
<symbol id="check" viewBox="0 0 44 44"><path fill-rule="evenodd" d="M34.538 8L38 11.518 17.808 32 8 22.033l3.462-3.518 6.346 6.45z"/></symbol>
```

## 多条数据

方法和单条一样，需要多处理一下换行`\n`

## 未尽事宜

能够一次操作完成替换