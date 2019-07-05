<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="Bean.DBBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="Bean.DBBean" scope="page" />

	<%
		List<String> list=new ArrayList<String>();
		String sql="select BusNum from businfo";
		ResultSet rs=db.executeQuery(sql);
		while(rs.next())
		{
			list.add(rs.getString(1));//下拉选单数组，用来存放车号
		}
	%>
<form action="AdBusMg2.jsp" method="post">
选择车次：<br>
<select name="id">
<%
	for(int i=0;i<list.size();i++)
	{
%>
	<option name="num">
	<%=list.get(i) %>
	
	</option>
	<%
	}
	%>
</select>
<input type="submit" name="submit" value="确定">
</form>




</body>
</html>