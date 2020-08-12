<%-- 
    Document   : noLogin-navbar
    Created on : 11 ??? 2020, 7:16:06 ??
    Author     : ths13
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="/css/noLogin-navbar.css" rel="stylesheet"> 

<header>
    <nav class="navbar navbar-expand-md fixed-top d-flex flex-row-reverse">

        <a class="navbar" href="/preInsertMyUser">Eγγραφή</a>
        <a class="navbar" href="/loginPage">Σύνδεση</a>
        <a><form:form method="post" action="${pageContext.request.contextPath}/logout">
                <input type="submit" value="Logout"/>
            </form:form></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse " id="navbarCollapse">
            <img src="/img/petKeeperLogowhite.png" class="rounded justify-content-center align-self-center" alt="">

            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link " href="#"> <i class="fa fa-fw fa-home"> </i> Home </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/getRoles"> Roles </a>
                </li>



            </ul>
        </div>
    </nav>
</header>  

