<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import="com.bean.User" %>
<%@ page import="com.service.EventService" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.lang.*" %>


<%
	if (session.getAttribute("uname") == null && session.getAttribute("pass") == null) {
	response.sendRedirect("admin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Registrations</title>
<meta charset="ISO-8859-1">
<title>List Of Registrations</title>
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
				href="registrationchart.jsp" class="nav-link">Registration Chart</a></li>
			<li class="nav-item d-none d-sm-inline-block active"><a
				href="viewregistration.jsp" class="nav-link">View Registrations</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="addevent.jsp" class="nav-link">Add Event</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="adminlogout.jsp" class="nav-link">Logout</a></li>
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
							<th>User Registration ID</th>
							<th>Full Name</th>
							<th>Registration Date</th>
						</tr>
					</thead>
					<tbody>
							<%
								try{
									ArrayList<User> user=new ArrayList<User>();
									EventService service=new EventService();
									user=service.retriveUserTableEventDetailsService();
									
									for(User u:user){
										/* System.out.println("jsp"+e.getEvent_id()); */
										%><tr>
											<%String url="registrationdetails.jsp?userid="+u.getUser_registration_id()+"&userfullname="+u.getUser_full_name()+"&useremail="+u.getUser_email_id()+"&usermobile="+u.getUser_mobile_no()+"&user_registrationtype="+u.getUser_registration_type()+"&userno_of_tickets="+u.getNo_of_tickets()+"&user_id_card="+u.getUser_id_card()+"&eventid="+u.getEvent_id()+"&user_registered_date="+u.getUser_registraion_date(); %>
											<td><a href="<%= url %>"><%= u.getUser_registration_id() %></a></td>
											<td><%= u.getUser_full_name() %></td>
											<td><%= u.getUser_registraion_date() %></td>	
											<% System.out.println(u.getUser_registraion_date()); %>	
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
	</div>

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