


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,bloodbank.dbutil.*,java.util.*,bloodbank.bens.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>veiwprofile</title>
</head>
<body bgcolor="white">
<div style="width: 100%;height:96px;background-image: url('/bloodbank/imgs/admin.jpg');float: left;">

<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(basePath);

HttpSession hs;
hs=request.getSession(false);
		String ui=(String)hs.getAttribute("userinfo");
		if(ui==null||hs.isNew())
		{
			response.sendRedirect("/bloodbank/jsp/login.jsp");
		}
		else
		{
			String imgname="";
			String picsrc=null;
			
			String strsql="select picname from userdetails where userid=?";
			
			ResultSet rs=CrudOperation.getData(strsql,ui);
			if(rs.next())
			{
				imgname=rs.getString("picname");
				if(imgname==null)
				{
					picsrc="/bloodbank/imgs/Untitled1.jpg";
					
				}
				else{
					
					picsrc=basePath+ui+"/"+imgname;
			}
			}%>
			<h4 style="color: red">Hello<i><%=ui%></i>
			<img src="<%=picsrc %>" style="width:60px;margin-left:900px;height: 50px" class="img-circle">
			<%@include file="/WEB-INF/signout.html" %></h4>
			
			
			
		
		<%} %>
		

</div>
<div style="width: 18%;height: 700px;background-color: lightslategrey;float: left">
<%@include file="/WEB-INF/menu.html" %>

</div>
<div style="width: 82%;height: 700px;background-color:skyblue;float: left">

<%
String strsql="select * from userdetails where userid=?";
ResultSet rs=CrudOperation.getData(strsql,ui);
if(rs.next())
{%>

<table style="width: 80%;height: 80%;color:black;margin-left:200px;margin-top:20px;border: solid">
<tr><th>Name</th><th><%=rs.getString("name") %></th></tr>
<tr><th>Address</th><th><%=rs.getString("address") %></th></tr>
<tr><th>Email</th><th><%=rs.getString("email") %></th></tr>
<tr><th>Gender</th><th><%=rs.getString("gender") %></th></tr>
<tr><th>DOB</th><th><%=rs.getString("dob") %></th></tr>
<tr><th>City</th><th><%=rs.getString("cityname") %></th></tr>
<tr><th>Bloodgroup</th><th><%=rs.getString("bloodgroup") %></th></tr>
<tr><th>phone no</th><th><%=rs.getString("phoneno") %></th></tr>
</table>
<%} %>

</div>
<div style="width: 100%;height: 110px;background-color: azure;float: left">
<h5>Created by khalid masood</h5>
<h3 style="text-align: center">Copyright 2017@ e-Bloodbank</h3>
</div>
</body>
</html>
