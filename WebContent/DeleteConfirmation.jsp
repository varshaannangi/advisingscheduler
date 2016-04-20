<%-- 
    Document   : DeleteConfirmation
    Created on : Mar 5, 2016, 2:50:27 PM
    Author     : includetech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
        <jsp:useBean id="deleteUser" class="uta.cse4361.beans.DeleteUserBean"/> 
        <jsp:setProperty name="deleteUser" property="email" value="<%=request.getParameter("email")%>" />
    </head>
    <body>
       <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Delete User</h3>
                <div>
                <%   
                    String email = deleteUser.getEmail();
                    String result = deleteUser.DeleteUser(email);
                    if(result.equals(""))
                    {
                        response.sendRedirect("EditAccounts.jsp");
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
    <script type="text/javascript" src="js/LoginValidation.js"></script>
</html>
