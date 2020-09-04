<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/reservation.css">
    <title>reservation</title>

    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <style>
            
        </style>
</head>

<body>
   
    <div class="container bg-light">
        <div class="item1"> <img src="/img/no-profile-pic-icon-12.png" alt="Profile Pic" class="img-circle " > 
        </div>
        <div class="item"> onoma </div>
        <div class="item"> epitheto</div>
        <div class="item ">ilikia</div>
        <div class="item">perigrrafi</div>
        <div class="item">timi</div>
        <div class="item">dates</div>
        <div class="item6 " id="paypal-button" ></div>
       
 <img src="/img/imageedit_4_3236078179.png" alt="cat"  >
  
    </div>
   

    
    
    
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
          shape: 'pill',
        },
    
        // Enable Pay Now checkout flow (optional)
        commit: true,
    
        // Set up a payment
        payment: function(data, actions) {
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
        onAuthorize: function(data, actions) {
          return actions.payment.execute().then(function() {
            // Show a confirmation message to the buyer
            window.alert('Thank you for your purchase!');
          });
        }
      }, '#paypal-button');
    
    </script>
   <!--PAY PAL  -->

    
</body>

</html>