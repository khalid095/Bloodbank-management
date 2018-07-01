

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,bloodbank.dbutil.*,java.util.*,bloodbank.bens.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminpass</title>
</head>
<body bgcolor="white">
<div style="width: 100%;height:85px;background-image: url('/bloodbank/imgs/admin.jpg');float: left;">
<% HttpSession hs;
hs=request.getSession(false);
		String ui=(String)hs.getAttribute("userinfo");
		if(ui==null||hs.isNew())
		{
			response.sendRedirect("/bloodbank/jsp/login.jsp");
		}
		else
		{ %>
		<h3 style="color: crimson">Hello<i><%=ui%></i></h3>
		<%@include file="/WEB-INF/signout.html" %>
		<%} %>
		
</div>
<div style="width: 18%;height: 600px;background-color: lightslategrey;float: left">
<%@include file="/WEB-INF/adminmenu.html" %>

</div>
<div style="width: 82%;height: 600px;background-color:skyblue;float: left">

<%
String strsql="select * from logindetails where userid=?";
ResultSet rs=CrudOperation.getData(strsql,ui);
if(rs.next())
{%>
<form method="post" action="/bloodbank/ChangePass">
<table style="color:black;width: 20%;height: 20%;margin-left: 300px;margin-top: 150px;float: left;border: solid">
<tr><th>Change password</th><th><input type="text" name="txtuserpass" value="<%=rs.getString("userpass") %>"></th></tr>
 <tr><th colspan="2"><button type="submit">Change</button></th></tr>
</table></form>
<%} %>
</div>
<div style="width: 100%;height: 110px;background-color: azure;float: left">
<h5>Created by khalid masood</h5>
<h3 style="text-align: center">Copyright 2017@ e-Bloodbank</h3>
</div>
</body>
</html>