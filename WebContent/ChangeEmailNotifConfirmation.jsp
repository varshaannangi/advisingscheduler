<%-- 
    Document   : ChangeEmailNotifConfirmation
    Created on : Mar 6, 2016, 3:33:00 PM
    Author     : includetech
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Setting</title>
        <jsp:useBean id="changeEmailSetting" class="uta.cse4361.beans.EditAdvisorEmailSettingBean"/> 
        <jsp:setProperty name="changeEmailSetting" property="email" value="<%=request.getParameter("email")%>" />
        <jsp:setProperty name="changeEmailSetting" property="emailSetting" value="<%=request.getParameter("emailSetting")%>" />

    </head>
    <body>
       <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Change Email Notification</h3>
                <div>
                <%   
                    String email = changeEmailSetting.getEmail();
                    String setting = changeEmailSetting.getEmailSetting();

                    String result = changeEmailSetting.EditAdvisorEmailSetting(email,setting);
                    if(result.equals(""))
                    {
                        response.sendRedirect("EditAccount.jsp");
                    }

                    else{
                        out.print("Settings Change Failed!");
                    } 
                    
                %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/LoginValidation.js"></script>
</html>
