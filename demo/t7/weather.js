// JavaScript Document
function btnSty(objId,objStyle)
{
	document.getElementById(objId).style.display = objStyle
}
//提示窗口控制
function ifodis(){
	btnSty('loadifo','none');
}
function loading(){
	btnSty('loading','none');
}
function settime(a){
	setTimeout(a,1000);
}
function loadtime(){
	loadifo.innerHTML += "."
}
//XML数据绑定
var xmldoc = false;
function loadurl(n){
//生成随机数，同时限制刷新次数
	var now=new Date();
	var Num=now.valueOf();
//定义往址参数
	url = "t7/weather.asp?n="+n+"&id="+Num;
//定义为异步传输模式
	xmldoc = false;
//Mozill,Safari等浏览器时需要创建的XMLHttp类
	if(window.XMLHttpRequest){
		xmldoc = new XMLHttpRequest();
		if(xmldoc.overrideMimeType){
				xmldoc.overrideMimeType('text/xml');
		}
	}
//IE浏览器时创建的XMLHttp类
	else if(window.ActiveXObject){
		try{
			xmldoc = new ActiveXObject("Msxml3.XMLHTTP");
		}
		catch(e){
			try{
				xmldoc = new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch(e){
				try{
					xmldoc = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch(e){}
			}
		}
	}
//不能创建XMLHTTP类时返回
	if(! xmldoc){
		return false;
	}
//调用CheckState函数
	xmldoc.onreadystatechange = CheckState;
	xmldoc.open('GET',url,true);
	xmldoc.send(null);
}
//状态检测
function CheckState(){
	btnSty('loadifo','')
//收到完整的服务器响应
	if(xmldoc.readyState == 1){
		loadifo.innerHTML = " -正连接服务器.."
		}
	else if(xmldoc.readyState == 2){
		loadifo.innerHTML = " -开始加载数据.."
//加载提示窗口隐藏
		//settime(loading)
		setTimeout("btnSty('loading','none')",150);
		}
	else if(xmldoc.readyState == 3){
		loadifo.innerHTML = " -正在加载数据.."
		settime(loadtime)
		}
	else if(xmldoc.readyState == 4){
//HTTP服务器响应值成功
		if(xmldoc.status == 200){
//将服务器返回的字符串写到页面中ID为showdiv的区域
     		//loadifo.innerHTML = " - 加载完成..."
		 var response = xmldoc.responseText;
		 settime(ifodis)
		 prolist.innerHTML = response;
		}
		else{
			//loadifo.innerHTML = "错误"+xmldoc.statusText+"请重新选择";
			loadifo.innerHTML = "天气获取失败！";
		}
	}
}
if (top.location != self.location)top.location=self.location; 