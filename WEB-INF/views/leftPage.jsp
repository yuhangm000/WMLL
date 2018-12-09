<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>left</title>
<script>
//暂时没用
	function change(){
		$.ajax({
			url:"getLuckyMoney",
			type:'post',
			success: function (data) {
				$("#import").html(data);
			},
			fail: function(){
				alert("登录失败");
			}
		});
	}
</script>
</head>
<body>
	<div class="left" style="padding:30px">
		<br>
		<img src="image/head1.jpg" style="width: 30px; height: 30px"></img>
		<br><br>
		<label>工号：${itcode}</label>
		<br>
		<label>用户名:${cname}</label>
		<br>
		<br>
		<ul class="list-group">
			<li class="list-group-item"><a href="jumpToClient">用户信息</a></li>
			<li class="list-group-item"><a href="jumpToWalletPage">钱包</a></li>
			<li class="list-group-item"><a href="getLuckyMoney">抢红包</a></li>
			<li class="list-group-item"><a href="jumpToReward">打赏</a></li>
		</ul>
	</div>
</body>
</html>