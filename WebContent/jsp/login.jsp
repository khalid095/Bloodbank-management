<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
<script src="/bloodbank/js/validation.js"></script>
<script>
	function main() {
		var userid = document.getElementById("txtuserid").value;
		var userpass = document.getElementById("txtuserpass").value;
		var b = true;
		//alert(userid);
		if (checkEmpty(userid) == false) {
			//alert("userid needed");
			document.getElementById("msg").innerHTML = "required userid ";
			b = false;

		}

		if (checkEmpty(userpass) == false) {
			// alert("userpass needed");
			document.getElementById("msg1").innerHTML = "required userpass";
			b = false;

		}

		if (checkLen(userpass) == false) {
			//alert("password must be 8 charecter");
			document.getElementById("msg2").innerHTML = "password must be 8 charectar";
			b = false;
		}

		return b;
	}
</script>
</head>
<body>
	<%
		String info = (String) request.getAttribute("info");%>
	<div style="width: 100%; height: 85px; background-image: url('/bloodbank/imgs/b18.jpg'); float: left"></div>
<div style="width: 100%;height: 560px;background-color:skyblue;float:left">
	<h1 id="fmt" style="color: black; text-align: center">LOGIN</h1>
	
	<div style="width: 30%;height: 30%;margin-left:400px;margin-top:20px;float:left">
	<form method="post" action="/bloodbank/Login" onsubmit="return main()">
			<table style="width: 100%; height:100%;color:grey;margin-left:50px;border: solid">

				<tr>
					<th style="color: black">User id:*</th>
					<th><input type="text" name="txtuserid" id="txtuserid"></th>
				</tr>

				<tr>
					<th style="color: black">User pass:*</th>
					<th><input type="password" name="txtuserpass" id="txtuserpass"></th>
				</tr>


				<tr>
					<th colspan="2" align="center"><button type="submit">Login</button></th>
				</tr>

			</table>

		</form>
		<h5 id="msg" style="color: black; text-align: center;"></h5>
		<h5 id="msg1" style="color: black; text-align: center;"></h5>
		<h5 id="msg2" style="color: black; text-align: center;"></h5>
		
	</div>


</div>
</body>
</html>