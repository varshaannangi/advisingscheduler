<%-- 
    Document   : EditAccount
    Created on : Feb 27, 2015, 3:37:26 PM
    Author     : Akshay
--%>

<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.beans.CreateAdvisorAccountBean"%>
<%@page import="uta.cse4361.databases.GetUser"%>
 <%@page import="java.util.*"%>
 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <%
            //Uncomment when there's a proper way to create an admin account
                //this code redirects anyone who is not an admin back to the index page
            int rank = -1;
            int sessionid = -1;
            if ((session.getAttribute("id") == null) || (session.getAttribute("rank") == null)) {
               response.sendRedirect("index.jsp");
            }
            if (!(session.getAttribute("id") == null)) {
                    sessionid = Integer.parseInt((String) session.getAttribute("id"));
                }
                if (!(session.getAttribute("rank") == null)) {
                    rank = Integer.parseInt((String) session.getAttribute("rank"));
            }
            if(rank != 1){
                    response.sendRedirect("index.jsp");
            }
        %>
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    
        <script type="text/javascript">
                        function emailNotifChange()
                        {
                            var email1 = document.forms["editAccount"]["email"].value;
                           var ele = document.getElementsByName("emailNotif");
                            var i = ele.length;
                            var isChecked = "0";
                            for (var j = 0; j < i; j++) {
                            if (ele[0].checked) 
                            {
                                isChecked = "1";
                                break;
                            }
                            } 
                          return isChecked;
                        }
                    </script>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="accordion">
                <h3>Edit Account</h3>
                
                 <%
                        if (request.getParameter("apptID") == null || request.getParameter("apptID)") == "" || request.getParameter("apptID").equals("")) {
                            response.sendRedirect("EditAccounts.jsp");
                        } else {
                            
                        //System.out.println("Fetcing data");
                            System.out.println("app id "+Integer.parseInt(request.getParameter("apptID")));
                        GetUser user = new GetUser(Integer.parseInt(request.getParameter("apptID")));
                        user.execute();
            System.out.println("Fetcing44444444 data");
                        HashMap<Integer,String> allUsers= user.getUser();
                        String arr[]=allUsers.get(Integer.parseInt(request.getParameter("apptID"))).split(";");
                        String userEmail = arr[2];
                        System.out.println(userEmail);
                        String userName = arr[3];
                        String userPassword = arr[4];
                        String userDept = arr[0];
                        int userRank = Integer.parseInt(arr[1]);
                        String isEmailOn = "1";
                        if(userRank == 0)
                            isEmailOn = arr[5];
                       System.out.println(userEmail+":"+userName+":"+userPassword+":"+userDept+":"+userRank);
                    %>

                <form role="form" name="editAccount" id="create"  onSubmit="return validate();" action="EditAccount.jsp" method="POST">
                   
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input class="form-control" type="text" name="email" id="email" value="<%=userEmail%>">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password" value="<%=userPassword%>">
                    </div>
                     
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input class="form-control" type="text" name="name" id="name" value="<%=userName%>">
                    </div>
                     
                     <div class="form-group">
                        <label for="name">Department</label>
                        <input class="form-control" type="text" name="dept" id="dept" value="<%=userDept%>">
                    </div>
                    
                    <div class="form-group">
                        <label for="name">Rank</label>
                        <input class="form-control" type="text" name="rank" id="rank" value="<%=userRank%>">
                    </div>
         
                    <div class="centerthis">
                        <input type="submit" value="Edit Account" id="submitBtn" class="btn btn-default">
                    </div>
                    </form>
                    <form role="form" name="deleteUser" action="DeleteConfirmation.jsp">
                        <div  class="centerthis">
                           <input class="form-control" type="hidden" name="email" id="email" value="<%=userEmail%>">
                           <input type="submit" value="Delete User" id="deleteBtn" class="btn btn-default" class="btn btn-default">
                               
                        </div>
                    </form>
                    <form role="form" name="editNotif" action="ChangeEmailNotifConfirmation.jsp">
                     <% if(userRank == 0){ %>
                    <div class="centerthis">
                        <% if(isEmailOn.equals("1")){%>
                              <input class="form-control" type="hidden" name="emailSetting" id="email" value="0">
                              <input class="form-control" type="hidden" name="email" id="email" value="<%=userEmail%>">
                              <input type="submit" value="Turn Off Email Notifications" id="submitBtn" class="btn btn-default">
                            <% } else {%>
                                <input class="form-control" type="hidden" name="emailSetting" id="email" value="1">
                                <input class="form-control" type="hidden" name="email" id="email" value="<%=userEmail%>">
                                <input type="submit" value="Turn On Email Notifications" id="submitBtn" class="btn btn-default">
                            <%}%>
                    </div>
                    <%}%>
                   </form>

                        
     
                    <%}%>
            </div>
        </div>
    
    <jsp:include page="footer.jsp" />
    

