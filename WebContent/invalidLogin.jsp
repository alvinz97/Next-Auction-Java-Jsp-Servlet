<!--		    Author : Kulathunga W.G.R.A
				IT No   : IT18211306
				Year     : 2nd Year 1st Semester -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Log In Error | Next Auction</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/7db8364a09.js"></script>

<!-- Main css -->
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="main">
        <!-- Sing in  Form -->
        
        <section class="sign-in" >
            <div class="container" style="height: auto">
                <a class="backHome" href="index.jsp"> <i class="fas fa-arrow-circle-left"> </i> Back to LOGIN page</a>
                <div class="signin-content">
                    <h2 class="text-center">Invalid Username Password</h2>
                    <div class="form-group" style="color: red;">
                               <%=(request.getAttribute("errMessage") == null) ? "": request.getAttribute("errMessage")%>
                            </div>
                </div>
            </div>
        </section>

    </div>
</body>
</html>