<%-- 
    Document   : login
    Created on : 6 Αυγ 2020, 6:41:36 μμ
    Author     : ths13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login </title>
    <link rel="icon" href="/img/pawwhite.png" sizes="32x32">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="/css/login.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="navbar.jsp"></jsp:include>
            <div class="wrapper fadeInDown">
                <div id="formContent">
                    <!-- Tabs Titles -->



                <c:if test="${param.error != null}">
                    <b>Προσπάθησε ξανά</b>
                </c:if>
                <c:if test="${param.logout != null}">
                    <b>Αποσυνδέθηκες επιτυχώς</b>
                </c:if>
                <springform:form method="POST" action="" >
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="Όνομα χρήστη">
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="Συνθηματικό">
                    <input type="submit" class="fadeIn fourth pointer" value="Σύνδεση">
                </springform:form> 

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Ξέχασες το συνθηματικό;</a>
                </div>
            </div>   
        </div>
            <br><br><br><br><br><br>
           
        <jsp:include page="footer.jsp"></jsp:include>  

    </body>
</html>
