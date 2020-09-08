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
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

        <!--bootstrap-->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

        <!--        font awesome-->
        <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
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
        <springform:form id="detailsForm" action="/doInsertMyUserDetails" method="post" modelAttribute="myUserDetails" enctype="multipart/form-data" >

            <springform:input path="detailsId" hidden="true" />
            <div class="col-xl-8 order-xl-1">
                <div class="card bg-info shadow">
                    <div class="card-header bg-info border-0">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <h3 class="mb-0 text-center m-2"><i class="fas fa-paw fa-2x"></i> My PetKeeper profile!</h3>
                            </div>
                            <div class="col-4 text-right">

                            </div>
                        </div>
                    </div>
                    <div class="card-body">


                        <div class="pl-lg-4">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group focused">
                                        <label class="form-control-label" for="input-first-name"><i class="fas fa-user"></i> First name</label>
                                        <springform:input id="input-first-name" cssClass="form-control form-control-alternative" type="text" path="firstName" pattern="[A-Za-z]{3,50}" title="must be between 3 and 50 characters" required="true" placeholder="Όνομα"/>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-last-name"><i class="fas fa-user"></i> Last name</label>
                                        <springform:input id="input-last-name" cssClass="form-control form-control-alternative" type="text" path="lastName" pattern="[A-Za-z]{3,50}" title="must be between 3 and 50 characters" required="true"  placeholder="Επίθετο"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group focused">
                                        <label class="form-control-label" for="input-age"><i class="far fa-calendar-alt"></i> Age</label>
                                        <springform:input id="input-age" cssClass="form-control form-control-alternative" type="number" path="age" min="18" max="99" required="true" placeholder="Ηλικία"/>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group focused">
                                        <label class="form-control-label" for="input-age"> <i class="fas fa-mobile-alt"></i> Phone number</label>
                                        <springform:input id="input-phone" cssClass="form-control form-control-alternative" type="tel" path="tel" pattern="69+[0-9]{8}" title="must start with 69 and have 10 numbers" required="true" placeholder="Τηλέφωνο"/>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <hr class="my-4">

                    <div class="pl-lg-4">
                        <div class="form-group focused">
                            <label><i class="fas fa-pencil-alt"></i> About Me</label>
                            <textarea rows="4" class="form-control form-control-alternative" placeholder="A few words about you ...">Tell us more about you! </textarea>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="Upload photo"><i class="fas fa-camera-retro"></i> Upload photo</label>

                                <input type="file" name="photo" accept="image/*" class="form__input  form-control " />
                            </div>
                            <div class="col-lg-8 container-fluid text-center well">

                                <button type="submit" id="submitButton" class="btn btn-success btn-lg mr-4 " ><i class="far fa-thumbs-up"></i>Submit</button>
                                <button type="button"  class="btn btn-primary btn-lg mr-4" ><i class="far fa-edit"></i>Edit</button>
                                <button type="reset" class="btn btn-warning btn-lg mr-4 "><i class="fas fa-ban"></i> Clear</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
                <!--TODO Address form-->        
                <div class="col-xl-4 order-xl-1 float-right">
                    <div class="card bg-info shadow">
                        <div class="card-header bg-info border-0">
                            <div class="row align-items-center">
                                <div class="col-8">

                                </div>
                                <div class="col-4 text-right">
                                </div>
                            </div>
                        </div>
                        <div class="card-body">


                            <div class="pl-lg-4">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group focused">
                                            <label class="form-control-label" for="input-price"><i class="fas fa-euro-sign"></i> Price/day</label>
                                            <input id="price" class="form-control form-control-alternative" placeholder="Price/day" type="number" />
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label class="form-control-label" for="input-email"><i class="fas fa-map-marker-alt"></i> Address</label>
                                            <input id="autocomplete" class="form-control form-control-alternative" placeholder="Enter your address" type="text" />
                                        </div>
                                    </div>
                                </div>
                                <div id ="addressDiv">
                                    <br>
                                    Διεύθυνση <input class="field" id="street_number" disabled="true" placeholder="Διεύθυνση" />
                                    <br>
                                    Πόλη  <input class="field" id="locality" disabled="true" placeholder="Πόλη" />
                                    <br>
                                    Πολιτεια <input class="field" id="administrative_area_level_1" disabled="true" placeholder="Πολιτεια" />
                                    <br>
                                    Τ.Κ. <input class="field" id="postal_code" disabled="true" placeholder="Τ.Κ." />
                                    <br>
                                    Χώρα <input class="field" id="country" disabled="true" placeholder="Χώρα" />
                                    <br>
                                    <hr>
                                </div>  
                            </div>
                        </div>

                    </div>
                </div>


                <div id="map-canvas"></div>
                <script
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCI5mZvsDf2yxpRbN_AdULITrSGI_o3Oow&libraries=places&v=weekly"
                    defer>

                </script>

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
