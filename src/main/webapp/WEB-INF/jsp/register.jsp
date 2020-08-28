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
        <title>Register </title>
        <link rel="icon" href="/img/paw.png" sizes="32x32">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="/css/register.css">
    </head>

    <body>
        <jsp:include page="noLogin-navbar.jsp"></jsp:include>
            <div class="wrapper fadeInDown">
                <div id="formContent">



                    <!-- register Form -->
                <springform:form action="${pageContext.request.contextPath}/doInsertMyUser" method="post" modelAttribute="newMyUser">
                    <springform:input path="myUserId" hidden="true"></springform:input>
                    <springform:input path="username" type="text" id="login" cssClass="fadeIn first" name="register" placeholder="username" />
                    <springform:input path="myPassword" type="password" id="password" cssClass="fadeIn second" name="register" placeholder="password" />
                    <springform:input path="email" type="email" id="email" cssClass="fadeIn third" name="register" placeholder="email" />
                    
                    <span id="keeperCheckbox" class="fadeIn fourth text-muted ">Register as a Keeper ? <input name="keeper" id="keeper" class="pointer"  value="true" type="checkbox"/> </span>  


                    <p></p>
                    <input type="submit" class="fadeIn fourth pointer" value="Register" />
                </springform:form>

            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>