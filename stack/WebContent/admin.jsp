<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
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
<body class="content-wrapper">

	<nav class="navbar navbar-expand navbar-primary navbar-dark" style="background-color: black;">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">Event Registration</a>
			</div>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="index.html" class="nav-link">Home</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a href="event.jsp"
				class="nav-link">Events</a></li>
			<li class="nav-item d-none d-sm-inline-block active"><a href="admin.jsp"
				class="nav-link">Admin</a></li>
		</ul>

		<!-- SEARCH FORM -->
		<form class="form-inline ml-3">
			<div class="input-group input-group-sm">
				<input class="form-control form-control-navbar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-navbar" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</nav>
	</br>
	
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- left column -->
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Please Login To Access The Admin Panel</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form action="AdminController" method="get">
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputFullname1">Username</label> <input
										type="text" class="form-control" id="username" name="username"
										placeholder="Enter Username" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputMobile1">Password</label> <input
										type="password" class="form-control" id="password" name="password"
										placeholder="Enter Password" required="required">
								</div>
							
							</div>
							<!-- /.card-body -->

							<div class="card-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
					<!-- /.card -->

				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</section>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/demo.js"></script>
</body>
</html>