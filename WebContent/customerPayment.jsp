<%@page import="oop.webApp.model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oop.webApp.service.ItemServiceImpl"%>
<%@page import="oop.webApp.service.IItemService"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Payment | Next Auction</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/7db8364a09.js"></script>

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
</head>

<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <a class="backHome" href="landPageCusView.jsp"> <i class="fas fa-arrow-circle-left"> </i> Back to HOME page</a>
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Pay In Here</h2>
                        
                        <form name="validate" action="AddPaymentServlet" method="POST" class="register-form" id="register-form" onsubmit="return validateForm()">
							
                            <div class="form-group">
                                <label for="no"><i class="far fa-credit-card"></i></label>
                                <input type="tel" name="cardNo" id="name" placeholder="Credit Card Number" required="required"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="fas fa-file-signature"></i></label>
                                <input type="text" name="cusName" id="e000mail" placeholder="Name On Card" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="date"><i class="fas fa-table"></i></label>
                                <input type="month" name="expiryDate" id="re_pass"  placeholder="Expiry Date" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="cvv"><i class="fas fa-hashtag"></i></label>
                                <input type="tel" name="cvv" id="pass" placeholder="CVV Number" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="fas fa-envelope"></i></label>
                                <input type="email" name="email" id="pass" placeholder="Your Email" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="amount"><i class="fas fa-dollar-sign"></i></label>
                                <input type="text" name="amount" id="pass" placeholder="Amount" required="required"  value=""/>
                            </div>
                            <div class="form-group">
                                <label for="phone"><i class="fas fa-phone"></i></label>
                                <input type="tel" name="phone" id="pass" placeholder="Your Phone " required="required" />
                            </div>

                            <div class="form-group">
                                <%=(request.getAttribute("errMessage") == null) ? "": request.getAttribute("errMessage")%>
                            </div>

                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all
                                    statements in <a href="#" class="term-service">Terms of service</a></label>
                            </div>

                            <div class="row" id="buttons">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="submit" name="signup" id="signup" class="form-submit" value="Pay" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="reset" id="signup" class="form-submit" value="Reset" />
                                    </div>
                                </div>
                            </div>
                        </form>
                           
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