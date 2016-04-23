
<%@page import="uta.cse4361.businessobjects.StudentAccount"%>
<%@page import="uta.cse4361.businessobjects.Appointment"%>
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
                var sName = document.forms["schedule"]["sName"].value;
                var email = document.forms["schedule"]["email"].value;
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");               
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
                } 
                if (sName === null || sName === "") {
                    $("#sName").notify("Please enter your name", "error",
                            {elementPosition: 'bottom center',
                                globalPosition: 'bottom center'})
                    document.forms["schedule"]["sName"].focus();
                    return false;
                }                                   
        </script>
<script>
            window.onload = function () {
                var major = document.getElementById("major");               
                <%dm = new DatabaseManager();
			HashMap<String, ArrayList<User>> usersByRank = dm.getUsersByRank(1);%>
                  var departments = "<%=usersByRank.keySet()%>"
                  <%System.out.println(usersByRank.keySet());%>
                  optionMajor = document.createElement('option');
                  optionMajor.text = "Undecided";
                  major.add(optionMajor, 0);   
                  <%for (String department : usersByRank.keySet()) {%>
                     var optionMajor = document.createElement('option');
                     optionMajor.text = "<%=department%>";
                     major.add(optionMajor, 0);                     
			<%}%>            
             }   
        </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
	<%
		String email = "";
		String name = "";
		String profilePic = "";
		String picsPath = "";
		String thisEmail = (String) session.getAttribute("email");
		StudentAccount retrievedSA = dm.getStudentAccount(thisEmail);

		if (retrievedSA != null) {
			email = retrievedSA.getEmail();
			name = retrievedSA.getName();
			picsPath = request.getServletContext().getContextPath() + "/images/profile/" + name + ".jpg";
		}
	%>
	<jsp:include page="navigationbar.jsp" />
	<div id="wrapper">
		<jsp:include page="header.jsp" />
		<div id="accordion" class="centerthis">
			<h3>Schedule Appointment</h3>
			<div class="centerthis">
				<form method="post" name="profile"
					action="StudentProfileConfirmation.jsp"
					enctype="multipart/form-data" onSubmit="return validate();">
					<div class="form-group">
						<img name="profilePic" id="profilePic" src='<%=picsPath%>'
							style="width: 100px; height: 100px;" class="form-control">
						<input type="file" accept=".jpg" name="profilePicUpload"
							id="profilePicUpload">
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="text" name="email"
							id="email" value='<%=email%>' class="form-control">
					</div>
					<div class="form-group">
						<label for="sName">Student Name</label> <input type="text"
							name="sName" id="sName" value='<%=name%>' class="form-control">
					</div>
					<div class="form-group">
						<label for="major">Major</label> <select name="major" id="major"
							class="form-control"></select>
					</div>
					<input type="submit" value="Submit" id="submitBtn"
						class="btn btn-default"> <input type="reset" value="Reset"
						id="resetBtn" class="btn btn-default">
				</form>
			</div>
		</div>
			<h3>Appointments</h3>
			<div>
				<form name="allAppointments" action="CancelStudentAppointment.jsp">
					<table border="1" class="display" id="allAppointments"
						cellpadding="3" cellspacing="0">
						<col width="80">
						<col width="180">
						<col width="150">
						<col width="100">
						<col width="200">
						<col width="80">
						<thead>
							<th>Date</th>
							<th>Time</th>
							<th>Advisor Name</th>
							<th>Type</th>
							<th>Description</th>
						</thead>
						<tbody>
							<%
								String email1 = (String) session.getAttribute("email");
								ArrayList<Appointment> appts = dm.getAllUserAppointments(email1);
								for (Appointment a : appts) {
									out.print("<tr>");
									out.print("<td>");
									out.print(a.getDate());
									out.print("</td>");
									out.print("<td>");
									out.print(a.getStartHour() + ":");
									if (a.getStartMinute() == 0) {
										out.print("00");
									} else {
										out.print(a.getStartMinute());
									}
									out.print("--");
									out.print(a.getEndHour() + ":");
									if (a.getEndMinute() == 0) {
										out.print("00");
									} else {
										out.print(a.getEndMinute());
									}
									out.print("</td>");
									out.print("<td>");
									out.print(a.getAdvisorName());
									out.print("</td>");
									out.print("<td>");
									out.print(a.getType());
									out.print("</td>");
									out.print("<td>");
									out.print(a.getDescription());
									out.print("</td>");									
									out.print("</tr>");
									out.print("</script>");
								}
							%>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	<br>
</body>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/schedule.js"></script>
</html>
