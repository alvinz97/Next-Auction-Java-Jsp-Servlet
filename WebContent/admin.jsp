<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin | Next Acution </title>
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
<link rel="stylesheet" href="css/admin.css">

</head>
<body>

<div class="site-wrap">


<div class="site-navbar bg-white py-2">

  <div class="search-wrap">
    <div class="container">
      <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
      <form action="#" method="post">
        <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
      </form>  
    </div>
  </div>

  <div class="container">
    <div class="d-flex align-items-center justify-content-between">
      <div class="logo">
        <div class="site-logo">
          <a href="landPage.jsp" class="js-logo-clone"> <img src="images/pro/Logo2.png" alt="" style="width: 100px;height: 65px;"> NEXT AUCTION</a>
        </div>
      </div>
      <div class="main-nav d-none d-lg-block">
        <nav class="site-navigation text-right text-md-center" role="navigation">
          <ul class="site-menu js-clone-nav d-none d-lg-block">
            <li class="has-children">
              <a href="landPage.jsp">Collection</a>
              <ul class="dropdown">
                <li><a href="#">Men</a></li>
                <li><a href="#">Women</a></li>
                <li><a href="#">Children</a></li>
                <li class="has-children">
                  <a href="#">Sub Menu</a>
                  <ul class="dropdown">
                    <li><a href="#">Men</a></li>
                    <li><a href="#">Women</a></li>
                    <li><a href="#">Children</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            
            <li><a href="shop.jsp">Shop</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
          </ul>
        </nav>
      </div>
      <div class="icons">
        
        <a href="#" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
        <a href="#" class="icons-btn d-inline-block"><span class="icon-heart-o"></span></a>
        <a href="cart.jsp" class="icons-btn d-inline-block bag">
          <span class="icon-shopping-bag"></span>
          <span class="number">2</span>
        </a>
        <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span class="icon-menu"></span></a>
        <a href="landPage.jsp"> <span><i class="fas fa-user-tie"></i></span></a>
      </div>
    </div>
  </div>
</div>

<br><br><br><br>
<div class="container-fluid">
    <div class="container">
        <form action="#" method="post">

        <h4 class="text-left text-primary">Item Details</h4>
        <br>
        <!-- ROW 01 -->
        <div class="row">
            <div class="col-sm-3 ">
                <h5>Title</h5>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-lg" >
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <!-- ROW 02 -->
        <div class="row">
            <div class="col-sm-3 ">
                <h5>Subtitle</h5>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-lg" >
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
         <!-- ROW 03 -->
         <div class="row">
            <div class="col-sm-3 ">
                <h5>Category</h5>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <select class="form-control" >
                        <option>--</option>
                        <option>Shoes</option>
                        <option>Shoes</option>
                        <option>Shoes</option>
                        <option>Shoes</option>
                        <option>Shoes</option>
                        <option>Shoes</option>
                        <option>Shoes</option>
                        <option>Shoes</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
         <!-- ROW 04 -->
         <div class="row">
            <div class="col-sm-3 ">
                <h5>Condition</h5>
            </div>
            <div class="col-sm-6 ">
                <div class="form-row">
                    <div class="form-group">
                        <select class="form-control" >
                            <option>--</option>
                            <option>Shoes</option>
                            <option>Shoes</option>
                            <option>Shoes</option>
                            <option>Shoes</option>
                        </select>
                    </div>        
                </div>
            </div>
            <div class="col-sm-3"></div>
         </div>
        <!-- ROW 05 -->
        <div class="row">
            <div class="col-sm-3 ">
                <h5>Photos</h5>
            </div>
            <div class="col-sm-6">
                <!-- ROW 05 => 01 -->
                <div class="row" id="album">
                    <div class="col-sm-4">
                        <div class="inner-div">
                             <input type="file" >
                        </div>
                    </div>
                    <div class="col-sm-4">
                            <div class="inner-div">
                                 <input type="file">
                            </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="inner-div">
                             <input type="file">
                        </div>
                    </div>
                </div> <br>
                <!-- ROW 05 => 02 -->
                <div class="row" id="album">
                    <div class="col-sm-4">
                        <div class="inner-div">
                            <input type="file">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="inner-div">
                             <input type="file">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="inner-div">
                            <input type="file">
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="col-sm-3"></div>
        </div> <br>
        <!-- ROW 06 -->
        <div class="row">
            <div class="col-sm-3 ">
                <h5>Item Specifics</h5>
            </div>
            <div class="col-sm-6">
                <!-- ROW 06 => 01-->
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="">Brand</label> <br>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="">Style</label> <br>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                </div>
                <!-- ROW 06 => 02-->
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="">Color</label> <br>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="">Item Number</label> <br>
                            <input type="text" class="form-control">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <!-- ROW 07 -->
        <div class="row">
            <div class="col-sm-3 ">
                <h5>Bid Duration</h5>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label >Start Date</label> <br>
                                <input type="date" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label >End Date</label> <br>
                                <input type="date" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
         <!-- ROW 08 -->
         <div class="row">
            <div class="col-sm-3 ">
                <h5>Price</h5>
            </div>
            <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label >Starting Price ( $ )</label> <br>
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label >Buy it Now Price ( $ )</label> <br>
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label >Reserve Price ( $ )</label> <br>
                                <input type="text" class="form-control">
                            </div>
                        </div>
                    </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <!-- ROW 09 -->
        <div class="row">
            <div class="col-sm-3 ">
                <h5>Item Description</h5>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <textarea cols="60" rows="10" class="form-control form-control-lg"></textarea>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <!-- ROW 10 -->
        <div class="row">
            <div class="col-sm-3 ">
               
            </div>
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="input-group">
                            <button type="button" class="btn btn-primary" value="Submit">Submit</button>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <button type="button" class="btn btn-primary" value="Preview">Preview</button>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <button type="button" class="btn btn-primary" value="Save & Draft">Save & Draft</button>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <button type="button" class="btn btn-primary" value="Cancel">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </form>
    </div>
</div>
<br><br><br>

<jsp:include page="footer.jsp"></jsp:include>


</div>

</body>
</html>