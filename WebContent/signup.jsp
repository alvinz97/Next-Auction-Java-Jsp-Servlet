<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up | Next Auction</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/7db8364a09.js"></script>

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
                <!-- <a class="backHome" href="landPage.jsp"> <i class="fas fa-arrow-circle-left"> </i> Back to HOME page</a> -->
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign Up</h2>
                        
                        <form action="AddUserServlet" method="POST" class="register-form" id="register-form"  onsubmit="return validate()">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="e000mail" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
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
                                <div class="col-sm-6" style="padding: 0px 30px 0px 0px;">
                                    <div class="form-group">
                                        <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                    </div>
                                </div>
                                <div class="col-sm-6" style="padding: 0px 30px 0px 0px;">
                                    <div class="form-group">
                                        <input type="reset" class="form-submit" value="Reset"/>
                                    </div>                                    
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="index.jsp" class="signup-image-link">I am already member</a>
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