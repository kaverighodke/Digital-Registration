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
<title>Add Event</title>
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

<!-- daterange picker -->
<link rel="stylesheet" href="css/daterangepicker.css">

<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet" href="css/tempusdominus-bootstrap-4.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="css/select2.min.css">
<link rel="stylesheet" href="css/select2-bootstrap4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet" href="css/bootstrap-duallistbox.min.css">

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
			<li class="nav-item d-none d-sm-inline-block"><a
				href="viewregistration.jsp" class="nav-link">View Registrations</a></li>
			<li class="nav-item d-none d-sm-inline-block active"><a
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

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- left column -->
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Please Enter Details To Add Event</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form action="AddEventController" method="get">
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputFullname1">Event Name</label> <input
										type="text" class="form-control" id="eventname"
										name="eventname" placeholder="Enter Event Name" required="required">
								</div>
								<!-- Date and time range -->
								<div class="form-group">
									<label>Event Date and time range:</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="far fa-clock"></i></span>
										</div>
										<input type="text" class="form-control float-right"
											name="eventdatetime" id="reservationtime" required="required">
									</div>
									<!-- /.input group -->
								</div>
								<div class="form-group">
									<label for="exampleInputMobile1">Event Description</label> <input
										type="text" class="form-control" id="eventdescription"
										name="eventdescription" placeholder="Enter Event Description" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputMobile1">Total Tickets</label> <input
										type="number" class="form-control" id="availabletickets"
										name="availabletickets" placeholder="Enter Available Tickets" required="required">
								</div>
								<div class="form-group">
									<label for="exampleInputMobile1">Event Organizer</label>
									 <input
										type="text" class="form-control" id="eventorganizer"
										name="eventorganizer" placeholder="Enter Event Organizer" required="required">
								</div>
								<!-- /.form group -->
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

<!-- Select2 -->
<script src="js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="js/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="js/moment.min.js"></script>
<script src="js/jquery.inputmask.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="js/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Page script -->
<script>
	$(function() {
		//Initialize Select2 Elements
		$('.select2').select2()

		//Initialize Select2 Elements
		$('.select2bs4').select2({
			theme : 'bootstrap4'
		})

		//Datemask dd/mm/yyyy
		$('#datemask').inputmask('dd/mm/yyyy', {
			'placeholder' : 'dd/mm/yyyy'
		})
		//Datemask2 mm/dd/yyyy
		$('#datemask2').inputmask('mm/dd/yyyy', {
			'placeholder' : 'mm/dd/yyyy'
		})
		//Money Euro
		$('[data-mask]').inputmask()

		//Date range picker
		$('#reservation').daterangepicker()
		//Date range picker with time picker
		$('#reservationtime').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			locale : {
				format : 'MM/DD/YYYY hh:mm A'
			}
		})
		//Date range as a button
		$('#daterange-btn').daterangepicker(
				{
					ranges : {
						'Today' : [ moment(), moment() ],
						'Yesterday' : [ moment().subtract(1, 'days'),
								moment().subtract(1, 'days') ],
						'Last 7 Days' : [ moment().subtract(6, 'days'),
								moment() ],
						'Last 30 Days' : [ moment().subtract(29, 'days'),
								moment() ],
						'This Month' : [ moment().startOf('month'),
								moment().endOf('month') ],
						'Last Month' : [
								moment().subtract(1, 'month').startOf('month'),
								moment().subtract(1, 'month').endOf('month') ]
					},
					startDate : moment().subtract(29, 'days'),
					endDate : moment()
				},
				function(start, end) {
					$('#reportrange span').html(
							start.format('MMMM D, YYYY') + ' - '
									+ end.format('MMMM D, YYYY'))
				})

		//Timepicker
		$('#timepicker').datetimepicker({
			format : 'LT'
		})

		//Bootstrap Duallistbox
		$('.duallistbox').bootstrapDualListbox()

		//Colorpicker
		/*     $('.my-colorpicker1').colorpicker()
		 //color picker with addon
		 $('.my-colorpicker2').colorpicker()

		 $('.my-colorpicker2').on('colorpickerChange', function(event) {
		 $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
		 });

		 $("input[data-bootstrap-switch]").each(function(){
		 $(this).bootstrapSwitch('state', $(this).prop('checked'));
		 }); */

	})
</script>
</html>