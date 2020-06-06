<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.bean.User" %>
<%@ page import="java.io.File" %> 
<%@ page import="java.awt.Image" %>
<%@ page import="javax.imageio.ImageIO" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ID Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"> 
<!-- SweetAlert2 -->
<link rel="stylesheet" href="css/sweetalert2.min.css">
<!-- Toastr -->
<link rel="stylesheet" href="css/toastr.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="content-wrapper">

	<nav class="navbar navbar-expand navbar-primary navbar-dark" style="background-color: black;">
		<!-- Left navbar links -->
			<ul class="navbar-nav">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">Event Registration</a>
			</div>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="registrationchart.jsp" class="nav-link">Registration Chart</a></li>
			<li class="nav-item d-none d-sm-inline-block"><a
				href="viewregistration.jsp" class="nav-link active">View Registrations</a></li>
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
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- left column -->
				<div class="col-md-3"></div>
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="card card-primary">
							<div class="card-header">
							<%
								String userid=request.getParameter("userid");
							String username=request.getParameter("userfullname");
							String useremail=request.getParameter("useremail");
							String usermobile=request.getParameter("usermobile");
							String registrationtype=request.getParameter("user_registrationtype");
							String nooftickets=request.getParameter("userno_of_tickets");
							String useridcard=request.getParameter("user_id_card");
							String eventid=request.getParameter("eventid");
							String userregistereddate=request.getParameter("user_registered_date");
							System.out.println(userregistereddate);	
							%>
							    <h3 class="card-title"><%=userid %></h3>
						    </div>
						    <!-- /.card-header -->
						    <!-- form start -->
						    
						    <form role="form" action="viewregistration.jsp">
							    <div class="card-body">
                                    <!-- registration id card  -->
                                    <label >Registration Id Card :</label>
                                    <div role="form" class="col-sm-6">
                                    <%
                                    /*File sourceimage = new File("c:\\uploads\\"+useridcard);
                                    Image image = ImageIO.read(sourceimage);*/
                                     String imgpath="images/"+useridcard;
                                
                                    %>
                                        <img class="img-fluid mb-3" src="<%=imgpath %>" alt="Photo">
                                    </div>
                                    <label >Full Name :</label>
									<p style="margin-left:20px"><%=username %></p>
									<label >Mobile Number :</label>
									<p style="margin-left:20px"><%=usermobile %></p>
									<label >Email :</label>
									<p style="margin-left:20px"><%=useremail %></p>
									<label >Registration Type :</label>
									<p style="margin-left:20px"><%=registrationtype %></p>
									<label >No of Tickets  :</label>
									<p style="margin-left:20px"><%=nooftickets %></p>
									<label >Registration Date :</label>
									<p style="margin-left:20px"><%=userregistereddate %></p>
									<%-- <label >Registered Event Name:</label>
									<p style="margin-left:20px"><%=usermobile %></p> --%>
	        						<div class="card-footer">
			        					<button type="submit" class="btn btn-primary">Back</button>
					        		</div>
                                </div>
						    </form>
						</div>
						<!-- /.card -->
					</div>			
				</div>
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

    