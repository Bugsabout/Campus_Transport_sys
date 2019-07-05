<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>
<head>
<meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html">
  <title>车辆查询结果</title>
  <meta name="author" content="Jake Rocheleau">
  <link rel="stylesheet" href="CSS/main.css">
  <script type="text/javascript" src="JS/jquery.min.js"></script>
  <script type="text/javascript" src="JS/menu.js"></script>

</head>

<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page"/>
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
	String Busnum=(String)request.getParameter("Busnum");
	String sql="select busst.StOrder,stinfo.StName,businfo.TicketNote,businfo.BusLevel,StNote from businfo,busst,stinfo where businfo.BusNum=busst.BusNum and busst.StID=stinfo.StID and businfo.BusNum="+"'"+Busnum+"' ORDER by busst.StOrder";
	ResultSet rs=db.executeQuery(sql);
%>
<p>
	车次为<%=Busnum %>的信息如下：
<table border=1 align="center">
	<tr>
		<td>
		车序
		</td>
		<td>
		站点
		</td>
		<td>
		票价
		</td>
		<td>
		票价等级
		</td>
		<td>
		站点信息
		</td>
	</tr>

<%
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>"+rs.getInt(1)+"</td>");
		for(int i=2;i<6;i++)
		{
			out.print("<td>"+rs.getString(i)+"</td>");
		}
		out.print("</tr>");
	}
%>
</table>
<br>
			<form action="BusInfo.jsp">
				<center>
				<input type="submit" name="back" value="返回">
				</center>
			</form>
			
		</div>
  </div>
</div><!-- @end #pgcontainer -->
</body>
</html>