
<%@page import="uta.cse4361.businessobjects.StudentAccount"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="uta.cse4361.businessobjects.User"%>
<%@page import="java.util.HashMap"%>
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


        <%
            DatabaseManager dm = new DatabaseManager();
//            ArrayList<Date> availableDates = dm.getDatesForAvailability();
            ArrayList<Slot> availableDates = dm.getAvailableSlots();
            ArrayList<String> availables = new ArrayList<String>();
            for (Slot s : availableDates) {
                int dd = s.getDate().getDate();
                int mm = s.getDate().getMonth() + 1;
                int yy = s.getDate().getYear() + 1900;
                String newRecord = "" + dd + "-" + mm + "-" + yy;
                availables.add(newRecord);
            }
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < availables.size(); i++) {
                sb.append(availables.get(i) + ",");
            }
        %>

        <script type="text/javascript">
            temp = "<%=sb.toString()%>";
            var availableDates = new Array();
            availableDates = temp.split(',', '<%=availables.size()%>');

            //alert("array: " + availableDates);
            function available(date) {
                dmy = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
                 
                if ($.inArray(dmy, availableDates) !== -1) {
                    return [true, "", "Available"];
                } else {
                    return [false, "", "unAvailable"];
                }
            }
            $(function () {
                $('#date').datepicker({beforeShowDay: available});
            })
        </script>


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
                var sID = document.forms["schedule"]["sID"].value;
                var sName = document.forms["schedule"]["sName"].value;
                var email = document.forms["schedule"]["email"].value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                var ddate = document.forms["schedule"]["date"].value;
                var dp = document.forms["schedule"]["description"].value;
                if (email === null || email === "") {
                    $("#email").notify("Please enter your email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["schedule"]["email"].focus();
                    return false;
                }
                if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
                    $("#email").notify("Please enter a valid email", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["schedule"]["email"].focus();
                    return false;
                }
                if(email.indexOf("mavs.uta.edu") > 0) {
                    if (sID === null || sID === "") 
                        $("#sID").notify("Please enter your student ID", "error",
                                {elementPosition: 'bottom center',
                                    globalPosition: 'bottom center'})
                        document.forms["schedule"]["sID"].focus();
                        return false;
                    }
                    if (isNaN(sID)) {
                        $("#sID").notify("Your student ID must be a number", "error",
                                {elementPosition: 'bottom center',
                                    globalPosition: 'bottom center'})
                        document.forms["schedule"]["sID"].focus();
                        return false;
                    }
                    if (sID.length !== 10) {
                        $("#sID").notify("Your student ID must be a 10-digit number", "error",
                                {elementPosition: 'bottom center',
                                    globalPosition: 'bottom center'})
                        document.forms["schedule"]["sID"].focus();
                        return false;
                    }
                    if (sID.indexOf("1000") === -1 && sID.indexOf("6000") === -1) {
                        $("#sID").notify("Your student ID should begin with 1000 or 6000", "error",
                                {elementPosition: 'bottom center',
                                    globalPosition: 'bottom center'})
                        document.forms["schedule"]["sID"].focus();
                        return false;
                    }
                } else {
                    sID = 0;
                }
                if (sName === null || sName === "") {
                    $("#sName").notify("Please enter your name", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["schedule"]["sName"].focus();
                    return false;
                }
                if (ddate === null || ddate === "") {
                    $("#date").notify("Please select your appointment date", "error",
                            {elementPosition: 'right middle',
                                globalPosition: 'right middle'})
//                    document.forms["schedule"]["date"].focus();
                    return false;
                }
                if (dp === null || dp === "") {
                    $("#description").notify("Please enter a proper description", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["schedule"]["description"].focus();
                    return false;
                }
            }
        </script>
        <script>
            window.onload = function () {
                var major = document.getElementById("major");
                var advisor = document.getElementById("advisor");
                <%dm = new DatabaseManager();                    
                  HashMap<String, ArrayList<User>> usersByRank = dm.getUsersByRank(1);%>
                  var departments = "<%=usersByRank.keySet()%>"
                  <% System.out.println(usersByRank.keySet()); %>
                  <% for(String department : usersByRank.keySet()) { %>
                     var optionMajor = document.createElement('option');
                     optionMajor.text = "<%=department%>";
                     major.add(optionMajor, 0);
                     <% for(User u: usersByRank.get(department)) { %>
                        var optionAdvisor = document.createElement('option');
                        optionAdvisor.text = "<%=u.getName() +"," + u.getEmail()%>";
                        advisor.add(optionAdvisor, 0);
                 <% }} %>
                 optionMajor = document.createElement('option');
                 optionMajor.text = "Undecided";
                 major.add(optionMajor, 0);    
             }   
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Appointment</title>
    </head>
    <body>
        <%
            String email = "";
            String name = "";
            String thisEmail = (String)session.getAttribute("email");
            StudentAccount retrievedSA = dm.getStudentAccount(thisEmail);
            
            if(retrievedSA != null)
            {
                email = retrievedSA.getEmail();
                name = retrievedSA.getName();
            }
        %>
    <tr>
        <jsp:include page="navigationbar.jsp" />
    <div id="wrapper">
        <jsp:include page="header.jsp" />
        <div id="accordion" class="centerthis">
            <h3>Schedule Appointment</h3>
            <div class="centerthis">
                <form role="form" name="schedule" action="StudentCalendar.jsp" onSubmit="return validate();" >
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text"  name="email" id="email" value='<%=email%>' class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="sID">Student ID</label>
                        <input type="text" onkeypress="return isNumberKey(event)" name="sID" id="sID" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="sName">Student Name</label>
                        <input type="text" name="sName" id="sName" value='<%=name%>' class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="major">Major</label>
                        <select name="major" id="major" class="form-control"></select>
                    </div>
                    <div class="form-group">
                        <label for="advisor">Advisor</label>
                        <select name="advisor" id="advisor" class="form-control"> </select>
                        
                    </div>
                    <div class="form-group">
                        <label for="type">Advising Type</label>
                        <select name="type" id="type" class="form-control">
                            <option value="New Student">New Student</option>
                            <option value="Returning Student">Returning Student</option>
                            <option value="Drop Course">Drop Course</option>
                            <option value="Enroll">Enroll</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="date">Date</label>
                        <input type="text" name="date"  id="date" readonly="false" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea name="description" id="description"  value="" class="form-control"></textarea>
                    </div>
                    <input type="submit" value="Submit" id="submitBtn" class="btn btn-default">
                    <input type="reset" value="Reset" id="resetBtn" class="btn btn-default">
                </form>
            </div>
        </div>
    </div>
    <br>
</body>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/schedule.js"></script>
</html>
