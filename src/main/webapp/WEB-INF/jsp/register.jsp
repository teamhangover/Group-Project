<%-- 
    Document   : register
    Created on : Jul 25, 2020, 8:48:52 PM
    Author     : RG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/register.css">
</head>

<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
           


            <!-- register Form -->
            <form>
                <input type="text" id="login" class="fadeIn first" name="register" placeholder="username">
                <input type="password" id="password" class="fadeIn second" name="register" placeholder="password">
                <input type="email" id="email" class="fadeIn third" name="register" placeholder="email">
                <p></p>
                <input type="submit" class="fadeIn fourth pointer" value="Register">
            </form>

        </div>
    </div>
</body>

</html>