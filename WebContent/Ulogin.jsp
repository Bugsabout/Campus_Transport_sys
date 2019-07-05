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
	request.setCharacterEncoding("utf-8");
	String username=(String)request.getParameter("username");
	String password=(String)request.getParameter("password");
	//
	String sql="select * from userinfo where username="+"'"+username+"'";
	ResultSet rs=db.executeQuery(sql);
	if(rs.next())
	{
		if(password.equals(rs.getObject("password"))){
			request.getSession().setAttribute("uname", username);
			request.getSession().setAttribute("paswd", password);//保存用户的特有session的username和password
%>
			<jsp:forward page="main.jsp" />
<%
        }
        else{
            out.print("<script language='javaScript'> alert('密码错误');</script>");
            response.setHeader("refresh", "0;url=Index.jsp");
        }
    }
    else 
    {
        out.print("<script language='javaScript'> alert('账号错误');</script>");
        response.setHeader("refresh", "0;url=Index.jsp");
	}
%>
</body>
</html>