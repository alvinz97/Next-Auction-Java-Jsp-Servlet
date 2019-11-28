<%@page import="oop.webApp.model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Update Items | Next Auction </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/7db8364a09.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
  
    <link rel="stylesheet" href="css/aos.css">
    
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/addItem.css">

</head>

<body>

    <div class="site-wrap">

	 <jsp:include page="header.jsp"></jsp:include>

        <br> <br><br>

        
        <div class="container">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Update Item</a></li>
                <li class="breadcrumb-item active">Form </li>
            </ol>
        </div> <br>
        

            <div class="container">
        	<a href="addItem.jsp">
	        			<button type="button" class="btn btn-primary btn-lg btn-block">Add An Item &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
	        </a> <br>
            <%
            		Item item = (Item) request.getAttribute("item");
            %>
                    <form action="UpdateItemServlet" method="post">
                        <h4 class="text-left text-primary">Item Details</h4>
                        <br>
                        <!-- ROW 01 -->
                        <div class="row">
                            <div class="col-sm-3 ">
                                <h5>Item No</h5>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input name="itemNo" type="text" class="form-control form-control-lg"  disabled="disabled" value="<%=item.getItemNo()%>"/>
                                </div>
                            </div>
                            <div class="col-sm-3"></div>
                        </div>
                        <!-- ROW 01 -->
                        <div class="row">
                            <div class="col-sm-3 ">
                                <h5>Title</h5>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <input name="title" type="text" class="form-control form-control-lg"  value="<%=item.getTitle()%>"/>
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
                                    <select name="category" class="custom-select mr-sm-2" id="inlineFormCustomSelect" value="<%=item.getCategory()%>">
                                        <option selected>--</option>
                                        <option value="Fashion">Fashion</option>
                                        <option value="Furniture">Furniture</option>
                                        <option value="Electronics">Electronics</option>
                                        <option value="Tools">Tools</option>
                                        <option value="Sports">Sports</option>
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
                                <div class="form-group">
                                    <select name="condition" class="custom-select mr-sm-2" id="inlineFormCustomSelect"  value="<%=item.getCondition()%>">
                                        <option selected>--</option>
                                        <option value="Brand New">Brand New</option>
                                        <option value="Used">Used</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-3"></div>
                        </div>
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
                                            <input name="brand" type="text" class="form-control" value="<%=item.getBrand()%>"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="">Color</label> <br>
                                            <input name="color" type="text" class="form-control" value="<%=item.getColor()%>"/>
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
                                                <label>Start Date</label> <br>
                                                <input name="startDate"  type="date" class="form-control" value="<%=item.getStartDate()%>"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>End Date</label> <br>
                                                <input name="endDate" type="date" class="form-control" value="<%=item.getEndDate()%>"/>
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
                                            <label>Starting Price ( $ )</label> <br>
                                            <input name="startingPrice" type="text" class="form-control" value="<%=item.getStartPrice()%>"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>Buy it Now Price ( $ )</label> <br>
                                            <input name="buyPrice" type="text" class="form-control" value="<%=item.getBuyPrice()%>"/>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>Reserve Price ( $ )</label> <br>
                                            <input name="reservePrice" type="text" class="form-control" value="<%=item.getReservePrice()%>"/>
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
                                    <textarea name="desc" cols="60" rows="10" class="form-control form-control-lg" ></textarea>
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
                                            <Input type="submit" class="btn btn-primary" value="Update">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3"></div>
                        </div>
                    </form>
                    
                    
                    <div class="row">
                            <div class="col-sm-3 ">
                            </div>
                            <div class="col-sm-6">
                                <form method="POST" action="DeleteItemServlet">
										<input type="hidden" name="employeeID"value="<%=item.getItemNo()%>" /> 
										<button type="submit" class="btn btn-danger btn-lg btn-block">Delete Item &nbsp; &nbsp;<i class="fas fa-user-slash"></i></button>
									</form>
                            </div>
                            <div class="col-sm-3"></div>
                        </div>
                    
                                    
                </div>
            <br><br><br>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>

    <script src="js/main.js"></script>
    
    <jsp:include page="footer.jsp"></jsp:include>

</body>

</html>