<!-- 最短路径算法的实现！！！！ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>
<%@ page import="Bean.Query" %>
<%@ page import="java.util.Stack" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html">
<meta name="author" content="Jake Rocheleau">
<link rel="stylesheet" href="CSS/main.css">
<script type="text/javascript" src="JS/jquery.min.js"></script>
<script type="text/javascript" src="JS/menu.js"></script>
<title>出行查询</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page"/>
<jsp:useBean id="q1" class="Bean.Query" scope="page" />


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
			
			


	<p>查询结果：
<br>
<br>
<%
//将站点名称转化为站点id好床底给下面的程序
	String BeginStname=new String(request.getParameter("BeginSt").getBytes("iso-8859-1"),"utf-8");
	String EndStname=new String(request.getParameter("EndSt").getBytes("iso-8859-1"),"utf-8"); //防止乱码
	int BeginStID=0,EndStID=0;
	String sql="select * from stinfo where Stname="+"'"+BeginStname+"'";
	ResultSet rs=db.executeQuery(sql);
	while(rs.next()){
		BeginStID=rs.getInt(1);
	}
	String sql2="select * from stinfo where Stname="+"'"+EndStname+"'";
	ResultSet rs2=db.executeQuery(sql2);
	while(rs2.next()){
		EndStID=rs2.getInt(1);
	}	            //到此查询出要查询站点的stid
	Query q=new Query(); //建立Query类
	q1=q.createGapth();//新建所有站点的顶点图
	q1.setBID(BeginStID);  

	q1.setEID(EndStID);          //设置号起始和终点id给他Query.class进行数据处理

	q1.resetVertices();         //通过调用广度优先算法查询以BeginStID开始，EndStID结束的路线
	q1.breadthFirstVisit();//广度优先遍历的结果,到此可以正常
	Stack<Integer> pathStack=new Stack<Integer>();//放入int数据的栈,关键的是stid
	double pathLength=q1.getShortestPath(pathStack);

%>
	<table border=1 align="center" width=80%>
		<tr>
			<td width=30%>
				下个站点
			</td>
			<td>
				途径车辆
			</td>
		</tr>
		

<%	
	
	while(!pathStack.isEmpty()){
		int a=pathStack.pop();  //出栈stid

		String sql4="select * from stinfo where StID="+a;//根据出栈stid查询数据库stinfo表
		ResultSet rs4=db.executeQuery(sql4);
		out.print("<tr>");
		while(rs4.next())
		{
			out.print("<td>"+"站点："+rs4.getString(2)+"</td>"); //找到后显示站点的stname字段(站点名)
		}	
		String sql3="select * from busst where StID="+a;//经过站点号的车号要查出来
		ResultSet rs3=db.executeQuery(sql3);
		out.print("<td>");
		while(rs3.next()){
			out.print("车号："+rs3.getInt(1)+"/");//显示经过这个stid的车号的信息
		}
		out.print("</td>");
		out.print("</tr>");

	}
%>
	</table>
<br>

<br>
<br>
	<span>总共需要通过：<%=pathLength %>个站点</span>
<!-- 到这里基本实现了站点的查询，只要在转换成stname即可 -->
<br>



		</div>
			

</div><!-- @end #pgcontainer -->
</body>
</html>