<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page import="uta.cse4361.businessobjects.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.rmi.server.UID"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.ParseException"%>
<%@page contentType="text/calendar" pageEncoding="UTF-8"%>

<%
	DatabaseManager dbm = new DatabaseManager();
	StringBuffer sb = new StringBuffer();
	ArrayList<Appointment> appointments = dbm.getAllUserAppointments(request.getParameter("u"));
	StringBuffer buffer = sb.append("BEGIN:VCALENDAR\r\n"
			+ "PRODID:-//Microsoft Corporation//Outlook 9.0 MIMEDIR//EN\r\n" + "VERSION:2.0\r\n"
			+ "METHOD:PUBLISH\r\n" + "BEGIN:VTIMEZONE\r\n" + "TZID:Central Standard Time\r\n"
			+ "BEGIN:STANDARD\r\n" + "DTSTART:16011104T020000\r\n"
			+ "RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11\r\n" + "TZOFFSETFROM:-0500\r\n" + "TZOFFSETTO:-0600\r\n"
			+ "END:STANDARD\r\n" + "BEGIN:DAYLIGHT\r\n" + "DTSTART:16010311T020000\r\n"
			+ "RRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3\r\n" + "TZOFFSETFROM:-0600\r\n" + "TZOFFSETTO:-0500\r\n"
			+ "END:DAYLIGHT\r\n" + "END:VTIMEZONE\r\n");

	for (Appointment appoint : appointments) {
		UID uid = new UID();

		String startTime = new SimpleDateFormat("yyyyMMdd'T'HHmmss").format(appoint.getStartDateTime());
		String endTime = new SimpleDateFormat("yyyyMMdd'T'HHmmss").format(appoint.getEndDateTime());
		sb.append("BEGIN:VEVENT\r\n" + "DTSTART;TZID=Central Standard Time:" + startTime + "00\r\n"
				+ "DTEND;TZID=Central Standard Time:" + endTime + "00\r\n" + "LOCATION:Advisor Office\r\n"
				+ "TRANSP:OPAQUE\r\n" + "SEQUENCE:0\r\n" + "UID:" + uid + "\r\n" + "DTSTAMP:20141118T120102\r\n"
				+ "CATEGORIES:Meeting\r\n" + "SUMMARY:Appointment with advisor\r\n" + "PRIORITY:1\r\n"
				+ "CLASS:PUBLIC\r\n" + "BEGIN:VALARM\r\n" + "TRIGGER:PT1440M\r\n" + "ACTION:DISPLAY\r\n"
				+ "DESCRIPTION:Reminder\r\n" + "END:VALARM\r\n" + "END:VEVENT\r\n");
	}
	sb.append("END:VCALENDAR");
	System.out.println(sb);
	response.setHeader("Content-Disposition", "attachment; filename=calendar.ics");
	out.print(sb.toString());
%>