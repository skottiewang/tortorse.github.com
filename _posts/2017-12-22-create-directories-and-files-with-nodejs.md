---
id: 872
title: 通过nodejs创建目录与文件
date: 2017-12-22T16:02:55+00:00
author: 愆伏

guid: https://www.tortorse.com/?p=872
permalink: /archives/872
categories:
  - 技术
---
## 1. 先引入文件操作类

```javascript
var fs = require('fs')
```


## 2. 定义要创建的文件夹

```javascript
const components = ['Accordion', 'ActionSheet', 'ActivityIndicator', 'Badge', 'Button', 'Calendar', 'Card', 'Carousel', 'Checkbox', 'DatePicker', 'DatePickerView', 'Drawer', 'Flex', 'Grid', 'Icon', 'ImagePicker', 'InputItem', 'List', 'ListView', 'LocaleProvider', 'Menu', 'Modal', 'NavBar', 'NoticeBar', 'Pagination', 'Picker', 'PickerView', 'Popover', 'Progress', 'PullToRefresh', 'Radio', 'Range', 'Result', 'SearchBar', 'SegmentedControl', 'Slider', 'Stepper', 'Steps', 'SwipeAction', 'Switch', 'TabBar', 'Tabs', 'Tag', 'TextareaItem', 'Toast', 'WhiteSpace', 'WingBlank']
```

## 3. 创建文件夹

```javascript
components.forEach(function(e){
  fs.mkdir(e,0777,function(err){
    if(err){
      console.log(err)
    } else {
      console.log(e + 'is created')
    }
  })
})
```

## 4. 创建文件夹下的README文件

```javascript
components.forEach(function(e){
  fs.appendFile(e+'/README.md','',function(err){
    if(err){
      console.log(err)
    } else {
      console.log(e + '\'s README.md is created')
    }
  })
})
```

## 5. 创建文件夹下的index文件

```javascript
components.forEach(function(e){
  fs.appendFile(e+'/index.js','',function(err){
    if(err){
      console.log(err)
    } else {
      console.log(e + '\'s index.js is created')
    }
  })
})
```

## 6. 创建文件夹下的Vue文件

```javascript
components.forEach(function(e) {
  fs.appendFile(e + '/' + e + '.vue', '', function(err) {
    if (err) {
      console.log(err)
    } else {
      console.log(e + '\'s ' + e + '.vue is created')
    }
  })
})
```

## 全部代码

```javascript
var fs = require('fs')

const components = ['Accordion', 'ActionSheet', 'ActivityIndicator', 'Badge', 'Button', 'Calendar', 'Card', 'Carousel', 'Checkbox', 'DatePicker', 'DatePickerView', 'Drawer', 'Flex', 'Grid', 'Icon', 'ImagePicker', 'InputItem', 'List', 'ListView', 'LocaleProvider', 'Menu', 'Modal', 'NavBar', 'NoticeBar', 'Pagination', 'Picker', 'PickerView', 'Popover', 'Progress', 'PullToRefresh', 'Radio', 'Range', 'Result', 'SearchBar', 'SegmentedControl', 'Slider', 'Stepper', 'Steps', 'SwipeAction', 'Switch', 'TabBar', 'Tabs', 'Tag', 'TextareaItem', 'Toast', 'WhiteSpace', 'WingBlank']

components.forEach(function(e){
  fs.mkdir(e,0777,function(err){
    if(err){
      console.log(err)
    } else {
      console.log(e + 'is created')
    }
  })
})

components.forEach(function(e){
  fs.appendFile(e+'/README.md','',function(err){
    if(err){
      console.log(err)
    } else {
      console.log(e + '\'s README.md is created')
    }
  })
})

components.forEach(function(e){
  fs.appendFile(e+'/index.js','',function(err){
    if(err){
      console.log(err)
    } else {
      console.log(e + '\'s index.js is created')
    }
  })
})

components.forEach(function(e) {
  fs.appendFile(e + '/' + e + '.vue', '', function(err) {
    if (err) {
      console.log(err)
    } else {
      console.log(e + '\'s ' + e + '.vue is created')
    }
  })
})
```

## 未尽事宜

1. 可以通过循环一次性创建
2. 首先遍历目录，如果发现已经创建的文件夹、文件则不再创建，只创建其他未被创建的
3. 文件的内容可以事先写入
4. 通过交互式方法完成输入