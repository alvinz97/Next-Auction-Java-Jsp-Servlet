<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
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
                  <a href="landPageCusView.jsp" class="js-logo-clone"> <img src="images/pro/Logo2.png" id="mainLogo" style="width: 100px;height: 55px;"> NEXT AUCTION</a>
                </div>
              </div>
              <div class="main-nav d-none d-lg-block">
                <nav class="site-navigation text-right text-md-center" role="navigation">
                  <ul class="site-menu js-clone-nav d-none d-lg-block">
                    
                    <li class="has-children">
                      <a href="landPageCusView.jsp">Collection</a>
                      <ul class="dropdown">

                          <li class="has-children">
                            <a href="#">Fashion</a>
                            <ul class="dropdown">
                              <li><a href="#">Men</a></li>
                              <li><a href="#">Women</a></li>
                              <li><a href="#">Children</a></li>
                              <li><a href="#">Shoes</a></li>
                            </ul>
                          </li>

                          <li class="has-children">
                            <a href="#">Vehicles</a>
                            <ul class="dropdown">
                              <li><a href="#">Bikes</a></li>
                              <li><a href="#">Cars</a></li>
                              <li><a href="#">Trailers</a></li>
                              <li><a href="#">Others</a></li>
                            </ul>
                          </li>

                          <li class="has-children">
                            <a href="#">Electronics</a>
                            <ul class="dropdown">
                              <li><a href="#">Laptops</a></li>
                              <li><a href="#">Smart Phone</a></li>
                              <li><a href="#">Tablet</a></li>
                              <li><a href="#">Accessories</a></li>
                            </ul>
                          </li>

                          <li class="has-children">
                            <a href="#">Home & Garden</a>
                            <ul class="dropdown">
                              <li><a href="#">Tools & Workshop Equipments</a></li>
                              <li><a href="#">Kitchen</a></li>
                              <li><a href="#">Dining</a></li>
                              <li><a href="#">Home De`cor</a></li>
                            </ul>
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
            <a href="index.jsp"> <span><i class="fas fa-user-tie"></i></span></a>
          </div>
            </div>
          </div>
        </div>

</body>
</html>