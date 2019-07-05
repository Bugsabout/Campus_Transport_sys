<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html">
<meta name="author" content="Jake Rocheleau">
<link rel="stylesheet" href="CSS/main.css">
<script type="text/javascript" src="JS/jquery.min.js"></script>
<script type="text/javascript" src="JS/menu.js"></script>


<title>用户留言</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page" />


<div id="pgcontainer">
  <header>
    <div id="navbar">
      <a href="#" class="menubtn">menu</a>
      <!-- use captain icon for toggle menu -->
      <div id="hamburgermenu">
        <ul>
          <li>
          <%
			String uname=request.getSession().getAttribute("uname").toString();
			String paswd=request.getSession().getAttribute("paswd").toString();//获取cookie,为后面的页面保存用户的信息
          %>
			<a href="#">欢迎登陆，用户<%=uname %></a>
          <!-- 到这里实现了用户的信息登陆和保存 -->
          </li>
          <li><a href="UserInfo.jsp">用户信息</a></li>
          <li><a href="BusInfo.jsp">车辆查询</a></li>
          <li><a href="StationInfo.jsp">站点查询</a></li>
          <li><a href="LineQuery.jsp">出行查询</a></li>
          <li><a href="GIS.jsp">GIS地图定位及查询</a></li>
          <li><a href="Umessage.jsp">用户留言</a></li>
        </ul>
      </div>
      	<h1 style="color:#ff8000">城市公交线路信息查询系统</h1>
    </div>
    <div class="overlay"></div>
  </header>
  
  
  
  <div id="content">
		<br>
		<br>
		<br>
			
	<form action="Umessage_2.jsp" method="post">
		<table border=1 align="center" width=50%>
			<tr>
				<td><p>标题：</p></td>
				<td><input type="text" name="title" size=52></td>
			</tr>
			<tr>
				<td><p>用户留言：</p></td>
				<td><textarea name="message" rows="20" cols="40"></textarea></td>
			</tr>
		</table>

		<table align="center">
			<tr>
				<td><input type="submit" value="提交">
			</tr>
		</table>
	</form>
	<br>
	<form action="main.jsp" method="post">
				<center>
				<input type="submit" value="返回">
				</center>
	</form>
			
		</div>
			

</div><!-- @end #pgcontainer -->
</body>
</html>