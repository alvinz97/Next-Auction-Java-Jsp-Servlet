<%@page import="oop.webApp.model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Payment | Next Auction</title>

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
    <link rel="stylesheet" href="css/signup.css">

	<style >
		#buttons {
			display: flex;
		}
		#buttons .col-sm-6 {
			margin: 0px 50px 0px 0px;
		}
	</style>
	
    <script>
        function validate() {

            var name = document.form.name.value;
            var email = document.form.email.value;
            var pass = document.form.pass.value;
            var re_pass = document.form.re_pass.value;

            if (name == null || name == "") {
                alert("Full Name can't be blank");
                return false;
            }
            else if (email == null || email == "") {
                alert("Email can't be blank");
                return false;
            }
            else if (pass.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }
            else if (pass != re_pass) {
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
                <a class="backHome" href="landPageCusView.jsp"> <i class="fas fa-arrow-circle-left"> </i> Back to HOME page</a>
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Update Details</h2>
                        
                        <%
				        	Payment payment = (Payment) request.getAttribute("payment");
				        %>
				        
                        <form action="UpdatePaymentServlet" method="POST" class="register-form" id="register-form"
                            onsubmit="return validate()">
                            <div class="form-group">
                                <label for="id"><i class="far fa-credit-card"></i></label>
                                <input type="text" name="id" id="name" placeholder="ID" disabled="disabled" value="<%=payment.getId()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="no"><i class="far fa-credit-card"></i></label>
                                <input type="tel" name="cardNo" id="name" placeholder="Credit Card Number" value="<%=payment.getCardNo()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="fas fa-file-signature"></i></label>
                                <input type="text" name="cusName" id="e000mail" placeholder="Name On Card" value="<%=payment.getCusName()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="date"><i class="fas fa-table"></i></label>
                                <input type="month" name="expiryDate" id="re_pass"  placeholder="Expiry Date" value="<%=payment.getExpiryDate()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="cvv"><i class="fas fa-hashtag"></i></label>
                                <input type="tel" name="cvv" id="pass" placeholder="CVV Number" value="<%=payment.getCvv()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="fas fa-envelope"></i></label>
                                <input type="email" name="cusEmail" id="pass" placeholder="Your Email" value="<%=payment.getEmail()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="amount"><i class="fas fa-dollar-sign"></i></label>
                                <input type="text" name="amount" id="pass" placeholder="Amount" value="<%=payment.getAmount()%>"/>
                            </div>
                            <div class="form-group">
                                <label for="phone"><i class="fas fa-phone"></i></label>
                                <input type="tel" name="phone" id="pass" placeholder="Your Phone " value="<%=payment.getPhone()%>"/>
                            </div>

                            <div class="form-group">
                                <%=(request.getAttribute("errMessage") == null) ? "": request.getAttribute("errMessage")%>
                            </div>

                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all
                                    statements in <a href="#" class="term-service">Terms of service</a></label>
                            </div>

                            <div class="row" id="buttons" style="display: inline-flex;">
                                <div class="col-lg-7">
                                    <div class="form-group">
                                        <input type="submit" name="signup" id="signup" class="form-submit" value="Update & Pay" />
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div class="form-group">
                                        <input type="reset" id="signup" class="form-submit" value="Reset" />
                                    </div>
                                </div>
                            </div>
                        </form> <br>
                        
                        <div class="row">
                        	<div class="col-sm-12">
                               <form method="POST" action="DeletePaymentServlet">
                                    <input type="hidden" name="id" value="<%=payment.getId()%>" />
                                    <button type="submit" class="btn btn-danger btn-lg btn-block">Delete Payment Info &nbsp; &nbsp;<i class="fas fa-user-slash"></i></button>
                                </form>
                            </div>
                           </div>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/pro/payment.png" alt="sing up image"></figure>
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