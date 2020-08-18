<%-- 
    Document   : access-denied
    Created on : Aug 6, 2020, 9:16:18 PM
    Author     : RG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="noLogin-navbar.jsp"></jsp:include>
        <h1>Access denied</h1>
        <p>
            Username: <security:authentication property="principal.username" />
            <br>
            Role: <security:authentication property="principal.authorities" />
        </p>
        <form:form method="post" action="${pageContext.request.contextPath}/logout">
            <input type="submit" value="Logout"/>
        </form:form>
    </body>
</html>
