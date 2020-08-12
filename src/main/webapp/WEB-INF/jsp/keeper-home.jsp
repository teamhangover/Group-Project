<%-- 
    Document   : keeper-home
    Created on : Aug 8, 2020, 1:21:51 AM
    Author     : RG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Keeper-home</title>
    </head>
    <body>
        <h1>Keeper-home!</h1>
        <p>
            User: <security:authentication property="principal.username" />
            <br>
            Role(s): <security:authentication property="principal.authorities" />
        </p>
        <form:form method="post" action="${pageContext.request.contextPath}/logout">
            <input type="submit" value="Logout"/>
        </form:form>
    </body>
</html>
