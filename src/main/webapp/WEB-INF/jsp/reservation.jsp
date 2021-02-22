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
        <script src="/js/reservation.js"></script>
    </body>
</html>