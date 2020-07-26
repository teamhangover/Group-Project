<%-- 
    Document   : register
    Created on : Jul 25, 2020, 8:48:52 PM
    Author     : RG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <!--bootstrap-->
    </head>
    <body>
        <h1>Hello World!</h1>

        <springform:form action="/doInsertMyUser" method="post" modelAttribute="newMyUser">
            <springform:input path="myUserId" hidden="true"></springform:input>
                <div class="row mt-2">
                    <div class="col mini-box">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i>username: </i></span>
                            </div>
                        <springform:input path="username" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col mini-box">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i>Password: </i></span>
                        </div>
                        <springform:input type="password" path="myPassword" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col mini-box">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i>email: </i></span>
                        </div>
                        <springform:input type="email" path="email" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col mini-box">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i>Register as keeper: </i></span>
                        </div>
                        <input  name="keeper" id="keeper" value="true" type="checkbox" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col mini-box">
                    <button type="submit" id="submit" class="btn btn-lg btn-block btn-primary mb-1"
                            ">Register</button>
                </div>
                <div class="col mini-box">
                    <button type="reset" class="btn btn-lg btn-block btn-primary mb-1">Clear</button>
                </div>
            </div>
        </springform:form>
    </body>
</html>
