<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	if (session.getAttribute("uname") == null && session.getAttribute("pass") == null) {
	response.sendRedirect("admin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- SweetAlert2 -->
<link rel="stylesheet" href="css/sweetalert2.min.css">
<!-- Toastr -->
<link rel="stylesheet" href="css/toastr.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body>

</body>
</html>
<body class="content-wrapper">

	<nav class="navbar navbar-expand navbar-primary navbar-dark"
		style="background-color: black;">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">Event Registration</a>
			</div>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="registrationchart.jsp" class="nav-link">Registration Chart</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="viewregistration.jsp" class="nav-link">View Registrations</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="addevent.jsp" class="nav-link">Add Event</a></li>
		</ul>
		<!-- SEARCH FORM -->
		<form class="form-inline ml-3">
			<div class="input-group input-group-sm">
				<input class="form-control form-control-navbar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-navbar" type="submit">
						<i class="fas fa-search" src="images/searchimg.jpg"></i>
					</button>
				</div>
			</div>
		</form>
	</nav>
	</br>
	<%
	
	try{
		session.invalidate();
		response.sendRedirect("admin.jsp");	
	}catch(Exception e){
		response.sendRedirect("admin.jsp");
	}
	%>

</body>
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>
<!-- jQuery Knob -->
<script src="js/jquery.knob.min.js"></script>
<!-- Sparkline -->
<script src="js/jquery.sparkline.min.js"></script>
</html>