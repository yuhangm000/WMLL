<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/laydate-v1.1/laydate/laydate.js"></script>
<title>add program</title>
<script type="text/javascript">
	function login() {
		if(check()){
		var pname = $("#pname").val();
		var dname = $("#dname").val();
		var time = $("#time").val();
		var json = {
			"pname" : pname,
			"dname" : dname,
			"time" : time
		};
		$.ajax({
			url : "ProgramCon",
			type : 'post',
			data : json,
			success : function(data) {
				dealData(data);
			},
			fail : function() {
				alert("添加节目失败");
			}
		});
		}else{
			alert("输入格式错误");
		}
	}
	
	function check(){
		var pname = document.getElementById("pname").value;
		var dname = document.getElementById("dname").value;
		var time = document.getElementById("time").value;
		var patern = new RegExp("^[\u4e00-\u9fa5_a-zA-Z0-9]+$");
		var flag1=false;
		var flag2=false;
		var flag3=false;
		if(pname==null||pname==""){
			$("#warn1").text("节目名为空");
			flag1=false;
		}
		else{
			$("#warn1").text("");
			flag1=true;
		}
		//单位
		if(dname==null||dname==""){
			$("#warn2").text("选送单位为空");
			flag2=false;
		}
		else{
			if(patern.test(dname)){
				$("#warn2").text("");
				flag2=true;
			}
			else{
				$("#warn2").text("内容输入格式不对");
				flag2=false;
			}			
		}
		//时间
		if(time==null||time==""){
			$("#warn3").text("未填写时间");
			flag3=false;
		}
		else{
			$("#warn3").text("");
			flag3=true;
		}
		
		if(flag1&&flag2&&flag3){
			return true;
		}
	}

	function dealData(data) {
		if (data == "a") {
			alert("添加节目成功！");

		}
		if (data == "b") {
			alert("添加节目失败！");
		}
		if (data == "c") {
			$("#warn").text("节目名已存在！");
		}
		if (data == "d") {
			$("#warn").text("抛出异常！");
		}

	}
	function showProgram() {
		$.ajax({
			url : "showProgram",
			type : 'post',
			success : function(data) {

			},
			fail : function() {

			}
		});
	}
</script>
</head>
<body>
		<div
			style="text-align: center; width: 300px; box-shadow: 1px 5px 5px 2px #888888; padding: 20px">
			<br>
			<table>
				<tr>
					<td colspan="3" height="50px"><label>节目录入系统</label></td>
				</tr>
				<tr>
					<td height="50px">节目名称:</td>
					<td height="50px" colspan="3"><input type="text" id="pname"
						name="pname" class="form-control" onchange="check()"></input></td>
				</tr>
				<tr>
				    <td colspan="3"><div id="warn1" style="color:red"></div></td></tr>
				<tr>
					<td height="50px">部&nbsp;&nbsp;门:</td>
					<td height="50px" colspan="3"><input type="text" id="dname"
						name="dname" class="form-control" onchange="check()"></input></td>
				</tr>
				<tr>
				    <td colspan="3"><div id="warn2" style="color:red"></div></td></tr>
				<tr>
					<td height="50px">节目时间:</td>
					<td><input id="time" name="time" placeholder="请输入节目开始时间" onclick="laydate({elem: '#time',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></input></td>
				</tr>
				<tr>
				    <td colspan="3"><div id="warn3" style="color:red"></div></td></tr>
				<tr>
					<td height="80px" colspan="3"><button class="btn btn-primary"
							style="width: 100px; height: 30px" onclick="login()">提交</button></td>
				</tr>
			</table>
		</div>
		<input id="time" name="time" placeholder="请输入节目开始时间" onclick="laydate({elem: '#time',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
		
</body>
</html>