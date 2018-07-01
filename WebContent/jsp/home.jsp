<!DOCTYPE html>
<%@page import="bloodbank.dbutil.CrudOperation"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/bloodbank/bootfiles/bootstrap.min.css">
<script src="/bloodbank/bootfiles/jquery-3.1.1.min.js"></script>

<script>
	$(document).ready(function() {
	//alert("in fun")
		$("#btnsearch").click(function() {
			var ci=$('option:selected','#cityname').val();
			var bd=$('option:selected','#bloodgroup').val();
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
<script
	src="/bloodbank/bootfiles/bootstrap.min.js"></script>

<title>home</title>

<script>
	var arr = new Array(4);
	arr[0] = "/bloodbank/imgs/slide.jpg";
	arr[1] = "/bloodbank/imgs/slide1.jpg";
	arr[2] = "/bloodbank/imgs/slide2.jpg";
	arr[3] = "/bloodbank/imgs/slide3.jpg";
	var idx = 0;
	function changeImage() {
		document.getElementById("img1").src = arr[idx];

		idx++;
		if (idx > 3) {
			idx = 0;
		}
		setTimeout("changeImage()", 2000);
	}
</script>
</head>

<body bgcolor="white" onload="changeImage()">
	<div
		style="width: 100%; height: 85px; background-image: url('/bloodbank/imgs/b18.jpg'); float: left"></div>

	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Registration <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/bloodbank/html/signup.html">Register here </a></li>
					<li><a href="/bloodbank/jsp/login.jsp">After
							Register(login)</a></li>
				</ul></li>
			<li><a href="/bloodbank/jsp/searchdonor.jsp">Search Donor By
					City</a></li>
			<li><a href="/bloodbank/jsp/knowabout.jsp">Know About..</a></li>
			<li><a href="/bloodbank/jsp/feedback.jsp">Feedback</a></li>
			<li><a href="/bloodbank/html/gallery.html">Gallery</a></li>
			<li><a href="/bloodbank/html/aboutus.html">About Us</a></li>
			<li><a href="/bloodbank/html/contactus.html">Contact Us</a></li>
		</ul>
	</div>
	<div
		style="width: 100%; height: 600px; background-image: url('/bloodbank/imgs/blood1.jpg'); float: left">
		
		
		<div
			style="width: 17%; height: 280px; background-color: skyblue; margin-top: 20px; margin-left: 10px;float :left">
			
			<h4 style="color: black; text-align: center; margin-top: 20px">Update
				News</h4>
				<ul style="list-style-type: none">
				<%
					String strsql = "select newsid,subject from news order by date desc";
					ResultSet rs = CrudOperation.getData(strsql);
					while (rs.next()) {
						int nid = rs.getInt("newsid");
				%>
				<marquee direction=down onmouseover="this.stop()"
					onmouseout="this.start()" scrolldelay=1800 scrollamount=12>
					<li><a href="/bloodbank/jsp/shownews.jsp?id=<%=nid%>"
						style="text-decoration: none"><%=rs.getString("subject")%></a> </li>
				</marquee>
				<%
					}
				%>
			</ul>
			
			<div
			style="width: 100%; height: 265px; background-color:skyblue;margin-top:30px;float: left">
			
			<h4 style="color: black; text-align: center; margin-top: 20px">Feedback</h4>
			<ul style="list-style-type: none">
				<%
					String strfeed = "select feedbackid,name from feedback order by date desc";
					ResultSet rw = CrudOperation.getData(strfeed);
					while (rw.next()) {
						int fid = rw.getInt("feedbackid");
				%>
				<marquee direction=up onmouseover="this.stop()"
					onmouseout="this.start()" scrolldelay=1800 scrollamount=10>
					<li><a href="/bloodbank/jsp/showfeedback.jsp?id=<%=fid%>"
						style="text-decoration: none"><%=rw.getString("name")%></a> </li>
				</marquee>
				<%
					}
				%>
			</ul>
          </div>
			
		</div>
		
		
			
		
			 <div
			style="width: 75%; height: 400px; background-color: white; margin-left:40px; margin-top: 20px; float: left">
			<img src="/bloodbank/imgs/slide3.jpg"
				style="width: 100%; height: 100%" id="img1">
		</div>
		
		
		 <div style="width: 75%; height: 147px; background-color: skyblue; margin-left:280px; margin-top: 20px; float: left">
		 <div style="width: 100%;height: 100%;background-color: skyblue;overflow:scroll;display: none" id="divalertmsg">
		 <table border="1">
		 <tr><th>name</th></tr>
		<tr> <th>email</th></tr>
		<tr> <th>phoneno</th></tr>
		 <tr><th>gender</th></tr>
		 </table>
		 </div>
		<table style="width: 80%;height: 100%;color: black;margin-left: 100px">
		<tr>
						<th>City</th>
						<th><select id="cityname" name="cityname">
								<option>select city</option>
								<%
									String strct = "select * from city";
									ResultSet rc = CrudOperation.getData(strct);
									while (rc.next()) {
								%>
								<option value="<%=rc.getString("cityname")%>"><%=rc.getString("cityname")%></option>
								<%
									}
								%>

						</select></th>
						
						<th>Bloodgroup</th>
						<th><select id="bloodgroup" name="bloodgroup">
						<option>Select bloodgroup</option>
						<%
									String strbld = "select * from bloodgroup";
									ResultSet rb = CrudOperation.getData(strbld);
									while (rb.next()) {
								%>
								<option value="<%=rb.getString("bloodgroup")%>"><%=rb.getString("bloodgroup")%></option>
								<%
									}
								%>
						</select>
						<th><button type="submit" id="btnsearch">Search</button></th>
						
		</tr></table>
		
		</div>
		
	</div>
	
	<div
		style="width: 289px; height: 209px; background-image: url('/bloodbank/imgs/lower.jpg'); float: left">

	</div>
	<div
		style="width: 289px; height: 209px; background-image: url('/bloodbank/imgs/images.jpg'); float: left">

	</div>
	<div
		style="width: 289px; height: 209px; background-image: url('/bloodbank/imgs/lower2.jpg'); float: left">

	</div>
	<div
		style="width: 287px; height: 209px; background-image: url('/bloodbank/imgs/lower1.jpg'); float: left">

	</div>
	<div
		style="width: 193px; height: 209px; background-image: url('/bloodbank/imgs/lower4.jpg'); float: left">

	</div>

	<div
		style="width: 100%; height: 40px; background-color: white; float: left">
		<h5>Created By Khalid Masood</h5>
		<h3 align="center" style="color: red">
			<i>Copyright 2017 @ e-bloodbank</i>
		</h3>
	</div>
</body>
</html>