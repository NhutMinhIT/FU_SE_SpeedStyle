<%-- 
    Document   : signin
    Created on : Feb 18, 2022, 9:14:44 PM
    Author     : Nhut Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Design by foolishdeveloper.com -->
        <title>SpeedStyle - Not Just For Show</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/stylesignin.css">

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
        <link rel="stylesheet" href="css/signup.css">

    </head>
    <body>



        <div>
            <div class="background">
                <div class="shape"></div>
                <div class="shape"></div>
            </div>
            <form action="./signup">
                <h3>Sign Up</h3>
                
                <label for="username">Username</label>
                <input type="text" placeholder="Username" name="username" >

                <label for="password">Password</label>

                <input onChange="onChange()"  type="password" size="60" placeholder="Password"  value="" name="password" required pattern="\S+"/><br>
                <p class="help-block alert-danger" style="color: red">${requestScope.MSG_SIGNUP}</p>
                <label for="repassword">Re-Password</label>

                <input onChange="onChange()" type="password" size="60" value="" name="repassword" placeholder="Re-Password"  required pattern="\S+"/><br>

                <p>Already have account?  <a href ="login" style="color: red">Login</a></p>
                <input type="submit" value="Sign Up" style="color: white; border-radius: 10px; background: orange; " id="btn">
            </form>
        </div>
    </body>

    <script>
        function onChange() {
                const password = document.querySelector('input[name=password]');
                const confirm = document.querySelector('input[name=repassword]');
                if (confirm.value === password.value) {
                    confirm.setCustomValidity('');
                } else {
                    confirm.setCustomValidity('Passwords do not match');
                }
            }
    </script>
</html>