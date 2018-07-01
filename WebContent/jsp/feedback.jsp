<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>feedback</title>
<script src="/bloodbank/js/validation.js"></script>
<script>
	function main() {
		var emailid = document.getElementById("txtemailid").value;
		var name = document.getElementById("txtname").value;
		var text = document.getElementById("text").value;
		var b = true;
		//alert(userid);
		if (checkEmpty(emailid) == false) {
			//alert("userid needed");
			document.getElementById("msg").innerHTML = "required email";
			b = false;

		}

		if (checkEmpty(name) == false) {
			// alert("userpass needed");
			document.getElementById("msg1").innerHTML = "required name";
			b = false;

		}
		if (checkEmpty(text) == false) {
			// alert("userpass needed");
			document.getElementById("msg2").innerHTML = "type atleast one sentance";
			b = false;

		}
		

		return b;
	}
</script>
</head>
<body>

	<div style="width: 100%; height: 85px; background-image: url('/bloodbank/imgs/b18.jpg'); float: left"></div>
<div style="width: 100%;height: 565px;background-color:skyblue;float:left">
	<h1 id="fmt" style="color: black; text-align: center">FEEDBACK</h1>
	
	<div style="width: 30%;height: 30%;margin-left:400px;margin-top:20px;float:left">
		<form method="post" action="/bloodbank/Feedback" onsubmit="return main()">
			<table style="width: 100%; height:100%;color: grey;border: solid;margin-left: 50px">

				<tr>
					<th style="color: black">Email id:*</th>
					<th><input type="text" name="txtemailid" id="txtemailid"></th>
				</tr>

				<tr>
					<th style="color: black">Name:*</th>
					<th><input type="text" name="txtname" id="txtname"></th>
				</tr>


                <tr>
					<th style="color: black">Text:*</th>
					<th><textarea  name="text" id="text" rows="4" cols="18"></textarea> </th>
				</tr>
				
				
				<tr>
					<th colspan="2" align="center"><button type="submit">OK</button></th>
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