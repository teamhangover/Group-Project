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

                    <div class="flex-container">

                        <div>κρατηση 1</div>
                        <div>κρατηση 2</div>
                        <div>κρατηση 3</div>  
                        <div>κρατηση 3</div>  
                        <div>κρατηση 3</div>  
                        <div>κρατηση 3</div>  
                        <h5 id="kratiseis">Οι τελευταίες σου κρατήσεις!</h5> 
                    </div>

                </article>
                <!--                <article id="three"></article>-->

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

        <!--<script src="/js/calendarJs.js" async defer></script>-->

        <script>

            var months = ["Ιαν", "Φεβ", "Μαρ", "Απρ", "Μαι", "Ιουν", "Ιουλ", "Αυγ", "Σεπ", "Όκτ", "Νοε", "Δεκ"];
            var startYear = 2020;
            var endYear = 2050;
            var month = 0;
            var year = 0;
            var selectedDays = new Array();
            var mousedown = false;
            var mousemove = false;

            function loadCalendarMonths() {
                for (var i = 0; i < months.length; i++) {
                    var doc = document.createElement("div");
                    doc.innerHTML = months[i];
                    doc.classList.add("dropdown-item");

                    doc.onclick = (function () {
                        var selectedMonth = i;
                        return function () {
                            month = selectedMonth;
                            document.getElementById("curMonth").innerHTML = months[month];
                            loadCalendarDays();
                            return month;
                        };
                    })();

                    document.getElementById("months").appendChild(doc);
                }
            }

            function loadCalendarYears() {
                document.getElementById("years").innerHTML = "";

                for (var i = startYear; i <= endYear; i++) {
                    var doc = document.createElement("div");
                    doc.innerHTML = i;
                    doc.classList.add("dropdown-item");

                    doc.onclick = (function () {
                        var selectedYear = i;
                        return function () {
                            year = selectedYear;
                            document.getElementById("curYear").innerHTML = year;
                            loadCalendarDays();
                            return year;
                        };
                    })();

                    document.getElementById("years").appendChild(doc);
                }
            }

            function loadCalendarDays() {
                document.getElementById("calendarDays").innerHTML = "";

                var tmpDate = new Date(year, month, 0);
                var num = daysInMonth(month, year);
                var dayofweek = tmpDate.getDay();       // find where to start calendar day of week

                for (var i = 0; i < dayofweek; i++) {
                    var d = document.createElement("div");
                    d.classList.add("day");
                    d.classList.add("blank");
                    d.classList.add("dayHeight");
                    document.getElementById("calendarDays").appendChild(d);
                }

                for (var i = 0; i < num; i++) {
                    var tmp = i + 1;
                    var d = document.createElement("div");
                    d.id = "calendarday_" + tmp;
                    d.className = "day";
                    d.classList.add("dayHeight");
                    d.innerHTML = `<span class="clnd-day-number"><strong>` + tmp + `</strong></span><span class="avail">Διαθέσιμος</span>`;
                    d.dataset.day = tmp;

                    //set full date attribute
                    let fullDate = new Date(year, month, tmp);
                    d.dataset.fullDate = fullDate.getTime();

                    //Check if date is already unavailable
                    if (unavailableDates.includes(parseInt(d.dataset.fullDate))) {
                        selectedDays.push(d.dataset.day);
                        d.classList.add("selected");
                        d.innerHTML = `<span class="clnd-day-number">` + d.dataset.day + `</span><span class="avail">Μη Διαθέσιμος</span>`;
                    }

                    //TODO get dates from reservastions and make them unavailable and disabled

                    d.addEventListener('click', function () {
                        this.classList.toggle('selected');

                        let tmpDay = this.dataset.day;
                        if (!selectedDays.includes(this.dataset.day)) {
                            selectedDays.push(this.dataset.day);
                            this.innerHTML =`<span class="clnd-day-number"><strong>` + tmpDay + `</strong></span><span class="avail">Μη Διαθέσιμος</span>`;
                            setUnavailableDate(this.dataset.fullDate);
                        } else {
                            selectedDays.splice(selectedDays.indexOf(this.dataset.day), 1);
                            this.innerHTML =`<span class="clnd-day-number"> <strong>` + tmpDay + `</strong></span><span class="avail">Διαθέσιμος</span>`;
                            deleteDate(this.dataset.fullDate);
                        }
                    });

                    document.getElementById("calendarDays").appendChild(d);
                }

                var clear = document.createElement("div");
                clear.className = "clear";
                document.getElementById("calendarDays").appendChild(clear);
            }

            function daysInMonth(month, year) {
                var d = new Date(year, month + 1, 0);
                return d.getDate();
            }

            //send Ajax to register unavailable date
            let unavailableDateUrl = "/keeper/unavailableDate";
            function setUnavailableDate(date) {
                $.post(
                        unavailableDateUrl,
                        {date: date}
                ).done((data) => {
                    console.log("Registered");
                });
            }
            //send Ajax to delete unavailable date
            let deleteDateUrl = "/keeper/deleteUnavailableDate";
            function deleteDate(date) {
                $.post(
                        deleteDateUrl,
                        {date: date}
                ).done((data) => {
                    console.log("Deleted");
                });
            }

            //send ajax and get all unavailable dates already registered in database
            let unavailableDates = [];
            let allUnvailableDatesURL = "/keeper/getUnavailableDates";
            function getUnavailableDates() {
                $.post(
                        allUnvailableDatesURL
                        ).done((data) => {

                    $.each(data, (i, entry) => {
                        let stringToDateMillis = Date.parse(entry.unavailableDate);
                        let tmpDate = new Date(stringToDateMillis);
                        tmpDate.setHours(0, 0, 0, 0);
                        unavailableDates.push(tmpDate.getTime());
                    });
                    areUnavailableDatesFilled = true;
                    loadCalendar();
                });
            }

            function loadCalendar() {
                if (areUnavailableDatesFilled) {

                    var date = new Date();
                    month = date.getMonth();
                    year = date.getFullYear();
                    document.getElementById("curMonth").innerHTML = months[month];
                    document.getElementById("curYear").innerHTML = year;
                    loadCalendarMonths();
                    loadCalendarYears();
                    loadCalendarDays();
                }
            }
            let areUnavailableDatesFilled = false;
            $(document).ready(function () {
                getUnavailableDates();

            });

        </script>
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
