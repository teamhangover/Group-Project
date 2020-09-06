<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="icon" href="/img/paw.png" sizes="32x32">

        <!--bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <!--bootstrap-->

        <!--Map-->
        <link type="text/css" rel="stylesheet" href="/css/map.css">
        <!--        customs css-->
        <link type="text/css" rel="stylesheet" href="/css/fillMyUserDetails.css">
        <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
    </head>

    <body>
        <jsp:include page="navbar.jsp"></jsp:include>

            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <hr>
            <img id="profilePicImg" height="250px" class="rounded-circle" alt="profile photo"/> 
            <br>
            <br>
        <springform:form id="detailsForm" action="/doInsertMyUserDetails" method="post" modelAttribute="myUserDetails" enctype="multipart/form-data">

            <springform:input path="detailsId" hidden="true" />
            First Name: <springform:input type="text" path="firstName" pattern="[A-Za-z]{3,50}" title="must be between 3 and 50 characters" required="true" placeholder="Όνομα"/>
            <br>
            Last Name: <springform:input type="text" path="lastName" pattern="[A-Za-z]{3,50}" title="must be between 3 and 50 characters" required="true"  placeholder="Επίθετο"/>
            <br>
            Age: <springform:input type="number" path="age" min="18" max="99" title="You have to be at least 18 years old" required="true" placeholder="Ηλικία"/>
            <br>
            Phone Number: <springform:input type="tel" path="tel" pattern="69+[0-9]{8}" title="must start with 69 and have 10 numbers" required="true" placeholder="Τηλέφωνο"/>
            <br>
            Description: <springform:input cssClass="form__input form-control" type="textarea" path="uDescription"  placeholder="Περιγραφή"/>       
            <br>
            Upload Profile Photo: <input type="file" name="photo" accept="image/*" class="form__input  form-control "  />
            <br>
            <div class="d-flex   ">
                <button type="submit" id="submitButton" class="btn btn-outline-dark m-5" >Submit</button>
                <button type="reset" class="btn btn-lg btn-outline-dark m-5">Clear</button>
            </div>
            <br>
        </springform:form>
        <c:if test="${pageContext['request'].userPrincipal != null}">
            <script>
                //get username of loggedInUser
                let username = "${pageContext['request'].userPrincipal.name}";
                //get ProfilePicName of loggedInUser
                let getUserPhotoUrl = "/getProfilePhoto/" + username;
                $.ajax({
                    url: getUserPhotoUrl
                }).then(function (data) {
                    if (data !== null) {
                        //set src to show the profile pic
                        let src = "../images/" + data;
                        $("#profilePicImg").attr("src", src);
                    }
                });
            </script>
            <!--and is Keeper-->
            <security:authorize access="hasRole('ROLE_KEEPER') and isAuthenticated()">
                <!-- Address form-->
                <div id="addressForm">
                    <hr>
                    Price/day: <input id="price" placeholder="Price/day" type="number"/>&euro;
                    <br>
                    Address:
                    <input id="autocomplete" placeholder="Enter your address" type="text" />
                    <div id="AddressDiv">
                        <br>
                        Διεύθυνση <input class="field" id="street_number" disabled="true" placeholder="Διεύθυνση" />
                        <br>
                        Πόλη  <input class="field" id="locality" disabled="true" placeholder="Πόλη" />
                        <br>
                        Route: <input class="field" id="route" disabled="true" />
                        <br>
                        Τ.Κ. <input class="field" id="postal_code" disabled="true" placeholder="Τ.Κ." />
                        <br>
                        Χώρα <input class="field" id="country" disabled="true" placeholder="Χώρα" />
                        <br>
                        <hr>
                    </div>
                    <div id="map-canvas"></div>
                </div>
                <script
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCI5mZvsDf2yxpRbN_AdULITrSGI_o3Oow&libraries=places&v=weekly"
                defer></script>

                <script src="/js/fillMyuserDetails-Keeper.js"></script>

            </security:authorize>

            <!--and is owner-->
            <security:authorize access="hasRole('ROLE_OWNER') and isAuthenticated()">
                <div id="petForm">
                    :Όνομα ζώου <input type="text" id="petName" placeholder="Όνομα κατοικιδίου" />
                    Eίδος ζώου <select name="type" id="petType">
                        <option value="dog">Dog</option>
                        <option value="cat">Cat</option>
                        <option value="rabbit">Rabbit</option>
                        <option value="bird">Bird</option>
                    </select>
                    Description  <input type="text" id="petDescription" placeholder="Λίγα λόγια για το ζωάκι σου!"/>
                </div>

                <script src="/js/fillMyuserDetails-Owner.js"></script>

           </security:authorize>
        </c:if>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
