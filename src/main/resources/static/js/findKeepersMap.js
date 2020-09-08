$(document).ready(function () {
    let startDate = $("#start");
    currentDate = new Date();
    currentDateFormattedString = currentDate.getDate() + "-" + currentDate.getMonth() + "-" + currentDate.getFullYear();
    startDate.val(currentDateFormattedString);
    let endDate = $("#end");
    let tomorrow = new Date(currentDate)
    tomorrow.setDate(tomorrow.getDate() + 1);
    tomorrowFormattedString = tomorrow.getDate() + "-" + tomorrow.getMonth() + "-" + tomorrow.getFullYear();
    endDate.val(tomorrowFormattedString);
    let priceInput = $("#fromPrice");
    priceInput.val(priceInput.attr("max"));
    $("#fPrice").text(priceInput.val());
    priceInput.change(function () {
        $("#fPrice").text(priceInput.val());
    });
});
function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
        center: {
            lat: 37.983748,
            lng: 23.727658
        },
        zoom: 13
    });

    const input = document.getElementById("pac-input");
    const autocomplete = new google.maps.places.Autocomplete(input); // Bind the map's bounds (viewport) property to the autocomplete object,
    // so that the autocomplete requests use the current map bounds for the
    // bounds option in the request.

    autocomplete.bindTo("bounds", map); // Set the data fields to return when the user selects a place.

    autocomplete.setFields(["address_components", "geometry", "icon", "name"]);
    const infowindow = new google.maps.InfoWindow();
    const infowindowContent = document.getElementById("infowindow-content");
    infowindow.setContent(infowindowContent);
    const marker = new google.maps.Marker({
        map,
        anchorPoint: new google.maps.Point(0, -29)
    });
    autocomplete.addListener("place_changed", () => {
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
    });

}