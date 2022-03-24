<%-- 
    Document   : Cart
    Created on : Mar 14, 2022, 9:43:59 AM
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

        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
                        <h1 class="mb-0 bread">My Cart</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">
                                        <th>&nbsp;</th>
                                        <th>Product</th>
                                        <th>&nbsp;</th>
                                        <th>Size</th>
                                        <th>Price</th>

                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="STT" value="0" />
                                    <c:set var="total" value="0" />
                                    <c:forEach items="${requestScope.pCart}" var="o">
                                        <c:set var="STT" value="${STT+1}" />
                                        <tr class="text-center">
                                            <td class="product-id">${STT}</td>

                                            <td class="image-prod"><div class="img" style="background-image:url(${o.product.image_link});"></div></td>

                                            <td class="product-name">
                                                <h3>${o.product.name}</h3>

                                            </td>
                                            <td class="price">${o.size}</td>
                                            <td class="price">$${o.price}</td>

                                            <td class="quantity" style="text-align: center">

                                                <button style="width: 30px"><a href="process?num=-1&size=${o.size}&id=${o.product.id}">-</a></button>
                                                ${o.quantity}
                                                <button style="width: 30px"><a href="process?num=1&size=${o.size}&id=${o.product.id}">+</a></button>


                                            </td>
                                            <c:set var="total" value="${total+(o.price * o.quantity)}" />
                                            <td class="total">$${o.quantity * o.price}</td>


                                        </tr><!-- END TR-->

                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <form action="./checkout" method="POST">                    
                <div class="row justify-content-start">
                    
                    <div class="col col-lg-6 col-md-6 mt-5">
                        <h3 style="text-align: center;">Shipping Information</h3>
                        Name<input style="width: 400px; padding-top: 13px; padding-bottom: 13px; margin-left: 25px; margin-top: 5px;" value="${sessionScope.LOGIN_USER.fullname}" type="text" name="fullname" /><br>
                        Phone<input style="width: 400px; padding-top: 13px; padding-bottom: 13px; margin-left: 22px; margin-top: 5px;" value="${sessionScope.LOGIN_USER.phone}"  type="text" name="phone" /><br>
                        Address<input style="width: 400px; padding-top: 13px; padding-bottom: 13px; margin-left: 10px; margin-top: 5px;" value="${sessionScope.LOGIN_USER.address}" type="text" name="address" />
                    </div>
                    <div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
                        <div class="cart-total mb-3">
                            <h3>Cart Totals</h3>
                            <p class="d-flex">
                                <span>Delivery</span>
                                <span>Freeship</span>
                            </p>
                            <hr>
                            <p class="d-flex total-price">
                                <span>Total</span>
                                <input type="hidden" value="${total}" name="total"/>
                                <span>$${total}</span>
                            </p>
                        </div>
                            <input type="submit" class="btn btn-primary py-3 px-4" value="Proceed to Checkout"/>               
                    </div>
                </div>
            </form>
            </div>
        </section>
        <%@include file="/View/layout/footer.jsp" %>
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

        <script>
            $(document).ready(function () {

                var quantity = 0;
                $('.quantity-right-plus').click(function (e) {

                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    $('#quantity').val(quantity + 1);


                    // Increment

                });

                $('.quantity-left-minus').click(function (e) {
                    // Stop acting like a button
                    e.preventDefault();
                    // Get the field name
                    var quantity = parseInt($('#quantity').val());

                    // If is not undefined

                    // Increment
                    if (quantity > 0) {
                        $('#quantity').val(quantity - 1);
                    }
                });

            });
        </script>

    </body>
</html>
