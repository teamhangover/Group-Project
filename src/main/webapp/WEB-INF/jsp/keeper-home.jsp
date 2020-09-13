<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html > 
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> Dashboard</title>
        <link rel="icon" href="/img/pawwhite.png" sizes="32x32">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- CSS only -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/calendarStyle.css">
        <link rel="stylesheet" href="/css/keeper-home-style.css">


    </head>

    <body>
        <!--        navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>
            <br><br><br>

            <div class="firstflex mt-3">

                <article></article>
                <article> </article>
                <article></article>
            </div>

            <!-- FLEXBOX -->
            <div class="flexbox">
                <article id="one">

                </article>
                <article id="two">

                    <div class="calendar" id="calendar">
                        <div class="calendar-btn month-btn" onclick="$('#months').toggle('fast')">
                            <span id="curMonth"></span>
                            <div id="months" class="months dropdown"></div>
                        </div>

                        <div class="calendar-btn year-btn" onclick="$('#years').toggle('fast')">
                            <span id="curYear"></span>
                            <div id="years" class="years dropdown"></div>
                        </div>

                        <div class="clear"></div>

                        <div class="calendar-dates">
                            <div class="days">
                                <div class="day label">ΔΕΥ</div>
                                <div class="day label">ΤΡΙ</div>
                                <div class="day label">ΤΕΤ</div>
                                <div class="day label">ΠΕΜ</div>
                                <div class="day label">ΠΑΡ</div>
                                <div class="day label">ΣΑΒ</div>
                                <div class="day label">ΚΥΡ</div>

                                <div class="clear"></div>
                            </div>

                            <div id="calendarDays" class="days">
                            </div>
                        </div>
                    </div>

                    <div class="flex-container" id="reservations">
                        <h5 id="kratiseis">Οι τελευταίες σου κρατήσεις!</h5> 
                        <div class="d-flex justify-content-around">
                            <label>#</label><label>Όνομα</label><label>Επίθετο</label><label>Κατοικίδιο</label><label> Τιμή(&euro;)</label><label> Από</label><label> Μέχρι</label>
                        </div>
                    </div>

                </article>
            </div>

            <div id="centered">    
                <!-- Position absolute -->
                <div class="abs" >
                    <h6> Πως λειτουργεί το ημερολόγιο;</h6>
                    <span> Για αλλάξεις την διαθεσιμότητά σου, κάνε click στην ημέρα που θέλεις να αλλάξεις. Η ένδειξη
                        εναλλάσεται ανάμεσα σε Διαθέσιμος και Μη διαθέσιμος κάθε φορά που κάνεις click (Δεν μπορείς να
                        αλλάξεις όπου υπάρχει κράτηση).

                        Μπορείς να αλλάξεις τη διαθεσιμότητά σου όσες φορές επιθυμείς και αποθηκεύεται αυτόματα καθώς
                        κάνεις τις αλλαγές.</span>
                </div>
                <div class="abs" >
                    <h6> Πως αλλάζω μήνα/χρόνο; </h6>
                    <span>Μπορείς να πατήσεις είτε πάνω στον μήνα είτε στο έτος για να εμφανιστεί η αντίστοιχη λίστα και
                        να μετακινηθείς στην επιθυμητή ημερομηνία.Το ημερολόγιό σου εμφανίζεται στο προφίλ σου ώστε οι
                        ιδιοκτήτες κατοικιδίων να μπορούν να ελέγχουν την διαθεσιμότητά σου πριν κάνουν κράτηση.</span>
                </div>
            </div>

            <!-- popup -->
            <div id="popup">
                <h2>Θες βοήθεια;</h2>
                <p>Στείλε μας email. Ένα μέλος της ομάδας μας θα σου απαντήσει άμεσα!</p>
                <div>
                    <button>Κλείσιμο</button>
                    <button >Ε-mail</button>
                </div>
            </div>
            <div id="opener" class="">
                &#9754;
            </div>

        <jsp:include page="footer.jsp"></jsp:include>

        <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
        </script>

        <script src="/js/calendarJs.js" async defer></script>

        <!-- popup -->
        <script>
                            $(function ($) {
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
        </script>

    </body>
</html>
