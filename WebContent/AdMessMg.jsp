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
	String sql="select * from umessage";
	ResultSet rs=db.executeQuery(sql);//查询留言的内容
	
%>
<table border=1 width=80% align="center">
	<tr>
		<td>
			用户名
		</td>
		<td>
			主题
		</td>
		<td>
			留言时间
		</td>
		<th width=35%>
			留言内容		
		</th>
		<td width=20%>
			回复内容
		</td>
	</tr>
<%
	while(rs.next())
	{
		out.print("<tr>");
		for(int i=1;i<6;i++)
		{
			out.print("<td>"+rs.getString(i)+"</td>");
		}
		out.print("<td>");
%>
	<a href='AdMessMg_2.jsp?username=<%=rs.getString(1) %>&title=<%=rs.getString(2) %> '>回复</a>
<%
		out.print("</td>");
		out.print("</tr>");
	}
%>
	
	
</table>


</body>
</html>