<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="com.bean.Event" %>
<%@ page import="com.service.EventService" %>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Events</title>
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

	<nav class="navbar navbar-expand navbar-primary navbar-dark"
		style="background-color: black;">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">Event Registration</a>
			</div>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="index.html" class="nav-link">Home</a></li>
			<li class="nav-item d-none d-sm-inline-block active"><a
				href="event.jsp" class="nav-link">Events</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="admin.jsp" class="nav-link">Admin</a></li>
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
	<div class=row>
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Events List</h3>

					<div class="card-tools">
						<ul class="pagination pagination-sm float-right">
							<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body p-0">
					<table class="table">
						<thead>
							<tr>
								<th>Event ID</th>
								<th>Event Name</th>
								<th>Start date</th>
								<th>End Date</th>
								<th>Available Tickets</th>
								<th>Register Open</th>
							</tr>
						</thead>
						<tbody>
							<%
								try{
									ArrayList<Event> event=new ArrayList<Event>();
									EventService service=new EventService();
									event=service.retriveTableEventDetails();
									
									for(Event e:event){
										/* System.out.println("jsp"+e.getEvent_id()); */
										%><tr>
											<td><%= e.getEvent_id() %></td>
											<td><%= e.getEvent_name() %></td>
											<td><%= e.getEvent_start() %></td>
											<td><%= e.getEvent_end() %></td>
											<td><%= e.getRemaining_tickets() %></td>
											<%String url="userform.jsp?EventId="+e.getEvent_id()+"&EventDescription="+e.getEvent_description()+"&EventName="+e.getEvent_name(); %>
											<td><a href="<%= url %>">Book</a></td>
										<%
									}
									
								}catch(Exception e){
									System.out.println(e);
								}
							%>
							<tr>
							
						</tbody>
					</table>
				</div>
				<!-- /.card-body -->
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
	<!-- /.card -->


	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/demo.js"></script>
	<!-- bs-custom-file-input -->
	<script src="js/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>
</body>
</html>