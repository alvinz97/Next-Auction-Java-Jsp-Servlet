<%@page import="oop.webApp.service.RegisterServiceImpl"%>
<%@page import="oop.webApp.service.IRegisterService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="oop.webApp.model.RegisterBean"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>User | Next Auction </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css"
        rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/7db8364a09.js"></script>


    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
</head>
<body>

 <jsp:include page="adminHeader.jsp"></jsp:include>
<br><br><br><br>

            <div class="container">
		        <!-- Breadcrumbs-->
		        <ol class="breadcrumb">
		            <li class="breadcrumb-item"><a href="#">Admin</a></li>
		            <li class="breadcrumb-item">User Management</li>
		        </ol>
		    </div> <br>
		    <!-- 
            <div class="image-group">
                <img src="images/pro/user2.png" class="rounded mx-auto d-block" style="width: 100px; height: 100px;">
            </div>
             -->
		    
	        <div class="container text-center">
				<br><br>
				<%
						IRegisterService iRegisterService = new RegisterServiceImpl();
						ArrayList<RegisterBean> arraList = iRegisterService.getuUser();
						
						for(RegisterBean registerBean : arraList) {
            	%>
				
            <div class="row">
                <div class="col-4 text-right" >
                    <h3 class="text text-primary">ID : </h3>
                </div>

                <div class="col-8">
                    <h4 class="text text-info"><%=registerBean.getuId() %></h4>
                </div>
            </div>
				<br>
            <div class="row">
                <div class="col-4 text-right">
                    <h3 class="text text-primary">Name : </h3>
                </div>
            
                <div class="col-8">
                    <h4 class="text text-info"><%=registerBean.getuName() %></h4>
                </div>
            </div> 
            <br>
            <div class="row">
                <div class="col-4 text-right">
                    <h3 class="text text-primary">E-Mail Address : </h3>
                </div>
            
                <div class="col-8">
                    <h4 class="text text-info"><%=registerBean.getuMail() %></h4>
                </div>
            </div>
            <div class="row">
            
            	<div class="col-lg-6">
	            	<div class="container">
				        <form action="GetUserServlet" method="POST">
				        		<input type="hidden" name="catNo" value="<%=registerBean.getuId()%>" />
				        		<button type="submit" class="btn btn-primary btn-lg btn-block">Edit User &nbsp; &nbsp;<i class="fas fa-user-edit"></i></button>
				        </form>
			        </div>
            	</div>
            	
            	<div class="col-lg-6">
		            <div class="container">
				        <form action="GetUserServlet" method="POST">
				        		<input type="hidden" name="catNo" value="<%=registerBean.getuId()%>" />
				        		<button type="submit" class="btn btn-danger btn-lg btn-block">Delete User &nbsp; &nbsp;<i class="fas fa-user-slash"></i></button>
				        </form>
		        	</div>
            	</div>
            </div>
            <%
					}
            %>
            <br>
            <div class="container">
            	<hr style="border: 2px solid #0f9fe6; ">
            </div>
            
            <div class="container">
		        <!-- Breadcrumbs-->
		        <ol class="breadcrumb">
		            <li class="breadcrumb-item"><a href="#">Admin</a></li>
		            <li class="breadcrumb-item">Manage Category</li>
		        </ol>
		    </div> <br>
            <div class="row">
            	<div class="col-lg-6">
	            	<div class="container">
				        <form action="addCategory.jsp" method="POST">
				        		<button type="submit" class="btn btn-primary btn-lg btn-block">Add A Category&nbsp; &nbsp;<i class="fas fa-plus"></i></button>
				        </form>
			        </div>
            	</div>
            	
            	<div class="col-lg-6">
		            <div class="container">
				        <form action="deleteCategory.jsp" method="POST">
				        		<button type="submit" class="btn btn-warning btn-lg btn-block">View Category List &nbsp; &nbsp;<i class="fas fa-eye"></i></button>
				        </form>
		        	</div>
            	</div>
            </div>
            
        </div>
        
        <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>