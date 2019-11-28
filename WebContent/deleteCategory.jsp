 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <%@page import="oop.webApp.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oop.webApp.service.CategoryServiceImpl"%>
<%@page import="oop.webApp.service.ICategoryService"%>
<html lang="en">
      <head>
        <title>Category List | Next Auction</title>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    
    
        <link rel="stylesheet" href="css/aos.css">
    
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/admin.css">

		<style type="text/css">
 			   #item-container .row .col-lg-8 .col-sm-6 h6 {
 			   		color: black;
 			   }
    </style>
    
      </head>
      <body>
      
      <div class="site-wrap">
        
    <jsp:include page="adminHeader.jsp"></jsp:include>

<br><br><br>

<!-- HEADER END --> 
<br>

    <div class="container" id="item-container">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Admin</a></li>
          <li class="breadcrumb-item active"><a href="#">Categories</a></li>
        </ol>
        
    <br>
    
	        <a href="addCategory.jsp">
	        			<button type="button" class="btn btn-primary btn-lg btn-block">Add A Category &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
	        </a>
        <br>
        <br>
    		 <%
    		 ICategoryService iCategoryService = new CategoryServiceImpl();
    		 ArrayList<Category> arrayList = iCategoryService.getCategory();
    		 
			
			for(Category category : arrayList){
			%>
        
        <div class="row">
          
          <div class="col-lg-8">
            <div class="row">
              <div class="col-sm-6">
                <h6>Category No</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=category.getCatNo() %></h6>
              </div>
            </div>
            <br>
            
            <div class="row">
              <div class="col-sm-6">
                <h6>Category Name</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=category.getCatName() %></h6>
              </div>
            </div>
            <br>
            <div class="row">
              <div class="col-sm-6">
                <h6>Sub Category Name</h6>
              </div>
              <div class="col-sm-6">
                <h6><%=category.getSubName() %></h6>
              </div>
            </div>
            <br>
            
            <div class="row">
              <div class="col-sm-3">
                <form method="POST" action="GetCategoryServlet">
                  <input type="hidden" name="itemNo" value="<%=category.getCatNo()%>" />
                  <input type="submit" value="Select Category " class="btn btn-primary" />
                </form>
              </div>
              
              <div class="col-sm-3">
                
              </div>
              
              <div class="col-sm-3">
                
              </div>
            </div>

          </div>
          
          <div class="col-lg-4">
            <img src="images/pro/category1.png" alt="..." class="img-thumbnail">
          </div>
        </div>

      <hr style="border: 2px solid #0f9fe6; ">
			<%	
			   }
            %>     

    </div> <br> 
    
    	<div class="container">
	        <a href="addCategory.jsp">
	        			<button type="button" class="btn btn-primary btn-lg btn-block">Add A Category &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
	        </a>
        </div>

<!-- FOOTER -->
        <jsp:include page="footer.jsp"></jsp:include>
        
    </div>
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