<%-- 
    Document   : reportBug
    Created on : Feb 28, 2016, 12:36:22 PM
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
        <title>Report Bug</title>
    </head>
    <body>
        <h3 style="margin: 12px">
            Report bug
        </h3>
        <div style="margin: 15px">            
            <form action="SaveBugReport.jsp" method="post">
                <textarea name="report" rows="10" cols="60"></textarea><br>
                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>
