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
            console.log(myReservations);
            if (myReservations.length > 0) {
                displayMyReservations(myReservations);
            }
        });
    }

    function displayMyReservations(reservations) {

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
            return $.post(
                    registerPetUrl,
                    {petName: petName.val(), petType: petType.val(), petDescription: petDescription.val()}
            ).done(function (data) {
                //Request was successfull  
                $(document.body).css({'cursor': 'wait'});
                // Switching the variable to true
                hasAjaxRequestSucceeded = true;
                // Submitting the form
                $("#detailsForm").submit();
            });
        }
    });
});