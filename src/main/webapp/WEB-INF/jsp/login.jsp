<%-- 
    Document   : login
    Created on : 6 Αυγ 2020, 6:41:36 μμ
    Author     : ths13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="/css/login.css" rel="stylesheet">
    </head>
    <body>

        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <!--    <div class="fadeIn first">
                      <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
                    </div>-->

                <form:form method="POST" action="">
                    <input type="text" id="login" class="fadeIn second" name="login" placeholder="username">
                    <input type="text" id="password" class="fadeIn third" name="login" placeholder="password">
                    <input type="submit" class="fadeIn fourth pointer" value="Log In">
                    

                </form:form> 

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a>
                </div>

            </div>
        </div>
    </body>
</html>
