<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>know</title>
<meta name="viewport" content="width=device-width, initail-scale=1">

<link rel="stylesheet" href="/touristportal/bootfiles/bootstrap.min.css">
<script src="/touristportal/bootfiles/jquery-3.1.1.min.js"></script>
<script src="/touristportal/bootfiles/bootstrap.min.js"></script>

<script>
$(document).ready(function()
		{ 
	
	$("button").click(function()
			{
				//alert(this.id)
				var pagename=this.id;
				var path="/bloodbank"+pagename;
				//alert(path);
				$('#Div1').load(path);
		$('#Div1').show();
			
			});
		});





</script>
</head>
<body>
<div style="width: 100%;height:85px;background-image: url('/bloodbank/imgs/b18.jpg');float: left;">

</div>
<div class="container" style="margin-left: 250px">
  <button type="button" class="btn">Basic</button>
  <button type="button" class="btn btn-default" id="/jsp/wbc.jsp ">WhiteBloodCells</button>
  <button type="button" class="btn btn-primary" id="/jsp/transfusion.jsp">BloodTransfusion</button>
  <button type="button" class="btn btn-success" id="/jsp/importance.jsp">Importance</button>
  <button type="button" class="btn btn-info" id="/jsp/motivat.jsp">Motivation</button>
  <button type="button" class="btn btn-danger" id="/jsp/rbc.jsp">RedBloodCells</button>
       
</div>
<div style="width: 100%;height: 600px;background-color: skyblue">
<div style="width: 77%;height: 467px;background-color: yellow;margin-left:150px;margin-top:20px;overflow:scroll;float: left" id="Div1">
</div>
</div>
</body>
</html>