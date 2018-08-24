---
id: 885
title: Vue 事件参数传递
date: 2018-01-12T09:23:17+00:00
author: 愆伏

guid: http://www.tortorse.com/?p=885
permalink: /archives/885
categories:
  - 技术
---
## 1.  问题

### components

组件内部抛一个事件

```javascript
onChange (value) {
  this.$emit('OnChange', value)
}
```

### Page

外部使用时监听，并且执行一个回调

#### 1.1 什么都不传

```html
<tag @onChange="log"></tag>
<script>
  methods: {
    log (value) {
      console.log(value)
    }
  }
</script>
```

返回

```bash
value
```

#### 1.2  传字符串

```html
<tag @onChange="log('change')"></tag>
<script>
  methods: {
    log (value) {
      console.log(value)
    }
  }
</script>
```

返回

```bash
'change'
```

## 2. 期望达到的效果

既返回原始value，也返回字符串

```bash
'change' + value
```

## 3. 权宜之计

模板式写法无法做到，只能这样写

```html
<tag @onChange="log"></tag>
<script>
methods: {
  log (value) {
    console.log ('change' +  value)
  }
}
</script>
```

使用函数式组件也许可以，还没有尝试

## 4. 换种方法

把onChange本身传递的`value`作为函数的参数向下传递
```html
<tag @onChange="(value) => log('change'+value)"></tag>
<script>
methods: {
  log (value) {
    console.log (value)
  }
}
</script>
```

返回

```bash
'change' + value
```
