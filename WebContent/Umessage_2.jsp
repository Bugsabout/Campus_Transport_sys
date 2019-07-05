<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page" />
<%
	String uname=request.getSession().getAttribute("uname").toString();
	String paswd=request.getSession().getAttribute("paswd").toString();//获取用户登陆信息
	String u_title=new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
	String u_message=new String(request.getParameter("message").getBytes("iso-8859-1"),"utf-8");//解决request.getParameter的中文乱码问题
	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String u_time=df.format(new Date());//获取时间
	String sql="insert into umessage(username,title,time,message,back) values"+"('"+uname+"','"+u_title+"','"+u_time+"','"+u_message+"',"+"' ')";
	int rs=db.executeUpdate(sql);
%>
<jsp:forward page="main.jsp" />
</body>
</html>