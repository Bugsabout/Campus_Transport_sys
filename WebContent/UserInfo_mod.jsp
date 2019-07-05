<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page" />
<%
	String u_name=new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");//解决request.getParameter的中文乱码问题
	String u_sex=new String(request.getParameter("sex").getBytes("iso-8859-1"),"utf-8");
	String u_birthday=new String(request.getParameter("birthday").getBytes("iso-8859-1"),"utf-8");
	String u_phone=new String(request.getParameter("phone").getBytes("iso-8859-1"),"utf-8");
	String u_email=new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");
	String u_note=new String(request.getParameter("note").getBytes("iso-8859-1"),"utf-8");
	String uname=request.getSession().getAttribute("uname").toString();
	String paswd=request.getSession().getAttribute("paswd").toString();//获取用户登陆信息
	String sql1="update userinfo set name='"+u_name+"' where username="+"'"+uname+"' and password="+"'"+paswd+"'";//修改用户数据库中的数据
	String sql2="update userinfo set sex='"+u_sex+"' where username="+"'"+uname+"' and password="+"'"+paswd+"'";
	String sql3="update userinfo set birthday='"+u_birthday+"' where username="+"'"+uname+"' and password="+"'"+paswd+"'";
	String sql4="update userinfo set phone='"+u_phone+"' where username="+"'"+uname+"' and password="+"'"+paswd+"'";
	String sql5="update userinfo set email='"+u_email+"' where username="+"'"+uname+"' and password="+"'"+paswd+"'";
	String sql6="update userinfo set note='"+u_note+"' where username="+"'"+uname+"' and password="+"'"+paswd+"'";
	int rs=db.executeUpdate(sql1);
	rs=db.executeUpdate(sql2);
	rs=db.executeUpdate(sql3);
	rs=db.executeUpdate(sql4);
	rs=db.executeUpdate(sql5);
	rs=db.executeUpdate(sql6);
	out.print("修改数据成功，用户"+u_name);//修改成功
%>
<p>返回主页</p>
<jsp:forward page="main.jsp" />
</body>
</html>