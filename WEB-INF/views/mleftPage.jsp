<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>manage Home</title>
<style>
ul li:hover{color:white;background:#6699ff;}
</style>
<script>
/*加载添加信息页面*/
function AddProgram(){
	$.ajax({
		url:"addProgramPage",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

/*加载显示充值提现列表页面*/
function showTrade(){
	$.ajax({
		url:"JumpToAdminTrade",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

/*加载显示红包列表页面*/
function showRedPackge(){
	$.ajax({
		url:"showRedPacketRainPage",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("加载失败");
		}
	});
}

/*加载显示抢红包列表页面*/
function showRecode(){
	$.ajax({
		url:"checkredpacket",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("加载失败");
		}
	});
}

/*加载显示打赏记录列表页面*/
function showReward(){
	$.ajax({
		url:"M_RewardResult",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

/*发送开启红包雨信息*/
function startRain(data){
	var json = {"round" : data}
	$.ajax({
			url : "Lucky_on",
			type : 'post',
			data : json,
			success:function(data) {
				$("#import").html(data);
			},
			fail : function() {
				alert("开启失败，请重试");
			}
	});
}

function jumpToRain(){
	$.ajax({
		url : "managerPage",
		type : 'post',
		success:function(data) {
			$("#import").html(data);
		},
		fail : function() {
			alert("加载失败，请重试");
		}
	});
}
</script>
</head>
<body>
<!-- 左边栏 -->
<div style="float:left;width:25%;padding:30px">
		<br>
		<img src="image/head1.jpg" style="width: 30px; height: 30px"></img>
		<br><br>
		<label>工号：${itcode}</label>
		<br>
		<label>用户名:${cname}</label>
		<br>
		<br>
		<ul class="list-group">
		<!-- 
			<li class="list-group-item"><a href="jumpToClient">用户信息</a></li>
			<li class="list-group-item"><a href="jumpToWalletPage">钱包</a></li>
			<li class="list-group-item"><a href="getLuckyMoney">抢红包</a></li>
			<li class="list-group-item"><a href="jumpToReward">打赏</a></li>
		 -->
		 	<li class="list-group-item" style="cursor:pointer" onclick="jumpToRain()">红包雨开启</li>
			<li class="list-group-item" style="cursor:pointer" onclick="showRedPackge()">查看红包雨记录</li>
		 	<li class="list-group-item" style="cursor:pointer" onclick="AddProgram()">添加节目</li>
		 	<li class="list-group-item" style="cursor:pointer" onclick="showTrade()">查看充值提现记录</li>
			<li class="list-group-item" style="cursor:pointer" onclick="showRecode()">查看所有抢红包记录</li>	
			<li class="list-group-item" style="cursor:pointer" onclick="showReward()">查看所有打赏记录</li>
		</ul>
</div>
<!-- 左边栏结束 -->
<!-- 右边页面 -->
<!-- 动态注入 -->
<div id="import" style="float:left;width:75%;padding:30px"></div>

</body>
</html>