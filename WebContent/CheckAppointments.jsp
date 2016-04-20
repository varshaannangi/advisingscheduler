<%-- 
    Document   : CheckAppointments
    Created on : Mar 5, 2016, 8:10:32 PM
    Author     : includetech
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uta.cse4361.businessobjects.Appointment"%>
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointments</title>
    </head>
    <body>
         <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
             <div id="accordion">
                <h3>All Accounts</h3>
                           <div>
                                <form  name="allAppointments" action="CancelStudentAppointment.jsp">
                                <table border = "1" class="display" id="allAppointments" cellpadding= "3" cellspacing= "0" >
                                    <col width="80">
                                    <col width="180">
                                    <col width="150">
                                    <col width="100">
                                    <col width="200">
                                    <col width="80">
                                    <thead>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Advisor Name</th>
                                    <th>Type</th>
                                    <th>Description</th>
                                    <th>Select</th>

                                    <th></th>
                                    </thead>
                                    <tbody>
                                    <%
                                     DatabaseManager dm = new DatabaseManager(); 
                                     String email1 = (String)session.getAttribute("email");
                                    ArrayList<Appointment> appts = dm.getAllUserAppointments(email1); 
                                    for(Appointment a: appts) {
                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(a.getDate());
                                        out.print("</td>");
                                        out.print("<td>");                                       
                                        out.print(a.getStartHour() +":");
                                        if(a.getStartMinute() == 0)
                                        {
                                            out.print("00");
                                        }
                                        else
                                        {
                                            out.print(a.getStartMinute());
                                        }
                                        out.print("--");
                                        out.print(a.getEndHour() + ":" );
                                        if(a.getEndMinute() == 0)
                                        {
                                            out.print("00");
                                        }
                                        else
                                        {
                                            out.print(a.getEndMinute());
                                        }
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(a.getAdvisorName());
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(a.getType());
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(a.getDescription());
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print("<input type='radio' name='apptID' value='" +a.getApptID()+"'>");
                                        out.print("</td>");
                                        out.print("</tr>");
                                        out.print("</script>");
                                    }  
                                    %>
                                    </tbody>
                                </table>
                                    <input type="submit" value="Cancel Appointment" id="cancelBtn" class="btn btn-default">
                   
                                </form>
                            </div>

             </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>
