$(document).ready(function () {
    //pop up
    $("#opener").click(function () {
        $("#opener").addClass("d-none");
        $("#popup").animate({
            right: "20px"
        }, 1200);
    });

    $("#popup-close-btn").click(function () {
        $("#popup").animate(
                {
                    "right": "-400px"
                },
                1200, /* Animation in ms */
                function () {
                    $("#opener").removeClass("d-none");
                }
        );
    });

    $("#popup-email-btn").click(function () {
        $("#popup").animate(
                {
                    "right": "-400px"
                },
                1200, /* Animation in ms */
                function () {
                    $("#opener").removeClass("d-none");
                }
        );
    });

    $("#contact-form").submit((e) => {
        e.preventDefault();
        $(document.body).css({'cursor': 'wait'});
        let form_data = {
            subject: $("#subject").val() + " - " + $("#email-contact").val(), // we need to change the email service
            email: $("#email-contact").val(),
            text: $("#email-text").val()
        };


        $.ajax({
            url: "/sendEmail",
            type: "POST",
            data: form_data
        }).done(function (response) { //
            $("#modal-close-btn").trigger('click');
            $(document.body).css({'cursor': 'default'});
            alert("Το μήνυμα σας εστάλη!");
        });
    });

});
        