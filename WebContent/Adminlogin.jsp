<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理员登陆</title>
<style type="text/css">
<!--
.STYLE2 {color: #BEB396}
body {
	background-color: #F3F0E7;
	margin-left: 0px;
	margin-top: 0px;
}
.STYLE2 {
	color: #D1A767;
}
.STYLE3 {
	color: #BEB396;
	font-family: "新宋体";
	font-weight: bold;
}
.STYLE3 {
	font-size: 24px;
	color: #D1A767;
}
body,td,th {
	font-family: Times New Roman, Times, serif;
	font-size: 9pt;
}
-->
</style>
</head>

<body>
<p class="STYLE2">&nbsp;</p>
<p class="STYLE2">&nbsp;</p>
<p class="STYLE2">&nbsp;</p>
<p class="STYLE2">&nbsp;</p>
<center>
<div style="border:0px solid; width:500px; height:800px overflow:scroll;" align="center">
<form id="Adminlogin" name="Adminlogin" action="Adlogincheck.jsp" method="post">
<table width="77%" height="219" border="1" align="center"  style= "background-repeat:no-repeat "   bordercolor="#E4DDCB" background="Image/admin_bg.gif ">
  <tr>
    <td height="213" bordercolor="#CCCC99" class="STYLE2">
    <table width="100%" border="0" align="left">
      <tr>
        <td width="119" height="26" align="right">&nbsp;&nbsp;&nbsp;&nbsp; </td>
          <td width="30" align="right" valign="top"><img src="Image/simplicio_070.png" width="24" height="24" align="right" /></td>
          <td width="146" align="left">
            <input name="adname" type="text" size="20" />
         </td>
          <td width="62" rowspan="2" align="left"><input type="image" src="Image/admin_Btn_login.gif"  /></td>
        </tr>
      <tr>
        <td width="119" height="41" align="right">&nbsp;&nbsp;</td>
          <td width="30" height="41" align="right" valign="top"><img src="Image/dialog-password.png" width="24" height="24" align="right" />&nbsp;&nbsp;</td>
          <td width="146"><label>
            <input name="adpassword" type="password" size="20" />
          </label></td>
        </tr>
    </table>
    </td>
  </tr>
</table>
</form>
</div>
</center>
</body>
</html>
