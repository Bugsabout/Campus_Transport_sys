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
	String stid=request.getParameter("StID");//获取传递的数据
	String sql="delete from busst where StID="+stid;
	int rs=db.executeUpdate(sql);
    out.print("<script language='javaScript'> alert('删除成功');</script>");
    response.setHeader("refresh", "0;url=AdBusMg.jsp");
%>
</body>
</html>