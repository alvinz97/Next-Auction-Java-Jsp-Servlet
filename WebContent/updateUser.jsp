<%@page import="oop.webApp.model.RegisterBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Info | Next Auction</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/7db8364a09.js"></script>
    
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/7db8364a09.js"></script>


    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/styles.css">
 
    
    <script> 
		function validate() { 
			
			 var name = document.getElementById("name");
			 var email = document.getElementById("e000mail");
			 var pass = document.getElementById("pass");
			 var re_pass= getElementById("re_pass");
			 
			 if (name==null || name=="") { 
				 alert("Name can't be blank"); 
				 return false; 
			 }
			 else if (email==null || email=="") { 
				 alert("Email can't be blank"); 
				 return false; 
			 }
			 else if(pass.length<6) { 
				 alert("Password must be at least 6 characters long."); 
				 return false; 
			 } 
			 else if (pass!=re_pass) { 
				 alert("Confirm Password should match with the Password"); 
				 return false; 
			 } 
		 } 
	</script> 
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <a class="backHome" href="landPage.jsp"> <i class="fas fa-arrow-circle-left"> </i> Back to HOME page</a>
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Update Info</h2>
                         <%
                         		RegisterBean registerBean = (RegisterBean)request.getAttribute("user");
			            %>
                        
                        <form action="UpdateUserServlet" method="POST" class="register-form" id="register-form"  onsubmit="return validate()">
                            <div class="form-group">
                                <label for="id"><i class="fas fa-id-card-alt"></i></label>
                                <input type="text" name="id" id="name" placeholder="User ID" disabled="disabled" value="<%=registerBean.getuId() %>"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name" value="<%=registerBean.getuName() %>"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="e000mail" placeholder="Your Email" value="<%=registerBean.getuMail() %>"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password" />
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            
                            <div class="form-group" style="color: red;">
                               <%=(request.getAttribute("errMessage") == null) ? "": request.getAttribute("errMessage")%>
                            </div>
                            
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="row" style="display: inline-flex;">
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <input type="submit" name="signup" id="signup" class="form-submit" value="Update & Save"/>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <input type="reset" class="form-submit" value="Reset"/>
                                    </div>                                    
                                </div>
                            </div>
                        </form>
                         <br>
                         <div class="row">
                        	<div class="col-sm-12">
                               <form method="POST" action="DeleteUserServlet">
                                    <input type="hidden" name="id" value="" />
                                    <button type="submit" class="btn btn-danger btn-lg btn-block">Delete User &nbsp; &nbsp;<i class="fas fa-user-slash"></i></button>
                                </form>
                            </div>
                           </div>
                    </div>
                    
                    <div class="signup-image">
                        <figure><img src="images/pro/update.png" alt="sing up image"></figure>
                    </div>
                </div>
            </div>
        </section>

        
    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>