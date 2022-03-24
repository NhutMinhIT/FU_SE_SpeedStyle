<%-- 
    Document   : header
    Created on : Mar 9, 2022, 4:34:01 PM
    Author     : avillX
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head> 
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        
        <jsp:useBean id="a" class="com.speedstyle.prj301.dao.ProductDAO" scope="request"></jsp:useBean>
    </head>
    <body>
        <div class="py-1 bg-black">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md-5 pr-4 d-flex topper align-items-center">
<!--					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+ 1235 2355 98</span>-->
                                        </div>
                                        <div class="col-md-5 pr-4 d-flex topper align-items-center">
<!--					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                                                <span class="text">speyle081222@email.com</span>-->
                                        </div>
                                    <c:set var="login" value="${sessionScope.LOGIN_USER.username}"></c:set>
                                    <c:if test="${ empty login}">
                                        <div class="col-md-2 pr-4 d-flex topper align-items-right text-lg-right">
                                                <a href="login">Sign In     | </a>
                                                <a href="signup">   Sign Up</a>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty login}">
                                        <div class="col-md-2 pr-4 d-flex topper align-items-right text-lg-right">
                                                <a href="user_infor?Uid=${sessionScope.LOGIN_USER.userID}">${sessionScope.LOGIN_USER.username}    | </a>
                                                <a href="logout">   Log Out</a>
                                        </div> 
                                    </c:if>
				</div>
			    </div>
		    </div>
		  </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="home">SpeedStyle</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="home" class="nav-link">Home</a></li>
	          <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="shop" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Category</a>

                      <div class="dropdown-menu" aria-labelledby="dropdown04">                  
                        <c:forEach items="${a.category}" var="o">
                            <a class="dropdown-item" href="shop?sortCategory=${o.category}">${o.category}</a>                
                        </c:forEach> 
                        <a class="dropdown-item" href="shop?sortCategory=">All Products</a> 
                      </div>
                  </li>
                <c:set var="role" value="${sessionScope.LOGIN_USER.roleID}"></c:set> 
                <c:if test="${role == 1}">
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manager</a>

                      <div class="dropdown-menu" aria-labelledby="dropdown04">                  
                        <a class="dropdown-item" href="usermanager">USER MANAGEMENT</a>
                        <a class="dropdown-item" href="ordermanager">ORDER MANAGEMENT</a>  
                        <a class="dropdown-item" href="productmanager">PRODUCT MANAGEMENT</a>  
                        <a class="dropdown-item" href="addproduct">ADD NEW PRODUCT</a>                         
                      </div>
                  </li>
                </c:if>
                  <li class="nav-item cta cta-colored"><a href="mycart" class="nav-link"><span class="icon-shopping_cart">[${sessionScope.CART}]</span></a></li>

	        </ul>
	      </div>
	    </div>
	  </nav>
    </body>
</html>



