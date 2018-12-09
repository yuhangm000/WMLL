<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
p{
   font-size:20px;
   text-align: center;
}
</style>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>wallet</title>
</head>
<body>
<!--侧栏 -->
	<div style="float: left; width: 25%">
		<c:import url="leftPage.jsp"></c:import>
	</div>

	<div style="float: left; width: 75%;padding:30px">
<!-- 此处往下输入自己的页面 -->
<h1 style = "text-align: center;">我的钱包</h1>
				
				<!-- 钱包处于激活状态 -->
				<c:if test="${res == 1 }">
			<!-- 显示钱包信息，并实现充值和提现功能 -->
				<p>账户余额：${balance}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				<div style="text-align: center;"><form name = "f1" action="topup"><input type="text" name = "tu" id = "tu">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="充值">
				<c:if test="${traderes == 2}"><div style="color: red;">充值成功</div></c:if>
				<c:if test="${traderes == -2}"><div style="color: red;">充值失败</div></c:if>
				</form></div>
				<br>
				
				<div style="text-align: center;"><form name = "f2" action="withdraw"><input type="text" name = "wd" id = "wd">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提现">
				<c:if test="${traderes == 1}"><div style="color: red;">提现成功</div></c:if>
				<c:if test="${traderes == -1}"><div style="color: red;">提现失败</div></c:if>
				</form></div>
				<br><br>
							<h1 style = "text-align: center;">交易记录</h1>
						交易列表 ：
				<table class="table table-striped">
					<tr>
						<th>交易编号</th>
						<th>交易类型</th>
						<th>交易金额</th>
						<th>交易时间</th>
						<th>备注</th>
					</tr>
					<c:forEach items="${trades}" var="temp">
						<tr>
							<td>${temp.tid}</td>
							<td><c:if test="${temp.type == 1}">充值</c:if>
								<c:if test="${temp.type == 2}">提现</c:if></td>	
							<td>${temp.amount}</td>
							<td>${temp.time_}</td>
							<td><c:if test="${temp.remark == null}">无</c:if>
								<c:if test="${temp.remark != null}">${temp.remark}</c:if></td>
						</tr>
					</c:forEach>
				</table>	
				
			</c:if> 
			
			<!-- 钱包处于未激活状态 -->
			<c:if test="${res == 0 }">
			钱包状态:
						<form name="form1" action="JumpToaddWallet">
							<input type="submit" value="点我激活钱包">
						</form>
			</c:if> 
			<c:if test="${res ==-1 }">
			无法获取钱包信息！请重新登录
			</c:if>
</div>
</body>
</html>