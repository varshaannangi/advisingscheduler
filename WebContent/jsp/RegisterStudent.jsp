<%-- 
    Document   : RegisterStudent
    Created on : Feb 27, 2016, 10:08:58 PM
    Author     : Divya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.businessobjects.Slot"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
		<script src='https://www.google.com/recaptcha/api.js'></script>
        <script type="text/javascript">
            function isNumberKey(evt)
            {
                var e = evt || window.event; //window.event is safer, thanks @ThiefMaster
                var charCode = e.which || e.keyCode;
                if (charCode > 31 && (charCode < 47 || charCode > 57))
                    return false;
                if (e.shiftKey)
                    return false;
                return true;
            }

            function validate() {
                var studentID = document.forms["RegisterStudent"]["studentID"].value;
                var name = document.forms["RegisterStudent"]["name"].value;
                var username = document.forms["RegisterStudent"]["username"].value;
                var securityAnswer = document.forms["RegisterStudent"]["securityAnswer"].value;
                var email = document.forms["RegisterStudent"]["email"].value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                if (/(\W|^)[\w.+\-]*@mavs\.uta\.edu(\W|$)/.test(email)) 
                {
                    
                }
                else
                {
                    $("#email").notify("Please enter a valid mavs email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["email"].focus();
                    return false;
                }   
                    
                if (email === null || email === "") {
                    $("#email").notify("Please enter your email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["email"].focus();
                    return false;
                }
                if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
                    $("#email").notify("Please enter a valid email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["email"].focus();
                    return false;
                }
                if (studentID === null || studentID === "") {
                    $("#studentID").notify("Please enter your student ID", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["studentID"].focus();
                    return false;
                }
                if (isNaN(studentID)) {
                    $("#studentID").notify("Your student ID must be a number", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["studentID"].focus();
                    return false;
                }
                if (studentID.length !== 10) {
                    $("#studentID").notify("Your student ID must be a 10-digit number", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["studentID"].focus();
                    return false;
                }
                if (studentID.indexOf("100") === -1&& studentID.indexOf("6000") === -1) {
                    $("#studentID").notify("Your student ID should begin with 1000 or 6000", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["studentID"].focus();
                    return false;
                }
                if (name === null || name === "") {
                    $("#name").notify("Please enter your name", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["name"].focus();
                    return false;
                }
                
                if (username === null || username === "") {
                    $("#username").notify("Please enter your user name", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["username"].focus();
                    return false;
                }
                
                if (securityAnswer === null || securityAnswer === "") {
                    $("#securityAnswer").notify("Please enter answer for security question", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["RegisterStudent"]["securityAnswer"].focus();
                    return false;
                }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Student</title>
    </head>
    <body>
    <tr>
        <jsp:include page="navigationbar.jsp" />
    <div id="wrapper">
        <jsp:include page="header.jsp" />
        <div id="accordion" class="centerthis">
            <h3>Register Student</h3>
            <div class="centerthis">
                <form role="form" name="RegisterStudent" action="RegisterStudentConfirmation.jsp" onSubmit="return validate();" >
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text"  name="email" id="email" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="studentID">Student ID</label>
                        <input type="text" onkeypress="return isNumberKey(event)" name="studentID" id="studentID" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="name">Student Name</label>
                        <input type="text" name="name" id="name" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="username">User Name</label>
                        <input type="text" name="username" id="username" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="major">Major</label>
                        <select name="major" id="major" class="form-control" >
                            <option value="CSE">CSE</option>
                            <option value="SE">SE</option>
                            <option value="CPE">CPE</option>
                            <option value="Undecided">Undecided</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="securityQuestion">Security Question</label>
                        <select name="securityQuestion" id="securityQuestion" class="form-control" >
                            <option value="What was your childhood nickname?">What was your childhood nickname?</option>
                            <option value="What is the name of your favorite childhood friend?">What is the name of your favorite childhood friend?</option>
                            <option value="What is your favorite movie?">What is your favorite movie?</option>
                            <option value="What school did you attend for sixth grade?">What school did you attend for sixth grade?</option>
                        </select>
                    </div>
                     <div class="form-group">
                        <label for="securityAnswer">Security Question</label>
                        <input type="text" name="securityAnswer" id="securityAnswer" value="" class="form-control">                        
                    </div>
                    <div class="form-group">
                    	<div class="g-recaptcha" data-sitekey="6LetEh4TAAAAAL5P56hE-dl_98DnfW1uC7sgqA3R"></div>
                    </div>
                    <input type="submit" value="Register" id="registerBtn" class="btn btn-default">
                </form>
            </div>
        </div>
    </div>
    <br>
</body>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/schedule.js"></script>
</html>

