<%-- 
    Document   : ProductManager
    Created on : Mar 14, 2022, 8:26:44 PM
    Author     : avillX
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
    </head>
    <body class="goto-here">

        <%@include file="/View/layout/header.jsp" %>
        <c:set var="url" value="${pageContext.request.contextPath}/productmanager"/>
        
        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="home">Home</a></span> <span>Order</span></p>
                        <h1 class="mb-0 bread">Information</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section" style="padding: 3em 0">
            <div class="container">
                <div class="row mt-5">
                    <div class="col-md-12 nav-link-wrap">
                        <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Order Information</a>
                        <c:if test="${sessionScope.LOGIN_USER.roleID == 1}">    
                            <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Change Status</a>
                        </c:if>    


                        </div>
                    </div>
                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content bg-light" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                <div class="p-4">

                                    <div class="col-md-5 ftco-animate form-group">
                                        


                                        <form action="./updateU" method="POST">
                                            <div class="infor" style="margin-left: 20%;">
                                                <table style="margin: 4% 24%; font-size: 20px; ">
                                                    <input type="hidden" name="act" value="infor"/>
                                                    <tr>
                                                        <td><mark>UserID: </mark></td>
                                                        <td><mark style="font-weight: bold"><a href="user_infor?Uid=${requestScope.OrderInfo.userID}">${requestScope.OrderInfo.userID}</a></mark></td>
                                                    </tr>
                                                    <tr>
                                                        <td><mark>Phone: </mark></td>
                                                        <td><mark>0${requestScope.OrderInfo.phone}</mark></td>
                                                    <tr>
                                                        <td><mark>Address: </mark></td>
                                                        <td><mark>  ${requestScope.OrderInfo.address}</mark></td>
                                                    </tr>
                                                    <tr>
                                                        <td><mark>Mess: </mark></td>
                                                        <td><mark>  ${requestScope.OrderInfo.mess}</mark></td>
                                                    </tr>
                                                    <tr>
                                                        <td><mark>Date: </mark></td>
                                                        <td><mark>  ${requestScope.OrderInfo.created}</mark></td>
                                                    </tr>
                                                    
                                                    
                                            
                                        
                                                </table>
                                        
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <c:if test="${sessionScope.LOGIN_USER.roleID == 1}">
                          <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                                <div class="p-4">
                                    <div class="col-md-5 ftco-animate form-group">
                                        <form action="./updateU?act=status&Tid=${requestScope.OrderInfo.transactionID}" method="POST">   
                                            <div class="infor" style="margin-left: 20%;">
                                                <table style="margin: 4% 24%; font-size: 20px; ">
                                                    <input type="hidden" name="act" value="status"/>
                                                    <c:set var="status" value="Processing,Cancelled,Rejected,Completed"/>
                                                    <c:forEach items="${status}" var="o">
                                                        <c:choose>
                                                            <c:when test="${o == requestScope.OrderInfo.status}">
                                                                <tr>
                                                                    <td><input style="margin: 5%;" checked="checked" name="status" type="radio" value="${o}" /></td>
                                                                    <td><mark style="color: green; font-weight: bold;">${o}</mark></td>
                                                                </tr>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <tr>
                                                                    <td><input style="margin: 5%;" name="status" type="radio" value="${o}" /></td>
                                                                    <td><mark style="color: red">${o}</mark></td>
                                                                </tr>
                                                            </c:otherwise>    
                                                        </c:choose>
                                                    </c:forEach>
                                                                
                                                </table>
                                                     <input style="margin-left:550px" type="submit" class="submit"  value="Update" />
                                            </div>

                                        </form>
                                    </div>
                                </div>              
                            </div> 
                        </c:if>
                        </div>
                    </div>
                </div>
        </section>

          <section class="ftco-section ftco-cart" style="padding: 3em 0">
        <div class="container">
            <h2>Order's Detail</h2>
            <div class="row">
<!--                <div class="col-md-5 ftco-animate form-group">
                    <form>
                        <input style="search" name="search" placeholder="Search" class="form-control" value="" autocomplete="off">
                    </form>
                </div>-->
            </div>
        </div>
        <div class="container">
                <div class="row">
        <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                    <form name="f" method="POST">
                        <table class="table">
                            <thead class="thead-primary">
                              <tr class="text-center">
                                <th>ID</th>
                                
                                <th>&nbsp;</th>
                                <th>Product</th>
                                
                                <th>Category</th>
                                <th>Size</th>
                                <th>Price</th>
                                
                                <th>Qty</th>
                                <th>Total</th>
                                <th>Control</th>
                                
                                
                              </tr>
                            </thead>
                            <tbody>
                                <c:set var="total" value="0" />
                                <c:forEach items="${listO}" var="o">
                                    
                                    <tr class="text-center">
                                        <td class="product-id">${o.product.id}</td>
                                        <td class="image-prod"><div class="img" style="background-image:url(${o.product.image_link});"></div></td>

                                        <td class="product-name">
                                            <h3>${o.product.name}</h3>
                                        </td>
                                        <td class="price">${o.product.category}</td>
                                        <td class="price">${o.size}</td>
                                        <td class="price">$${o.price}</td>
                                        <td class="price">${o.quantity}</td>
                                        <td class="product-name">
                                            <h3>$${o.price * o.quantity}</h3>
                                        </td>
                                        <td class="product-remove"><a href="product?pid=${o.product.id}"><span class="ion-ios-eye"></span></a></td>
                                        <c:set var="total" value="${total+(o.price * o.quantity)}" />
                                    </tr><!-- END TR-->
                                    
                                </c:forEach>
                        </tbody>
              </table>
            </form>
              </div>
        </div>
    		</div>
    		<div class="row justify-content-start">
                    
    			<div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Cart Totals</h3>
<!--    					<p class="d-flex">
    						<span>Subtotal</span>
    						<span>$20.60</span>
    					</p>-->
    					<p class="d-flex">
    						<span>Delivery</span>
    						<span>Freeship</span>
    					</p>
 <!--    					<p class="d-flex">
    						<span>Discount</span>
    						<span>$3.00</span>
    					</p>-->
    					<hr>
    					<p class="d-flex total-price">
    						<span>Total</span>
    						<span>$${total}</span>
    					</p>
    				</div>

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
