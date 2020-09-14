let areUnavailableDatesFilled = false;
$(document).ready(function () {
    getMyReservations();
});

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
    var dayofweek = tmpDate.getDay(); // find where to start calendar day of week

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
            let text;
            if (reservastionDates.includes(parseInt(d.dataset.fullDate))) {
                text = "Κράτηση";
                d.classList.add("reservedDay");
            } else {
                text = "Μη Διαθέσιμος";
            }
            d.innerHTML = `<span class="clnd-day-number">` + d.dataset.day + `</span><span class="avail">` + text + `</span>`;
        }
        let today = new Date();
        today.setHours(0, 0, 0, 0);
        let todayTimeString = today.getTime() + "";

        if (d.dataset.fullDate === todayTimeString) {        
            d.classList.add("todayDate");
        }
        if (!reservastionDates.includes(parseInt(d.dataset.fullDate))
                && d.dataset.fullDate >= today.getTime()) {
            d.addEventListener('click', function () {
                this.classList.toggle('selected');
                let tmpDay = this.dataset.day;
                if (!selectedDays.includes(this.dataset.day)) {
                    selectedDays.push(this.dataset.day);
                    this.innerHTML = `<span class="clnd-day-number"><strong>` + tmpDay + `</strong></span><span class="avail">Μη Διαθέσιμος</span>`;
                    setUnavailableDate(this.dataset.fullDate);
                } else {
                    selectedDays.splice(selectedDays.indexOf(this.dataset.day), 1);
                    this.innerHTML = `<span class="clnd-day-number"> <strong>` + tmpDay + `</strong></span><span class="avail">Διαθέσιμος</span>`;
                    deleteDate(this.dataset.fullDate);
                }
            });
        }
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
let reservastionDates = [];
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

function getMyReservations() {
    $.get("/myReservations").done((myReservations) => {
        showAllReservations(myReservations);
        $.each(myReservations, (i, reservastion) => {
            let from = new Date(reservastion.dateFrom);
            let to = new Date(reservastion.dateTo);
            from.setHours(0, 0, 0, 0);
            to.setHours(0, 0, 0, 0);
            for (let dt = from; dt < to; dt.setDate(dt.getDate() + 1)) {
                reservastionDates.push(dt.getTime());
            }
        });
        getUnavailableDates();
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

function showAllReservations(reservs) {
    $.each(reservs, (i, reservation) => {
        displayReservations(reservation);
    });
}

let reservationDiv = $("#reservations");
function displayReservations(rsvData) {

  
    let reservation = `
                
                <div class="d-flex justify-content-around">
                          <span>  <img  src="../images/` + rsvData.profPhoto + `" alt="Profile Pic" height="30px" width="30px" class="rounded-circle ownerPhoto " ></span>
                          <span><i class="fas fa-user"></i> ` + rsvData.firstName + `</span> <span>` + rsvData.lastName + `</span> <span> <i class="fas fa-paw"></i> ` + rsvData.ownerPetType + `</span> <span><i class="fas fa-euro-sign"></i>` + rsvData.totalPrice + `</span> <span><i class="far fa-calendar-alt"></i>` + rsvData.dateFrom + ` </span> <span><i class="far fa-calendar-alt"></i>` + rsvData.dateTo + `</span> 
                </div>`;
    reservationDiv.append(reservation);
}