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
	int busnum=Integer.parseInt(request.getParameter("busnum"));
	String stbegin=new String(request.getParameter("stbegin").getBytes("iso-8859-1"),"utf-8");
	String stend=new String(request.getParameter("stend").getBytes("iso-8859-1"),"utf-8");
	int stnum=Integer.parseInt(request.getParameter("stnum"));//获取上个页面的数据
	int ticketnote=Integer.parseInt(request.getParameter("ticketnote"));
	String buslevel=new String(request.getParameter("buslevel").getBytes("iso-8859-1"),"utf-8");
	
	int stid=0;
	if(busnum>0){
		String sql="select * from businfo where BusNum="+busnum;
		ResultSet rs=db.executeQuery(sql);//查询输入的车号是否是新的车号
		if(rs.next()){
			out.print("该车号已经存在"+"请<a href=\"AdnewBus.jsp\">返回</a>");
		}
		else{
			String sql1="insert into businfo(BusNum,BeginSt,EndSt,TicketNote,BusLevel) values("+busnum+",'"+stbegin+"','"+stend+"',"+ticketnote+",'"+buslevel+"')";
			int rs1=db.executeUpdate(sql1);
			
		}
	}
	else{
        out.print("<script language='javaScript'> alert('请重新输入车号');</script>");
        response.setHeader("refresh", "0;url=AdnewBus.jsp");//车号不能为负数
	}


%>
</body>
</html>