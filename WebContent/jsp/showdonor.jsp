<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bloodbank.dbutil.CrudOperation"%>
    <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>showdonor</title>
<script src="/bloodbank/bootfiles/jquery-3.1.1.min.js"></script>
</head>
<body>
<%
String city_name=request.getParameter("cname");
String sql="select * from userdetails where cityname=?";
ResultSet rs=CrudOperation.getData(sql, city_name);
%>
<table style="color:black;width:100%;height:100%;border: solid">
<tr><th>Name</th>
<th>gender</th> 
<th>bloodgroup</th></tr>
<%
while(rs.next())
{%>
<tr><th><%=rs.getString("name") %></th>
<th><%=rs.getString("gender") %></th>
<th><%=rs.getString("bloodgroup") %></th></tr>
<%} %>

</table>
</body>
</html>