
<%@page import="model.hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HelthCare</title>
<link href="view/css/bootstrap.min.css" rel="stylesheet">
<script src="component/jquery-3.5.0.min.js" type="text/javascript"></script>
<script src="component/hostpital.js" type="text/javascript"></script>
</head>
<body>
	<div>
		
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<a class="navbar-brand" href="#">Hospital Management</a>
		</nav>
	
		<div class="container shadow-sm p-3 mb-5 bg-white rounded ">

		<div id="signupbox" margin-top:50px" class="mainbox">
			<div class="panel panel-info">
			
				<div class="panel-body container">
					<form id="detailform" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="firstname" class="col-md-3 control-label">
								<h6>Hospital Name</h6> </label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="hospitalName"
									placeholder="Last Name" id="hospitalName">
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-md-3 control-label"><h6>Hospital
								Address</h6></label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="hospitalAddress"
									placeholder="Last Name" id="hospitalAddress">
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label"><h6>Phone
								number</h6></label>
							<div class="col-md-9">
								<input type="text" class="form-control" name="phone"
									placeholder="phone number" id="phone">
							</div>
						</div>

						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label"><h6>Email</h6></label>
							<div class="col-md-9">
								<input type="email" class="form-control" name="hospitalEmail"
									placeholder="Email" id="hospitalEmail">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-3 control-label"><h6>Password</h6></label>
							<div class="col-md-9">
								<input type="password" class="form-control" name="password"
									placeholder="password" id="password">
							</div>
						</div>

						<input type="hidden" id="hidItemIDSave" name="HospitalId" value="">

						<div id="alertSuccess" class="alert alert-success "></div>

						<div id="alertError" class="alert alert-danger"></div>

						<button type="button" id="btnSave" class="btn btn-primary"><h6>Register</h6></button>


					</form>
				</div>
			</div>
		</div>
	</div>
		<div id="divItemsGrid" style="margin-top: 10px; margin-left:10%; margin-right: 10%" class="table-responsive-md">
			<%
				hospital Aobj2 = new hospital();
			out.print(Aobj2.getHospitalDetails());
			%>
		</div>
	</div>
	
	
</body>
</html>