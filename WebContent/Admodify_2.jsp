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
	int busnum=Integer.parseInt(request.getSession().getAttribute("idnum").toString());//获取存下来的车号
	int stid=Integer.parseInt(request.getSession().getAttribute("stid").toString());//获取存下来的站点id
	
	int storder=Integer.parseInt(request.getParameter("storder"));
	String stname=new String(request.getParameter("stname").getBytes("iso-8859-1"),"utf-8");//解决request.getParameter的中文乱码问题
	String ticketnote=new String(request.getParameter("ticketnote").getBytes("iso-8859-1"),"utf-8");//解决request.getParameter的中文乱码问题
	String buslevel=new String(request.getParameter("buslevel").getBytes("iso-8859-1"),"utf-8");//解决request.getParameter的中文乱码问题
	String stnote=new String(request.getParameter("stnote").getBytes("iso-8859-1"),"utf-8");//解决request.getParameter的中文乱码问题
	String sql1="update busst set StOrder="+storder+" where BusNum="+busnum+" and StID="+stid;
	String sql2="update stinfo set StName="+"'"+stname+"' where StID="+stid;
	String sql3="update businfo set TicketNote="+"'"+ticketnote+"' where BusNum="+busnum;
	String sql4="update businfo set BusLevel="+"'"+buslevel+"' where BusNum="+busnum;
	String sql5="update stinfo set StNote="+"'"+stnote+"' where StID="+stid;
	int rs=db.executeUpdate(sql1);
	rs=db.executeUpdate(sql2);
	rs=db.executeUpdate(sql3);
	rs=db.executeUpdate(sql4);
	rs=db.executeUpdate(sql5);
	out.print("修改数据成功");//修改成功
%>
<jsp:forward page="Admain.jsp" />
</body>
</html>