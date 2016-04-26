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
					if (result.equals("")) {

						response.sendRedirect("CheckAppointments.jsp");
						java.util.ArrayList<Appointment> appointments = dm.getAllWaitlist();
						for (Appointment app : appointments) {
							if (app.getDate().getYear() == appt.getDate().getYear()
									&& app.getDate().getMonth() == appt.getDate().getMonth()
									&& app.getDate().getDate() == appt.getDate().getDate()) {
								uta.cse4361.businessobjects.Email email = new uta.cse4361.businessobjects.Email();
								email.sendSimpleEmail(app.getStudentEmail(), "Advising slot available",
										"An advising slot is available on " + (app.getDate().getMonth() + 1) + "/"
												+ app.getDate().getDate() + "/" + (app.getDate().getYear() + 1900));

							}
						}
						appt = null;
					} else {
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
