<%-- 
    Document   : LoginValidation
    Created on : Nov 22, 2014, 10:39:39 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<jsp:useBean id="login" class="uta.cse4361.beans.LogInBean" />
<jsp:setProperty name="login" property="email"
	value='<%=request.getParameter("username")%>' />
</head>
<body>
	<jsp:include page="navigationbar.jsp" />
	<div id="wrapper">
		<jsp:include page="header.jsp" />
		<div id="accordion">
			<h3>Login Validation</h3>
			<div>
				<%
					String result = login.ForgotPassword();
					if (result.equals("Incorrect")) {
						out.print("Incorrect username");
					} else {
						out.print("We have sent a link to your email to reset password.");
						response.sendRedirect("index.jsp");
					}
				%>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/LoginValidation.js"></script>
</html>
