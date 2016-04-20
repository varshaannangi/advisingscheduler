<%-- 
    Document   : EditAccounts
    Created on : Feb 27, 2015, 3:40:20 PM
    Author     : Akshay
--%>

<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="uta.cse4361.databases.RDBImplCommand"%>
<%@page import="uta.cse4361.databases.GetUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            GetUsers users = new GetUsers();
            users.execute();
            
            HashMap<Integer,String> allUsers= users.getUsers();

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Accounts</title>
    </head>
    <body>
         <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
             <div id="accordion">
                <h3>All Accounts</h3>
                           <div>
                                <form  name="editAccount" action="EditAccount.jsp">
                                <table class="display" id="appointmentList" cellpadding= "3" cellspacing= "0" >
                                    <thead>

                                    <th>Id</th>
                                    <th>Name</th>

                                    <th></th>
                                    </thead>
                                    <tbody>
                                <%
                                      
                                    
                                    for(Map.Entry<Integer,String> entry:allUsers.entrySet()) {
                                        out.print("<tr>");
                                        out.print("<td>");
                                        out.print(entry.getKey());
                                        out.print("</td>");
                                        out.print("<td>");                                       
                                        out.print(entry.getValue()); 
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print("<input type='radio' name='apptID' value='" +entry.getKey()+"'>");
                                        out.print("</td>");
                                        out.print("</tr>");
                                        
                                    }
                                    %>
                                    </tbody>
                                </table>
                                <br>
                                   <input type="submit" value="Edit User" id="submitBtn" class="btn btn-default" class="btn btn-default">
                                </form>
                            </div>

             </div>
        </div>
    </body>
    <jsp:include page="footer.jsp" />
</html>
