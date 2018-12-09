<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>红包雨</title>
<script>
	function send(data) {
		var json = {
			"round" : data
		}
		$.ajax({
			url : "Lucky_on",
			type : 'post',
			data : json,
			success : function(data) {
				window.location.href = "Raining";
			},
			fail : function() {
				alert("开启失败，请重试");
			}
		});
	}
</script>
<script type="text/javascript">
	function sendMessage1() {
		var data = $("#btn1").val();
		send(data);
	}
	function sendMessage2() {
		var data = $("#btn2").val();
		send(data);
	}
	function sendMessage3() {
		var data = $("#btn3").val();
		send(data);
	}
</script>
<script>
	function shut() {
		$.ajax({
			url : "Lucky_off",
			type : 'post',
			success : function(data) {
				alert("关闭成功")
			},
			fail : function() {
				alert("关闭失败，请重试");
			}
		});
	}
</script>
</head>
<body>
	<button id="btn1" value="1" onclick="sendMessage1()">第一次红包雨</button>
	<br>
	<button id="btn2" value="2" onclick="sendMessage2()">第二次红包雨</button>
	<br>
	<button id="btn3" value="3" onclick="sendMessage3()">第三次红包雨</button>
	<br>
	<button onclick="shut()">关闭红包雨</button>
	<br>

</body>
</html>