<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>red packet</title>
</head>
<body>
	<table class="table table-striped">
		<tr>
			<th>itcode</th>
			<th>用户名</th>
			<th>节红包金额</th>
			<th>时间</th>
			<th>轮次</th>
		</tr>
		<c:forEach items="${list}" var="temp">
			<tr>
				<td>${temp.itcode}</td>
				<td>${temp.name}</td>
				<td>${temp.amount/100}</td>
				<td>${temp.time_}</td>
				<td>${temp.round}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>