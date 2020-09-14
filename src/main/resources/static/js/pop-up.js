
       
            $(document).ready(function ($) {
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
            });
        