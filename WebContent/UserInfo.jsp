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


<title>用户信息</title>
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

			
<%
	String name,sex,birthday,phone,email,note;
	String sql="select name,sex,birthday,phone,email,note from userinfo where username="+"'"+uname+"'"+"and"+"'"+paswd+"'";
	ResultSet rs=db.executeQuery(sql);
	while(rs.next()){
		name=rs.getString("name");
		request.setAttribute("name", name);
		sex=rs.getString("sex");
		request.setAttribute("sex", sex);
		birthday=rs.getString("birthday");
		request.setAttribute("birthday", birthday);
		phone=rs.getString("phone");
		request.setAttribute("phone", phone);
		email=rs.getString("email");
		request.setAttribute("email", email);
		note=rs.getString("note");	
		request.setAttribute("note", note);
	}
%>
<!-- 获取用户信息后，填写在框框中，用户可以去修改并提交，完成信息的更新 -->
<br>
<br>
<br>
<form action="UserInfo_mod.jsp" method="post">
	<table border=1 align="center" width=50%>
		<tr>
			<td><p>姓名:</p></td>
			<td><input type="text" name="name" value=<%=request.getAttribute("name") %> /></td>
		</tr>
		<tr>
			<td><p>性别:</p></td>
			<td><input type="text" name="sex" value=<%=request.getAttribute("sex") %> /></td>
		</tr>
		<tr>
			<td><p>出生日期:</p></td>
			<td><input type="text" name="birthday" value=<%=request.getAttribute("birthday") %> /></td>
		</tr>
		<tr>
			<td><p>Phone:</p></td>
			<td><input type="text" name="phone" value=<%=request.getAttribute("phone") %> /></td>
		</tr>
		<tr>
			<td><p>E-mail:</p></td>
			<td><input type="text" name="email" value=<%=request.getAttribute("email") %> /></td>
		</tr>
		<tr>
			<td><p>个人简介:</p></td>
			<td><textarea name="note" rows="12" cols="40" ><%=request.getAttribute("note") %></textarea></td>
		</tr>
	</table>
	<center>
		<input type="submit" value="修改" name="submit">
	</center>
</form>
<br>
<center>
<form action="main.jsp" method="post">
	<input type="submit" value="返回">
</form>
</center>
			
  </div>
</div><!-- @end #pgcontainer -->
</body>
</html>