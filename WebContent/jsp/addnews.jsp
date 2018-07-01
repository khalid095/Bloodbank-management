<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,bloodbank.dbutil.*,java.util.*,bloodbank.bens.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>addnews</title>
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
<form method="post" action="/bloodbank/AddNews" onsubmit="return main()">
			<table style="width: 60%; height:60%;margin-left:200px;color:black;margin-top:100px;border: solid">

				<tr>
					<th>Content:*</th>
					<th><textarea  name="txtcontent" id="txtcontent" rows="5" cols="20"></textarea></th>
				</tr>

				<tr>
					<th>Subject:*</th>
					<th><textarea name="txtsub" id="txtsub" rows="3" cols="20"></textarea></th>
				</tr>


                <tr>
					<th>Date:*</th>
					<th><input type="date" name="txtdate" id="txtdate"> </th>
				</tr>
				
				
				<tr>
					<th colspan="2" align="center"><button type="submit">OK</button></th>
				</tr>

			</table>

		</form>

</div>
<div style="width: 100%;height: 110px;background-color: azure;float: left">
<h5>Created by khalid masood</h5>
<h3 style="text-align: center">Copyright 2017@ e-Bloodbank</h3>
</div>
</body>
</html>