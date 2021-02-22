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
        if (data) {
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
            longitude: longitude,
            latitude: latitude,
            country: country.val(),
            city: city.val(),
            streetName: streetName.val(),
            streetNumber: streetNumber.val(),
            postalCode: postalCode.val(),
            price: price.val()
        };
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
            alert("Παρακαλώ συμπληρώστε όλα τα πεδία!");
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
                $(document.body).css({'cursor': 'wait'});
                // Switching the variable to true
                ajaxSentFlag = true;
                // Submitting the form
                $("#detailsForm").submit();
            });
        }
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