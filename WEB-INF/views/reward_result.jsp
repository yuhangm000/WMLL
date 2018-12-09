<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
 <script type="text/javascript" src="js/laydate-v1.1/laydate/laydate.js"></script>
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
<!--侧栏 -->
	<div style="float: left; width: 25%">
		<c:import url="leftPage.jsp"></c:import>
	</div>
	<div style="float: left; width: 75%;padding:30px">
<!-- 此处往下输入自己的页面 -->
<br>
<div style="text-align:center">
<table class="table">
    <tr>
        <td><button class="btn btn-primary" onclick="queryAll()">所有记录</button></td>
        <td><button class="btn btn-primary" onclick="queryBySelf()">个人记录</button></td>
        <!--  <td><input class="laydate-icon" onclick="laydate()"></td>-->
        <form name="form1" action="queryByDate" method="post">
        <td><input id="time1" name="time1" placeholder="请输入查询开始时间" onclick="laydate({elem: '#time1',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></td>
        <td><input id="time2" name="time2" placeholder="请输入查询结束时间" onclick="laydate({elem: '#time2',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"></td>
        <td><input type="submit" value="查询" onclick="queryByDate()"></td></form>
    </tr>
        <!--  <td><input id="id" type="text" readonly="readonly" onclick="laydate()"></td></tr>-->
</table>
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



</div>
<!-- 此处往上写自己的代码 -->
</body>
</html>