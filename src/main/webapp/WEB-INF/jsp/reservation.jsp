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
        
        <div class="container2">
            <div class="item text-center"><p id="fname">onoma</p></div>
            <div class="item"><p id="lname">epitheto</p></div>
            <div class="item"><p id="age">ilikia</p></div>
            <div class="item"><p id="price">timi</p></div>
            <div class="item"><p id="from">apo</p></div>
            <div class="item"><p id="until">mexri</p></div>
            <div class="item1"><p id="descri">perigrafi</p></div>
            <div class="item"><p id="address"> dieuthinsi</p></div>
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
                keeperPhoto: "keeper-Photo",
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