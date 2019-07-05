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
	int id=Integer.parseInt(request.getParameter("id"));
	request.getSession().setAttribute("idnum", id);//我保存了这个车的车号，后面可能都会用到
	String sql="select busst.StID,busst.StOrder,stinfo.StName,businfo.TicketNote,businfo.BusLevel,stinfo.StNote from businfo,busst,stinfo where stinfo.StID=busst.StID AND busst.BusNum=businfo.BusNum AND businfo.BusNum="+id+" ORDER BY busst.StOrder";
	ResultSet rs=db.executeQuery(sql);
%>

<br>
<br>
<table border=1 width=80% align="center" style="text-align:center;font-weight:bold;">
<tr>
	<td>
		车次
	</td>
	<td>
		站点
	</td>
	<td>
		票价
	</td>
	<td>
		车辆等级
	</td>
	<td>
		站点信息
	</td>

</tr>
<%
while(rs.next())
{
	out.print("<tr>");
	out.print("<td>"+rs.getInt(2)+"</td>");
	for(int i=3;i<7;i++)
	{
		out.print("<td>"+rs.getString(i)+"</td>");
	}
	out.print("<td>");
%>
	<!-- 这样就可以实现在每一条数据后面都有删除和修改选项，传递的每个id都是当前的id -->
		<a href='Addelete.jsp?StID=<%=rs.getInt(1) %>'>删除</a>  
<%
	out.print("</td>");
	out.print("<td>");
%>
		<a href='Admodify.jsp?StID=<%=rs.getInt(1) %>&StOrder=<%=rs.getInt(2) %> '>修改</a>  
<%
	out.print("</td>");
	out.print("</tr>");
}
%>
</table>
<form action="Admain.jsp" method="post">
	<input type="submit" name="back" value="返回">
</form>
</body>
</html>