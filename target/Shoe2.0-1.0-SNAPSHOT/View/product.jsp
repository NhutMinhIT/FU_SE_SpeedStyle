<%-- 
    Document   : product
    Created on : Mar 9, 2022, 5:33:51 PM
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
  </head>
  <body class="goto-here">
    
    <%@include file="/View/layout/header.jsp" %>
    

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="home">Home</a></span> <span>Product</span></p>
            <h1 class="mb-0 bread">${detail.name}</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
                     
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="${detail.image_link}" class="image-popup prod-img-bg"><img src="${detail.image_link}" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
                            <form name="f" method="POST">
    				<h3>${detail.name}</h3>

    				<p class="price"><span>$${detail.price}</span></p>

						<div class="row mt-4">
							<div class="col-md-6">
								<div class="form-group d-flex">
		              <div class="select-wrap">
	                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                
                         
                            <select id="size" id="" class="form-control">
                    

                                <c:forEach items="${Size}" var="o">
                                    <option value="${o.psize}" style="text-align: center">${o.psize}</option>                                    
                                </c:forEach>  
                            </select>
	                </div>
		            </div>
							</div>
							<div class="w-100"></div>
							<div class="input-group col-md-6 d-flex mb-3">
	             	<span class="input-group-btn mr-2">
	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
                                <input type="text" id="quantity" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
	                     <i class="ion-ios-add"></i>
	                 </button>
	             	</span>
	          	</div>
	          	<div class="w-100"></div>
	          	<div class="col-md-12">
	          		
	          	</div>
          	</div>
                    <p>
                        <input type="submit" class="btn btn-black py-3 px-5 mr-2" onclick="addtoCart(${detail.id})" value="Add to Cart">
                        <a href="cart?id=${o.id}&quantity=1&size=39&act=buy" class="btn btn-primary py-3 px-5">Buy now</a>
                    </p>
    		</form></div>
                    
    		</div>




    	<div class="row mt-5">
          <div class="col-md-12 nav-link-wrap">
            <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Mô Tả Sản Phẩm</a>

              <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Bảo Hành</a>

              

            </div>
          </div>
          <div class="col-md-12 tab-wrap">
            
            <div class="tab-content bg-light" id="v-pills-tabContent">

              <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
              	<div class="p-4">
	              	<h3 class="mb-4">${detail.name}</h3>
	              	<p>${detail.main_description}</p>
              	</div>
              </div>

              <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
              	<div class="p-4">
	              	<h3 class="mb-4">BẢO HÀNH</h3>
                        <p>Thời gian hỗ trợ bảo hành kể từ ngày mua hàng: 3 tháng kể từ ngày mua hàng.<br>
                            <mark>Điều kiện áp dụng:</mark><br>
                            - Khách hàng mua sản phẩm sẽ được bảo hành miễn phí đối với các trường hợp sau: Hở keo, dứt chỉ, gãy móc khoá, bung hoạ tiết trang trí (nơ, nút, hoa, …)<br>
                            - Khi bảo hành khách hàng phải cung cấp hóa đơn (phiếu xuất hàng) và phiếu bảo hành của sản phẩm.
                            Thời gian xử lý bảo hành: Từ 1 đến 20 ngày làm việc kể từ ngày nhà máy nhận được sản phẩm tùy mức độ hư hỏng của giày dép.<br>
                            - Không hỗ trợ đối với những sản phẩm có thông báo: không áp dụng đổi trả - bảo hành.<br>
                            Địa điểm hỗ trợ bảo hành: <mark>661/17/32 Quận 9, Thành Phố Hồ Chí Minh</mark> <br>
                            Hotline : <mark>0203040506.</mark> 
                        </p>
              	</div>
              </div>              
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

  <script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
                
                
	</script>
        <script type="text/Javascript">
            function addtoCart(id){
            var size = document.f.size.value;
            var quantity = document.f.quantity.value;
            document.f.action = "cart?id="+id+"&quantity="+quantity+"&size="+size;
            document.f.submit();
    }    
        </script>
    
  </body>
</html>
