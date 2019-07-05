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
	int idnum=Integer.parseInt(request.getSession().getAttribute("idnum").toString());
	int stid=Integer.parseInt(request.getParameter("StID"));//获取传递的数据
	request.getSession().setAttribute("stid", stid);//我保存了这个车的车号的相应站点的id，后面可能都会用到
	int storder=Integer.parseInt(request.getParameter("StOrder"));
	String stname,ticketnote,buslevel,stnote;
	String sql="select * from stinfo where StID="+stid;//求的站点名称
	ResultSet rs=db.executeQuery(sql);
	while(rs.next())
	{
		stname=rs.getString(2);
		request.setAttribute("stname", stname);
		stnote=rs.getString(3);
		request.setAttribute("stnote", stnote);
	}
	String sql2="select * from businfo where BusNUm="+idnum;
	ResultSet rs2=db.executeQuery(sql2);
	while(rs2.next())
	{
		ticketnote=rs2.getString(4);
		request.setAttribute("ticketnote", ticketnote);
		buslevel=rs2.getString(5);
		request.setAttribute("buslevel", buslevel);
	}
%>
<br>
<br>
<form action="Admodify_2.jsp" method="post">
	<table border=1 width=80% align="center">
		<tr>
			<td>站点次序：</td>
			<td><input type="text" name="storder" value=<%=storder %> /></td>
		</tr>
		<tr>
			<td>站点：</td>
			<td><input type="text" name="stname" value=<%=request.getAttribute("stname") %> /></td>
		</tr>
		<tr>
			<td>票价：</td>
			<td><input type="text" name="ticketnote" value=<%=request.getAttribute("ticketnote") %> /></td>
		</tr>
		<tr>
			<td>票价等级：</td>
			<td><input type="text" name="buslevel" value=<%=request.getAttribute("buslevel") %> /></td>
		</tr>
		<tr>
			<td>站点信息：</td>
			<td><input type="text" name="stnote" value=<%=request.getAttribute("stnote") %> /></td>
		</tr>
	</table>
	<input type="submit" name="submit" value="修改">
</form>
<form action="Admain.jsp" method="post">
	<input type="submit" value="返回">
</form>
</body>
</html>