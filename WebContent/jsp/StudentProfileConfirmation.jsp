<%-- 
    Document   : RegisterStudentConfirmation
    Created on : Feb 28, 2016, 2:27:39 AM
    Author     : includetech
--%>

<%@page import="uta.cse4361.businessobjects.Email"%>
<%@page import="uta.cse4361.businessobjects.StudentAccount"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="studentProfile"
	class="uta.cse4361.beans.StudentProfileBean" />
<jsp:setProperty name="studentProfile" property="email"
	value='<%=request.getParameter("email")%>' />
<jsp:setProperty name="studentProfile" property="name"
	value='<%=request.getParameter("username")%>' />
<jsp:setProperty name="studentProfile" property="major"
	value='<%=request.getParameter("major")%>' />
<%
	System.out.println(ServletFileUpload.isMultipartContent(request));
	if (ServletFileUpload.isMultipartContent(request)) {
		try {
			DatabaseManager dm = new DatabaseManager();
			StudentAccount sa = dm.getStudentAccount((String) session.getAttribute("email"));
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

			for (FileItem item : multiparts) {
				if (!item.isFormField()) {
					item.write(new File(request.getServletContext().getRealPath("/images/profile/")
							+ sa.getName() + ".jpg"));

				}

			}

		} catch (Exception ex) {
			request.setAttribute("message", "File Upload Failed due to " + ex);

		}
	}
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register Confirmation</title>
</head>
<body>
	<jsp:include page="navigationbar.jsp" />
	<div id="wrapper">
		<jsp:include page="header.jsp" />
		<div id="accordion">
			<h3>Account Confirmation</h3>
			<div>
				<%
					String result = studentProfile.ChangeProfilePicture();
					if (result == "") {
						out.print("Profile has been successfully updated.");
					} else {
						out.print("There was a problem while updating your profile.");
					}
				%>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/AccountConfirmation.js"></script>
</html>
