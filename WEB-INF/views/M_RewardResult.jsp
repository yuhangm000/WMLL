<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<!--  
<script>
function queryBySelf(){
	$.ajax({
		url:"queryBySelf",
		type:'post',
		success: function () {
			//window.location.href="reward_result";
			//alert("s");
			//location.reload(true);   
		},
		fail: function(){
			alert("查询失败");
		}
	});
}
</script> -->
<script>
function queryBySelf(){
	window.location.href="queryBySelf";
}
</script>
<script>
function queryAll(){
	window.location.href="reward_result";
}
</script>
</head>
<body>

<div style="text-align:center">
</div>
		打赏记录：<br>
		<table class="table table-striped">
			<tr>
				<th>时间</th>
				<th>打赏人</th>
				<th>节目</th>
				<th>金额</th>
				<th>留言</th>
			</tr>
			<c:forEach items="${rewards}" var="temp">
				<tr>
					<td>${temp.time_}</td>
					<td>${temp.name}</td>
					<td>${temp.pname}</td>
					<td>${temp.amount}</td>
					<td>${temp.remark}</td>
				</tr>
			</c:forEach>
		</table>




<!-- 此处往上写自己的代码 -->
</body>
</html>