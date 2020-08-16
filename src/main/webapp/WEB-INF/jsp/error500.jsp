<%-- 
    Document   : error500
    Created on : Aug 13, 2020, 9:32:35 PM
    Author     : BergouLan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="emoji.png" type="image/png" sizes="16x16">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style type="text/css">
        img{
            width: 100px;
            height: 100px;
        }
        .jumbotron{
            margin-top: 100px;
        }
    </style>
    <title>500 NOT FOUND</title>
</head>
<body>
    <div class = "container">
        <div class ="jumbotron text-center">
            <img src="/img/emoji.png">
            <h1>ERROR 500 - SOMETHING WENT WRONG!</h1>
            <p>This page isn't available. Sorry about that<br>
            Try searching for something else.</p>
            <a href="/" class="btn btn-primary btn-lg">
                <span class="glyphicon glyphicon-chevron-left"></span>Go Back</a>
        </div>
        
    </div>
    
</body>
</html>
