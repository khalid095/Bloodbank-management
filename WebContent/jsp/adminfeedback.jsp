<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,bloodbank.dbutil.*,java.util.*,bloodbank.bens.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminfeedback</title>
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
<div style="width: 18%;height: 700px;background-color: lightslategrey;float: left">
<%@include file="/WEB-INF/adminmenu.html" %>

</div>
<div style="width: 82%;height: 700px;background-color:skyblue;float: left">

<%
		String strsql = "select * from feedback";
		ResultSet rs = CrudOperation.getData(strsql);
%>
	<table style="margin-left: 300px;margin-top: 20px;color: black" border="3">
		<tr>
			<th>Emailid</th>
			<th>Name</th>
			<th>Text</th>
			<th>Date</th>
		</tr>



		<%
			while (rs.next()) {
				String feedbackid = rs.getString("feedbackid");
		%> 
		
<tr>

<th><%=rs.getString("emailid")%></th>
<th><%=rs.getString("name")%></th>
<th><%=rs.getString("text")%></th>
<th><%=rs.getString("date") %></th>
</tr>

<%} %>
   </table>


</div>
<div style="width: 100%;height: 110px;background-color: azure;float: left">
<h5>Created by khalid masood</h5>
<h3 style="text-align: center">Copyright 2017@ e-Bloodbank</h3>
</div>
</body>
</html>