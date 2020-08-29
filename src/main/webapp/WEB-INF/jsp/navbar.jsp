<%-- 
    Document   : noLogin-navbar
    Created on : 11 ??? 2020, 7:16:06 ??
    Author     : ths13
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/css/navbar.css" rel="stylesheet"> 


<header>
    <nav class="navbar navbar-expand-md fixed-top d-flex flex-row-reverse nav-bk8">

        <!--if logged in-->
        <c:if test="${pageContext['request'].userPrincipal != null}">
            <security:authentication var="user" property="principal" />
            <security:authorize access="isAuthenticated()">
                ${user.username}
            </security:authorize>
            <a class="navbar btn btn-outline-warning m-2""><form:form method="post" action="${pageContext.request.contextPath}/logout">
                    <input class="text-warning" type="submit" value="Logout"/>
                </form:form></a>
            </c:if>

        <!--if not logged in-->
        <c:if test="${pageContext['request'].userPrincipal == null}">
            <a class="navbar btn btn-outline-warning m-2" href="${pageContext.request.contextPath}/preInsertMyUser">Eγγραφή</a>
            <a class="navbar btn btn-outline-warning m-2" href="${pageContext.request.contextPath}/loginPage">Σύνδεση</a>
        </c:if>

        <!--if logged in-->
        <c:if test="${pageContext['request'].userPrincipal != null}">
            <!--and is Keeper-->
            <security:authorize access="hasRole('ROLE_KEEPER') and isAuthenticated()">
                <a class="navbar btn btn-outline-warning m-2" href="${pageContext.request.contextPath}/preInsertMyUserDetails">Προφίλ</a>
                <a class="navbar btn btn-outline-warning m-2" href="${pageContext.request.contextPath}/keeper/dashboard"> Πίνακας Ελέγχου </a>
            </security:authorize>

            <!--and is owner-->
            <security:authorize access="hasRole('ROLE_OWNER') and isAuthenticated()">
                <a class="navbar btn btn-outline-warning m-2" href="${pageContext.request.contextPath}/preInsertMyUserDetails">Προφίλ</a>
            </security:authorize>
        </c:if>
            
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <img src="/img/petKeeperLogowhite.png" class="rounded-circle" alt="">

            
                    <a class="nav-link  btn btn-outline-warning ml-3 " href="${pageContext.request.contextPath}/"> <i class="fa fa-fw fa-home"> </i> Home </a>
               
        </div>
    </nav>
</header>  

