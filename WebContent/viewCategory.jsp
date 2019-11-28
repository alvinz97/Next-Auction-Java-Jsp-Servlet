<%@page import="oop.webApp.model.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Update | Delete Category  | Next Auction </title>
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

        + function ($) {
            'use strict';

            // UPLOAD CLASS DEFINITION
            // ======================

            var dropZone = document.getElementById('drop-zone');
            var uploadForm = document.getElementById('js-upload-form');

            var startUpload = function (files) {
                console.log(files)
            }

            uploadForm.addEventListener('submit', function (e) {
                var uploadFiles = document.getElementById('js-upload-files').files;
                e.preventDefault()

                startUpload(uploadFiles)
            })

            dropZone.ondrop = function (e) {
                e.preventDefault();
                this.className = 'upload-drop-zone';

                startUpload(e.dataTransfer.files)
            }

            dropZone.ondragover = function () {
                this.className = 'upload-drop-zone drop';
                return false;
            }

            dropZone.ondragleave = function () {
                this.className = 'upload-drop-zone';
                return false;
            }

        }(jQuery);
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
                        style="font-size: 40px;  text-transform: uppercase; font-weight: 600; color: black;">Update Existing
                        Category</h2>

                    <div class="field col-md-9 col-md-offset-34">
                        <button class="btn btn-primary pull-right" data-toggle="">Update Category &nbsp; <i
                                class="far fa-arrow-alt-circle-down"></i></button>
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
                <li class="breadcrumb-item"><a href="#">Update | Delete Category</a></li>
                <li class="breadcrumb-item active">Form </li>
            </ol>
        </div> <br>

        <div class="container">
        <%
        	Category category = (Category) request.getAttribute("category");
        %>

            <form action="UpdateCategoryServlet" class="post">
                <h4 class="text-left text-primary">Category Details</h4>
                <br>

                <!-- ROW 01 -->
                <div class="row">
                    <div class="col-sm-3 ">
                        <h5>Category ID</h5>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <input type="text" name="catNo" class="form-control form-control-lg" disabled="disabled" value="<%=category.getCatNo()%>">
                        </div>
                    </div>
                    <div class="col-sm-3"></div>
                </div>


                <!-- ROW 02 -->
                <div class="row">
                    <div class="col-sm-3 ">
                        <h5>Category Name</h5>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <input type="text" name="catName" class="form-control form-control-lg" value="<%=category.getCatName() %>">
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
                            <input type="text" name="subName" class="form-control form-control-lg" value="<%=category.getSubName() %>">
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
                                    <input type="hidden" name="catNo" value="<%=category.getCatNo()%>" />
                                    <input type="submit" value="Update " class="btn btn-primary" />
                            </div>

                            <div class="col-sm-6">
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </form> <br> 
            
                        <div class="row">
                            <div class="col-sm-3">
                                   
                            </div> <br>

                            <div class="col-sm-6">
                               <form method="POST" action="DeleteCategoryServlet">
                                    <input type="hidden" name="catNo" value="<%=category.getCatNo()%>" />
                                    <input type="submit" value="Delete  " class="btn btn-danger fas fa-trash-alt" />
                                </form>
                            </div>
                            <div class="col-sm-3"></div>
                        </div>
        </div> 
        
        ,<div class="container">
	        <a href="addCategory.jsp">
	        		<button type="button" class="btn btn-primary btn-lg btn-block">Add A Category &nbsp; &nbsp;<i class="fas fa-plus"></i></button>
	        </a> <br>
	        <a href="deleteCategory.jsp">
	        		<button type="button" class="btn btn-warning btn-lg btn-block">View Category List &nbsp; &nbsp;<i class="fas fa-eye"></i></button>
	        </a>
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