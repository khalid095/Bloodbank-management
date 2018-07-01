<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bloodbank.dbutil.CrudOperation"%>
    <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
String city_name=request.getParameter("cid");
String blood_group=request.getParameter("bld");

System.out.println(city_name+blood_group);
String sql="select * from userdetails where cityname=? and bloodgroup=?";

ResultSet rs=CrudOperation.getData(sql, city_name,blood_group);
int flag=0;
%>
<table style="width:400px;height:300px;border: solid;color: black">
<tr><th>Name</th>
<th>gender</th>
<th>bloodgroup</th>
<th>phoneno</th></tr>
<%
while(rs.next())
{
flag=1;
%>
<tr><th><%=rs.getString("name") %></th>
<th><%=rs.getString("gender") %></th>
<th><%=rs.getString("bloodgroup") %></th>
<th><%=rs.getString("phoneno") %></th></tr>
<%} %>
<% if(flag==0)
{%>
<tr><td>No donors found</td></tr>		
<% }%>
	
</table>
