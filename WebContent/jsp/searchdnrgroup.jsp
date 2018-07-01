<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,bloodbank.dbutil.*,java.util.*,bloodbank.bens.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search donor</title>
<script src="/bloodbank/bootfiles/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function() {
	//alert("in fun")
		$("#btnsearch").click(function() {
			var ci=$('option:selected','#cityname').val();
			var bd=$('option:selected','#bloodgrp').val();
			//alert(ci+bd);
			$.get("/bloodbank/jsp/showdnrgroup.jsp",
					{
				cid:ci,
				bld:bd
					},
					
					
					
					function(data,status){
						//alert(data)
						$("#divalertmsg").html(data);
						$("#divalertmsg").show();
					});
		});
			
			
	
	});
</script>
</head>
<body>
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

	<form>
				<table style="width: 600px; height: 100px;margin-left: 150px;margin-top: 50px;color: white">

					<tr>
						<th style="color: black">City</th>
						<th><select id="cityname" name="cityname">
								<option>select city</option>
								<%
									String strsql = "select * from city";
									ResultSet rs = CrudOperation.getData(strsql);
									while (rs.next()) {
								%>
								<option value="<%=rs.getString("cityname")%>"><%=rs.getString("cityname")%></option>
								<%
									}
								%>
						</select></th>
						
						<th style="color: black">Blood group</th>
						<th><select id="bloodgrp" name="bloodgrp">
								<option>select BloodGroup</option>
								<%
									String strsqlbld = "select * from bloodgroup";
									ResultSet rw = CrudOperation.getData(strsqlbld);
									while (rw.next()) {
								%>
								<option value="<%=rw.getString("bloodgroup")%>"><%=rw.getString("bloodgroup")%></option>
								<%
									}
								%>
						</select></th></tr>
					<tr>	<th colspan="4"><button type="button" id="btnsearch">search</button></th></tr>
				</table>
			</form>
<div style="width: 800px;height: 400px;margin-left: 150px;display:none;float:left" id="divalertmsg">
</div>

</div>
<div style="width: 100%;height: 110px;background-color: azure;float: left">
<h5>Created by khalid masood</h5>
<h3 style="text-align: center">Copyright 2017@ e-Bloodbank</h3>
</div>
</body>
</html>