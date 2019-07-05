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


<title>查询结果</title>
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
	String Stname=new String(request.getParameter("Stname").getBytes("iso-8859-1"),"utf-8");
	String sql="SELECT businfo.BusNum,BeginSt,EndSt,TicketNote,BusLevel FROM businfo,busst,stinfo WHERE stinfo.StID=busst.StID AND busst.BusNum=businfo.BusNum and stinfo.StName="+"'"+Stname+"'";
	ResultSet rs=db.executeQuery(sql);
%>
<br>
<br>
	<p style="font-size:20px;font-weight:bold">经过站点<%=Stname %>的车辆如下：
<table border=1 width=80% align="center" style="border:solid 1px blue">
	<tr>
		<td>
			车号
		</td>
		<td>
			起始站点
		</td>
		<td>
			终点站点
		</td>
		<td>
			票价
		</td>
		<td>
			车辆等级
		</td>
	</tr>
<%
	while(rs.next())
	{
		out.print("<tr>");
		out.print("<td>"+rs.getInt(1)+"</td>");//第一项是int数值，所以要单独拿出来
		for(int i=2;i<6;i++)
		{
			out.print("<td>"+rs.getString(i)+"</td>");
		}
		out.print("</tr>");
	}
%>
</table>
			
			
		</div>
			

</div><!-- @end #pgcontainer -->
</body>
</body>
</html>