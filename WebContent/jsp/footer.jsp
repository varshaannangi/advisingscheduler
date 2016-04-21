<%-- 
    Document   : footer
    Created on : Sep 12, 2014, 2:25:09 PM
    Author     : Melissa
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<footer id="footer" style="text-align: center">
    
    
    <script>
        function startTime() {
            var today = new Date();
            var hours = today.getHours();
            var minutes = today.getMinutes();
            var seconds = today.getSeconds();
            minutes = checkTime(minutes);
            seconds = checkTime(seconds);
            var time = document.getElementById('txt').innerHTML ="UTA Time " + hours + ":" + minutes + ":" + seconds;
            var t = setTimeout(startTime, 500);
        }
        function checkTime(x) {
            if (x < 10) {x = "0" + i};  // add zero in front of numbers < 10
            return x;
        }
    </script>
        <body onload="startTime()"/>
        <div id="txt"></div>
        </body>
    
    
        
        <div class = "ui-widget-header">
            © 2016 The University of Texas at Arlington
            701 S. Nedderman Drive, Arlington, TX 76019 
            817-272-2011
        </div>
    <div>       
          <a style="margin-right: 10px" href ="reportBug.jsp">Report a bug</a>
          <a style="margin-left: 10px;  margin-right: 10px" href ="Feedback.jsp">Give Feedback</a>
          <a style="margin-left:  10px" href ="Help.jsp">Help</a>
    </div>
        
        
        <!--<script type="text/javascript" src= "js/bootstrap.min.js"></script>-->
        <script type="text/javascript" src= "js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script> 
        <script type="text/javascript" src="js/notify.js"></script> 
        <script type="text/javascript" src= "js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="js/jquery.timepicker.js"></script>
        <script type="text/javascript" src= "js/bootstrap.js"></script>
        <script type="text/javascript" src= "js/bootbox.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.timepicker.css" />
    </footer>
</div>

