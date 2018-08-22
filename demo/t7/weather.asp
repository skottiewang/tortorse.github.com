<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<%
Session.CodePage = "65001"
Response.contentType="application/xml"
Response.Expires = 0
var N=Request("n")
var Num=Request("id")
var url="http://xml.weather.yahoo.com/forecastrss?p="+N+"&u=c&id="+Num;
var xmldoc=Server.CreateObject("Microsoft.Xmlhttp");
xmldoc.open('GET',url,false);
xmldoc.send(null);
var response = xmldoc.responseXML.documentElement;
var lastNode=response.selectNodes("//rss/channel/lastBuildDate");
var cityNode=response.selectNodes("//rss/channel/yweather:location");
var windNode=response.selectNodes("//rss/channel/yweather:wind");
var atmosphereNode=response.selectNodes("//rss/channel/yweather:atmosphere");
var astronomyNode=response.selectNodes("//rss/channel/yweather:astronomy");
var conditionNode=response.selectNodes("//rss/channel/item/yweather:condition");
var forecastNode=response.selectNodes("//rss/channel/item/yweather:forecast");
var lastV=lastNode(0).firstChild.nodeValue
//编辑属性
function attri(a,b,c){
        return a(b).attributes.getNamedItem(c).value
}
var cityV=attri(cityNode,0,"city")
var chillV=attri(windNode,0,"chill")
var directionV=attri(windNode,0,"direction")
var speedV=attri(windNode,0,"speed")
var humidityV=attri(atmosphereNode,0,"humidity")
var visibilityV=attri(atmosphereNode,0,"visibility")
var sunriseV=attri(astronomyNode,0,"sunrise")
var sunsetV=attri(astronomyNode,0,"sunset")
var textV=attri(conditionNode,0,"text")
var codeV=attri(conditionNode,0,"code")
var tempV=attri(conditionNode,0,"temp")
//转换英文为中文
var cityCH=EN2CH(cityV)
function EN2CH(obj){
        if(obj=="Wuhan"){return "武汉"}
        else if(obj=="Nanchang"){return "南昌"}
        else if(obj=="Haikou"){return "海口"}
        else if(obj=="Beijing"){return "北京"}
        else if(obj=="Shanghai"){return "上海"}
        else if(obj=="Guangzhou"){return "广州"}
        else if(obj=="Yinchuan"){return "银川"}
        else if(obj=="Zhengzhou"){return "郑州"}
        else if(obj=="Changsha"){return "长沙"}
        else if(obj=="Hangzhou"){return "杭州"}
		else if(obj=="Wenzhou"){return "温州"}
        else if(obj=="Hong Kong"){return "香港"}
        else if(obj=="Xin'an"){return "西安"}
        else if(obj=="Chengdu"){return "成都"}
        else if(obj=="Qingdao"){return "青岛"}
        else if(obj=="Guiyang"){return "贵阳"}
        else if(obj=="Jinan"){return "济南"}
        else if(obj=="Hefei"){return "合肥"}
        else if(obj=="Fuzhou"){return "福州"}
        else if(obj=="Nanjing"){return "南京"}
        else{return obj}
}
//风向函数
var windCH=wind(directionV)
function wind(a){
        if(a>337 && a<=360){return "北风"};
        else if(a>=0 && a<=22){return "北风"};
        else if(a>22 && a<=67){return "东北风"};
        else if(a>67 && a<=112){return "东风"};
        else if(a>112 && a<=157){return "东南风"};
        else if(a>157 && a<=202){return "南风"};
        else if(a>202 && a<=247){return "西南风"};
        else if(a>247 && a<=292){return "西风"};
        else if(a>292 && a<=337){return "西北风"};
}
//能见度函数
visibility=vis(visibilityV)
function vis(a){
        return a/100
}
//转换天气为中文
var textCH=tEN2CH(textV)
function tEN2CH(obj){
        if(obj=="Clear"){return "晴朗"}
        else if(obj=="Sunny"){return "晴天"}
        else if(obj=="Partly Cloudy"){return "局部有云"}
        else if(obj=="Mostly Clear"){return "晴"}
        else if(obj=="Mostly Sunny"){return "小云"}
        else if(obj=="Mostly Cloudy"){return "多云"}
        else if(obj=="Cloudy"){return "云"}
        else if(obj=="Sunny/Wind"){return "晴转云"}
        else if(obj=="AM Clouds/PM Sun/Wind"){return "云转晴"}
        else if(obj=="AM Showers"){return "晨雨"}
		else if(obj=="Fog"){return "雾"}
		else if(obj=="Haze"){return "霾"}
		else if(obj=="Rain"){return "雨"}
		else if(obj=="Showers"){return "阵雨"}
		else if(obj=="Light Rain Late"){return "午后小雨"}
        else{return obj}
}
//天气图片
var weaNum=weaimg(codeV)
function weaimg(obj){
        return "<img src=\"t7/52/"+obj+"\.gif\" />"
}
//星期替换
function dayEn(obj){
        if(obj=="Sun"){return "星期曰"}
        else if(obj=="Mon"){return "星期一"}
        else if(obj=="Tue"){return "星期二"}
        else if(obj=="Wed"){return "星期三"}
        else if(obj=="Thu"){return "星期四"}
        else if(obj=="Fri"){return "星期五"}
        else if(obj=="Sat"){return "星期六"}
        else{return obj}
}
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td rowspan="6" align="center"><%=cityCH%><br />
      <%=weaNum%><br />
      <%=textCH%></td>
    <td align="right">感觉：</td>
    <td align="center"><%=chillV%>&deg;</td>
  </tr>
  <tr style="background-color:#E6F5FF">
    <td align="right">实际：</td>
    <td align="center"><%=tempV%>&deg;</td>
  </tr>
  <tr>
    <td align="right">风向：</td>
    <td align="center"><%=windCH%></td>
  </tr>
  <tr style="background-color:#E6F5FF">
    <td align="right">风速：</td>
    <td align="center"><%=speedV%>Kph</td>
  </tr>
  <tr>
    <td align="right">湿度：</td>
    <td align="center"><%=humidityV%>%</td>
  </tr>
  <tr style="background-color:#E6F5FF">
    <td align="right">能见度：</td>
    <td align="center"><%=visibility%>km</td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td colspan="2" align="center" class="time"><%=lastV%></td>
  </tr>
  <tr style="background-color:#E6F5FF">
    <td>日出：<%=sunriseV%></td>
    <td>日落：<%=sunsetV%></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
<%
for(var i=0; i<2; i++){
        var dayV=attri(forecastNode,i,"day")
        var dateV=attri(forecastNode,i,"date")
        var lowV=attri(forecastNode,i,"low")
        var highV=attri(forecastNode,i,"high")
        var texttV=attri(forecastNode,i,"text")
        var codetV=attri(forecastNode,i,"code")
        var dayCH=dayEn(dayV)
        var texttCH=tEN2CH(texttV)
        var weabmp=weaimg(codetV)
        //var weatNum=weaimg(codetV)
%>
                <td align="center"><%=dayCH%><br /><%=weabmp%><br /><%=texttCH%><br />最高<%=highV%>&deg;<br />最低<%=lowV%>&deg;</td>
<%
}
%>
</tr>
</table>