<%-- 
    Document   : CancelStudentAppointment
    Created on : Mar 7, 2016, 4:02:09 PM
    Author     : includetech
--%>

<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.businessobjects.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Appointment</title>
    </head>
    <body>
       <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Cancel Appointment</h3>
                <div>
                <%   
                    int apptID = Integer.parseInt(request.getParameter("apptID"));
                    DatabaseManager dm = new DatabaseManager();
                    Appointment appt = dm.getAppointment(Integer.parseInt(request.getParameter("apptID")));
                    String result = dm.deleteStudentAppointment(apptID);
                    if(result.equals(""))
                    {
                        appt = null;
                        response.sendRedirect("CheckAppointments.jsp");
                    }
                    else{
                        out.print("Delete Failed!");
                    } 
                %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/appointmentEdit.js"></script>
</html>
