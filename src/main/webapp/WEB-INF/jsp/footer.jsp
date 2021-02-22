<%-- 
    Document   : footer
    Created on : 11 Αυγ 2020, 9:22:40 μμ
    Author     : ths13
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Load an icon library -->
<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
<link href="/css/footer.css" rel="stylesheet"> 


<!-- Footer -->
<footer class="page-footer font-small stylish-color-dark pt-4">

    <!-- Footer Links -->
    <div class="container text-center text-md-left noBg">

        <!-- Grid row -->
        <div class="row ">

            <!-- Grid column -->
            <div class="col-md-4 mx-auto">

                <!-- Content -->
                <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Vetaid 24/7</h5>
                <p class="text-light">Οι Keepers φροντίζουν ώστε το ζωάκι σου να είναι ασφαλές. Σε περίπτωση ωστόσο που
                    χρειαστεί κτηνιατρική βοήθεια, οποιαδήποτε στιγμή το 24ωρο, η ομάδα των κτηνιάτρων μας θα βρεθεί
                    άμεσα κοντά του. Χωρίς καμία δική σου επιβάρυνση.</p>

            </div>
            <!-- Grid column -->

            <hr class="clearfix w-100 d-md-none">

            <!-- Grid column -->
            <div class="col-md-2 mx-auto">

                <!-- Links -->
                <!-- <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5> -->


            </div>
            <!-- Grid column -->



            <!-- Grid column -->
            <div class="col-md-1 mx-auto">

                <!-- Links -->
                <!-- <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5> -->

                <ul class="d-flex list-unstyled justify-content-center">


                </ul>

            </div>
            <!-- Grid column -->



            <!-- Grid column -->
            <div class="col-md-3 mx-auto">



                <ul class="d-flex list-unstyled list-inline-item justify-content-center">
                    <c:choose>
                        <c:when test="${pageContext['request'].userPrincipal != null}">
                            <security:authorize access="hasRole('ROLE_KEEPER') and isAuthenticated()">
                                <li class="list-inline-item">
                                    <h5 class="mb-1 ">Δές τις κρατήσεις σου!</h5>
                                </li>
                                <li class="list-inline-item">
                                    <a href="${pageContext.request.contextPath}/keeper/dashboard" class="btn btn-lg btn-outline-success btn-rounded">Πίνακας Ελέγχου</a>
                                </li>                           
                            </security:authorize> 
                            <security:authorize access="hasRole('ROLE_OWNER') and isAuthenticated()">
                                <li class="list-inline-item">
                                    <h5 class="mb-1 ">Βρες keepers τώρα!</h5>
                                </li>
                                <li class="list-inline-item">
                                    <a href="${pageContext.request.contextPath}/owner/search" class="btn btn-lg btn-outline-success btn-rounded">Βρές Keepers</a>
                                </li>
                            </security:authorize>
                        </c:when>
                        <c:otherwise>
                            <li class="list-inline-item">
                                <h5 class="mb-1 ">Εγγράψου δωρεάν!</h5>
                            </li>
                            <li class="list-inline-item">
                                <a href="${pageContext.request.contextPath}/preInsertMyUser" class="btn btn-lg btn-success btn-rounded">Εγγραφή</a>
                            </li>

                        </c:otherwise>
                    </c:choose>
                </ul>

            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row -->



    </div>
    <!-- Grid row -->


    <hr>

    <!-- Call to action -->
    <ul class="list-unstyled list-inline text-center m-3 pb-5">


        <li class="list-inline-item">
            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/#!">Συχνές ερωτησεις</a>
        </li>

        <li class="list-inline-item">
            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/#!">Επικοινωνία</a>
        </li>

        <li class="list-inline-item">
            <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/#!">Για εμάς </a>
        </li>



    </ul>

    <!-- Call to action -->

    <hr>

    <!-- Social buttons -->
    <div class=" icon-bar text-center margin-bottom ">

        <a href="#" class="facebook p-3 m-3 btn btn-outline-info"><i class="fab fa-facebook-f"></i></a> 
        <a href="#" class="twitter p-3 m-3 btn btn-outline-info"><i class="fab fa-twitter"></i></a>
        <a href="#" class="google p-3 m-3 btn btn-outline-info"><i class="fab fa-google"></i></a>
        <a href="#" class="linkedin p-3 m-3 btn btn-outline-info"><i class="fab fa-linkedin"></i></a>
        <a href="#" class="youtube p-3 btn m-3 btn-outline-info"><i class="fab fa-youtube"></i></a>

    </div>
    <!-- Social buttons -->
    <hr>
    <!-- Copyright -->

    <div class="footer-copyright text-center py-3 ml-5" style="color: aliceblue;">© 2020 Copyright:
        <a href="${pageContext.request.contextPath}"> PetKeeper.com</a>
        <p class="float-left"><a class="mt-4 btn btn-outline-info" href="#">Back to top</a></p>

        <p> <a href="#" class="float-middle">Privacy</a> &middot; <a href="#">Terms</a></p>


    </div>

    <!-- Copyright -->

</footer>
<!-- Footer -->

