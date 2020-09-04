<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="springform" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Find Keepers</title>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
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

    </head>
    <body>
        <!--Navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>

            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <div class="container-fluid">
                <div class="row my-auto">
                    <div class="offset-3 col-md-5">
                        Location: <input id="pac-input" type="text" placeholder="Enter a location" />
                    </div>
                </div>
                <div class="row my-4  mx-auto">
                    <div class="offset-3 col-md-3">
                        From: <input id="fromDate" type="date"  placeholder="From"/>
                    </div>
                    <div class="col-md-3">
                        To: <input id="toDate" type="date"  placeholder="To"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <h4>Filters</h4>
                        Price: <input type="range" min="0" max="100"/>$
                    </div>    
                    <div class="col-md-5">
                        <div id="map"></div>
                    </div>    
                    <div class="col-md-5">
                        <h4>Keeper info</h4>
                        <ul class="list-group list-group-horizontal-lg">
                            <li class="list-group-item"><img alt="Keeper-profpic"></li>
                            <li class="list-group-item"><span>First Name</span></li>
                            <li class="list-group-item"><span>Last Name</span></li>
                            <li class="list-group-item"><span>Age</span></li>
                            <li class="list-group-item"><button class="btn-sm">Hire!</button></li>
                        </ul>
                    </div>    
                </div>


            </div>
            <!--            
                        <div class="" id="pac-card">
                            <div>
                                <div id="title">
                                    Location
                                </div>
                            </div>
                            <div id="pac-container">
                            </div>
                        </div>-->
            <br>
            <br>
            <div>
            </div>
            <div id="infowindow-content">
                <img src="" width="16" height="16" id="place-icon" />
                <span id="place-name" class="title"></span><br />
                <span id="place-address"></span>
                <span id="keeper-Fname">keeper-Fname</span>
                <span id="keeper-Lname">keeper-Lname</span>
                <span id="keeper-Lname"></span>
            </div>

            <script src="/js/findKeepersMap.js"></script>
            <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
            <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCI5mZvsDf2yxpRbN_AdULITrSGI_o3Oow&callback=initMap&libraries=places"
            defer></script>
            <br>
            <br>
            <br>
            <br>
            <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
