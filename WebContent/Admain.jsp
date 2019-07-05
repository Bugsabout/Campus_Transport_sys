<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/main_1.css">
</head>
<body>

	<!-- 头背景设置 -->
	<div class="hd">
		<div class="hd_1">
			<span>
				城市公交线路信息系统
			</span>
		</div>
	</div>
	
	
	<!-- 主体设置 -->
	<div class="bd">
		<div class="bd_left">
		
			<div class="bd_img">
				<div class="u_img"></div>

			</div>
			
			<div class="bd_wel">
<%

				String adname=request.getSession().getAttribute("adname").toString();
				String adpsd=request.getSession().getAttribute("adpsd").toString();//获取cookie,为后面的页面保存用户的信息
				out.print("欢迎您登陆系统,管理员"+adname);
%>
			</div>
			<div class="bd_info">

				<ul>
					&nbsp;<a href="AdBusMg.jsp">站点管理</a>
				</ul>
				<ul>
					&nbsp;<a href="AdnewBus.jsp">添加车辆</a>
				</ul>
				<ul>
					&nbsp;<a href="AdMessMg.jsp">留言管理</a>
				</ul>		
			</div>

		</div>
		
		<div class="bd_right">
			欢迎使用城市公交线路信息查询系统！！！
		</div>
	</div>
</body>
</html>