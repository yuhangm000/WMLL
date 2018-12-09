<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>index</title>

<script type="text/javascript">
function login(){
	var itcode=$("#itcode").val();
	var name=$("#name").val();
	var code=$("#identityCode").val();
	var json={
			"itcode":itcode,
			"name":name,
			"identityCode":code
	};
	$.ajax({
		url:"loginController",
		type:'post',
		data:json,
		success: function (data) {
			dealData(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

function dealData(data){
	if(data==1){//普通用户
		window.location.href="homePage";
	}
	if(data==3){//管理员
		window.location.href="mLeftPage";
	}
	if(data=="codeError"){
		$("#warn").text("验证码错误");
		changeImage();
	}
	if(data=="noUser"){
		$("#warn").text("用户不存在");
	}
	
}
</script>

<script>
function changeImage(){
	document.getElementById("code").src="identityCodeServlet?"+Math.random();
}
</script>
</head>
<body style="align:center;margin:10% 35%">
	<div style="text-align:center;width:300px;box-shadow:1px 5px 5px 2px #888888;padding:20px">
		<br>
		<table>
		<tr>
			<td colspan="3" height="50px"><label>登录进入系统</label></td>
		</tr>
		<tr>
			<td height="50px">工&nbsp;&nbsp;号:</td>
			<td height="50px" colspan="3"><input type="text" id="itcode" name="itcode" class="form-control"></input></td>
		</tr>
		<tr>
			<td height="50px">姓&nbsp;&nbsp;名:</td>
			<td height="50px" colspan="3"><input type="text" id="name" name="name" class="form-control"></input></td>
		</tr>
		<tr>
			<td height="50px">验证码:</td>
			<td><input type="text" id="identityCode" name="identityCode" style="width:80px" class="form-control"></input></td>
			<td height="50px"><img id="code" src="identityCodeServlet" onclick="changeImage()"></img></td>
		</tr>
		<tr>
			<td colspan="3"><div id="warn" style="color:red"></div></td>
		</tr>
		<tr>
			<td height="80px" colspan="3"><button class="btn-success" style="width:100px;height:30px" onclick="login()">登录</button></td>
		</tr>
		</table>
	</div>
	
</body>
</html>