<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>Add Category | Next Auction </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet"> -->
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/7db8364a09.js"></script>
    
    
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    
        <link rel="stylesheet" href="css/aos.css">
    
        <link rel="stylesheet" href="css/style.css">

            <script>

              $('.file-upload').file_upload();

              $(document).ready(function () {
                // Activate Carousel
                $("#carouselExampleIndicators").carousel();

                // Enable Carousel Indicators
                $(".item1").click(function () {
                  $("#carouselExampleIndicators").carousel(0);
                });
                $(".item2").click(function () {
                  $("#carouselExampleIndicators").carousel(1);
                });
                $(".item3").click(function () {
                  $("#carouselExampleIndicators").carousel(2);
                });

                // Enable Carousel Controls
                $(".left").click(function () {
                  $("#carouselExampleIndicators").carousel("prev");
                });
                $(".right").click(function () {
                  $("#carouselExampleIndicators").carousel("next");
                });
              });

            </script>
        
      </head>
      <body>
      
      <div class="site-wrap">
        
    
  <jsp:include page="adminHeader.jsp"></jsp:include>
<br><br><br>
      
    <!-- HEADER END --> 
    
          <div class="container">
            <div class="row">
              <div class="col-4 col-sm-2 col-md-3 col-lg-4">
                <br><br><br>
                <h2 class="text-center" id="col-text"
                  style="font-size: 40px;  text-transform: uppercase; font-weight: 600; color: black;">Add Category</h2>
          
                <div class="field col-md-9 col-md-offset-34">
                <a href="deleteCategory.jsp">
                  <button class="btn btn-primary pull-right" data-toggle="">Add A Category &nbsp; <i
                      class="far fa-arrow-alt-circle-down"></i></button>
               </a>
                </div>
          
              </div>
              <div class="col-8">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li class=" item1 active"></li>
                    <li class="item2"></li>
                    <li class="item3"></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img src="images/pro/slide1.png" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                      <img src="images/pro/slide2.png" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                      <img src="images/pro/slide3.png" class="d-block w-100">
                    </div>
                  </div>
          
                  <!-- Left and right controls -->
                  <a class="left carousel-control-prev" href="#carouselExampleIndicators" role="button">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control-next" href="#carouselExampleIndicators" role="button">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
            </div>
          </div> <br>

          <div class="container">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Admin</a></li>
              <li class="breadcrumb-item"><a href="#">Add Category</a></li>
              <li class="breadcrumb-item active">Form </li>
            </ol>
          </div> <br>
          
          <div class="container">
	        <a href="deleteCategory.jsp">
	        		<button type="button" class="btn btn-warning btn-lg btn-block">View Category List &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
	        </a>
        </div> <br>

          <div class="container">

            <form action="AddCategoryServlet" method="post">
              <h4 class="text-left text-primary">Category Details</h4>
              <br>
				<!-- ROW 01 -->
              
				
              <!-- ROW 02 -->
              <div class="row">
                <div class="col-sm-3 ">
                  <h5>Category Name</h5>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" name="catName"  required="required">
                  </div>
                </div>
                <div class="col-sm-3"></div>
              </div>

              <!-- ROW 03 -->
              <div class="row">
                <div class="col-sm-3 ">
                  <h5>Sub Category Name</h5>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" name="subName" required="required">
                  </div>
                </div>
                <div class="col-sm-3"></div>
              </div>

              <!-- ROW 03 -->
              <div class="row">
                <div class="col-sm-3 ">
              
                </div>
                <div class="col-sm-6">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="input-group">
                        <input type="submit" class="btn btn-primary" value="Submit">
                      </div>
                    </div>
                  
                    <div class="col-sm-6">
                      <div class="input-group">
                        <input type="reset" class="btn btn-primary" value="Reset">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-3"></div>
              </div>
            </form>
          </div>

        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/main.js"></script>
        
        <!-- FOOTER -->
        <jsp:include page="footer.jsp"></jsp:include>
      </body>
    </html>