<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.service.EventService" %>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.io.PrintWriter" %>
	
	<%
	PrintWriter p = response.getWriter();
		EventService service = new EventService();
		int count = service.getTicketsCountService(request.getParameter("EventId"));
		if(count<=0){
			p.println("<script type=\"text/javascript\">");
			p.println("alert('" + count + " Tickets Available You Can Register For Event')");
			p.println("location='event.jsp'");
			p.println("</script>");
		}
	
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- SweetAlert2 -->
<link rel="stylesheet" href="css/sweetalert2.min.css">
<link rel="stylesheet" href="css/bootstrap-4.min.css">
<!-- Toastr -->
<link rel="stylesheet" href="css/toastr.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<style>
.image-preview {
	width: 300px;
	height: 150px;
	min-height: 100px;
	border: 2px;
	margin-top: 15px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	color: #cccccc;
}

.image-preview__image {
	display: none;
	width: 100%;
}
</style>
</head>
<body class="content-wrapper">

	<nav class="navbar navbar-expand navbar-primary navbar-dark"
		style="background-color: black;">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">Event Registration</a>
			</div>
			<li class="nav-item d-none d-sm-inline-block active"><a
				href="index.html" class="nav-link">Home</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="event.jsp" class="nav-link">Events</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="admin.html" class="nav-link">Admin</a></li>
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

	<form role="form" action="UserController" method="post"
		enctype="multipart/form-data">

		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="card card-primary">
							<div class="card-header">
								<h3 class="card-title">Registration Form</h3>
							</div>
							<!-- /.card-header -->
							<!-- form start -->
							<input type="hidden" name="eventid" id="eventid"
								value="<%=request.getParameter("EventId")%>">
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputFullname1">Full Name</label> <input
										type="text" class="form-control" id="fullname" name="fullname"
										placeholder="Enter Full Name" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputMobile1">Mobile No.</label> <input
										type="number" class="form-control" id="mobile" name="mobile"
										placeholder="Enter Mobile Number" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="email" name="email"
										placeholder="Enter email" required="required">
								</div>
								<div class="form-group">
									<label for="idcard">Upload ID Card</label> <input type="file" accept="image/*"
										class="form-control" id="idcard" name="file" placeholder="Upload ID Card" >
								</div>
								<div class="form-group">
									<label for="exampleInputRegistrationType1">Registration
										Type</label> <select class="form-control" id="regtype" onchange="myFunction()" name="regtype" required="required">
										<option>Select type</option>
										<option value="1">Self</option>
										<option>Group</option>
										<option>Corporate</option>
										<option>Others</option>
									</select>
								</div>
								<div class="form-group">
									<label for="exampleInputNumberOfTickets1">Number Of
										Tickets</label> <input type="number" class="form-control" id="tickets"
										name="tickets" placeholder="Enter Number of Tickets" required="required">
								</div>
							</div>
							<!-- /.card-body -->
							<div class="row">
								<div class="col-md-0">
									<div class="card-footer">
										<button type="button" class="btn btn-default" name="btn"
											value="Submit" id="submitBtn" onclick="myFun();">Preview</button>
									</div>
								</div>
								<div class="col-md-2">
									<div class="card-footer">
										<button type="reset" class="btn btn-primary">Cancel</button>
									</div>
								</div>
								<div class="col-md-10"></div>
							</div>
						</div>
						<!-- /.card -->
						<div class="modal fade" id="modal-lg">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">Verify User Details</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p>
										<table class="table">
											<tr>
												<th>Full Name</th>
												<td><label id="fname"></label></td>
											</tr>
											<tr>
												<th>Event Id</th>
												<td><label id="eid"></label></td>
											</tr>
											<tr>
												<th>Mobile Number</th>
												<td><label id="emobile"></label></td>
											</tr>
											<tr>
												<th>Email Id</th>
												<td><label id="eemail"></label></td>
											</tr>
											<tr>
												<th>Id Card</th>
												<td><div class="image-preview" id="imagePreview">
														<img src="" alt="Image Preview"
															class="image-preview__image"> <span
															class="image-preview__default-text">Image Preview</span>
													</div></td>
											</tr>
											<tr>
												<th>Registration Type</th>
												<td><label id="eregtype"></label></td>
											</tr>
											<tr>
												<th>Tickets</th>
												<td><label id="etickets"></label></td>
											</tr>
										</table>



										</p>

									</div>
									<div class="modal-footer justify-content-between">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary" id="submit">Save
											changes</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
					<div class="col-md-6">
						<div class="card card-primary card-tabs">
							<div class="card-header p-0 pt-1">
								<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="custom-tabs-one-home-tab" data-toggle="pill"
										href="#custom-tabs-one-home" role="tab"
										aria-controls="custom-tabs-one-home" aria-selected="true">About
											<%=request.getParameter("EventName")%> Event
									</a></li>
								</ul>
							</div>
							<div class="card-body">
								<div class="tab-content" id="custom-tabs-one-tabContent">
									<div class="tab-pane fade show active"
										id="custom-tabs-one-home" role="tabpanel"
										aria-labelledby="custom-tabs-one-home-tab">
										<%=request.getParameter("EventDescription")%></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/demo.js"></script>
	<!-- SweetAlert2 -->
	<script src="js/sweetalert2.min.js"></script>
	<!-- Toastr -->
	<script src="js/toastr.min.js"></script>
	<!-- bs-custom-file-input -->
	<script src="js/bs-custom-file-input.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>
	<script type="text/javascript">
		function myFun() {
			debugger;
			var fname = document.getElementById('fullname').value;
			document.getElementById('fname').innerHTML = fname;

			var eid = document.getElementById('eventid').value;
			document.getElementById('eid').innerHTML = eid;

			var emobile = document.getElementById('mobile').value;
			document.getElementById('emobile').innerHTML = emobile;

			var eemail = document.getElementById('email').value;
			document.getElementById('eemail').innerHTML = eemail;

			const infile = document.getElementById("idcard");
			const preimgcon = document.getElementById("imagePreview");
			const preimg = preimgcon.querySelector(".image-preview__image");
			const pretext = preimgcon.querySelector(".image-preview__default-text");

			infile.addEventListener("change",function(){
				const file =this.files[0];
				if(file){
					const reader = new FileReader();

					pretext.style.display="none";
					preimg.style.display="block";

					reader.addEventListener("load",function(){
						preimg.setAttribute("src",this.result);
					});
					reader.readAsDataURL(file);
				}
			});

			var eregtype = document.getElementById('regtype').value;
			document.getElementById('eregtype').innerHTML = eregtype;

			var etickets = document.getElementById('tickets').value;
			document.getElementById('etickets').innerHTML = etickets;

			$('#modal-lg').modal('show');
		}
	</script>

	<script type="text/javascript">
		$(function() {
			const Toast = Swal.mixin({
				toast : true,
				position : 'top-end',
				showConfirmButton : false,
				timer : 3000
			});
		});
	</script>
	<script type="text/javascript">
	function myFunction() {
		  var x = document.getElementById("regtype");
		  var i = x.selectedIndex;
		  if(i=="Self")
		  		document.getElementById("tickets").innerHTML = x.options[i].val();
		}
	</script>
</body>
</html>