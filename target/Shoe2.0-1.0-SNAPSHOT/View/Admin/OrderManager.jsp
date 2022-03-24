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
    <c:set var="url" value="${pageContext.request.contextPath}/user_infor"/>
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="home">Home</a></span> <span>Manager</span></p>
            <h1 class="mb-0 bread">Order</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-cart">
        <div class="container">
            <div class="row">
                <div class="col-md-5 ftco-animate form-group">
                    <form>
                        <input style="search" name="search" placeholder="Search" class="form-control" value="${search}" autocomplete="off">
                    </form>
                </div>
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
                                <th>OrderID</th>
                                
                                <th>Order's Date</th>
                                <th>UserID</th>
                                
                                <th>Phone</th>
                                <th>Status</th>
                                
                                
                                <th>Update</th>
                                
                              </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listO}" var="o">
                                    
                                    <tr class="text-center">
                                        <td class="product-id">${o.transactionID}</td>
                                        

                                        <td class="product-name">
                                            <h3>${o.created}</h3>
                                        </td>
                                        <td class="price"><a href="${url}?Uid=${o.userID}">${o.userID}</a></td> 
                                        <td class="price">0${o.phone}</td>
                                        
                                        
<!--                                            <select id="size" id="" class="form-control" value="o.status">
                                                <option value="Processing" style="color: Blue">Processing</option>
                                                <option value="Completed" style="color: Green">Completed</option>
                                                <option value="Rejected" style="color: Orange">Rejected</option>
                                                <option value="Cancelled" style="color: Red">Cancelled</option>
                                            </select>-->
                                        <c:choose>
                                            <c:when test="${o.status == 'Processing'}">
                                               <td class="status" style="color: Blue; font-weight: bold;">${o.status}</td>
                                            </c:when>
                                            <c:when test="${o.status == 'Completed'}">
                                               <td class="status" style="color: Green; font-weight: bold;">${o.status}</td>
                                            </c:when>
                                            <c:when test="${o.status == 'Cancelled'}">
                                               <td class="status" style="color: red; font-weight: bold;">${o.status}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="status" style="color: Orange; font-weight: bold;">${o.status}</td>
                                            </c:otherwise>    
                                         </c:choose>
                                         

                                        <td class="product-remove"><a href="OrderDetail?Tid=${o.transactionID}"><span class="ion-ios-eye"></span></a></td>
                                                                          
                                        

                                    </tr><!-- END TR-->
                                    
                                </c:forEach>
                </tbody>
              </table>
            </form>
              </div>
        </div>
    		</div>
    		
	</div>
    </section>
    
    <%@include file="/View/layout/footer.jsp" %>
    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

    <script>
        function showMess(id){
            var option = confirm('Are you sure to delete');
            if(option === true){
                window.location.href='delete?pid='+id;
            }
        }
    </script>
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
