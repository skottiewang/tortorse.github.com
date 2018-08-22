---
id: 58
title: 1个form,2个action
date: 2006-07-03T17:50:53+00:00
author: 愆伏
layout: post
permalink: /archives/58
aktt_notify_twitter:
  - 'no'
dsq_thread_id:
  - "3444279693"
categories:
  - 技术
tags:
  - 互联网
  - 前端
---
今天工作上正好用到,其实是个伪单点登录,只是把同一个表单发到不同的页面而已
  
先写2个函数,用来将action的url分开

```javascript
function firstFormSubmit () {
  document.form1.action = 'login.jsp' //这是第一个
  document.form1.submit()
}
function secondFormSubmit () {
  document.form1.action = 'chklogin.jsp' //这是第二个
  document.form1.username.value = form1.userid.value //name不同，以要把另外一个里面的value搞过来
  document.form1.password.value = form1.userpassword.value //密码也搞过来
  docuemnt.form1.submit()
}
```

表单如下:

```html
<form name=”form1″ method=”post” >
  <input name=”userid” type=”text” size=”17″ />
  <input name=”userpassword” type=”password” size=”17″ />
  <input name=”password” type=”hidden” size=”17″ />
  <input name=’aa’ type=’button’ value=”提交1″ onClick=firstFormSubmit()” />
  <input name=’bb’ type=’button’ value=”提交2″ onClick=secondFormSubmit() ‘>
</form>
```