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

        <script type="text/javascript">

            function validate() {
                var confirmPassword = document.forms["ChangePassword"]["confirmPassword"].value;
                var newPassword = document.forms["ChangePassword"]["newPassword"].value;
                if (confirmPassword === null || confirmPassword === "") {
                    $("#confirmPassword").notify("Please confirm your new Password", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["ChangePassword"]["confirmPassword"].focus();
                    return false;
                }
                if (newPassword === null || newPassword === "") {
                    $("#newPassword").notify("Please enter your new Password", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["ChangePassword"]["newPassword"].focus();
                    return false;
                }
                if (confirmPassword !== newPassword) {
                    $("#confirmPassword").notify("Confirm password does not match!", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["ChangePassword"]["confirmPassword"].focus();
                    return false;
                }
                if (/^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).{8,24}$/.test(confirmPassword)) 
                {
                }
                else
                {
                    $("#confirmPassword").notify("Password should contain an uppercase letter, one special case letter, one digit and should atleast be of length 8!", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["ChangePassword"]["confirmPassword"].focus();
                    return false;
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
    <tr>
        <jsp:include page="navigationbar.jsp" />
    <div id="wrapper">
        <jsp:include page="header.jsp" />
        <div id="accordion" class="centerthis">
            <h3>Change Password</h3>
            <div class="centerthis">
                <form role="form" name="ChangePassword" action="ChangePasswordValidation.jsp" onSubmit="return validate();" >
                    <div class="form-group">
                    	<input type="hidden" id="u" name="u" value="<%= request.getParameter("u") %>">                    
                        <label for="newPassword">New Password</label>
                        <input type="password" name="newPassword" id="newPassword" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" name="confirmPassword" id="confirmPassword" value="" class="form-control">
                    </div>
                    <input type="submit" value="Change Password" id="changePwdBtn" class="btn btn-default">
                </form>
            </div>
        </div>
    </div>
    <br>
</body>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/schedule.js"></script>
</html>
