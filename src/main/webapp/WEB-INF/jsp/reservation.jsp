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

        <!--PAY PAL  -->

        <script src="https://www.paypalobjects.com/api/checkout.js"></script>
        <script>
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
                                    total: '30.00',
                                    currency: 'EUR'
                                }
                            }]
                    });
                },
                // Execute the payment
                onAuthorize: function (data, actions) {
                    return actions.payment.execute().then(function () {
                        // Show a confirmation message to the buyer
                        window.alert('Thank you for your purchase!');
                    });
                }
            }, '#paypal-button');

        </script>
        <!--PAY PAL  -->


        <!--reserve Keepers-->
        <script>
            let reservationData = {
                keeperPhoto: "keeper-Photo.jpg",
                keeperFname: "Makis",
                keeperLname: "Marinopoulos",
                age: "33",
                totalPrice: "30",
                fromDate: "25-9-2020",
                toDate: "28-9-2020",
                keeperDescription: "Αγαπαω πολυ τα ζωα και προσφερω ενα ανετο και καθαρο περιβαλλον η οτι  θελεις να γραφει εδω",
                keeperAddress: "Tositsa 18, Athens, Greece"
            };

            let kPhoto = $("#keeperPhoto");
            let fname = $("#fname");
            let lname = $("#lname");
            let age = $("#age");
            let price = $("#price");
            let from = $("#from");
            let until = $("#until");
            let descri = $("#descri");
            let address = $("#address");

            function displayReservationData(rsvData) {
                let srcString = "../images/" + rsvData.keeperPhoto;
                kPhoto.attr("src", srcString);
                fname.text(rsvData.keeperFname);
                lname.text(rsvData.keeperLname);
                age.text(rsvData.age);
                price.text(rsvData.totalPrice);
                from.text(rsvData.fromDate);
                until.text(rsvData.toDate);
                descri.text(rsvData.keeperDescription);
                address.text(rsvData.keeperAddress);
            }

            displayReservationData(reservationData);
        </script>

    </body>
</html>