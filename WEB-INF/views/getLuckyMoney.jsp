<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/shakeslow.css" rel="stylesheet" media="all">
<link href="css/shakehard.css" rel="stylesheet" media="all">
<link href="css/shakecrazy1.css" rel="stylesheet" media="all">
<link rel="stylesheet" href="css/get.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var i=0
var j=1
var t=0
var date=new Date();
var check=0
function createXHR(){
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
	    //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
	    xmlhttp=new XMLHttpRequest();
	}
	else
	{
	    // IE6, IE5 浏览器执行代码
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}
function getrecord(){
	document.getElementById('getresult').innerHTML="";
	var XHR=createXHR();
    XHR.open("GET","getrecord",true);
    XHR.onreadystatechange = function() { 
        if(XHR.readyState == 4) {
        	//忽略除DONE状态之外的所有状态  
            if (XHR.status >= 200 && XHR.status <300) {  
            		if(XHR.responseText!="1")
            			{ 		
            			document.getElementById('getresult').innerHTML=XHR.responseText;
            			}
            		else{
            			document.getElementById('getresult').innerHTML="您还没获得过红包哦";
            		}
            }
            else
            	document.getElementById('getresult').innerHTML="获取失败，请重试";
        }
        
    }
    XHR.send(null);
}
var q=0.0
function fade(){
	var obj=document.getElementById("redpacket");
	//alert(obj.style.opacity)
	if(q<1.0){
	q+=0.1
	obj.style.opacity=q
	}
	else{
		clearInterval(timer)
		q=0.0
	}
}
var timer=null;
function startget(){
	j=0
	var obj=document.getElementById("get");
	obj.style="DISPLAY:none"
	timer=setInterval(fade, 100);
	document.getElementById('1').innerHTML="狂按A键就有机会获得红包哦"
	document.getElementById('2').innerHTML=""	
}
function getmoney(){
	var XHR=createXHR();
    XHR.open("GET","getmoney",true);

    XHR.onreadystatechange = function() { 
        if(XHR.readyState == 4) {
        	//忽略除DONE状态之外的所有状态  
            if (XHR.status >= 200 && XHR.status <300) {  
            		if(XHR.responseText!="0")
            			{ 		
            			document.getElementById('1').innerHTML="恭喜您获得"+XHR.responseText+"红包";
            			j=1
            			var obj=document.getElementById("container");
            			obj.style.webkitAnimationDelay="0s";
            			var obj=document.getElementById("topcontent");
            			obj.style.webkitAnimationDelay="0s";
            			var obj=document.getElementById("description1");
            			obj.style.webkitAnimationDelay="0s";
            			var obj=document.getElementById("description2");
            			obj.style.webkitAnimationDelay="0s";
            			var obj=document.getElementById("bounceInDown");
            			obj.style.webkitAnimationDelay="0s";
            			var obj=document.getElementById("flash");
            			obj.style.webkitAnimationDelay="0s";
            			var obj=document.getElementById("text");
            			obj.style.webkitAnimationDelay="0s";
            			t=Math.ceil(Math.random()*10)+6
            			wait()
            			}
            		else{
            			document.getElementById('1').innerHTML="这次没抢到红包哦，别灰心，下次加油哦";
            			j=1
            			t=Math.ceil(Math.random()*10)+6
            			wait()
            		}
            }
        }
        else
        	document.getElementById('1').innerHTML="本次红包已发完，下波再来吧";
    }
    XHR.send(null);
}
function wait(){
	if(t>=0){
		document.getElementById('2').innerHTML="啊哦，冷却时间还有"+t+"秒，冷却过后即可再次抢红包哦"
		t--;
		setTimeout(wait,1000);
	}
	else
		{
		var obj=document.getElementById("get");
		obj.style="DISPLAY:block"
		document.getElementById('1').innerHTML=""
		document.getElementById('2').innerHTML=""
		}
}
setInterval(() => {
	if(i>0){
		var c=new Date().getTime();
		if(c-check<400){
		    i--;
		}else{
			if(i-5>=0)
				i=i-5;
			else
				i=0;
		}
		if(i<5){
			var obj=document.getElementById("redpacket");
			obj.className="shake-slow"
			obj.style.webkitAnimationDelay="0s";
			obj.style.webkitAnimationDuration=6000-i*1000+"ms"
		}
		else if(i<11){
			var obj=document.getElementById("redpacket");
			obj.className="shake-hard"
			obj.style.webkitAnimationDelay="0s";
			obj.style.webkitAnimationDuration="100ms"
		}
		else{
			var obj=document.getElementById("redpacket");
			obj.className="shake-crazy"
			obj.style.webkitAnimationDelay="0s";
			obj.style.webkitAnimationDuration=100-i*2+"ms"
		}
	}
	if(i<=0){
		var obj=document.getElementById("redpacket");
		obj.style.webkitAnimationDelay="100000s";
		obj.style.webkitAnimationDuration="11000ms"
	}
}, 300);
window.document.onkeydown = disableRefresh;
function disableRefresh(evt){
if(j==0){	
evt = (evt) ? evt : window.event
if (evt.keyCode) {
   if(evt.keyCode ==65){
	   check=new Date().getTime()
	 if(i==0){
		var obj=document.getElementById("redpacket");
		obj.style.webkitAnimationDelay="0s";
	 }
     i++;
     if(i==20){
    	 i=0;
    	 var obj=document.getElementById("redpacket");
			obj.style.webkitAnimationDelay="100000s";
			obj.style.opacity=0.0
		getmoney();
     }
   }
  
}
}
}

</script>
</head>
<body>
	<!--侧栏 -->
	<div style="float: left; width: 25%">
		<c:import url="leftPage.jsp"></c:import>
	</div>
	<div style="float: left; width: 75%;padding:30px">
		<!-- 此处往下输入自己的页面 -->
		<!-- 抢红包 -->
		<input type="button" value="点我抢红包" onclick="startget()" id="get">
		<div id="1"></div>
		<div id="2"></div>
		<div id="3"></div>
		<center>
			<img src="image/1.png" width="120px" style="opacity: 0"
				id="redpacket" name="redpacket" class="shake-hard">	
		</center>
		<!-- 抢红包 -->
		<!-- 获得红包 -->
	<div class="container" id="container">
		<div class="RedBox">
			<div class="topcontent">
				<h2 class="bounceInDown">恭喜你获得红包</h2>
				<span class="text flash"><b>50</b>元</span>
				<div class="avatar">
					<div id="open"><img src="image/user8.jpg" alt="" width="80" height="80" class="zoomIn"></div>
				</div>
				<div ><input type="button" value="   查看红包记录    " style="background: white" class="description1 flipInX" onclick="getrecord()" data-toggle="modal"
							data-target="#myModal" ></div>
			</div>
		</div>
	</div>
		<!-- 获得红包 -->
			<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"
						style="text-align: center">您的红包记录</h4>
				</div>
				<br>
				<div class="modal-body" style="padding-left: 20%">
				<div id="getresult"></div>
				
				</div>
				<br>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-primary" data-dismiss="modal" >确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div><!-- 此处往上输入自己的代码 -->
	</div>
</body>
</html>