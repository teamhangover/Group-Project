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
        <title> PetKeeper</title>
        <link rel="icon" href="/img/paw.png" sizes="32x32">

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

        <!--        navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>

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
                                    <p><a class="btn btn-lg btn-outline-dark" href="${pageContext.request.contextPath}/preInsertMyUser" role="button">Εγγραφή</a></p>
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
                                <p><button class="btn btn-lg btn-outline-dark" href="#" role="button" data-toggle="modal" data-target="#exampleModalScrollable">Μάθε περισσότερα</button></p>
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
                                <p><a class=" btn btn-lg btn-outline-dark text-light" href="${pageContext.request.contextPath}/loginPage" role="button">Συνδέσου</a></p>
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

            <!-- Modal -->
            <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header item-head ">
                            <h5 class="modal-title" id="exampleModalScrollableTitle">Τι είναι το PetKeeper;</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body bg-dark text-light text-center">

                            <div class="row item" > 
                                <img src="/img/keeppet_text_vacation.png" class="img-circle">
                                <div class="col " >
                                    <h2>Φεύγεις διακοπές; Τέλεια!</h2>
                                    <p style="text-align: justify;">Δε χρειάζεται πια να ανησυχείς που θα αφήσεις το αγαπημένο σου κατοικίδιο και ποιός θα το φροντίζει. Βρες στη βάση μας τον ιδανικό keeper που θα το φιλοξενήσει στο σπίτι του και θα το προσέχει όπως εσύ! Έτσι το ζωάκι σου δε θα μπει σε κλουβί όσο λείπεις και δεν θα κάνεις διακοπές μόνο εσύ.</p>
                                </div>
                            </div>

                            <div class="row item" > 
                                <img src="/img/keeppet_text_search.png" class="img-circle">
                                <div class="col " >
                                    <h2>Κάνε αναζήτηση τώρα</h2>
                                    <p style="text-align: justify;">Βρες έναν keeper κοντά σου, κάνε κράτηση φιλοξενίας και πλήρωσε online. Μπορείς να κάνεις αναζήτηση με πολλά κριτήρια όπως το πόσο κοντά σου μένει, αν έχει διαμέρισμα ή σπίτι με κήπο, αν έχει κατοικίδια, κ.α.</p>
                                </div>
                            </div>

                            <div class="row item" > 
                                <img src="/img/keeppet_text_news.png" class="img-circle">
                                <div class="col " >
                                    <h2>Κάθε μέρα θα μαθαίνεις νέα</h2>
                                    <p style="text-align: justify;">Ο keeper θα επικοινωνεί μαζί σου κάθε μέρα, θα σου στέλνει φωτογραφίες από το ζωάκι σου, θα μπορείς ακόμη και να δεις το ζωάκι σου μέσω skype. Θα τηρεί το πρόγραμμα που έχετε συζητήσει μαζί για τη βόλτα και το φαγητό ενώ αν συμβεί οτιδήποτε έχει στη διάθεσή του 24ωρη κτηνιατρική υποστήριξη από το petKeeper.</p>
                                </div>
                            </div>
                            <div class="row item" > 
                                <img src="/img/keeppet_text_users.png" class="img-circle">
                                <div class="col " >
                                    <h2>Ποιοι είναι οι keepers;</h2>
                                    <p style="text-align: justify;">Είναι ιδιώτες φιλόζωοι που θέλουν να προσφέρουν αγάπη και φροντίδα στο κατοικίδιό σου τις μέρες που δε θα είστε μαζί. Το Keeppet σε φέρνει σε επαφή μαζί τους έχοντας διασταυρώσει τα στοιχεία ταυτότητας και διεύθυνσής τους και σου προσφέρει μια σειρά από προνόμια: δωρεάν κτηνιατρική κάλυψη όλο το 24ωρο, εκπτώσεις και προσφορές σε συνεργάτες μας, υποστήριξη από μας σε ό, τι χρειαστείς. </p>
                                </div>
                            </div>
                            <div class="row item" > 
                                <img src="/img/keeppet_text_piggy.png" class="img-circle">
                                <div class="col " >
                                    <h2>Keep for a good cause</h2>
                                    <p style="text-align: justify;">Πολλοί keepers μας δίνουν ένα μέρος της αμοιβής τους στην Dogs' Voice,
                                        την Αστική μη Κερδοσκοπική εταιρεία που στηρίζει φιλοζωικές οργανώσεις σε όλη την Ελλάδα,
                                        και μπορείς στο προφίλ τους να δεις το σχετικό σήμα. Την Dogs' Voice μπορείς να ενισχύσεις απευθείας
                                        κι εσύ βάζοντας ένα tip όταν κάνεις την ηλεκτρονική πληρωμή του keeper σου.
                                        Αναζήτησε τώρα τον ιδανικό keeper σου!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->



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
                            <p>Βρες τον ιδιώτη φιλόζωο που θα φιλοξενήσει το ζωάκι σου όπως εσύ επιθυμείς.
                                Δες ποιος είναι κοντά σου, τι εμπειρία έχει, τι υπηρεσίες προσφέρει και επίλεξε τον καλύτερο. </p>
                            <!-- <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
                        </div>
                        <!-- /.col-lg-4 -->
                        <div class="col-lg-4">
                            <h2>Κάνε κράτηση & πληρωμή online</h2>
                            <p>Απλά και εύκολα κάνε κράτηση για τις ημερομηνίες που θέλεις και πλήρωσε ηλεκτρονικά ώστε να απολαύσεις όλα τα προνόμια του Keeppet.
                                Μπορείς πριν προχωρήσεις να συναντήσεις τον keeper, ζητώντας meet ’n’ greet μαζί του. </p>
                            <!-- <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
                        </div>
                        <!-- /.col-lg-4 -->
                        <div class="col-lg-4">

                            <h2>Το ζωάκι σου απολαμβάνει τη φιλοξενία</h2>
                            <p>Ο keeper θα φροντίσει ώστε να μην του λείψει η φροντίδα, η αγάπη και τα χάδια που έχει συνηθίσει.
                                Είναι καθημερινά σε επικοινωνία μαζί σου και σου στέλνει φωτογραφίες. </p>
                            <!-- <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p> -->
                        </div>
                        <!-- /.col-lg-4 -->
                    </div>
                    <!-- /.row -->
                </div>

            </div>
            <!-- /.container -->

            <div class="text-center  text-light card-bg " id="card">
                <p class="mb-0">Περισσότεροι από <strong>1500 keepers</strong> ανυπομονούν να φιλοξενήσουν το ζωάκι σας!<br>
                    Μέχρι σήμερα έχουν ήδη προσφέρει <strong>33850 νύχτες φιλοξενίας</strong> σε σκυλάκια, γατούλες, παπαγάλους, κουνελάκια... και ινδικά χοιρίδια!</p>
            </div>

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
















