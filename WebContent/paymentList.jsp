<%@page import="oop.webApp.model.Payment"%>
<%@page import="oop.webApp.service.PaymentServiceImpl"%>
<%@page import="oop.webApp.service.IPaymentService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Payment List | Next Auction </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
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
    
    <style type="text/css">
 			   #item-container .row .col-lg-8 .col-sm-6 h6 {
 			   		color: black;
 			   }
    </style>
    
  </head>
  <body>
  
  <div class="site-wrap">
   <jsp:include page="header.jsp"></jsp:include>
  
  <br> <br><br> <br><br>
  
      <div class="container" id="item-container">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Bidder</a></li>
          <li class="breadcrumb-item active"><a href="#">Payment Details</a></li>
        </ol>
        
    <br>
    
	        <a href="customerPayment.jsp">
	        			<button type="button" class="btn btn-primary btn-lg btn-block">Add New Payment &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
	        </a>
        <br>
        <br>
    		 <%
    		 IPaymentService iPaymentService = new PaymentServiceImpl();
    		 ArrayList<Payment> arrayList = iPaymentService.getPayment();
    		 
			
			for(Payment payment : arrayList){
			%>
        
        <div class="row">
          
          <div class="col-lg-8">
            <div class="row">
              <div class="col-sm-6">
                <h6>Payment ID</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getId() %></h6>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-6">
                <h6>Card Number</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getCardNo() %></h6>
              </div>
            </div>

            <div class="row">
              <div class="col-sm-6">
                <h6>Name On The Card</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getCusName() %></h6>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-6">
                <h6>Expiry Date</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getExpiryDate() %></h6>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-6">
                <h6>CVV</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getCvv() %></h6>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-6">
                <h6>Email Address</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getEmail() %></h6>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-6">
                <h6>Amount</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getAmount() %></h6>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-6">
                <h6>Phone Number</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=payment.getPhone() %></h6>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-3">
                <form method="POST" action="GetPaymentServlet">
                  <input type="hidden" name="id" value="<%=payment.getId()%>" />
                  <input type="submit" value="Select Payment " class="btn btn-primary" />
                </form>
              </div>
              
              <div class="col-sm-3">
                
              </div>
              
              <div class="col-sm-3">
                
              </div>
            </div>

          </div>
          
          <div class="col-lg-4">
            <img src="images/pro/pay.jpg" alt="..." class="img-thumbnail">
          </div>
        </div>

      <hr style="border: 2px solid #0f9fe6; ">
			<%	
			   }
            %>     

     <a href="customerPayment.jsp">
	        			<button type="button" class="btn btn-primary btn-lg btn-block">Add New Payment &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
	        </a>
    </div> 
    <br> 
    </div>
	<jsp:include page="footer.jsp"></jsp:include>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html></html>