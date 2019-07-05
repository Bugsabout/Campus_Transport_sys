<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="AdnewBus_2.jsp" method="post">
	<table border=1 width=80% align="center" >
		<tr>
			<td>输入新车号：</td>
			<td>
				<input type="text" name="busnum" size=30 >
			</td>
		</tr>
		<tr>
			<td>输入起点站名：</td>
			<td>
				<input type="text" name="stbegin" size=30>
			</td>
		</tr>
		<tr>
			<td>输入终点站名：</td>
			<td>
				<input type="text" name="stend" size=30>
			</td>
		</tr>
		<tr>
			<td>此车辆站点总数：</td>
			<td>
				<input type="text" name="stnum" size=30>
			</td>
		</tr>
		<tr>
			<td>票价：</td>
			<td>
				<input type="text" name="ticketnote" size=30>
			</td>
		</tr>
		<tr>
			<td>车辆等级：</td>
			<td>
				<input type="text" name="buslevel" size=30>
			</td>
		</tr>
	</table>
	<input type="submit" name="submit" value="确定">
</form>
<form action="Admain.jsp" method="post">
	<input type="submit" name="submit" value="取消">
</form>
</body>
</html>