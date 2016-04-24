<%-- 
    Document   : ChangePassword
    Created on : Feb 28, 2016, 6:52:32 PM
    Author     : includetech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change Availability</title>
</head>
<%
	int rank = -1;
	int sessionid = -1;
	if ((session.getAttribute("id") == null) || (session.getAttribute("rank") == null)) {
		response.sendRedirect("index.jsp");
	}
	if (!(session.getAttribute("id") == null)) {
		sessionid = Integer.parseInt((String) session.getAttribute("id"));
	}
	if (!(session.getAttribute("rank") == null)) {
		rank = Integer.parseInt((String) session.getAttribute("rank"));
	}
	if (rank != 0) {
		response.sendRedirect("index.jsp");
	}
%>
<body>
	<jsp:useBean id="dm" class="uta.cse4361.databases.DatabaseManager"
		scope="session" />
	<jsp:include page="navigationbar.jsp" />
	<div id="wrapper">
		<jsp:include page="header.jsp" />
		<div id="accordion" class="centerthis">
			<h3>Change Availability</h3>
			<div class="centerthis">
			<%
					if (!(request.getParameter("submitted") == null || !request.getParameter("submitted").equals("true"))) {
						if (request.getParameter("statusCheckbox") != null) {
							dm.changeAdvisorStatus((String) session.getAttribute("email"), "Available");
						} else {
							dm.changeAdvisorStatus((String) session.getAttribute("email"), "Unavailable");
						}
					}				
				%>
				<form role="form" name="ChangeAvailability">
					<div class="form-group">
						<label for="statusCheckbox">Available</label>
						<%
							dm = new uta.cse4361.databases.DatabaseManager();
							uta.cse4361.businessobjects.AdvisorAccount advisor = dm.getAccount((String) session.getAttribute("email"));
							String advisorStatus = advisor.getStatus();
							String checked = "";
							if (advisorStatus.equals("Available")) {
								checked = "checked";
							}
						%>
						<input type="checkbox" name="statusCheckbox" id="statusCheckbox"
							class="form-control" <%=checked%> />
					</div>
					<div class="form-group"></div>
					<input type="hidden" value="true" name="submitted"> <input
						type="submit" value="Change" id="changeBtn"
						class="btn btn-default">
				</form>				
			</div>
		</div>
	</div>
	<br>
</body>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/schedule.js"></script>
</html>
