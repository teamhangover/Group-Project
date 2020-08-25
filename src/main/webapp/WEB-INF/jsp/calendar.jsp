
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html > 
    <head>
        <meta charset="UTF-8">
<!--        <meta http-equiv="X-UA-Compatible" content="IE=edge">-->
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/css/calendarStyle.css">
    </head>
    <body>
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
                
        <script src="/js/calendarJs.js"></script>
        <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
    </body>
</html>
            