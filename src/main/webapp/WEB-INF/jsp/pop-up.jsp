

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/pop-up.css">
<script src="/js/pop-up.js"></script> 
<!-- popup -->
<div id="popup">
    <h2>Θες βοήθεια;</h2>
    <p>Στείλε μας email. Ένα μέλος της ομάδας μας θα σου απαντήσει άμεσα!</p>
    <div>
        <button id="popup-close-btn">Κλείσιμο</button>
        <button id="popup-email-btn" type="button" data-toggle="modal" data-target="#popupmodal">Ε-mail</button>
    </div>
</div>
<div id="opener" class="">
    🐾
</div>


<div id="popupmodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">



            <div class="modal-body">

                <div class="container">
                    <div class="row d-block mx-auto ">
                        <h4>Επικοινώνησε μαζί μας</h4>
                    </div>
                    <div class="row d-block mx-auto">
                        <h5>Πες μας πως μπορούμε να βοηθήσουμε</h5>
                    </div>
                    <div class="row input-container">
                        <form id="contact-form">
                            <div class="col-xs-12">
                                <div class="styled-input wide">
                                    <input id="subject" name="subject" type="text" required />
                                    <label>Θέμα</label> 
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="styled-input wide">
                                    <input id="email" name="email" type="email" required />
                                    <label>Email</label> 
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="styled-input wide">
                                    <textarea id="email-text" name="text" required></textarea>
                                    <label>Μήνυμα</label>
                                </div>
                            </div>
                            <div class="col-xs-6">
                                <button id="send-email-btn" type="submit" class="btn-lrg submit-btn">Αποστολή</button>
                            </div>
                            <div class="col-xs-6">
                                <button id="modal-close-btn" type="button" class="btn-lrg close-btn " data-dismiss="modal">Κλείσιμο</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>


        </div>
    </div>
</div>
