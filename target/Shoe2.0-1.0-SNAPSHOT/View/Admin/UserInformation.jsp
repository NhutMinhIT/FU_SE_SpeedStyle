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
                        <p class="breadcrumbs"><span class="mr-2"><a href="home">Home</a></span> <span>User</span></p>
                        <h1 class="mb-0 bread">Information</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section"  style="padding: 3em 0">
            <div class="container">
                <div class="row mt-5">
                    <div class="col-md-12 nav-link-wrap">
                        <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">User Information</a>
                        <c:if test="${sessionScope.LOGIN_USER.username == requestScope.InforU.username}">
                            <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Change Password</a>
                        </c:if>


                        </div>
                    </div>
                    <div class="col-md-12 tab-wrap">

                        <div class="tab-content bg-light" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                <div class="p-4">

                                    <div class="col-md-5 ftco-animate form-group">
                                        <form action="./updateU">



                                            <div class="infor" style="margin-left: 20%;">
                                                <table style="margin: 4% 24%; font-size: 20px; ">
                                                    <input type="hidden" name="act" value="infor"/>
                                                    <input type="hidden" name="Uname" value="${requestScope.InforU.username}"/>
                                                    <tr>
                                                        <td><label for="name">Name: </label></td>
                                                        <td><input name ="fullname" type="text" size="60" value="${requestScope.InforU.fullname}" autocomplete="off"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="phone">Phone: </label></td>
                                                        <td><input name="phone" type="text" value="${requestScope.InforU.phone}" size="60" maxlength="10" pattern="[0-9]{10}" autocomplete="off"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="address">Address: </label></td>
                                                        <td><input name="address" type="text" size="60" value="${requestScope.InforU.address}" autocomplete="off"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="email">Email</label>:</td>
                                                        <td><input name="email" type="text" id="email" name="email" size="60" value="${requestScope.InforU.email}" autocomplete="off"/></td>  </tr>




                                                </table>

                                            </div>
                                            <input style="margin-left:550px" type="submit" name="submit" value="Update" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <c:if test="${sessionScope.LOGIN_USER.username == requestScope.InforU.username}">
                            <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                                <div class="p-4">
                                    <div class="col-md-5 ftco-animate form-group">
                                        <form action="./updateU">   
                                            <div class="infor" style="margin-left: 20%;">
                                                <table style="margin: 4% 24%; font-size: 20px; ">
                                                    <input type="hidden" name="act" value="pass"/>
                                                    <input type="hidden" name="Uname" value="${requestScope.InforU.username}"/>
                                                    <tr>
                                                        <td><label for="OldPass">Old Password: </label>
                                                            <input  onchange="onChange1()" id="passSQL" type="hidden" name="passSQL" value="${requestScope.InforU.password}"/>
                                                            <input onchange="onChange1()" id="OldPass" type="password" size="60" value="" name="OldPass" required pattern="\S+" />
                                                            <p class="help-block alert-danger">${requestScope.error}</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="NewPass">New Password: </label>
                                                            <input onChange="onChange()"  type="password" size="60" value="" name="NewPass" required pattern="\S+"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><label for="ReNewPass">Re-enter New Pasword: </label>
                                                            <input onChange="onChange()" type="password" size="60" value="" name="ReNewPass"  required pattern="\S+"/></td>
                                                    </tr>
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

        <section class="ftco-section ftco-cart">
            <div class="container">
                <h2>Order's History</h2>
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
                                                <td class="price"><a href="${url}?uid=${o.userID}">${o.userID}</a></td> 
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
            function showMess(id) {
                var option = confirm('Are you sure to delete');
                if (option === true) {
                    window.location.href = 'delete?pid=' + id;
                }
            }
            function onChange() {
                const password = document.querySelector('input[name=NewPass]');
                const confirm = document.querySelector('input[name=ReNewPass]');
                if (confirm.value === password.value) {
                    confirm.setCustomValidity('');
                } else {
                    confirm.setCustomValidity('Passwords do not match');
                }
            }
            function onChange1() {
                const password1 = document.querySelector('input[name=passSQL]');
                const confirm1 = document.querySelector('input[name=OldPass]');
                if (confirm1.value === password1.value) {
                    confirm1.setCustomValidity('');      
                    
                } else {
                    confirm1.setCustomValidity('Old Pass do not match!! Please input again Old Password!!!'); 
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
