$(document).ready(function () {
    //datepicker 
    $('.input-daterange').datepicker({
        format: 'dd-mm-yyyy',
        autoclose: true,
        calendarWeeks: true,
        clearBtn: true,
        disableTouchKeyboard: true
    });
    //------------

    //output
    const tableBody = $("#tableBody");
    // keepers list
    let keepersList;
    //date inputs
    const startDate = $("#start");
    const endDate = $("#end");
    //set current dates (today,tomorrow)
    setDefaultDates();

    startDate.change(() => {
        autocompleteBtn.trigger("click");
    });
    endDate.change(() => {
        autocompleteBtn.trigger("click");
    });

    //--------------

    //set default LatLng
    let userLatitude = 37.988860;
    let userLongitude = 23.734173;
    //initialize map with default location
    let map;
    let markers = [];
    const input = $("#pac-input");

    //setting a "button" 
    let autocompleteBtn = $("#autocomplete-btn");
    autocompleteBtn.click(renewMap);
    autocompleteBtn.hover(() => {
        $(document.body).css({'cursor': 'pointer'});
    }, () => {
        $(document.body).css({'cursor': 'default'});
    });
    let autocomplete;
//                        initMap(map);
    let mapOptions = {
        center: new google.maps.LatLng(userLatitude, userLongitude),
        zoom: 13
    };

    map = new google.maps.Map(document.getElementById("map"), mapOptions);
    autocomplete = new google.maps.places.Autocomplete((document.getElementById('pac-input')), {types: ['geocode']});

    //addListener to autocomplete
    autocomplete.addListener("place_changed", renewMap);

    //addListener to map TODO change function
//                        map.addListener("dragend", handleDragend);
    //-----------------------------

    //get current location (if possible)
    //geolocationApi();

    //set price
    const priceInput = $("#fromPrice");
    const priceText = $("#fPrice");
    priceInput.val(priceInput.attr("max"));
    priceText.text(priceInput.val());
    //set event listener to price change
    priceInput.change(priceChangeHandler);
    priceInput.on('input', priceChangeHandler);

    let defaultData = {
        latitude: userLatitude,
        longitude: userLongitude,
        fromDate: new Date(),
        toDate: new Date()
    };

    getResultsFromServer(defaultData);

    //---------------------
    function priceChangeHandler() {
        maxPrice = priceInput.val();
        priceText.text(maxPrice);
        let result = keepersList.filter(keeper => keeper.price <= maxPrice);
        tableBody.empty();
        handleResponse(result);
    }

    // -------------------Marker functions ------------
    function createMarkers(keepers) {
        //delete current markers
        deleteMarkers();
        //create new markers
        $.each(keepers, (i, keeper) => {
            let marker = new google.maps.Marker({
                position: new google.maps.LatLng(keeper.latitude, keeper.longitude),
                map: map,
                title: keeper.firstName
            });
            markers.push(marker);
            createInfoWindow(marker, keeper);
        });
    }

    // Sets the map on all markers in the array.
    function setMapOnAll(map) {
        for (let i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
    }
    // Removes the markers from the map, but keeps them in the array.
    function clearMarkers() {
        setMapOnAll(null);
    }
    // Deletes all markers in the array by removing references to them.
    function deleteMarkers() {
        clearMarkers();
        markers = [];
    }

    // -------------------InfoWindow ------------
    function createInfoWindow(marker, keeper) {
        let contentString = `
                                    <div id="infowindow-content" class=" p-3 m-2 rounded">
                                        <div class="">
                                         <img src="../images/` + keeper.uPhotoName + `" width="50px" height="50px" id="place-icon" class="d-block ml-auto mr-auto pt-1 rounded-circle"/>
                                        </div>
                                        <div class=" text-center text-light h6">
                                            <span id="place-name" class="title"></span><br />
                                            <p id="place-address">` + keeper.streetName + ` ` + keeper.streetNumber + `, ` + keeper.city + `</p>
                                            <p id="keeper-name">` + keeper.firstName + ` ` + keeper.lastName + `</p>
                                            <p id="keeper-price">` + keeper.price + ` &euro;/ημέρα</p>
        <button type="button" id="` + keeper.username + `-infoWindow" class="btn btn-sm btn-outline-light operModalButtons mb-1" data-toggle="modal" data-target="#exampleModalScrollable" >Κάνε Κράτηση!</button>
                                        </div>
                                    </div>`;

        let infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });

        $(document).on("click", "#" + keeper.username + "-infoWindow", getReservationDetails);
    }

    // -------------------Renewing Map ------------
    function renewMap() {
        deleteMarkers();
        let place = autocomplete.getPlace();
        if (place) {
            if (!place.geometry) {
                // User entered the name of a Place that was not suggested and
                // pressed the Enter key, or the Place Details request failed.
                window.alert("No details available for input: '" + place.name + "'");
                return;
            } // If the place has a geometry, then present it on a map.
            if (validateDates(startDate.datepicker('getDate'), endDate.datepicker('getDate'))) {

                let formData = {
                    latitude: "",
                    longitude: "",
                    fromDate: startDate.datepicker('getDate'),
                    toDate: endDate.datepicker('getDate')
                };
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);

                    formData.latitude = place.geometry.location.lat();
                    formData.longitude = place.geometry.location.lng();

                    tableBody.empty();
                    $(document.body).css({'cursor': 'progress'});
                    getResultsFromServer(formData);

                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17); // Why 17? Because it looks good.

                    formData.latitude = place.geometry.location.lat();
                    formData.longitude = place.geometry.location.lng();
                    tableBody.empty();
                    $(document.body).css({'cursor': 'progress'});
                    getResultsFromServer(formData);
                }

            }
        }
    }

    // ----------------- Geolocation not currently in use-------------

    //Geolocation success
    function success(position) {
        userLatitude = position.coords.latitude;
        userLongitude = position.coords.longitude;
    }

    //Geolocation error
    function error() {
        alert('Unable to retrieve your location');
    }

    //Geolocation API
    function geolocationApi() {
        if (!navigator.geolocation) {
            alert("Your browser does not support geolocation!");
        } else {
            return navigator.geolocation.getCurrentPosition(success, error);
        }
    }

    // ----------------- Ajax -------------
    function getResultsFromServer(requestData) {

        $.get(
                "/owner/findKeepers",
                requestData
                ).done(function (response) {

            if (response.length === 0) {
                $("#noresults-div").addClass("no-results");
            } else {
                keepersList = response;
                findAndSetMaxPrice(response);
                handleResponse(response);
            }
        });
    }
    //handle response
    function handleResponse(response) {
        $("#noresults-div").removeClass("no-results");
        fillTableBodyWithData(response);
        createMarkers(response);
        $(document.body).css({'cursor': 'default'});
        map.setZoom(16);
    }

    // ----------------- Dom -------------

    function fillTableBodyWithData(keepers) {

        $.each(keepers, (i, keeper) => {

            let result = `
                                <tr>
                                    <td><img src="../images/` + keeper.uPhotoName + `" height="50px" width="50px" class="rounded" alt="Keeper-profpic"></td>
                                    <td>` + keeper.firstName + `</td>
                                    <td>` + keeper.lastName + `</td>
                                    <td>` + keeper.price + ` &euro;</td>
                                    <td><button type="button" id="` + keeper.username + `" class="btn btn-outline-info operModalButtons" data-toggle="modal" data-target="#exampleModalScrollable" >Κάνε Κράτηση!</button></td>
                                </tr>`;
            tableBody.append(result);

            $("#" + keeper.username).click(getReservationDetails);
        });
    }
    // ----------------- Reservation modal -------------
    function getReservationDetails(event) {
        let username = event.target.id;

        if (username.endsWith("-infoWindow")) {
            username = username.slice(0, -11);
        }

        //get keeper by username (ajax).done(the rest .... 
        $.get("/owner/getReservationDetails/" + username).done((data) => {
            handleRsrvSuccess(data, username);
        });
    }

    function handleRsrvSuccess(data, username) {
        let fromDate = startDate.datepicker('getDate');
        fromDate.setHours(0, 0, 0, 0);


        let toDate = endDate.datepicker('getDate');
        toDate.setHours(0, 0, 0, 0);

        let numOfDays = (toDate.getTime() - fromDate.getTime()) / (1000 * 3600 * 24);
        let totalPrice = numOfDays * data.price;
        let addressString = data.streetName + " " + data.streetNumber + ", " + data.city + ", " + data.country;

        let reservationData = {
            keeperUsername: username,
            keeperPhoto: data.uPhotoName,
            keeperFname: data.firstName,
            keeperLname: data.lastName,
            age: data.age,
            totalPrice: totalPrice,
            fromDate: fromDate,
            toDate: toDate,
            keeperDescription: data.uDescription,
            keeperAddress: addressString
        };
        displayReservationData(reservationData);
    }



    // ----------------- Helper functions -------------

    //set default Dates(today, tomorrow) on inpuτ fields
    function setDefaultDates() {
        let currentDate = new Date();
        startDate.datepicker('setDate', new Date());

        let tomorrow = new Date(currentDate);
        tomorrow.setDate(tomorrow.getDate() + 1);
        endDate.datepicker('setDate', tomorrow);
    }

    // Check Dates 
    function validateDates(fromDate, toDate) {
        let today = new Date();
        today.setHours(0, 0, 0, 0);
        if (toDate > fromDate && toDate > today && fromDate >= today) {
            return true;
        } else {
            alert("Please select valid dates");
            setDefaultDates();
            return false;
        }
    }

    // Find the most expensive keeper and set the input-Price at max+5
    function findAndSetMaxPrice(keepers) {

        let highestPrice = Number.NEGATIVE_INFINITY;
        let tmp;
        for (var i = keepers.length - 1; i >= 0; i--) {
            tmp = keepers[i].price;
            if (tmp > highestPrice)
                highestPrice = tmp;
        }
        //set the maximum Price on range input
        priceInput.attr("max", highestPrice + 5);
        priceInput.val(highestPrice + 5);
        priceText.text(highestPrice + 5);
    }

});