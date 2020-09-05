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
        <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">

        <!--Map-->
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
            First Name: <springform:input type="text" path="firstName" pattern="[A-Za-z]{3,50}" title="must be between 3 and 50 characters" required="true"/>
            <br>
            Last Name: <springform:input type="text" path="lastName" pattern="[A-Za-z]{3,50}" title="must be between 3 and 50 characters" required="true"/>
            <br>
            Age: <springform:input type="number" path="age" min="18" max="99" title="You have to be at least 18 years old" required="true"/>
            <br>
            Phone Number: <springform:input type="tel" path="tel" pattern="69+[0-9]{8}" title="must start with 69 and have 10 numbers" required="true"/>
            <br>
            Description: <springform:input type="textarea" path="uDescription"/>
            <br>
            Upload Profile Photo: <input type="file" name="photo" accept="image/*"/>
            <br>
            <input type="submit" id="submitButton" />
            <!--Submit</button>-->
            <button type="reset">Clear</button>
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
                <!--TODO Address form-->
                <div id="addressForm">
                    <hr>
                    Price/day: <input id="price" placeholder="Price/day" type="number"/>&euro;
                    <br>
                    Address:
                    <input id="autocomplete" placeholder="Enter your address" type="text" />
                    <div id="AddressDiv">
                        <br>
                        Street address:<input class="field" id="street_number" disabled="true" />
                        <br>
                        City: <input class="field" id="locality" disabled="true" />
                        <br>
                        Route: <input class="field" id="route" disabled="true" />
                        <br>
                        Zip code: <input class="field" id="postal_code" disabled="true" />
                        <br>
                        Country: <input class="field" id="country" disabled="true" />
                        <br>
                        <hr>
                    </div>
                    <div id="map-canvas"></div>
                </div>
                <script
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCI5mZvsDf2yxpRbN_AdULITrSGI_o3Oow&libraries=places&v=weekly"
                defer></script>

                <script>
                // This example displays an address form, using the autocomplete feature
                // of the Google Places API to help users fill in the information.
                $(document).ready(function () {

                    var autocomplete;
                    var componentForm = {
                        street_number: 'short_name',
                        locality: 'long_name',
                        route: 'short_name',
                        country: 'long_name',
                        postal_code: 'short_name'
                    };
                    //input fields
                    let streetNumber = $("#street_number");
                    let city = $("#locality");
                    let streetName = $("#route");
                    let postalCode = $("#postal_code");
                    let country = $("#country");
                    let price = $("#price");
                    //other properties of entity Address
                    let longitude = "";
                    let latitude = "";
                    //Get current Address of Keeper
                    let getAddressUrl = "/keeper/myAddress";
                    $.ajax({
                        url: getAddressUrl
                    }).then(function (data) {
                        if (data !== "") {
                            price.val(data.price);
                            country.val(data.country);
                            city.val(data.city);
                            streetNumber.val(data.streetNumber);
                            streetName.val(data.streetName);
                            postalCode.val(data.postalCode);
                            longitude = data.longitude;
                            latitude = data.latitude;
                            $("#autocomplete").val(data.streetName + " " + data.streetNumber + ", " + data.city + ", " + data.country);
                            initialize(data);
                        } else {
                            initialize(null);
                        }
                    });
//                    Register Address
                    let ajaxSentFlag = false;
                    let registerAddressUrl = "/keeper/registerMyAddress";
                    $("#detailsForm").submit((e) => {

                        //Address data
                        let addressData = {
                            latitude: latitude,
                            longitude: longitude,
                            country: country.val(),
                            city: city.val(),
                            streetName: streetName.val(),
                            streetNumber: streetNumber.val(),
                            postalCode: postalCode.val(),
                            price: price.val()
                        }
                        //validate
                        if (addressData.country === "" ||
                                addressData.city === "" ||
                                addressData.streetName === "" ||
                                addressData.streetNumber === "" ||
                                addressData.postalCode === "" ||
                                addressData.price === "" ||
                                addressData.latitude === "" ||
                                addressData.longitude === "") {

                            e.preventDefault();
                            alert("Παρακαλω συμπληρώστε όλα τα πεδία!");
                        } else if (!ajaxSentFlag) {

                            // Prevent from submission
                            e.preventDefault();
                            // Initiate request and stop function execution at this point
                            // by return-ing
                            return $.post(
                                    registerAddressUrl,
                                    addressData
                                    ).done(function (data) {
                                //Request was successfull  
                                $(document.body).css({'height': '100vh'});
                                $(document.body).css({'cursor': 'wait'});
                                // 
                                $('#detailsForm').fadeOut(600);
                                $('#addressForm').fadeOut(600);
                                // Switching the variable to true
                                ajaxSentFlag = true;
                                // Submitting the form
                                $("form").submit();
                            });
                        }
                    });
                    //Initiliza map when focusing on autocomplete input
                    $("#autocomplete").focus(function () {

                        //Geolocation? getCurrentLocation? --> Will be added if we have time

                        //initializing Map

                        //Revealing hidden input fields
//                        $("#AddressDiv").removeAttr("hidden");
                    });
                    //Initializing map
                    function initialize(data) {

                        if (data !== null) {
                            var mapOptions = {
                                center: new google.maps.LatLng(data.latitude, data.longitude),
                                zoom: 17
                            };
                        } else {
                            //setting default location
                            var mapOptions = {
                                center: new google.maps.LatLng(37.983748, 23.727658),
                                zoom: 13
                            };
                        }
                        //declaring Map's element (div) and default position
                        var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
                        var marker = null;
                        if (data !== null) {
                            var myPos = new google.maps.LatLng(data.latitude, data.longitude);
                            //add a marker
                            marker = new google.maps.Marker({
                                position: myPos,
                                map: map,
                                title: "My address"
                            });
                        }

                        //defining autocomplete input 
                        autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')), {types: ['geocode']});
                        //adding event listener on autocomplete inpu (on place change)
                        google.maps.event.addListener(autocomplete, 'place_changed', function () {
                            // Get the place details from the autocomplete object.
                            var place = autocomplete.getPlace();
                            //empty the inputs
                            for (var component in componentForm) {
                                document.getElementById(component).value = "";
                                document.getElementById(component).disabled = false;
                            }
                            //declare new position
                            var newPos = new google.maps.LatLng(place.geometry.location.lat(), place.geometry.location.lng());
                            //set the lat and lng for the data that will be sent with ajax
                            latitude = place.geometry.location.lat();
                            longitude = place.geometry.location.lng();
                            //set map Options
                            map.setOptions({
                                center: newPos,
                                zoom: 15
                            });
                            //delete previous marker (if any)
                            if (marker !== null) {
                                marker.setMap(null);
                            }

                            //add a marker
                            marker = new google.maps.Marker({
                                position: newPos,
                                map: map,
                                title: "New marker"
                            });
                            // Get each component of the address from the place details
                            // and fill the corresponding field on the form.
                            for (var i = 0; i < place.address_components.length; i++) {
                                var addressType = place.address_components[i].types[0];
                                if (componentForm[addressType]) {
                                    var val = place.address_components[i][componentForm[addressType]];
                                    document.getElementById(addressType).value = val;
                                }
                            }
                        });
                    }
                });
                </script>
            </security:authorize>

            <!--and is owner-->
            <security:authorize access="hasRole('ROLE_OWNER') and isAuthenticated()">
                <div id="petForm">
                    Pet Name: <input type="text" id="petName" placeholder="Pet Name" />
                    Pet Type: <select name="type" id="petType">
                        <option value="dog">Dog</option>
                        <option value="cat">Cat</option>
                        <option value="rabbit">Rabbit</option>
                        <option value="bird">Bird</option>
                    </select>
                    Description  <input type="text" id="petDescription" placeholder="Type here a few info about your pet"/>
                </div>
                <script>
                    $(document).ready(function () {

                        let petName = $("#petName");
                        let petType = $("#petType");
                        let petDescription = $("#petDescription");
                        //Send request to get the Pet of the owner (if any)
                        let getPetUrl = "/owner/myPet";
                        $.ajax({
                            url: getPetUrl
                        }).then(function (data) {

                            if (data !== null) {
                                importPetData(data);
                            }
                        });
                        //Fill Pet input fields with data from ajax request
                        function importPetData(data) {

                            petName.val(data.petName);
                            petType.val(data.petType);
                            petDescription.val(data.petDescription);
                        }


                        // Send request to register the changes on the owner's Pet or create a new on if doesn't have one. Then submit form
                        let registerPetUrl = "/owner/registerPet";
                        let hasAjaxRequestSucceeded = false;
                        $("#detailsForm").submit((e) => {

                            if (!hasAjaxRequestSucceeded) {
                                // Prevent from submission
                                e.preventDefault();
                                // Initiate request and stop function execution at this point
                                // by return-ing
                                return $.post(
                                        registerPetUrl,
                                        {petName: petName.val(), petType: petType.val(), petDescription: petDescription.val()}
                                ).done(function (data) {
                                    //Request was successfull  
                                    $(document.body).css({'height': '100vh'});
                                    $(document.body).css({'cursor': 'wait'});
                                    // 
                                    $('#detailsForm').fadeOut(600);
                                    $('#petForm').fadeOut(600);
                                    // Switching the variable to true
                                    hasAjaxRequestSucceeded = true;
                                    // Submitting the form
                                    $("form").submit();
                                });
                            }
                        });
                    });
                </script>
            </security:authorize>
        </c:if>

    </body>
</html>
