<div id="navbar">
    <%
        int rank = -1;
        int sessionid = -1;
        if (!(session.getAttribute("id") == null)) {
            sessionid = Integer.parseInt((String) session.getAttribute("id"));
            //System.out.println("Inside the first session "+sessionid);
        }
        if (!(session.getAttribute("rank") == null)) {
            rank = Integer.parseInt((String) session.getAttribute("rank"));
            //System.out.println("Inside the rank "+rank);
        }
    %>
    <ul class="navigation">
        <li class="home">
            <a href="index.jsp" >Home</a>
        </li>
        <%
            if (session.getAttribute("rank") == null) {

            } else {

                if (rank == 1) {
                    out.print("<li class='dropdown'>"
                            +"<a class='dropdown-toggle' data-toggle='dropdown' href='#'> Accounts <span class='caret'></span></a>" 
                            +"<ul class='dropdown-menu'>"
                            +"<li><a href='CreateAccount.jsp' >Create Account</a></li><br>"
                            +"<li><a href='EditAccounts.jsp' >Edit Accounts</a></li>"
                            +"</ul>"
                            + "</li>");
                }
               
                if (rank == 0) {
                    out.print("<li class='calendar'>"
                            + "<a href='AdvisorCalendar.jsp' >Calendar</a>"
                            + "</li>");
                    out.print("<li class='timeslot'>"
                            + "<a href='modifyTimeslot.jsp' >Time slot</a>"
                            + "</li>");
                    out.print("<li class='appointment'>"
                            + "<a href='modifyAppointment.jsp' >Appointment</a>"
                            + "</li>");
                }
              
                if ( rank == 2 || rank ==9){
                            out.print("<li class='dropdown'>"
                            +"<a class='dropdown-toggle' data-toggle='dropdown' href='#'> Appointments <span class='caret'></span></a>" 
                            +"<ul class='dropdown-menu'>"
                            +"<li><a href='schedule.jsp' >Make an Appointment</a></li><br>"
                            +"<li><a href='CheckAppointments.jsp' >Check Appointments</a></li>"
                            +"</ul>"
                            + "</li>");
                            
                            out.print("<li class='studentaccount'>"
                            + "<a href='ChangePassword.jsp' >Change Password</a>"
                            + "</li>"); 
                            
                            out.print("<li class='profile'>"
                                    + "<a href='StudentProfile.jsp' >Profile</a>"
                                    + "</li>");     
                }
               
                if (rank == 1 || rank == 0 || rank == 2 || rank ==9) {
                    out.print("<li class='logout'>"
                            + "<a href='logout.jsp' >Log Out</a>"
                            + "</li>");                      
                }
                
            }
           // if ((session.getAttribute("id") == null) || (session.getAttribute("rank") == null )) {

                //out.print("<li class='schedule'>"
                    // + "<a href='schedule.jsp' >Schedule Appointment</a>"
                     //   + "</li>");
           // }
            //out.print("<li class='account'>"
              //      + "<a href='http://www.uta.edu/uta/' >UTA</a>"
                //    + "</li>");
            //out.print("<li class='account'>"
              //      + "<a href='https://sis-portal-prod.uta.edu/psp/AEPPRD/EMPLOYEE/EMPL/h/?tab=PAPP_GUEST' >MY MAV</a>"
                //    + "</li>");
        %>         
        <li class="dropdown" >
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Helpful Links <span class="caret"></span></a>
          <ul class="dropdown-menu" style="text-align: center">
              <li><a href="https://sis-portal-prod.uta.edu/psp/AEPPRD/EMPLOYEE/EMPL/h/?tab=PAPP_GUEST"> My Mav</a></li><br>
              <li><a href="http://www.uta.edu/uta/"> UTA </a></li><br>
              <li><a href="http://www.uta.edu/uta/academics/colleges.php">Departments</a></li><br>
              <li><a href="https://www.uta.edu/uta/acadcal.php">Academic Calendar</a></li>              
          </ul>
        </li>
        <form>
                <input id="sbox" name="searchBox" 
                       style=" position: absolute; 
                               width: 140px; 
                               height: 32px; 
                               margin-top:-42px; 
                               margin-left: 370px;" 
                       type="text" 
                       placeholder="Search">
                <input onclick="reDirect()" 
                       id="sb" name="searchButton" 
                       style=" position: absolute;
                               padding-bottom: 20px;
                               width: 80px; 
                               height: 20px;
                               margin-top:-38px; 
                               margin-left: 530px;" 
                       type="button" 
                       value="Search">
                <script>                                                           
                    function reDirect(){
                        var x = document.getElementById('sbox').value;
                        var y = "https://www.google.com/?gws_rd=ssl#q="
                        var z = y.concat(x)
                       window.location.assign(z);
                    }
                </script>
        </form>
    </ul>            
</div>
