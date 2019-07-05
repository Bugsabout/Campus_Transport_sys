<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<head>
  <meta charset="gb2312">
  <meta http-equiv="Content-Type" content="text/html">
  <title>用户菜单界面</title>
  <meta name="author" content="Jake Rocheleau">
  <link rel="stylesheet" href="CSS/main.css">
  <script type="text/javascript" src="JS/jquery.min.js"></script>
  <script type="text/javascript" src="JS/menu.js"></script>

</head>

<body>

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
          <li><a href="Index.jsp">注销</a></li>
        </ul>
      </div>
      	<h1 style="color:#ff8000">城市公交线路信息查询系统</h1>

    </div>

    <div class="overlay"></div>
  </header>
  
  
  
  <div id="content">
    <h1>请阅读以下内容：</h1>
    
	<p>欢迎您使用城市公交信息查询系统！</p>
	<p>本系统实现了用户和管理员模块：在用户模块中，实现了信息查询，车号查询，站点查询，出行查询，地图查询，用户留言功能。
	在管理员模块中，实现了新车添加，站点管理，留言管理功能。</p>
	<p>在首页可以登录管理员进行管理。
  </div>
</div><!-- @end #pgcontainer -->
</body>
</html>