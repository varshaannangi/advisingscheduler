<%-- 
    Document   : modifyAppointment
    Created on : Oct 26, 2014, 3:53:12 PM
    Author     : Melissa
--%>

<%@page import="uta.cse4361.businessobjects.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advisor Status</title>
</head>
<body>

	<jsp:include page="navigationbar.jsp" />
	<jsp:useBean id="dm" class="uta.cse4361.databases.DatabaseManager"
		scope="session" />
	<div id="wrapper">
		<jsp:include page="header.jsp" />
		<div id="advisorAccordion" class="centerthis">
			<h3>Advisor Status</h3>
			<div>
				<table class="display centerthis" id="advisorList">
					<thead>
						<th>Advisor Name</th>
						<th>Advising Type</th>
					</thead>
					<tbody>
						<%
							dm = new uta.cse4361.databases.DatabaseManager();
							java.util.ArrayList<uta.cse4361.businessobjects.AdvisorAccount> advisors = dm.getAdvisors();
							for (uta.cse4361.businessobjects.AdvisorAccount a : advisors) {
								out.print("<tr>");
								out.print("<td>");
								out.print(a.getName());
								out.print("</td>");
								if (a.getStatus().equals("Available"))
									out.print("<td style=\"color: white; background-color: green;\">");
								else
									out.print("<td style=\"color: white; background-color: red;\">");
								out.print(a.getStatus());
								out.print("</td>");
								out.print("</tr>");
								out.print("</script>");
								out.print("</tr>");
							}
						%>
					</tbody>
				</table>
				<br>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript">
	$("#advisorAccordion").accordion({
		heightStyle : "content"
	});
	$(document).ready(function() {
		$('#advisorList').DataTable({
			"paging" : false,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
		});
	});
</script>
</html>
