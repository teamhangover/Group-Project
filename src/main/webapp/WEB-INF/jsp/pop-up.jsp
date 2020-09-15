<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/pop-up.css">
<script src="/js/pop-up.js"></script> 
<div id="popup" class="modal-body-popup">
    <h4 class="h4-popup text-center">Επικοινώνησε μαζί μας</h4>
    <h5 class="h5-popup text-center"><i>Πές μας πώς μπορούμε να βοηθήσουμε</i></h5>
    <form id="contact-form">
        <div class="styled-input wide">
            <input id="subject" name="subject" type="text" required />
            <label>Θέμα</label> 
        </div>
        <div class="styled-input wide">
            <input id="email-contact" name="email" type="email" required />
            <label>Email</label> 
        </div>
        <div class="styled-input wide">
            <textarea id="email-text" name="text" required rows=2></textarea>
            <label>Μήνυμα</label>
        </div>
        <div>
            <button id="send-email-btn" type="submit" class="btn-sm submit-btn">Αποστολή</button>
            <button id="popup-close-btn" type="button" class="btn-sm close-btn ">Κλείσιμο</button>
        </div>
    </form>
</div>
<div id="opener">
    <img alt="contact us" src="/img/transparent-contactus.png" height="200"/>
</div>