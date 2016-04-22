<%-- 
    Document   : RegisterStudentConfirmation
    Created on : Feb 28, 2016, 2:27:39 AM
    Author     : includetech
--%>

<%@page import="uta.cse4361.businessobjects.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="newstudent" class="uta.cse4361.beans.CreateStudentAccountBean"/> 
        <jsp:setProperty name="newstudent" property="email" value='<%=request.getParameter("email")%>' />
        <jsp:setProperty name="newstudent" property="username" value='<%=request.getParameter("username")%>' />
        <jsp:setProperty name="newstudent" property="tempPassword" value='<%=request.getParameter("password")%>'/>
        <jsp:setProperty name="newstudent" property="tempPasswordString" value='<%=request.getParameter("tempPasswordString")%>' />
        <jsp:setProperty name="newstudent" property="major" value='<%=request.getParameter("major")%>' />
        <jsp:setProperty name="newstudent" property="name" value='<%=request.getParameter("name")%>' />
        <jsp:setProperty name="newstudent" property="rank" value='<%=Integer.parseInt("9")%>' />
        <jsp:setProperty name="newstudent" property="securityQuestion" value='<%=request.getParameter("securityQuestion") %>' />
        <jsp:setProperty name="newstudent" property="securityAnswer" value='<%=request.getParameter("securityAnswer") %>' />
        
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
                    String result = newstudent.Student();
                    if (result == "") {
                        out.print(newstudent.getName() +" has been registered! Please check your email for further details.");
                        Email e = new Email();
                        String name = newstudent.getName();
                        String email1 = newstudent.getEmail();
                        String password = newstudent.getTempPasswordString();
                        e.sendSimpleEmail(email1, "UTA Advsing Scheduler Temporary Password", " "+name+", \n\tHere are your credentials:\n\tUsername: " + email1 + "\n\tPassword: " + password + "\n\n\tYou have 24 hours before your password expires.\n\nThanks, the UTA Advising Scheduler Devs!");
                    } 
                    else if (result == "Student is already registered!")
                    {
                        out.print("Registration could not be completed as email is already registered!");
                    }
                    else {
                        out.print("Registration could not be completed!");
                    }
                %>
                </div>
            </div>
        </div>   
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/AccountConfirmation.js"></script>
</html>
