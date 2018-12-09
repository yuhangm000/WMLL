<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>充值提现记录</title>
<script type="text/javascript" src="js/laydate-v1.1/laydate/laydate.js"></script>
</head>
<body>
<h1 style = "text-align: center;">充值提现记录明细</h1>
交易列表 ：<br>
<form name="form1" action="jumpToSearch" method="post">
<input type="text" placeholder="请输入名字" name="Sname">
<input type="text" placeholder="请输入工号" name="Sitcode">
<input type="text" placeholder="请输入交易金额" name="Samount">
<input id="time1" name="time1" placeholder="请输入查询开始时间" onclick="laydate({elem: '#time1',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
<input id="time2" name="time2" placeholder="请输入查询结束时间" onclick="laydate({elem: '#time2',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
<select name="Stype">
  <option value ="0">请选择交易类型</option>
  <option value ="1">充值</option>
  <option value ="2">提现</option>
</select>
<input type="submit" value="查询">
</form>
				<table class="table table-striped" >
					<tr>
						<th>交易编号</th>
						<th>交易者姓名</th>
						<th>交易者工号</th>
						<th>交易类型</th>
						<th>交易金额</th>
						<th>交易时间</th>
						<th>备注</th>
					</tr>
					<c:forEach items="${trades}" var="temp">
						<tr>
							<td>${temp.tid}</td>
							<td>${temp.name}</td>
							<td>${temp.itcode}</td>
							<td><c:if test="${temp.type == 1}">充值</c:if>
								<c:if test="${temp.type == 2}">提现</c:if></td>	
							<td>${temp.amount}</td>
							<td>${temp.time_}</td>
							<td><c:if test="${temp.remark == null}">无</c:if>
								<c:if test="${temp.remark != null}">${temp.remark}</c:if></td>
						</tr>
					</c:forEach>
				</table>	
</body>
</html>