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
            $(document.body).css({'cursor': 'progress'});
            $.post(
                    "/owner/makeReservation",
                    reservationData
                    ).done((data) => {
                console.log(data);
                // Show a confirmation message to the buyer
                $(document.body).css({'cursor': 'default'});
                alert('Thank you for your purchase!');
                window.location.replace("/preInsertMyUserDetails#myReservationDiv");
//                            
            });

        });
    }
}, '#paypal-button');