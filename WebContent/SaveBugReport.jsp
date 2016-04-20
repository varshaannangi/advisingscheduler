<%-- 
    Document   : SaveBugReport
    Created on : Feb 28, 2016, 2:46:15 PM
    Author     : Lakshman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="navigationbar.jsp" />
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/datatables/jquery.dataTables.css">
        <link rel="icon" href="css/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="css/images/favicon.ico" type="image/x-icon" /> 
        <jsp:useBean id="reportBean" class="uta.cse4361.beans.SaveBugReportBean"/> 
        <jsp:setProperty name="reportBean" property="report" value='<%=request.getParameter("report")%>'/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bug report submitted</title>
    </head>
    <body>
               <%
                    String result = reportBean.BugReport();                 
                        //response.sendRedirect("index.jsp");                    
                %>
                <div style="margin: 20px">
                    <h3>Your report has been saved </h3>
                <form action="index.jsp">
                    <input style="margin: 20px" width="50" height="22" type="submit" value="OK"/>                                            
                </form>
                    
                </div>
    </body>
</html>
