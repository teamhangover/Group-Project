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
    let mapOptions = {
        center: new google.maps.LatLng(userLatitude, userLongitude),
        zoom: 13
    };

    map = new google.maps.Map(document.getElementById("map"), mapOptions);
    autocomplete = new google.maps.places.Autocomplete((document.getElementById('pac-input')), {types: ['geocode']});

    //addListener to autocomplete
    autocomplete.addListener("place_changed", renewMap);

    //addListener to map's dragend 
    map.addListener('dragend', function () {
        let newLocation = {
            latitude: map.getCenter().lat(),
            longitude: map.getCenter().lng(),
            fromDate: startDate.datepicker('getDate'),
            toDate: endDate.datepicker('getDate')
        };
        getResultsFromServer(newLocation);
    });
    //-----------------------------

    //get current location (if possible)
    geolocationApi();

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


    //---------------------
    function priceChangeHandler() {
        maxPrice = priceInput.val();
        priceText.text(maxPrice);
        let result = keepersList.filter(keeper => keeper.addressDto.price <= maxPrice);
        handleResponse(result);
    }

    // -------------------Marker functions ------------
    function createMarkers(keepersDto) {
        //delete current markers
        deleteMarkers();
        //create new markers
        $.each(keepersDto, (i, keeperDto) => {
            let marker = new google.maps.Marker({
                position: new google.maps.LatLng(keeperDto.addressDto.latitude, keeperDto.addressDto.longitude),
                map: map,
                title: keeperDto.myUserDetailsDto.firstName
            });
            markers.push(marker);
            createInfoWindow(marker, keeperDto);
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
    function createInfoWindow(marker, keeperDto) {
        let contentString = `
                <div id="infowindow-content" class=" p-3 m-2 rounded">
                            <div class="">
                                <img src="../images/` + keeperDto.myUserDetailsDto.uPhotoName + `" width="50px" height="50px" id="place-icon" class="d-block ml-auto mr-auto pt-1 rounded-circle"/>
                            </div>
                            <div class=" text-center text-light h6">
                                <span id="place-name" class="title"></span><br />
                                <p id="place-address">` + keeperDto.addressDto.streetName + ` ` + keeperDto.addressDto.streetNumber + `, ` + keeperDto.addressDto.city + `</p>
                                <p id="keeper-name">` + keeperDto.myUserDetailsDto.firstName + ` ` + keeperDto.myUserDetailsDto.lastName + `</p>
                                <p id="keeper-price">` + keeperDto.addressDto.price + ` &euro;/ημέρα</p>
                                <button type="button" id="` + keeperDto.myUserDetailsDto.username + `-infoWindow" class="btn btn-sm btn-outline-light operModalButtons mb-1" data-toggle="modal" data-target="#exampleModalScrollable" >Κάνε Κράτηση!</button>
                            </div>
                </div>`;

        let infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });

        $(document).on("click", "#" + keeperDto.myUserDetailsDto.username + "-infoWindow", getReservationDetails);
    }

    // -------------------Renewing Map ------------
    function renewMap() {
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

                    $(document.body).css({'cursor': 'progress'});
                    getResultsFromServer(formData);

                } else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(15);

                    formData.latitude = place.geometry.location.lat();
                    formData.longitude = place.geometry.location.lng();
                    $(document.body).css({'cursor': 'progress'});
                    getResultsFromServer(formData);
                }

            }
        }
    }

    // ----------------- Geolocation -------------

    //Geolocation success
    function success(position) {

        $(document.body).css({'cursor': 'progress'});
        let data = {
            latitude: position.coords.latitude,
            longitude: position.coords.longitude,
            fromDate: startDate.datepicker('getDate'),
            toDate: endDate.datepicker('getDate')
        };
        getResultsFromServer(data);
    }

    //Geolocation error
    function error() {
        alert('Unable to retrieve your location');
        getResultsFromServer(defaultData);
    }

    //Geolocation API
    function geolocationApi() {
        if (!navigator.geolocation) {
            alert("Your browser does not support geolocation!");
            getResultsFromServer(defaultData);
        } else {
            navigator.geolocation.getCurrentPosition(success, error);
        }
    }

    // ----------------- Ajax -------------
    function getResultsFromServer(requestData) {

        map.setCenter({lat: requestData.latitude, lng: requestData.longitude});
        $.get(
                "/owner/findKeepers",
                requestData
                ).done(function (response) {

            if (response.length === 0) {
                tableBody.empty();
                deleteMarkers();
                $("#noresults-div").addClass("no-results");
                $(document.body).css({'cursor': 'default'});
            } else {
                keepersList = response;
                findAndSetMaxPrice(response);
                handleResponse(response);
            }
        });
    }
    //handle response
    function handleResponse(response) {
        tableBody.empty();
        deleteMarkers();
        $("#noresults-div").removeClass("no-results");
        fillTableBodyWithData(response);
        createMarkers(response);
        $(document.body).css({'cursor': 'default'});
        map.setZoom(15);
    }

    // ----------------- Dom -------------

    function fillTableBodyWithData(keepersDto) {

        $.each(keepersDto, (i, keeperDto) => {

            let result = `
                                <tr>
                                    <td><img src="../images/` + keeperDto.myUserDetailsDto.uPhotoName + `" height="50px" width="50px" class="rounded" alt="Keeper-profpic"></td>
                                    <td>` + keeperDto.myUserDetailsDto.firstName + `</td>
                                    <td>` + keeperDto.myUserDetailsDto.lastName + `</td>
                                    <td>` + keeperDto.addressDto.price + ` &euro;</td>
                                    <td>
                                        <button type="button" 
                                        id="` + keeperDto.myUserDetailsDto.username + `" 
                                        class="btn btn-outline-info operModalButtons" 
                                        data-toggle="modal" data-target="#exampleModalScrollable" >
                                        Κάνε Κράτηση!</button>
                                    </td>
                                </tr>`;
            tableBody.append(result);

            $("#" + keeperDto.myUserDetailsDto.username).click(getReservationDetails);
        });
    }
    // ----------------- Reservation modal -------------
    function getReservationDetails(event) {
        let username = event.target.id;

        if (username.endsWith("-infoWindow")) {
            username = username.slice(0, -11);
        }

        //get keeper by username ajax
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
        let totalPrice = numOfDays * data.addressDto.price;
        let addressString = data.addressDto.streetName + " " + data.addressDto.streetNumber + ", " + data.addressDto.city + ", " + data.addressDto.country;

        let reservationData = {
            keeperUsername: username,
            keeperPhoto: data.myUserDetailsDto.uPhotoName,
            keeperFname: data.myUserDetailsDto.firstName,
            keeperLname: data.myUserDetailsDto.lastName,
            age: data.myUserDetailsDto.age,
            totalPrice: totalPrice,
            fromDate: fromDate,
            toDate: toDate,
            keeperDescription: data.myUserDetailsDto.uDescription,
            keeperAddress: addressString
        };

        //function is in reservation.js
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
            tmp = keepers[i].addressDto.price;
            if (tmp > highestPrice)
                highestPrice = tmp;
        }
        //set the maximum Price on range input
        priceInput.attr("max", highestPrice + 5);
        priceInput.val(highestPrice + 5);
        priceText.text(highestPrice + 5);
    }

});