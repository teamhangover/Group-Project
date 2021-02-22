<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Βρες Keepers</title>
        <link rel="icon" href="/img/pawwhite.png" sizes="32x32">

        <!--bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
                crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <!--bootstrap-->


        <link rel="stylesheet" type="text/css" href="/css/findKeepersMap.css" />

        <!-- glyphicon -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

        <!-- datepicker resources -->
        <link rel="application/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>


    </head>

    <body class="bg-light">


        <!--Navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>
            <br>
            <br>
            <br>
            <p></p>

            <div class="d-md-flex  bd-highlight justify-content-center p-3 bg-dark card-1"
                 style="filter: drop-shadow(30px 10px 4px #313136); ">
                <input id="pac-input" class="form-control text-center" type="text" placeholder="Επιλέξτε την περιοχή σας" />
                <i id="autocomplete-btn" class="fa fa-map-marker mt-3 ml-2 " aria-hidden="true" style="color:cadetblue"></i>
            </div>

            <div class="d-md-flex p-2 bd-highlight justify-content-center p-5 dates card-1  "
                 style="background-color: cadetblue;">
                <div class="col-lg-6 col-11 px-1">
                    <div class="input-group input-daterange">
                        <input type="text" id="start" class="form-control text-left mr-2" placeholder="Από.."> <span
                            class="fa fa-calendar" id="fa-1" style="color:cadetblue"></span>
                        <input type="text" id="end" class="form-control text-left ml-2 " placeholder="Μέχρι.."> <span
                            class="fa fa-calendar" id="fa-2" style="color:cadetblue"></span>
                    </div>
                </div>
            </div>

            <div class="d-md-flex p-2 bd-highlight justify-content-center price bg-dark card-1">
                <input type="range" min="0" max="100" class="mr-2 bg-dark " id="fromPrice" value="90"> 

                <label id="fPrice" class="text-light my-2 ml-2 "></label> 
                <label for="fromPrice" class="mr-1  text-light my-2"> /ημέρα </label>
                <i class="fas fa-euro-sign text-light mt-3" aria-hidden="true"> </i>
            </div>
            <hr class="style-five">

            <!-- main row -->
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-md">
                        <div id="map"></div>
                    </div>

                    <div class="col-md" id="noresults-div">
                        <table class="table table-container text-center text-light  ">
                            <thead >
                                <tr >
                                    <th scope="col" >#</th>
                                    <th scope="col" >Όνομα</th>
                                    <th scope="col" >Επίθετο</th>
                                    <th scope="col" >&euro;/ημέρα</th>
                                    <th scope="col" ></th>
                                </tr>
                            </thead>
                            <tbody id="tableBody">

                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-body bg-dark">
                            <jsp:include page="reservation.jsp"></jsp:include> 
                            </div> 
                            <div class="modal-footer bg-dark">
                                <button type="button" class="btn btn-light text-dark " data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>


                <hr class="style-five">

                <!-- dog -->
                <div class="d-flex flex-row  text-light ">
                    <div class="thought ml-auto">Καλώς ήρθες στην έξυπνη αναζήτηση! Συμπλήρωσε τις ημερομηνίες που θες να φιλοξενηθεί το
                        κατοικιδιό σου καθώς και την
                        περιοχή που μένεις για να δεις όλους τους διαθέσιμους Keepers κοντά στο σπίτι σου για εκείνη την περίοδο!</div>
                    <div class="thought ">Μη ξεχάσεις να αυξομειώσεις τον δείκτη κόστους ανα ημέρα ανάλογα με τις ανάγκες σου για να
                        βρεις ακριβώς τον Keeper που ταιριάζει σε σένα αλλα και στο ζωάκι σου. Η μέγιστη επιτρεπόμενη χρέωση ανα ημέρα
                        ανέρχεται συμφωνα μα τους Όρους Χρήσης μας στα 100 &#8364; </div>
                    <div class="thought  mr-auto">Αριστερά στον χάρτη θα βρείς ολους του κοντινούς σε σενα Keepers, αλλα αν η τοποθεσία
                        φιλοξενίας δεν ειναι πρόβλημα για σενα, χρησιμοποίησε το +/- στο χαρτη αναλόγως! Δεξιά θα βρείς όλες τις σχετικές
                        καταχωρήσεις Keepers, μαζί με το κουμπί Μίσθωσης για τον καθένα! </div>
                </div>

                <div class="box-canvas mt-0 mb-0">
                    <div class="body"></div>
                    <div class="fence">
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                        <div class="panel"></div>
                    </div>

                    <div class="paw left"></div>
                    <div class="paw right"></div>
                    <div class="head">
                        <div class="eye left"></div>
                        <div class="eye right"></div>
                        <div class="tongue"></div>
                        <div class="snoot"></div>
                    </div>
                    <div class="ear left"></div>
                    <div class="ear right"></div>
                </div>

                <script src="/js/findKeepersMap.js"></script>
                <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
                <script
                    src="https://maps.googleapis.com/maps/api/js?key=API_KEY&libraries=places"
                defer></script>
            </div>
        <jsp:include page="pop-up.jsp"></jsp:include>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
