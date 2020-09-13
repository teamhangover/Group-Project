<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/reservation.css">
        <title>reservation</title>

        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    </head>

    <body>

        <div class="container1 ">
            <img id="keeperPhoto" src="/img/no-profile-pic-icon-12.png" alt="Profile Pic" height="180" class="rounded-circle">
        </div>

        <div class="container ">
            <div class="item text-center bg-dark text-light"><label for="fname"><u>Όνομα</u><p id="fname" class="pt-2"></p> </label></div>
            <div class="item text-center bg-dark text-light"><label for="lname"><u>Επίθετο</u><p id="lname" class="pt-2"></p> </label></div>
            <div class="item text-center bg-dark text-light"><label for="age"><u>Ηλικία</u><p id="age" class="pt-2"></p> </label></div>
            <div class="item text-center bg-dark text-light"><label for="price"><u>Συνολική τιμή (&euro;)</u><p id="price" class="pt-2"> </p> </label></div>
            <div class="item text-center bg-dark text-light"><label for="from"><u>Από</u><p id="from" class="pt-2"></p> </label></div>
            <div class="item text-center bg-dark text-light"><label for="until"><u>Μέχρι</u><p id="until" class="pt-2"></p> </label></div>
            <div class="item1 text-center bg-dark text-light "><label for="descri"><u>Περιγραφη Keeper</u><p id="descri" class="pt-2" ></p> </label></div>
            <div class="item text-center bg-dark text-light"><label for="address"><u>Διεύθυνση</u><p id="address" class="pt-2"> </p> </label></div>
        </div>

        <div class="pt-4" id="paypal-button"></div>

        <!--PayPal  -->
        <script src="https://www.paypalobjects.com/api/checkout.js"></script>

        <script>
            //---------reservation ----------------
            let kPhoto = $("#keeperPhoto");
            let fname = $("#fname");
            let lname = $("#lname");
            let age = $("#age");
            let price = $("#price");
            let from = $("#from");
            let until = $("#until");
            let descri = $("#descri");
            let address = $("#address");

            let reservationData;

            function displayReservationData(rsvData) {
                reservationData = rsvData;
                let srcString = "../images/" + rsvData.keeperPhoto;
                let fromDateFormattedString = rsvData.fromDate.getDate() + "-" + (rsvData.fromDate.getMonth() + 1) + "-" + rsvData.fromDate.getFullYear();
                let toDateFormattedString = rsvData.toDate.getDate() + "-" + (rsvData.toDate.getMonth() + 1) + "-" + rsvData.toDate.getFullYear();
                kPhoto.attr("src", srcString);
                fname.text(rsvData.keeperFname);
                lname.text(rsvData.keeperLname);
                age.text(rsvData.age);
                price.text(rsvData.totalPrice);
                from.text(fromDateFormattedString);
                until.text(toDateFormattedString);
                descri.text(rsvData.keeperDescription);
                address.text(rsvData.keeperAddress);
            }
            //---------PayPal ----------------
            paypal.Button.render({
                // Configure environment
                env: 'sandbox',
                client: {
                    sandbox: 'demo_sandbox_client_id',
                    production: 'demo_production_client_id'
                },
                // Customize button (optional)
                locale: 'en_GR',
                style: {
                    size: 'responsive',
                    color: 'gold',
                    shape: 'pill'
                },

                // Enable Pay Now checkout flow (optional)
                commit: true,

                // Set up a payment
                payment: function (data, actions) {
                    return actions.payment.create({
                        transactions: [{
                                amount: {
                                    total: reservationData.totalPrice,
                                    currency: 'EUR'
                                }
                            }]
                    });
                },
                // Execute the payment
                onAuthorize: function (data, actions) {
                    return actions.payment.execute().then(function () {
                        //TODO send request
                        $.post(
                                "/owner/makeReservation",
                                reservationData
                                ).done((data) => {
                            console.log(data);
                            // Show a confirmation message to the buyer
                            window.alert('Thank you for your purchase!');
                        });

                    });
                }
            }, '#paypal-button');

        </script>

    </body>
</html>