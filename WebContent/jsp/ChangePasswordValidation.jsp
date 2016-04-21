<%-- 
    Document   : ChangePasswordValidation
    Created on : Feb 28, 2016, 8:50:03 PM
    Author     : includetech
--%>

<%@page import="uta.cse4361.beans.ChangePasswordBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <jsp:useBean id="changePassword" class="uta.cse4361.beans.ChangePasswordBean"/> 
         <jsp:setProperty name="changePassword" property="email" value='<%=(String)session.getAttribute("email")%>' />
        <jsp:setProperty name="changePassword" property="newPassword" value='<%=request.getParameter("newPassword")%>' />
    </head>
<body>
         <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Password Validation</h3>
                <div>
                <%   
                    String result = changePassword.ChangePassword();
                    if(result.equals(""))
                    {
                        response.sendRedirect("index.jsp");
                    }

                    else{
                        out.print("Change Paasword Invalid.");
                        response.sendRedirect("ChangePassword.jsp");
                    } 
                    
                %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/LoginValidation.js"></script>
</html>
