<%-- 
    Document   : fillMyUserDetails
    Created on : 29 Ιουλ 2020, 10:14:54 πμ
    Author     : ths13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fill My User Details</title>

        <!--TODO FIX THIS-->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript">
            var jQuery_ui = $.noConflict(true);
        </script>

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
        <jsp:include page="noLogin-navbar.jsp"></jsp:include>

        <springform:form action="/doInsertMyUserDetails" method="post" modelAttribute="myUserDetails" enctype="multipart/form-data">
            <%--<springform:input path="myUserId" hidden="true"></springform:input>--%>
            <springform:input path="detailsId" hidden="true"></springform:input>
                <div class="row mt-2">
                    <div class="col mini box">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i>Profile photo</i></span>
                            </div>
                            <input type="file" name="profilePic" class="form-control" accept="image/*"/>
                        </div>               
                    </div>           
                </div>

                <div class="row mt-2">
                    <div class="col mini box">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i>First Name</i></span>
                            </div>
                        <springform:input type="text" path="firstName" cssClass="form-control"></springform:input>
                        </div>               
                    </div>           
                </div>
                <div class="row mt-2">
                    <div class="col mini-box">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i>Last Name </i></span>
                            </div>
                        <springform:input type="text" path="lastName" cssClass="form-control"/>
                    </div>
                </div>
            </div>     
            <div class="row mt-2">
                <div class="col mini-box">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i>Age </i></span>
                        </div>
                        <springform:input type="number" path="age" cssClass="form-control"/>
                    </div>
                </div>
            </div>    
            <div class="row mt-2">
                <div class="col mini-box">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i>Telephone : </i></span>
                        </div>
                        <springform:input type="tel" path="tel" cssClass="form-control"/>
                    </div>
                </div>
            </div>  
            <div class="row mt-2">
                <div class="col mini-box">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i>Description : </i></span>
                        </div>
                        <springform:input type="textarea" path="uDescription" cssClass="form-control"/>
                    </div>
                </div>
            </div> 
            <div class="row mt-2">
                <div class="col mini-box">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i>Upload Profile Photo: </i></span>
                        </div>
                        <input type="file" name="photo" class="form-control" accept="image/*"/>
                        <!--delete uPhotoName?-->
                        <%--<springform:input type="text" path="uPhotoName" hidden="true"/>--%>
                    </div>
                </div>
            </div>   
            <div class="row mt-2">
                <div class="col mini-box">
                    <button type="submit" id="submit" class="btn btn-lg btn-block btn-primary mb-1"
                            ">Submit</button>
                </div>
                <div class="col mini-box">
                    <button type="reset" class="btn btn-lg btn-block btn-primary mb-1">Clear</button>
                </div>
            </div>
        </springform:form>

        <c:if test="${pageContext['request'].userPrincipal != null}">
            <!--and is Keeper-->
            <security:authorize access="hasRole('ROLE_KEEPER') and isAuthenticated()">
                <!--TODO Address form-->
            </security:authorize>

            <!--and is owner-->
            <security:authorize access="hasRole('ROLE_OWNER') and isAuthenticated()">

                <input type="text" id="petName" placeholder="Pet Name" />
                <select name="type" id="petType">
                    <option value="dog">Dog</option>
                    <option value="cat">Cat</option>
                    <option value="rabbit">Rabbit</option>
                    <option value="bird">Bird</option>
                </select>
                <input type="text" id="petDescription" placeholder="Type here a few info about your pet"/>

                <!--TODO FIX THIS-->
                <script>
                    jQuery_ui(document).ready(function () {
                        let pet;
                        let petName = jQuery_ui("#petName");
                        let petType = jQuery_ui("#petType");
                        let petDescription = jQuery_ui("#petDescription");

                        let getPetUrl = "/myPet";
                        jQuery_ui.get(getPetUrl, function (data, status) {
                            alert("Data: " + data + "\nStatus: " + status);
                        });
        //                jQuery_ui.ajax({
        //                    url: getPetUrl
        //                }).then(function (data) {
        //                    importPetData(data);
        //                });

                        let registerPetUrl = "/registerPet";
                        jQuery_ui("#submit").click(function () {
                            jQuery_ui.post(registerPetUrl,
                                    {
                                        petName: petName.value,
                                        petType: petType.value,
                                        petDescription: petDescription.value
                                    },
                                    function (data, status) {
                                        importPetData(data);
                                        alert("Data: " + data + "\nStatus: " + status);
                                    }
                            );
                        });

                        function importPetData(data) {
                            pet = data;
                            petName.value = data.petName;
                            petType.value = data.petType;
                            petDescription.value = data.petDescription;
                        }
                    });
                </script>
            </security:authorize>
        </c:if>

    </body>
</html>
