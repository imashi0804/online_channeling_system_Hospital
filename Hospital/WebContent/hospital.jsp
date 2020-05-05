	<%@page import="model.hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="view/css/bootstrap.min.css" rel="stylesheet">
<script src="component/jquery-3.5.0.min.js" type="text/javascript"></script>
<script src="component/appointmentUI.js" type="text/javascript"></script>
</head>
<body>



<div id="divItemsGrid" style="margin-top:10px;">
		<% 
		
		hospital Aobj2 = new  hospital();
		out.print(Aobj2.getHospitalDetails());
		
		%> 
</div> 
</body>
</html>