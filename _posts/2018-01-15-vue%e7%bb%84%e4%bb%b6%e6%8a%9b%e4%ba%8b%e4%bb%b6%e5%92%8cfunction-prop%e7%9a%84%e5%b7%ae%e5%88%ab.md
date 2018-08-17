---
id: 888
title: Vue组件抛事件和Function prop的差别
date: 2018-01-15T16:54:06+00:00
author: 愆伏
layout: post
guid: http://www.tortorse.com/?p=888
permalink: /archives/888
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
      <a href="#1_emit_event">1. emit event</a><ul>
        <li>
          <a href="#child_component">child component</a>
        </li>
        <li>
          <a href="#parent_component">parent component</a>
        </li>
      </ul>
    </li>
    
    <li>
      <a href="#2_props_function">2. props function</a><ul>
        <li>
          <a href="#child_component-2">child component</a>
        </li>
        <li>
          <a href="#parent_component-2">parent component</a>
        </li>
      </ul>
    </li>
    
    <li>
      <a href="#3">3. 实验结果和理解</a>
    </li>
    <li>
      <a href="#4">4. 可能的问题</a>
    </li>
  </ul>
</div>

## <span id="1_emit_event">1. emit event</span>

### <span id="child_component">child component</span><pre data-language=HTML>

<code class="language-markup ">&lt;template&gt;
  &lt;button @click="foo"&gt;Button&lt;/button&gt;
&lt;/template&gt;
&lt;script&gt;
export default {
  name: 'my-button',
  methods:{
    foo () {
      this.$emit('onClick')
    }
  }
}
&lt;/script&gt;
</code></pre> 

### <span id="parent_component">parent component</span><pre data-language=HTML>

<code class="language-markup ">&lt;template&gt;
  &lt;my-button @onClick="handleClick"&gt;&lt;/my-button&gt;
&lt;/template&gt;
&lt;script&gt;
import myButton from '@/components/myButton'
export default {
  components: { myButton }
  methods: {
    handleClick () {
      console.log('boo')
    }
  }
}
&lt;/script&gt;
</code></pre> 

## <span id="2_props_function">2. props function</span>

### <span id="child_component-2">child component</span><pre data-language=HTML>

<code class="language-markup ">&lt;template&gt;
  &lt;button @click="onClick"&gt;Button&lt;/button&gt;
&lt;/template&gt;
&lt;script&gt;
export default {
  name: 'my-button',
  props: {
    onClick: {
      type: Function
    }
  }
}
&lt;/script&gt;
</code></pre> 

### <span id="parent_component-2">parent component</span><pre data-language=HTML>

<code class="language-markup ">&lt;template&gt;
  &lt;my-button :onClick="handleClick"&gt;&lt;/my-button&gt;
&lt;/template&gt;
&lt;script&gt;
import myButton from '@/components/myButton'
export default {
  components: { myButton }
  methods: {
    handleClick () {
      console.log('boo')
    }
  }
}
&lt;/script&gt;
</code></pre> 

## <span id="3">3. 实验结果和理解</span>

`父组件`不知道事件什么时候会发生，因为事件的监听和处理都在`子组件`里

`子组件`不知道`父组件`在事件发生后干什么，因为干什么是执行的`父组件`里的method

`子组件`要求`父组件`提供一个Callback函数，当事件发生时`子组件`去回调`父组件`提供的Callback函数

两种方式的运行结果是一样的，写法上和理解上有差别。

  1. 在emit的情况下 
    父组件能够监听到事件的发生，并且决定在事件发生时做什么

  2. 在props的情况下
    
    父组件不知道事件发生与否，只能指令子组件在发生时做什么处理

## <span id="4">4. 可能的问题</span>

  1. 是否存在父组件要对子组件产生的事件进行搜集并处理? 第二种方式可能就歇菜
  2. 第二种方式对传入的Function内部是无法校验的，不过第一种也只是回避，本来就不校验