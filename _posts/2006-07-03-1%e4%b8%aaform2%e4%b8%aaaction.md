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
今天工作上正好用到.伪单点登录&#8230;.只是把同一个表单发到不同的页面而已
  
先写2个函数,用来将action的url分开

<coolcode lang="javascript">
  
<Script Language="JavaScript"><br />
 function aa1()<br />
 {<br />
 document.form1.action=&#8221;login.jsp&#8221;; //这是第一个<br />
 document.form1.submit();<br />
 }</p>


<p>
  function aa2()<br />
 {<br />
 document.form1.action=&#8221;chklogin.jsp&#8221;;//这是第二个<br />
 document.form1.username.value=form1.userid.value //name不同,所以要把另外一个里面的value搞过来<br />
 document.form1.password.value=form1.userpassword.value //密码也是一样要搞过来<br />
 document.form1.submit();<br />
 }<br />
 </Script><br />
</coolcode>
</p>


<p>
  <!--more-->表单如下:
  
  <br />
<coolcode lang="html">
</p>
<form name=”form1″ method=”post” >
<input name=”userid” type=”text” size=”17″ style=’width:120px;hengit:20;’>

<br />
<input name=”username” type=”hidden” size=”17″ style=’width:120px;hengit:20;’ ><br />
<input name=”userpassword” type=”password” size=”17″ class=’edit_css’ style=’width:120px;hengit:20;’><br />
<input name=”password” type=”hidden” size=”17″ style=’width:120px;hengit:20;’ ><br />
<input name=’aa’ type=’button’ value=”提交1″ onClick=”aa1()”><br />
<input name=’bb’ type=’button’ value=”提交2″ onClick=’aa2() ‘><br />
</coolcode></p>