<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page" />
<%
	request.setCharacterEncoding("utf-8");
	String adname=(String)request.getParameter("adname");
	String adpsd=(String)request.getParameter("adpassword");
	String sql="select * from admin where ID="+"'"+adname+"'";
	ResultSet rs=db.executeQuery(sql);
	if(rs.next())
	{
		if(adpsd.equals(rs.getObject("psd"))){
			request.getSession().setAttribute("adname", adname);
			request.getSession().setAttribute("adpsd", adpsd);//保存用户的特有session的username和password
%>
			<jsp:forward page="Admain.jsp" />
<%
        }
        else{
            out.print("<script language='javaScript'> alert('密码错误');</script>");
            response.setHeader("refresh", "0;url=index_1.jsp");
        }
    }
    else 
    {
        out.print("<script language='javaScript'> alert('账号错误');</script>");
        response.setHeader("refresh", "0;url=index_1.jsp");
	}
%>
</body>
</html>