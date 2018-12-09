<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
</head>
<body>
<!--侧栏 -->
	<div style="float: left; width: 25%">
		<c:import url="leftPage.jsp"></c:import>
	</div>

	<div style="float: left; width: 75%;padding:30px">
<!-- 此处往下输入自己的页面 -->

		<div class="text" style="text-align: center;">${name}</div>
		<table>
			<tr>
				<td>上传（更换）头像:</td>
			</tr>
			<tr>
				<td><form name="form3" id="form3" method="post"
						enctype="multipart/form-data" action="updateIcon">
						<input type="file" name="file" id="file"> <input
							type="submit">
					</form></td>
			</tr>

			<tr>
				<td>工号：</td>
				<td>${itcode}</td>
			</tr>
			<tr>
				<td>身份：</td>
				<td>${iden}</td>
			</tr>

		</table>
		
		
</div><!-- 往上写自己的代码 -->
</body>
</html>