<!DOCTYPE html>
<%@page import="bloodbank.dbutil.CrudOperation"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search</title>
<script src="/bloodbank/bootfiles/jquery-3.1.1.min.js"></script>

<script>
	$(document).ready(function() {
		//	alert("in fun")
		$("#cityname").change(function() {
			var cn = this.value;
			//	alert(cn);
			$.get("/bloodbank/jsp/showdonor.jsp", {
				cname : cn
			}, function(data, status) {
				$("#divalertmsg").html(data);
				$("#divalertmsg").show();
			});
		});
	});
</script>
</head>
<body bgcolor="white">
	<div
		style="width: 100%; height: 85px; background-image: url('/bloodbank/imgs/b18.jpg'); float: left"></div>

	<div
		style="width: 100%; height: 600px; background-color: skyblue; float: left">
		<h1 style="color: black; text-align: center">View Donor</h1>
		<div
			style="width: 200px; height: 140px; margin-left: 550px; float: left;">
			<form onsubmit="return main()">
				<table style="width: 100%; height: 100%">

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
						</select></th></tr>
				</table>
			</form>
		</div>

		<div
			style="width: 450px; height: 380px; display: none; margin-left: 460px; float: left"
			id="divalertmsg"></div>
	</div>
</body>
</html>