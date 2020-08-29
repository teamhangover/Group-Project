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
        <script
            src="https://maps.googleapis.com/maps/api/js?key=&libraries=places&v=weekly"
        defer></script>
        <!--Map-->
    </head>
    <body>
        <jsp:include page="noLogin-navbar.jsp"></jsp:include>

            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <hr>
        <springform:form id="form" action="/doInsertMyUserDetails" method="post" modelAttribute="myUserDetails" enctype="multipart/form-data">

            <springform:input path="detailsId" hidden="true" />
            First Name: <springform:input type="text" path="firstName" />
            <br>
            Last Name: <springform:input type="text" path="lastName"/>
            <br>
            Age: <springform:input type="number" path="age"/>
            <br>
            Phone Number: <springform:input type="phone" path="tel"/>
            <br>
            Description: <springform:input type="textarea" path="uDescription"/>
            <br>
            Upload Profile Photo: <input type="file" name="photo" accept="image/*"/>
            <br>
            <button type="submit" id="submit" >Submit</button>
            <button type="reset">Clear</button>
            <br>
        </springform:form>

        <c:if test="${pageContext['request'].userPrincipal != null}">
            <!--and is Keeper-->
            <security:authorize access="hasRole('ROLE_KEEPER') and isAuthenticated()">
                <!--TODO Address form-->
                <hr>
                Address:
                <input id="autocomplete" placeholder="Enter your address" type="text" />
                <div id="AddressDiv" hidden="true">
                    <br>
                    Street address:<input class="field" id="street_number" disabled="true" />
                    <br>
                    City: <input class="field" id="locality" disabled="true" />
                    <br>
                    State: <input class="field" id="administrative_area_level_1" disabled="true" />
                    <br>
                    Zip code: <input class="field" id="postal_code" disabled="true" />
                    <br>
                    Country: <input class="field" id="country" disabled="true" />
                    <br>
                    <hr>
                </div>

                <div id="map-canvas"></div>

                <script>
                // This example displays an address form, using the autocomplete feature
                // of the Google Places API to help users fill in the information.
                $(document).ready(function () {

                    var autocomplete;
                    var componentForm = {
                        street_number: 'short_name',
                        locality: 'long_name',
                        administrative_area_level_1: 'short_name',
                        country: 'long_name',
                        postal_code: 'short_name'
                    };

                    //input fields
                    let streetNumber = $("#street_number");
                    let locality = $("#locality");
                    let administrativeAreaLevel = $("#administrative_area_level_1");
                    let postalCode = $("#postal_code");
                    let country = $("#country");
                    //other properties of entity Address
                    let longitude;
                    let latidute;

                    //Get current Address of Keeper
                    let getAddressUrl = "/keeper/myAddress";
                    $.ajax({
                        url: getAddressUrl
                    }).then(function (data) {
                        if (data !== null) {
                             //TODO Fill in input fields with data
                        }
                    });

                    //Register Address
                    let registerAddressUrl = "";
                    $("#submit").click(function (e) {
                        e.preventDefault();
                        $.get(
                                registerAddressUrl,
                        //TODO set the data
//                                {petName: petName.val(), petType: petType.val(), petDescription: petDescription.val()}
                                ).done(function (data) {
                            $("#form").submit();
                        });

                    });

                    //
                    $("#autocomplete").focus(function () {
                        //Geolocation? getCurrentLocation?

                        //initializing Map
                        initialize();
                        //Revealing hidden input fields
                        $("#AddressDiv").removeAttr("hidden");
                    });

                    function initialize() {
                        var mapOptions = {
                            center: new google.maps.LatLng(-33.8688, 151.2195),
                            zoom: 13
                        };


                        var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
                        autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')), {types: ['geocode']});
                        google.maps.event.addListener(autocomplete, 'place_changed', function () {
                            // Get the place details from the autocomplete object.
                            var place = autocomplete.getPlace();

                            for (var component in componentForm) {
                                document.getElementById(component).value = "";
                                document.getElementById(component).disabled = false;
                            }
                            var newPos = new google.maps.LatLng(place.geometry.location.lat(), place.geometry.location.lng());

                            map.setOptions({
                                center: newPos,
                                zoom: 15
                            });

                            //add a marker
                            var marker = new google.maps.Marker({
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

                Pet Name: <input type="text" id="petName" placeholder="Pet Name" />
                Pet Type: <select name="type" id="petType">
                    <option value="dog">Dog</option>
                    <option value="cat">Cat</option>
                    <option value="rabbit">Rabbit</option>
                    <option value="bird">Bird</option>
                </select>
                Description  <input type="text" id="petDescription" placeholder="Type here a few info about your pet"/>
                <script>
                    $(document).ready(function () {

                        let petName = $("#petName");
                        let petType = $("#petType");
                        let petDescription = $("#petDescription");

                        //Send request to get the Pet of the owner
                        let getPetUrl = "/owner/myPet";
                        $.ajax({
                            url: getPetUrl
                        }).then(function (data) {

                            if (data !== null) {
                                importPetData(data);
                            }
                        });

                        // Send request to register the changed on the owner's Pet
                        let registerPetUrl = "/owner/registerPet";
                        $("#submit").click(function (e) {
                            e.preventDefault();
                            $.post(
                                    registerPetUrl,
                                    {petName: petName.val(), petType: petType.val(), petDescription: petDescription.val()}
                            ).done(function (data) {
                                importPetData(data);
                                $("#form").submit();
                            });

                        });
                        //Take the Pet and put it in the input fields
                        function importPetData(data) {

                            petName.val(data.petName);
                            petType.val(data.petType);
                            petDescription.val(data.petDescription);
                        }
                    });
                </script>
            </security:authorize>
        </c:if>

    </body>
</html>
