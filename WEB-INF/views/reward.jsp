<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.demo.model.Program"%>
<%@page import="com.demo.dao.ProgramDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reward</title>

<script>
	function sendReward(id) {
		var json = {
			"pid" : id
		};
		$.ajax({
			url : "sendReward",
			type : 'post',
			data : json,
			success : function(data) {
				var str = eval('(' + data + ')');
				var pid = str.pid;
				var pname = str.pname;
				$("#pid").html(pid);
				$("#pname").html(pname);
				$("#value").val("");
				$("#remark").val("");
			},
			fail : function() {
				alert("打赏失败，请检查网络");
			}
		});
	}
</script>

<script>
	function sendForm() {
		var pid = $("#pid").html();
		var value = $("#value").val();
		var remark = $("#remark").val();
		var json = {
			"pid" : pid,
			"value" : value,
			"remark" : remark
		};
		$.ajax({
			url : "sendForm",
			type : 'post',
			data : json,
			success : function() {
				$("#myModal").modal('hide');
				alert("打赏成功");
				window.location.href="reward_result";
			},
			fail : function() {
				alert("打赏失败，请检查网络");
			}
		});
	}
</script>
<script>
function queryReward(){
	window.location.href="reward_result";
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


		节目列表 ：
		<table class="table table-striped">
			<tr>
				<th>节目编号</th>
				<th>节目名称</th>
				<th>部门</th>
				<th>开始时间</th>
				<th>打赏</th>
			</tr>
			<c:forEach items="${programs}" var="temp">
				<tr>
					<td>${temp.pid}</td>
					<td>${temp.name}</td>
					<td>${temp.department}</td>
					<td>${temp.time_}</td>
					<td>
						<!-- 打赏按钮 -->
						<button class="btn btn-primary" data-toggle="modal"
							data-target="#myModal" value="${temp.pid}"
							onclick="sendReward(this.value)">打赏</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"
						style="text-align: center">打赏节目</h4>
				</div>
				<br>
				<div class="modal-body" style="padding-left: 20%">
					<table>
						<tr>
							<td>节目编号:</td>
							<td><div id="pid"></div></td>
						</tr>
						<tr>
							<td>节目名称:</td>
							<td><div id="pname"></div></td>
						</tr>
					</table>
					打赏金额:<input type="text" id="value" name="value"></input><br>
					<br> 进行评论:
					<textarea id="remark" rows="2" cols="40"></textarea>
				</div>
				<br>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="sendForm()">提交更改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消打赏</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
		<!-- 打赏按钮结束 -->
</div><!-- 此处往上输入自己ide代码 -->
<div style="text-align:center">
	<br>
	<br>
	<button class="btn btn-primary" onclick="queryReward()">显示打赏记录</button>		
</div>
</body>
</html>