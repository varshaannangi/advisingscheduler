<%-- 
    Document   : Feedback
    Created on : Feb 28, 2016, 6:23:21 PM
    Author     : Lakshman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="navigationbar.jsp"/>
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/datatables/jquery.dataTables.css">
        <link rel="icon" href="css/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="css/images/favicon.ico" type="image/x-icon" /> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <body>
        <body>
        <h3 style="margin: 12px">
            Feedback
        </h3>
        <div style="margin: 15px">            
            <form action="SaveFeedback.jsp" method="post">
                <textarea name="Feedback" rows="10" cols="60"></textarea><br>
                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
    </body>
</html>
