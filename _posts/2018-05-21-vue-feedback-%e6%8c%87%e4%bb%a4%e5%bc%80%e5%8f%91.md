---
id: 932
title: vue feedback 指令开发
date: 2018-05-21T11:48:47+00:00
author: 愆伏
layout: post
guid: http://www.tortorse.com/?p=932
permalink: /archives/932
categories:
  - 技术
tags:
  - vue
---
<div id="toc_container" class="no_bullets">
  <p class="toc_title">
    Contents
  </p>
  
  <ul class="toc_list">
    <li>
      <a href="#i">功能需求</a>
    </li>
    <li>
      <a href="#i-2">为什么要使用指令方式</a><ul>
        <li>
          <a href="#1">1. 直接使用组件</a>
        </li>
        <li>
          <a href="#2">2. 使用混合</a>
        </li>
      </ul>
    </li>
    
    <li>
      <a href="#i-3">实现思路</a>
    </li>
    <li>
      <a href="#i-4">优化及未尽事宜</a>
    </li>
  </ul>
</div>

## <span id="i">功能需求</span><pre data-language=HTML>

<code class="language-markup ">&lt;template&gt;
  &lt;span v-feedback="{activeClass:'span-active'}"&gt;&lt;/span&gt;
&lt;/template&gt;
&lt;style&gt;
.span-active {
  background: #000;
}
&lt;/style&gt;
</code></pre> 

当该`span`被点时，`.span-active`生效。此处`span`可以是任意的`html`元素或`组件`

以鼠标操作举例，所谓的点是指左键被按下，按下时样式生效，松开后失效

## <span id="i-2">为什么要使用指令方式</span>

### <span id="1">1. 直接使用组件</span><pre data-language=HTML>

<code class="language-markup ">&lt;feedback :active="{activeClass: 'span-active'}"&gt;
  &lt;span&gt;&lt;/span&gt;
&lt;/feedback&gt;
</code></pre> 

由于`vue`的组件必须包含一个根节点，实际上是<pre data-language=HTML>

<code class="language-markup ">&lt;div class="span-active"&gt;
  &lt;span&gt;&lt;/span&gt;
&lt;/div&gt;
</code></pre> 

此时出现了尴尬，`span`本身是一个`inline`元素，加上`feedback`后变成了`block`，并且`feedback`被使用的时候并不知道`slot`进来的元素是什么，如果要知道势必又要增加复杂度。

### <span id="2">2. 使用混合</span><pre data-language=HTML>

<code class="language-markup ">&lt;template&gt;
  &lt;span&gt;&lt;/span&gt;
&lt;/template&gt;
&lt;script&gt;
import feedback from '@/components/feedback.js'
export default {
  mixin: {
    feedback
  },
  data () {
    return {
      activeClassName: 'span-active'
    }
  }
}
&lt;/script&gt;
</code></pre> 

`mixin`是当前使用的方式，但是对使用人员要求更高，需要同时知道两个组件的内部实现。

## <span id="i-3">实现思路</span>

该指令需要干以下几件事：

  1. 为绑定指令的组件添加点击的监听，包括`mouseup`、`mousedown`、`touchestart`、`touchend`、`touchcancel`
  2. 当事件发生时，为元素添加相应的`activeClass`
  3. 当元素本身是`disabled`的时候，去除样式的响应，实际上是去除监听

初始化的时候，先获得绑定的元素，并且添加监听器。在监听到有关事件的时候，添加、删除样式<pre data-language=>

<code class="language-javascript ">export default {
  bind (el, binding) {
    const className = binding.value.activeClass
    const disabled = !!binding.value.disabled
    if (!disabled) {
      el.addEventListener('mousedown', ()=&gt; {el.classList.add(className)})
      el.addEventListener('touchstart',  ()=&gt; {el.classList.add(className)})
      el.addEventListener('touchcancel',  ()=&gt; {el.classList.remove(className)})
      el.addEventListener('touchend',  ()=&gt; {el.classList.remove(className)})
      el.addEventListener('mouseup',  ()=&gt; {el.classList.remove(className)})
    }
  }
}
</code></pre> 

到此时，一切都很美好。

在实际应用中，这个组件极有可能点击后发生了改变，比如从`!disabled`转为了`disabled`状态，需要我们对其进行进一步处理。这个看起来很简单，`!disabled`看起来并不需要处理，原来的事件应该保留。只有`disabled`的状况需要把原有的监听器去除掉。<pre data-language=>

<code class="language-javascript ">export default {
  bind (el, binding) {
    const className = binding.value.activeClass
    const disabled = !!binding.value.disabled
    if (!disabled) {
      el.addEventListener('mousedown', ()=&gt; {el.classList.add(className)})
      el.addEventListener('touchstart',  ()=&gt; {el.classList.add(className)})
      el.addEventListener('touchcancel',  ()=&gt; {el.classList.remove(className)})
      el.addEventListener('touchend',  ()=&gt; {el.classList.remove(className)})
      el.addEventListener('mouseup',  ()=&gt; {el.classList.remove(className)})
    }
  },
  componentUpdated (el, binding) {
    const className = binding.value.activeClass
    const disabled = !!binding.value.disabled
    if (disabled) {
      el.removeEventListener('mousedown', ()=&gt; {el.classList.add(className)})
      el.removeEventListener('touchstart',  ()=&gt; {el.classList.add(className)})
      el.removeEventListener('touchcancel',  ()=&gt; {el.classList.remove(className)})
      el.removeEventListener('touchend',  ()=&gt; {el.classList.remove(className)})
      el.removeEventListener('mouseup',  ()=&gt; {el.classList.remove(className)})
    }
  }
}
</code></pre> 

运行后，发现监听器没有被去除掉，因为 [removeEventListener](https://developer.mozilla.org/zh-CN/docs/Web/API/EventTarget/removeEventListener) 应该移除之前添加的监听器，因为使用了箭头函数，所以后面的监听器并不是之前的监听器。那我们把箭头函数换成统一的函数<pre data-language=>

<code class="language-javascript ">function addClass (el, className) {
  el.classList.add(className)
}

function removeClass (el, className) {
  el.classList.remove(className)
}

export default {
  bind (el, binding) {
    const className = binding.value.activeClass
    const disabled = !!binding.value.disabled
    if (!disabled) {
      el.addEventListener('mousedown', addClass(el, className))
      el.addEventListener('touchstart',  addClass(el, className))
      el.addEventListener('touchcancel',  removeClass(el, className))
      el.addEventListener('touchend',  removeClass(el, className))
      el.addEventListener('mouseup',  removeClass(el, className))
    }
  },
  componentUpdated (el, binding) {
    const className = binding.value.activeClass
    const disabled = !!binding.value.disabled
    if (disabled) {
      el.removeEventListener('mousedown', addClass(el, className))
      el.removeEventListener('touchstart',  addClass(el, className))
      el.removeEventListener('touchcancel',  removeClass(el, className))
      el.removeEventListener('touchend',  removeClass(el, className))
      el.removeEventListener('mouseup',  removeClass(el, className))
    }
  }
}
</code></pre> 

报错了，想当然是不行的。[addEventListener](https://developer.mozilla.org/zh-CN/docs/Web/API/EventTarget/addEventListener) 的第二个参数

> `listener` 必须是一个实现了 [`EventListener`](https://developer.mozilla.org/zh-CN/docs/Web/API/EventListener) 接口的对象，或者是一个[函数](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Functions) 

如果只传入函数，那又产生了一个问题，`addClass`、`removeCLass`无法取得`el`和`className`的。这里面还存在一个作用域的问题。最后想了一个办法，就是利用`eventTarget`来替代`el`，并且把`className`放在Dom上。<pre data-language=>

<code class="language-javascript ">function addClass (event) {
  const el = event.currentTarget
  const className = event.currentTarget.getAttribute('data-active-class')
  el.classList.add(className)
}

function removeClass (event) {
  const el = event.currentTarget
  const className = event.currentTarget.getAttribute('data-active-class')
  el.classList.remove(className)
}

function feedback (el, className, option) {
  el.setAttribute('data-active-class', className)
  if (option === 'add') {
    el.addEventListener('mousedown', addClass)
    el.addEventListener('touchstart', addClass)
    el.addEventListener('touchcancel', removeClass)
    el.addEventListener('touchend', removeClass)
    el.addEventListener('mouseup', removeClass)
  } else if (option === 'remove') {
    el.removeEventListener('mousedown', addClass)
    el.removeEventListener('touchstart', addClass)
    el.removeEventListener('touchcancel', removeClass)
    el.removeEventListener('touchend', removeClass)
    el.removeEventListener('mouseup', removeClass)
  }
}
export default {
  bind (el, binding) {
    const className = binding.value.activeClass
    const disabled = !!binding.value.disabled
    if (!disabled) {
      feedback(el, className, 'add')
    }
  },
  componentUpdated (el, binding) {
    const className = binding.value.activeClass
    const disabled = !!binding.value.disabled
    const oldDisabled = !!binding.oldValue.disabled
    if (oldDisabled !== disabled) {
      if (disabled) {
        feedback(el, className, 'remove')
      } else {
        feedback(el, className, 'add')
      }
    }
  },
  unbind (el, binding) {
    const className = binding.value.activeClass
    feedback(el, className, 'remove')
  }
}
</code></pre> 

## <span id="i-4">优化及未尽事宜</span>

  1. disabled是不是可以不通过指令传入
  2. 把监听和添加样式从`el`转到`vnode`上