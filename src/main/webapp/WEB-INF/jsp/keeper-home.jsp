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

        
        
        <link rel="stylesheet" href="/css/calendarStyle.css">
        <link rel="stylesheet" href="/css/keeper-home-style.css">
        <!--font awesome-->
        <script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

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
                        <h5 id="kratiseis">Οι Kρατήσεις σου!</h5> 
                        <!--                        <div class="d-flex justify-content-around">
                                                    <label>#</label><label>Όνομα</label><label>Επίθετο</label><label>Κατοικίδιο</label><label> Τιμή(&euro;)</label><label> Από</label><label> Μέχρι</label>
                                                </div>-->
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

            <script src="/js/calendarJs.js" async defer></script>
        <jsp:include page="pop-up.jsp"></jsp:include>
        <jsp:include page="footer.jsp"></jsp:include> 
    </body>
</html>
