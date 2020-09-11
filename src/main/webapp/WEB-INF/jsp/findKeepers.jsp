<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Βρες Keepers</title>
        <link rel="icon" href="/img/pawwhite.png" sizes="32x32">

        <!--bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
                crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <!--bootstrap-->


        <link rel="stylesheet" type="text/css" href="/css/findKeepersMap.css" />

        <!-- glyphicon -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

        <!-- datepicker resources -->
        <link rel="application/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>


    </head>

    <body class="bg-light">


        <!--Navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>
            <br>
            <br>
            <br>
            <p></p>

            <!-- <hr class="style-five"> -->

            <div class="d-md-flex  bd-highlight justify-content-center p-3 bg-dark card-1"
                 style="filter: drop-shadow(30px 10px 4px #313136); ">
                <input id="pac-input" class="form-control text-center  " type="text" placeholder="Επιλέξτε την περιοχή σας" />
                <i class="fa fa-map-marker mt-3 ml-2 " aria-hidden="true" style="color:cadetblue"></i>
            </div>

            <div class="d-md-flex p-2 bd-highlight justify-content-center p-5 dates card-1  "
                 style="background-color: cadetblue;">
                <div class="col-lg-6 col-11 px-1">
                    <div class="input-group input-daterange">
                        <input type="text" id="start" class=" form-control text-left mr-2" placeholder="Από.."> <span
                            class="fa fa-calendar" id="fa-1" style="color:cadetblue"></span>
                        <input type="text" id="end" class="   form-control text-left ml-2 " placeholder="Μέχρι.."> <span
                            class="fa fa-calendar" id="fa-2" style="color:cadetblue"></span>
                    </div>
                </div>
            </div>

            <div class="d-md-flex p-2 bd-highlight justify-content-center price bg-dark card-1">
                <input type="range" min="0" max="100" class="mr-2 bg-dark " id="fromPrice" value="90"> 

                <label id="fPrice" class="text-light my-2 ml-1 "></label> 
                <label for="fromPrice" class="mr-1  text-light mt-2"> /ημέρα </label>
                <i class="fas fa-euro-sign text-light mt-3" aria-hidden="true"> </i>
            </div>
            <hr class="style-five">

            <!-- main row -->
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-md">
                        <div id="map"></div>
                    </div>

                    <div class="col-md" id="noresults-div">
                        <table class="table table-container text-center text-light  ">
                            <thead >
                                <tr >
                                    <th scope="col" >#</th>
                                    <th scope="col" >Όνομα</th>
                                    <th scope="col" >Επίθετο</th>
                                    <th scope="col" >Ηλικία</th>
                                    <th scope="col" ></th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">

                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                            <jsp:include page="reservation.jsp"></jsp:include> 
                            </div>
                            <div class="modal-footer bg-light">
                                <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>


                <hr class="style-five">

                <div id="infowindow-content">
                    <img src="#" width="16" height="16" id="place-icon" />
                    <span id="place-name" class="title"></span><br />
                    <span id="place-address"></span>
                    <span id="keeper-Fname">keeper-Fname</span>
                    <span id="keeper-Lname">keeper-Lname</span>
                    <span id="keeper-Age">keeper-Age</span>
                </div>

                <!-- dog -->
                <div class="d-flex flex-row  text-light ">
                    <div class="thought ml-auto">Καλώς ήρθες στην έξυπνη αναζήτηση! Συμπλήρωσε τις ημερομηνίες που θες να φιλοξενηθεί το
                        κατοικιδιό σου καθώς και την
                        περιοχή που μένεις για να δεις όλους τους διαθέσιμους Keepers κοντά στο σπίτι σου για εκείνη την περίοδο!</div>
                    <div class="thought ">Μη ξεχάσεις να αυξομειώσεις τον δείκτη κόστους ανα ημέρα ανάλογα με τις ανάγκες σου για να
                        βρεις ακριβώς τον Keeper που ταιριάζει σε σένα αλλα και στο ζωάκι σου. Η μέγιστη επιτρεπόμενη χρέωση ανα ημέρα
                        ανέρχεται συμφωνα μα τους Όρους Χρήσης μας στα 100 &#8364; </div>
                    <div class="thought  mr-auto">Αριστερά στον χάρτη θα βρείς ολους του κοντινούς σε σενα Keepers, αλλα αν η τοποθεσία
                        φιλοξενίας δεν ειναι πρόβλημα για σενα, χρησιμοποίησε το +/- στο χαρτη αναλόγως! Δεξιά θα βρείς όλες τις σχετικές
                        καταχωρήσεις Keepers, μαζί με το κουμπί Μίσθωσης για τον καθένα! </div>
                </div>

                <div class="box-canvas mt-0 mb-0">
                    <div class="body"></div>
                    <div class="fence">
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                    </div>

                    <div class="paw left"></div>
                    <div class="paw right"></div>
                    <div class="head">
                        <div class="eye left"></div>
                        <div class="eye right"></div>
                        <div class="tongue"></div>
                        <div class="snoot"></div>
                    </div>
                    <div class="ear left"></div>
                    <div class="ear right"></div>
                </div>

                <!-- datepicker func -->
                <script>
                    $(document).ready(function () {

                        $('.input-daterange').datepicker({
                            format: 'dd-mm-yyyy',
                            autoclose: true,
                            calendarWeeks: true,
                            clearBtn: true,
                            disableTouchKeyboard: true
                        });
                    });
                </script>

                <script>
                    $(document).ready(function () {
                        let startDate = $("#start");
                        let currentDate = new Date();
                        let currentDateFormattedString = currentDate.getDate() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getFullYear();
                        startDate.val(currentDateFormattedString);

                        let endDate = $("#end");
                        let tomorrow = new Date(currentDate);
                        tomorrow.setDate(tomorrow.getDate() + 1);
                        tomorrowFormattedString = tomorrow.getDate() + "-" + (tomorrow.getMonth() + 1) + "-" + tomorrow.getFullYear();
                        endDate.val(tomorrowFormattedString);

                        let priceInput = $("#fromPrice");
                        priceInput.val(priceInput.attr("max"));

                        $("#fPrice").text(priceInput.val());
                        priceInput.change(function () {
                            $("#fPrice").text(priceInput.val());
                        });
                        // !!!!!!!!!!!!!!!!
                        functionToBeChanged();
                    });

                    function initMap() {
                        const defaultMapOptions = {
                            center: new google.maps.LatLng(37.983748, 23.727658),
                            zoom: 13
                        };
                        const map = new google.maps.Map(document.getElementById("map"), defaultMapOptions);

                        const input = document.getElementById("pac-input");
                        const autocomplete = new google.maps.places.Autocomplete(input);

                        //not sure if this is needed
                        autocomplete.bindTo("bounds", map);
                        autocomplete.setFields(["address_components", "geometry", "icon", "name"]);

                        //info window
                        const infowindow = new google.maps.InfoWindow();
                        const infowindowContent = document.getElementById("infowindow-content");
                        infowindow.setContent(infowindowContent);

                        //marker
                        let marker = new google.maps.Marker({
                            position: new google.maps.LatLng(0, 0),
                            map: map,
                            title: "Title on hover"
                        });

                        //addListener to autocomplete
                        autocomplete.addListener("place_changed", renewMap);

                        function renewMap() {
                            infowindow.close();
                            marker.setVisible(false);
                            const place = autocomplete.getPlace();

                            if (!place.geometry) {
                                // User entered the name of a Place that was not suggested and
                                // pressed the Enter key, or the Place Details request failed.
                                window.alert("No details available for input: '" + place.name + "'");
                                return;
                            } // If the place has a geometry, then present it on a map.

                            if (place.geometry.viewport) {
                                map.fitBounds(place.geometry.viewport);
                            } else {
                                map.setCenter(place.geometry.location);
                                map.setZoom(17); // Why 17? Because it looks good.
                            }

                            marker.setPosition(place.geometry.location);
                            marker.setVisible(true);
                            let address = "";

                            if (place.address_components) {
                                address = [
                                    (place.address_components[0] &&
                                            place.address_components[0].short_name) ||
                                            "",
                                    (place.address_components[1] &&
                                            place.address_components[1].short_name) ||
                                            "",
                                    (place.address_components[2] &&
                                            place.address_components[2].short_name) ||
                                            ""
                                ].join(" ");
                            }

                            infowindowContent.children["place-icon"].src = place.icon;
                            infowindowContent.children["place-name"].textContent = place.name;
                            infowindowContent.children["place-address"].textContent = address;
                            infowindow.open(map, marker);
                        }

                    }

                    function functionToBeChanged() {
                        let fromDate = new Date();
                        let toDate = new Date(fromDate);
                        toDate.setDate(toDate.getDate() + 1);

                        let url = "/owner/findKeepers";
                        let defaultData = {
                            latitude: 37.988860,
//                            988860
                            longitude: 23.734173,
//                            734173
                            fromDate: fromDate,
                            toDate: toDate
                        };
                        $.get(
                                url,
                                defaultData
                                ).done(function (response) {
                            console.log(response);
                            if (response.length === 0) {
                                $("#noresults-div").addClass("no-results");
                            } else {
                                fillTableBodyWithData(response);
                                $("#noresults-div").removeClass("no-results");
                            }
                        });
                    }

                    let tableBody = $("#tableBody");
                    function fillTableBodyWithData(keepers) {

                        $.each(keepers, (i, keeper) => {

                            //this if might need to be changed to === null
                            if (keeper.uPhotoName === "") {
                                
                                keeper.uPhotoName = "/img/no-profile-pic-icon-12.png";
                            }else {
                                keeper.uPhotoName = "../images/"  + keeper.uPhotoName;
                            }
                            let result = `
                                <tr>
                                    <td><img src="` + keeper.uPhotoName + `" height="50px" width="50px" class="rounded" alt="Keeper-profpic"></td>
                                    <td >` + keeper.firstName + `</td>
                                    <td >` + keeper.lastName + `</td>
                                    <td >` + keeper.age + `</td>
                                    <td ><button type="button" username="` + keeper.username + `" class="btn btn-outline-info operModalButtons" data-toggle="modal" data-target="#exampleModalScrollable" >Κάνε Κράτηση!</button></td>
                                </tr>`;
                            tableBody.append(result);
                        });
                    }
                </script>
                <!--<script src="/js/findKeepersMap.js"></script>-->
                <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
                <script
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCI5mZvsDf2yxpRbN_AdULITrSGI_o3Oow&callback=initMap&libraries=places"
                defer></script>
            </div>



        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
