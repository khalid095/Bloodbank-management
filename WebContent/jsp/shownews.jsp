<%@page import="bloodbank.dbutil.CrudOperation"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>shownews</title>

</head>

<body bgcolor="white">
	<div
		style="width: 100%; height: 85px; background-image: url('/bloodbank/imgs/b18.jpg'); float: left"></div>

	
	<div
		style="width: 100%; height: 550px;background-color:skyblue;text-align:center;color:black; float: left">
<%
int newsid=Integer.parseInt(request.getParameter("id")); 

System.out.println(newsid);
String strsql="select content from news where newsid=?";
ResultSet rs=CrudOperation.getData(strsql,newsid);
if(rs.next())
{%>
<%=rs.getString("content") %>
<%}%> 

	
	</div>
	
</body>
</html>
			
			
			
			