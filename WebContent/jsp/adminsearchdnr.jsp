<%@page import="bloodbank.dbutil.CrudOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,bloodbank.dbutil.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>adminsearchdnr</title>

<script src="/bloodbank/bootfiles/jquery-3.1.1.min.js"></script>

<script>
$(document).ready(function()
		{ 
//	alert("in fun")
	$("#cityname").change(
			function(){
				var cn=this.value;
			//	alert(cn);
				$.get("/bloodbank/jsp/showdonor.jsp",
				{
					cname:cn
				},
				function(data,status){
					$("#divalertmsg").html(data);
					$("#divalertmsg").show();
				});
			});
		});

</script>
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

<h1 style = "color:black;text-align: center">View Donor</h1>
<div style="width: 20%;height: 20%;margin-left:500px;float: left">
<form onsubmit="return main()">
 <table style="width: 100%;height: 100%">
        
       <tr>
				<th style="color: black">City</th>
				<th><select id="cityname" name="cityname">
				<option>select city</option>
				<%
				String strsql="select * from city";
				ResultSet rs=CrudOperation.getData(strsql);
				while(rs.next())
				{
				%>
				<option value="<%=rs.getString("cityname")%>"><%=rs.getString("cityname") %></option><%} %>
				</select>

</table>
</form>
</div>
<div
			style="width: 450px; height: 380px; display: none; margin-left: 410px; float: left"
			id="divalertmsg"></div>
	</div>
</div>
<div style="width: 100%;height: 110px;background-color: azure;float: left">
<h5>Created by khalid masood</h5>
<h3 style="text-align: center">Copyright 2017@ e-Bloodbank</h3>
</div>
</body>
</html>