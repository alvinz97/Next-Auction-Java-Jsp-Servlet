<%@page import="oop.webApp.model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oop.webApp.service.ItemServiceImpl"%>
<%@page import="oop.webApp.service.IItemService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Next Auction </title>
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
  
    
 <jsp:include page="header.jsp"></jsp:include>
  <div class="site-wrap">

    <div class="site-blocks-cover" data-aos="fade">
      <div class="container">

        <div class="row align-items-center">
          <div class="col-lg-5 text-center">
            <div class="featured-hero-product w-100">
              <h1 class="mb-2">NEXT AUCTION <br> <i class="fas fa-cogs fas text-danger"></i></h1>
            </div>  
          </div>
          <div class="col-lg-7 align-self-end text-center text-lg-right">
            <img src="images/new/person_transparent.png" alt="Image" class="img-fluid img-1">
          </div>
          
        </div>
      </div>
      
    </div>
    <br> <br>
   <!--  
    <div class="container">
    	<div class="row justify-content-md-center">
    		<div class="col-lg-6">
    		<a href="addItem.jsp">
    			<button type="submit" class="btn btn-primary btn-lg btn-block">Add An Item &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
    		</a>
    		</div>
    	</div>
    </div>
--> 
	<br>
	
    <div class="container">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Item List</a></li>
        </ol>
    </div> <br>

    <div class="container" id="item-container">
            <%
            IItemService iItemsService = new ItemServiceImpl();
			ArrayList<Item> arrayList = iItemsService.getItems();
			
			for(Item items : arrayList){
			%>
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-sm-6">
                        <h6>Item No</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getItemNo()%></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Title</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getTitle() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Category</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getCategory() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Condition</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getCondition() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Brand</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getBrand() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Color</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getColor() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Bid Start Date</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getStartDate() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Bid End Date</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getEndDate() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Start Price</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getStartPrice() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Buy Price</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getBuyPrice() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Reserve Price</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getReservePrice() %></h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6">
                        <h6>Description</h6>
                    </div>
                    <div class="col-sm-6">
                        <h6><%=items.getDesc() %></h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <img src="images/pro/L1.jpg" alt="..." class="img-thumbnail">

                <br> <br>
                
                <form method="POST" action="customerPayment.jsp">
					<input type="hidden" name="itemNo" value="<%=items.getItemNo()%>"/>
					<button type="submit" class="btn btn-success btn-lg btn-block">Buy Item &nbsp; &nbsp;<i class="fas fa-hand-pointer"></i></button>
				 </form>

            </div>
        </div> <hr style="border: 2px solid #0f9fe6; ">
			<%	
			   }
            %>     
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
</html>