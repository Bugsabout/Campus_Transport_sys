<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="Bean.DBBean" %>

<html>
<head>
<meta charset="UTF-8">
<title>注册成功页面</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page" />
<%
	request.setCharacterEncoding("utf-8");
	String username=(String)request.getParameter("username");
	String password=(String)request.getParameter("password");
	String check=(String)request.getParameter("check");
	String email=(String)request.getParameter("email");
	String phone=(String)request.getParameter("phone");
	ResultSet rs=null;
	String sql=null;
	try{
	if(username!=null){
		sql="select * from userinfo where username="+"'"+username+"'";
		rs=db.executeQuery(sql);
		if(rs.next()){
			out.print("用户已经存在"+"请<a href=\"Register.jsp\">注册</a>");
		}else{
			if(password.equals(check)){
				db.executeUpdate("insert into userinfo(username,password,phone,email) values"+"("+"'"+username+"','"+password+"','"+phone+"','"+email+"'"+")");
%>
			注册成功！！！<br>
			三秒后自动转到登陆页面！<br>
			如果没有跳转，请点击<a href="Index.jsp">这里</a>
			<span style="font-size:24px;"><meta http-equiv="refresh" content="3";url="http://localhost:8080/Transport_sys/Index.jsp"></span>
<%
			}else{
				out.print("密码输入不一致！！！<br>"+"重新<a href=\"Register.jsp\">注册</a>");
			}
		}
	}else{
			out.print("姓名不能为空");
		}
	}catch(Exception e){
		out.print(e);
	}
%>
</body>
</html>