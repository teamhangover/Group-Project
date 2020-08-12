

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>

<!--         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Jekyll v4.0.1">
        <title> petKeeper</title>
    
        <!-- Load an icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
        <!--    carousel-->
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

        <!-- BS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <!-- JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

 <!-- Load an icon library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
        <!-- Custom styles for this template -->
        <link href="/css/home.css" rel="stylesheet">
    </head>
    
    
 <body>
    
     
<!--     <header>
        <nav class="navbar navbar-expand-md fixed-top d-flex flex-row-reverse">

            <a class="navbar" href="/preInsertMyUser">Eγραφή</a>
            <a class="navbar" href="/loginPage">Σύνδεση</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse " id="navbarCollapse">
                <img src="/img/petKeeper.png" class="rounded-circle justify-content-center align-self-center" alt="">

                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link " href="#"> <i class="fa fa-fw fa-home"> </i> Home </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/getRoles"> Roles </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>-->
     
     <jsp:include page="noLogin-navbar.jsp"></jsp:include>

    <main role="main">
       

        <!-- CAROUSEL-->
        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-bottom: 0;">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>

            </ol>

            <div class="carousel-inner">
                <div class="carousel-item active">

                    <div class="view">
                        <img class="d-block w-100" src="/img/Canva - Dalmatian on Pet Bed.jpg" alt="First slide">
                        <div class="mask rgba-black-light"></div>
                    </div>

                    <div class="container">
                        <div id="bottom-rem-carousel" class="carousel-caption text-left text-dark">
                            <h1>Όλοι περνάνε τέλεια στις διακοπές!</h1>
                            <p>Βες τώρα ποιός θα φιλοξενήσει και θα φροντίζει το ζωάκι σου οσο θα λείπεις</p>
                            <p><a class="btn btn-lg btn-outline-dark" href="/preInsertMyUser" role="button">Εγγραφή</a></p>

                        </div>
                    </div>

                </div>
                <div class="carousel-item">
                    <div class="view">
                        <img class="d-block w-100" src="/img/Canva - Orange Kitten.jpg" alt="First slide">
                        <div class="mask rgba-black-light"></div>
                    </div>
                    <div class="container">
                        <div class="carousel-caption text-dark ">
                            <h1>Λατρεύεις τα ζώα;</h1>
                            <p>Γίνε keeper και ετοιμάσου για μια αξέχαστη εμπειρία</p>
                            <p><a class="btn btn-lg btn-outline-dark" href="#" role="button">Μάθε περισσότερα</a></p>
                        </div>
                    </div>
                </div>


                <div class="carousel-item">
                    <div class="view">
                        <img class="d-block w-100 " src="/img/Canva - Selective Focus Photography of Bunny on a Leash.jpg" alt="First slide">
                        <div class="mask rgba-black-light"></div>
                    </div>
                    <div class="container">
                        <div class="carousel-caption text-left">
                            <h1>Bρες τον keeper σου</h1>
                            <p>Δες ποιος είναι κοντά σου, τι εμπειρία έχει, τι υπηρεσίες προσφέρει και επίλεξε τον καλύτερο.
                            </p>
                            <p><button class=" btn btn-lg btn-outline-dark text-light" href="/loginPage" role="button">Συνδέσου</button></p>
                        </div>
                    </div>
                </div>
            </div>



            <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>




        <!-- cards-look-alike -->

        <div style="background-color: #f5f6f8;">

            <div class="container marketing">

                <br>
                <h2 class="d-flex justify-content-center text-muted">Πώς Δουλεύει</h2>
                <br>
                <!-- Three columns of text below the carousel -->
                <div class="row d-flex align align-self-center">
                    <img src="/img/howworks.jpg" class="mx-auto d-block" alt="how it works">


                    <div class="col-lg-4">

                        <h2>Bρες τον keeper σου</h2>
                        <p></p>
                        <p>Βρες τον ιδιώτη φιλόζωο που θα φιλοξενήσει το ζωάκι σου όπως εσύ επιθυμείς. Δες ποιος είναι κοντά σου, τι εμπειρία έχει, τι υπηρεσίες προσφέρει και επίλεξε τον καλύτερο. </p>
                        <!-- <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">

                        <h2>Κάνε κράτηση & πληρωμή online</h2>
                        <p>Απλά και εύκολα κάνε κράτηση για τις ημερομηνίες που θέλεις και πλήρωσε ηλεκτρονικά ώστε να απολαύσεις όλα τα προνόμια του Keeppet. Μπορείς πριν προχωρήσεις να συναντήσεις τον keeper, ζητώντας meet ’n’ greet μαζί του. </p>
                        <!-- <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
                    </div>
                    <!-- /.col-lg-4 -->
                    <div class="col-lg-4">

                        <h2>Το ζωάκι σου απολαμβάνει τη φιλοξενία</h2>
                        <p>Ο keeper θα φροντίσει ώστε να μην του λείψει η φροντίδα, η αγάπη και τα χάδια που έχει συνηθίσει. Είναι καθημερινά σε επικοινωνία μαζί σου και σου στέλνει φωτογραφίες. </p>
                        <!-- <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
                    </div>
                    <!-- /.col-lg-4 -->
                </div>
                <!-- /.row -->
            </div>
 
        </div>
        <!-- /.container -->

        


        <!-- Footer -->
        <footer class="page-footer font-small stylish-color-dark pt-4">

            <!-- Footer Links -->
            <div class="container text-center text-md-left">

                <!-- Grid row -->
                <div class="row">

                    <!-- Grid column -->
                    <div class="col-md-4 mx-auto">

                        <!-- Content -->
                        <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Footer Content</h5>
                        <p>Here you can use rows and columns to organize your footer content. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>

                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-2 mx-auto">

                        <!-- Links -->
                        <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!">Link 1</a>
                            </li>
                            <li>
                                <a href="#!">Link 2</a>
                            </li>
                            <li>
                                <a href="#!">Link 3</a>
                            </li>
                            <li>
                                <a href="#!">Link 4</a>
                            </li>
                        </ul>

                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-2 mx-auto">

                        <!-- Links -->
                        <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!">Link 1</a>
                            </li>
                            <li>
                                <a href="#!">Link 2</a>
                            </li>
                            <li>
                                <a href="#!">Link 3</a>
                            </li>
                            <li>
                                <a href="#!">Link 4</a>
                            </li>
                        </ul>

                    </div>
                    <!-- Grid column -->

                    <hr class="clearfix w-100 d-md-none">

                    <!-- Grid column -->
                    <div class="col-md-2 mx-auto">

                        <!-- Links -->
                        <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!">Link 1</a>
                            </li>
                            <li>
                                <a href="#!">Link 2</a>
                            </li>
                            <li>
                                <a href="#!">Link 3</a>
                            </li>
                            <li>
                                <a href="#!">Link 4</a>
                            </li>
                        </ul>

                    </div>
                    <!-- Grid column -->

                </div>
                <!-- Grid row -->

            </div>
            <!-- Footer Links -->

            <hr>

            <!-- Call to action -->
            <ul class="list-unstyled list-inline text-center py-2">
                <li class="list-inline-item">
                    <h5 class="mb-1">Register for free</h5>
                </li>
                <li class="list-inline-item">
                    <a href="#!" class="btn btn-danger btn-rounded">Sign up!</a>
                </li>
            </ul>
            <!-- Call to action -->

            <hr>

            <!-- Social buttons -->
            <div class=" icon-bar text-center margin-bottom">

                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                <a href="#" class="google"><i class="fa fa-google"></i></a>
                <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                <a href="#" class="youtube"><i class="fa fa-youtube"></i></a>

            </div>
            <!-- Social buttons -->
            <hr>
            <!-- Copyright -->

            <div class="footer-copyright text-center py-3 align-self-center" style="color: aliceblue;">© 2020 Copyright:
                <a href="http://127.0.0.1:5500/home.html"> PetKeeper.com</a>
                <p class="float-right"><a href="#">Back to top</a></p>
                <p> <a href="#" class="float-middle">Privacy</a> &middot; <a href="#">Terms</a></p>


            </div>

            <!-- Copyright -->

        </footer>
        <!-- Footer -->
        
 <jsp:include page="footer.jsp"></jsp:include>

    </main>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script>
        window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>');
    </script>
    <script src="../assets/dist/js/bootstrap.bundle.js"></script>



</body>
    
    
</html>
















