<%-- 
    Document   : addNewProduct
    Created on : Mar 17, 2022, 12:46:33 AM
    Author     : Nhut Minh
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <jsp:useBean id="x" class="com.speedstyle.prj301.dao.ProductDAO" scope="request"></jsp:useBean>
    </head>
    
    <body class="goto-here">
            <style>

        /*
        =====
        RESET STYLES
        =====
        */

        .field__input{
            --uiFieldPlaceholderColor: var(--fieldPlaceholderColor, #767676);

            background-color: transparent;
            border-radius: 0;
            border: none;

            -webkit-appearance: none;
            -moz-appearance: none;

            font-family: inherit;
            font-size: inherit;
        }

        .field__input:focus::-webkit-input-placeholder{
            color: var(--uiFieldPlaceholderColor);
        }

        .field__input:focus::-moz-placeholder{
            color: var(--uiFieldPlaceholderColor);
        }

        /*
        =====
        CORE STYLES
        =====
        */

        .field{
            --uiFieldBorderWidth: var(--fieldBorderWidth, 2px);
            --uiFieldPaddingRight: var(--fieldPaddingRight, 1rem);
            --uiFieldPaddingLeft: var(--fieldPaddingLeft, 1rem);
            --uiFieldBorderColorActive: var(--fieldBorderColorActive, rgba(22, 22, 22, 1));

            display: var(--fieldDisplay, inline-flex);
            position: relative;
            font-size: var(--fieldFontSize, 1rem);
        }

        .field__input{
            box-sizing: border-box;
            width: var(--fieldWidth, 100%);
            height: var(--fieldHeight, 3rem);
            padding: var(--fieldPaddingTop, 1.25rem) var(--uiFieldPaddingRight) var(--fieldPaddingBottom, .5rem) var(--uiFieldPaddingLeft);
            border-bottom: var(--uiFieldBorderWidth) solid var(--fieldBorderColor, rgba(0, 0, 0, .25));
        }

        .field__input:focus{
            outline: none;
        }

        .field__input::-webkit-input-placeholder{
            opacity: 0;
            transition: opacity .2s ease-out;
        }

        .field__input::-moz-placeholder{
            opacity: 0;
            transition: opacity .2s ease-out;
        }

        .field__input:focus::-webkit-input-placeholder{
            opacity: 1;
            transition-delay: .2s;
        }

        .field__input:focus::-moz-placeholder{
            opacity: 1;
            transition-delay: .2s;
        }

        .field__label-wrap{
            box-sizing: border-box;
            pointer-events: none;
            cursor: text;

            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
        }

        .field__label-wrap::after{
            content: "";
            box-sizing: border-box;
            width: 100%;
            height: 0;
            opacity: 0;

            position: absolute;
            bottom: 0;
            left: 0;
        }

        .field__input:focus ~ .field__label-wrap::after{
            opacity: 1;
        }

        .field__label{
            position: absolute;
            left: var(--uiFieldPaddingLeft);
            top: calc(50% - .5em);

            line-height: 1;
            font-size: var(--fieldHintFontSize, inherit);

            transition: top .2s cubic-bezier(0.9, -0.15, 0.1, 1.15), opacity .2s ease-out, font-size .2s ease-out;
            will-change: bottom, opacity, font-size;
        }

        .field__input:focus ~ .field__label-wrap .field__label,
        .field__input:not(:placeholder-shown) ~ .field__label-wrap .field__label{
            --fieldHintFontSize: var(--fieldHintFontSizeFocused, .75rem);

            top: var(--fieldHintTopHover, .25rem);
        }

        /* 
        effect 1
        */

        .field_v1 .field__label-wrap::after{
            border-bottom: var(--uiFieldBorderWidth) solid var(--uiFieldBorderColorActive);
            transition: opacity .2s ease-out;
            will-change: opacity;

        }



        /* 
        effect 2
        */

        .field_v2 .field__label-wrap{
            overflow: hidden;
        }

        .field_v2 .field__label-wrap::after{
            border-bottom: var(--uiFieldBorderWidth) solid var(--uiFieldBorderColorActive);
            transform: translate3d(-105%, 0, 0);
            will-change: transform, opacity;
            transition: transform .285s ease-out .2s, opacity .2s ease-out .2s;
        }

        .field_v2 .field__input:focus ~ .field__label-wrap::after{
            transform: translate3d(0, 0, 0);
            transition-delay: 0;
        }

        /*
        effect 3
        */

        .field_v3 .field__label-wrap::after{
            border: var(--uiFieldBorderWidth) solid var(--uiFieldBorderColorActive);
            will-change: opacity, height;
            transition: height .2s ease-out, opacity .2s ease-out;
        }

        .field_v3 .field__input:focus ~ .field__label-wrap::after{
            height: 100%;
        }

        /*
        =====
        LEVEL 4. SETTINGS
        =====
        */

        .field{
            --fieldBorderColor: #D1C4E9;
            --fieldBorderColorActive: #673AB7;
        }

        /*
        =====
        DEMO
        =====
        */

        body{
            font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Open Sans, Ubuntu, Fira Sans, Helvetica Neue, sans-serif;
            margin: 0;

            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .page{
            box-sizing: border-box;
            width: 100%;
            max-width: 480px;
            margin: auto;
            padding: 1rem;

            display: grid;
            grid-gap: 30px;
        }

        .linktr{
            order: -1;
            padding: 1.75rem;
            text-align: center;
        }

        .linktr__goal{
            background-color: rgb(209, 246, 255);
            color: rgb(8, 49, 112);
            box-shadow: rgb(8 49 112 / 24%) 0px 2px 8px 0px;
            border-radius: 2rem;
            padding: .5rem 1.25rem;
        }

        @media (min-width: 1024px){

            .linktr{
                position: absolute;
                right: 1rem;
                bottom: 1rem;
            }
        }

        .r-link{
            --uirLinkDisplay: var(--rLinkDisplay, inline-flex);
            --uirLinkTextColor: var(--rLinkTextColor);
            --uirLinkTextDecoration: var(--rLinkTextDecoration, none);

            display: var(--uirLinkDisplay) !important;
            color: var(--uirLinkTextColor) !important;
            text-decoration: var(--uirLinkTextDecoration) !important;
        }
    </style>    
        <%@include file="/View/layout/header.jsp" %>
        
        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="home">Home</a></span> <span>Manager</span></p>
                        <h1 class="mb-0 bread">Edit Product</h1>
                    </div>
                </div>
            </div>
        </div>
        <c:set var="p" value="${requestScope.product}"/>
        <c:set var="Size" value="${requestScope.sizeList}"/>
       <section>
            <div>
                <img style="width: 30%; margin-left: 35%; margin-top: 3%;" class="img-fluid" src="${p.image_link}" alt="Colorlib Template">
            </div>

            <div class="page">
                <form action="./update" method="POST">
                    <label class="field field_v1">
                        <p><input type="hidden" class="field__input" placeholder="" name="id" autocomplete="off" value="${p.id}"/></p>
                    </label>
                    <label class="field field_v1">
                        <input type="text" class="field__input" placeholder="" name="Name" autocomplete="off" value="${p.name} " required />
                        <span class="field__label-wrap">
                            <span class="field__label">Input Name Product</span>
                        </span>
                    </label>               

                    <label class="field field_v1">
                        <input class="field__input" placeholder="" name="Price" autocomplete="off" value="${p.price}" required pattern="\S+"/>
                        <span class="field__label-wrap">
                            <span class="field__label">Input Price</span>
                        </span>
                    </label>
                    <!-- comment -->
                    CATEGORY: 
                    <label class="field field_v1" style="margin-top: 30px; margin-left: 15%;">                      
                        <c:forEach items="${x.category}" var="o">
                            <c:choose>
                                <c:when test="${p.category == o.category}">
                                    <input  style="margin: 5%;" checked="checked" name="Category" type="radio" value="${o.category}" />${o.category}
                                </c:when>
                                <c:otherwise>
                                    <input  style="margin: 5%;" name="Category" type="radio" value="${o.category}" />${o.category}
                                </c:otherwise>    
                            </c:choose>
                        </c:forEach>
                   </label>  
                    <br>
                    <br>
                    <!-- comment -->
                    <label class="field field_v1">
                        <input class="field__input" placeholder="" name="image_link" autocomplete="off" value="${p.image_link}" required pattern="\S+"/> 
                        <span class="field__label-wrap">
                            <span class="field__label">Input image_link Product</span>
                        </span>
                    </label>  
                    <label class="field field_v3">
                        <input style="width: 440px;" class="field__input" placeholder="" name="Description" autocomplete="off" value="${p.main_description}" required/>
                        <span class="field__label-wrap">
                            <span class="field__label">Input Description</span>
                        </span>
                    </label>
                    <label>
                        Size39: <input class="c" type="text" name="size39" placeholder="39" autocomplete="off" value="${Size.size39}" required pattern="\S+"/><br>
                        Size40: <input class="c" type="text" name="size40" placeholder="40" autocomplete="off" value="${Size.size40}" required pattern="\S+"/><br>
                        Size41: <input class="c" type="text" name="size41" placeholder="41" autocomplete="off" value="${Size.size41}" required pattern="\S+"/><br> 
                        Size42: <input class="c" type="text" name="size42" placeholder="42" autocomplete="off" value="${Size.size42}" required pattern="\S+"/><br>
                        Size43: <input class="c" type="text" name="size43" placeholder="43" autocomplete="off" value="${Size.size43}" required pattern="\S+"/><br>
                        Size44: <input class="c" type="text" name="size44" placeholder="44" autocomplete="off" value="${Size.size44}" required pattern="\S+"/><br>
                    </label>

                    <label>
                        <input class="linktr__goal r-link" style="margin-left: 40%;" onclick="checkBlank()" type="Submit" value="Submit">
                    </label>
                </form>
            </div>
            <div class="linktr">
                <a href="productmanager" target="_blank" class="linktr__goal r-link">Back to Product Manager Page ???</a>
            </div>
        </section>
        <%@include file="/View/layout/footer.jsp" %>
    </body>
</html>
