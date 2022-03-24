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
  <!--Stylesheet-->

</head>
<body>
    

 
    <div>
        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
        <form action="./login">
            <h3>Login Here</h3>

            <label for="username">Username</label>
            <input type="text" placeholder="Username" name="username" >

            <label for="password">Password</label>
            <input type="password" placeholder="Password" name="password"><br>

            <p class="help-block alert-danger">${requestScope.ERROR_LOGIN}</p>

            <a href="home.jsp"><button type="submit" style="color: white">Sign In</button></a>
            <p>Don't have account?  <a href ="signup" style="color: red">Sign up</a></p>
         </form>
    </div>
</body>
</html>