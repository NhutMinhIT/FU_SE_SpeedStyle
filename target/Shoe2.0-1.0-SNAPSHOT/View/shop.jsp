<%-- 
    Document   : shop.jsp
    Created on : Mar 9, 2022, 9:26:12 PM
    Author     : avillX
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>SpeedStyle - Not Just For Show</title>
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
    
    <jsp:useBean id="b" class="com.speedstyle.prj301.dao.ProductDAO" scope="request"></jsp:useBean>
      
  </head>
  <body class="goto-here">
    <%@include file="/View/layout/header.jsp" %>

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="home">Home</a></span> <span>Shop</span></p>
            <h1 class="mb-0 bread">Shop</h1>
          </div>
        </div>
      </div>
    </div>
    
    <section class="ftco-section bg-light">
        <div class="container">
            <div class="row">
                <div class="col-md-3 ftco-animate form-group">
                    <form>
                        <input style="search" name="search" placeholder="Search" value="${search}" class="form-control" autocomplete="off">
                    </form>
                </div>
            </div>
        </div>
    	<div class="container">
    		<div class="row">
    			<div class="col-md-8 col-lg-10 order-md-last">
                            <div class="row">
                                <c:forEach items="${listP}" var="o">
                                    <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">                                    
                                        <c:url value = "product" var = "productID">
                                            <c:param name = "pid" value = "${o.id}"/>                           
                                        </c:url>
		    			<div class="product d-flex flex-column">
                                            <a href="${productID}" class="img-prod"><img class="img-fluid" src="${o.image_link}" alt="Colorlib Template">
                                                    <div class="overlay"></div>
                                            </a>
                                            <div class="text py-3 pb-4 px-3">
                                                    <div class="d-flex">
                                                            <div class="cat">
                                                                    <span>${o.category}</span>
                                                            </div>
                                                    </div>
                                                    <h3><a href="product?pid=${o.id}">${o.name}</a></h3>
                                                    <div class="pricing">
                                                            <p class="price"><span>$${o.price}</span></p>
                                                    </div>
                                                    <p class="bottom-area d-flex px-3">
                                                            <a href="cart?id=${o.id}&quantity=1&size=39" class="add-to-cart text-center py-2 mr-1"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                                                            <a href="cart?id=${o.id}&quantity=1&size=39&act=buy" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>
                                                    </p>
                                            </div>
                                        </div>
                                    
                                    </div>
                                </c:forEach>
                            </div>  
		    	<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
                                <c:forEach begin="1" end="${endP}" var="i">
                                    <a style="padding: 20px; color: black;" href="shop?pageProduct=${i}">${i}</a>
                                </c:forEach>
		            </div>
		          </div>
		        </div>
		    	</div>

    <div class="col-md-4 col-lg-2">
	<div class="sidebar">
	<div class="sidebar-box-2">
		<h2 class="heading">Categories</h2>
		<div class="fancy-collapse-panel">
                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                     <div class="panel panel-default">
<!--                         <div class="panel-heading" role="tab" id="headingOne">
                             <h4 class="panel-title">
                                 <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Men's Shoes
                                 </a>
                             </h4>
                         </div>-->
                        <div id="collapseOne" class="panel-heading" role="tab" aria-labelledby="headingOne">
                             <div class="panel-body">
                                 <ul>  
                                    <c:forEach items="${b.category}" var="o">
                                        <li><a href="shop?sortCategory=${o.category}">${o.category}</a></li>                
                                    </c:forEach>
                                    <li><a href="shop?sortCategory=">All Product</a></li> 
                                 </ul>
                             </div>
                         </div>
                     </div>
                  </div>
               </div>
	</div>							
	</div>
    </div>
    </div>
    </div>
    </section>
		
		<section class="ftco-gallery">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-8 heading-section text-center mb-4 ftco-animate">
            <h2 class="mb-4">Follow Us On Instagram</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
          </div>
    		</div>
    	</div>
    	<div class="container-fluid px-0">
    		<div class="row no-gutters">
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-1.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-2.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-3.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-4.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-5.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-6.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
        </div>
    	</div>
    </section>

<%@include file="/View/layout/footer.jsp" %>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>
