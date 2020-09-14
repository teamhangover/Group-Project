
       
            $(document).ready(function ($) {
                $("#opener").click(function () {
                    $(this).addClass("d-none");
                    $("#popup").animate({
                        right: "20px"
                    }, 1200);
                });
                $("button:first-child").click(function () {
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
        