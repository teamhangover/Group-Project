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

    //------ get My reservations ---------
    getMyReservations();

    function getMyReservations() {
        $.get("/myReservations").done((myReservations) => {
            if (myReservations.length > 0) {
                displayMyReservations(myReservations);
            }
        });
    }
    const reservationDiv = $("#myReservationDiv");
    function displayMyReservations(reservs) {
        $.each(reservs, (i, reservation) => {
            displayOneReservation(reservation);
        });
    }

    function displayOneReservation(rsvData) {

        let reservation = `
                
                <div class="bg-light text-dark item d-flex justify-content-around">
                        <span>
                                <img  src="../images/` + rsvData.profPhoto + `" 
                                      alt="ProfPic" height="30px" width="30px" class="rounded-circle ownerPhoto">
                        </span>
                        <span> <i class="fas fa-user"></i> ` + rsvData.firstName + ` </span> 
                        <span> ` + rsvData.lastName + ` </span> 
                        <span> <i class="fas fa-map-marker"></i> ` + rsvData.addressStr + ` </span> 
                        <span> <i class="fas fa-euro-sign"></i> ` + rsvData.totalPrice + `  </span> 
                        <span><i class="far fa-calendar-alt"></i>  ` + rsvData.dateFrom + `</span>
                        <span><i class="far fa-calendar-alt"></i>  ` + rsvData.dateTo + `</span> 
                </div>`;
        reservationDiv.append(reservation);
    }

    // ---------------------------

    // Send request to register the changes on the owner's Pet or create a new on if doesn't have one. Then submit form
    let registerPetUrl = "/owner/registerPet";
    let hasAjaxRequestSucceeded = false;
    $("#detailsForm").submit((e) => {

        if (!hasAjaxRequestSucceeded) {
            // Prevent from submission
            e.preventDefault();
            // Initiate request and stop function execution at this point
            // by return-ing
            let petDto = {petName: petName.val(), petType: petType.val(), petDescription: petDescription.val()};
            return $.ajax({
                type: "POST",
                url: registerPetUrl,
                contentType: "application/json",
                data: JSON.stringify(petDto),
                success: function (data) {
                    //Request was successfull  
                    $(document.body).css({'cursor': 'wait'});
                    // Switching the variable to true
                    hasAjaxRequestSucceeded = true;
                    // Submitting the form
                    $("#detailsForm").submit();
                }
            });

        }
    });
});