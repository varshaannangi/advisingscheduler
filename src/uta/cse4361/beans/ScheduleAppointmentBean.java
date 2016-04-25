/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import uta.cse4361.businessobjects.Appointment;
import uta.cse4361.businessobjects.Scheduler;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;
//import javax.mail.*;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;

/**
 *
 * @author Han
 */
public class ScheduleAppointmentBean implements Constants {

	private String studentMajor = null;
	private String studentName = null;
	private String studentID = null;
	private String studentEmail = null;
	private String advisorName = null;
	private String description = null;
	private String type = null;
	private int startHour = 0;
	private int startMinute = 0;
	private int endHour = 0;
	private int endMinute = 0;
	private Date date = null;
	private String advisorEmail = null;
	private String advisor = null;
	private String priority = null;

	public ScheduleAppointmentBean() {

	}

	public String scheduleAppointment() {
		String msg = SUCCESS_MESSAGE;
		Appointment a = new Appointment();
		boolean r = a.initialize(this.studentMajor, this.studentName, this.studentID, this.studentEmail,
				this.advisorName, this.type, this.description, this.date, this.startHour, this.endHour,
				this.startMinute, this.endMinute, Constants.EMAIL_REQUEST, this.advisorEmail, this.priority);
		if (r == false) {
			return this.INITIALIZE_APPOINTMENT_FAIL;
		}
		DatabaseManager dm = new DatabaseManager();
		ArrayList<Appointment> appointments = dm.getAllUserAppointments(studentEmail);
		Calendar now = Calendar.getInstance();
		now.set(2016, Calendar.APRIL, 25, 0, 0, 0);
		int totalAppointments = 0;
		for (Appointment appointment : appointments) {
			Calendar appDate = Calendar.getInstance();
			appDate.setTime(appointment.getDate());

			if ((now.get(Calendar.YEAR) == appDate.get(Calendar.YEAR)
					&& now.get(Calendar.MONTH) == appDate.get(Calendar.MONDAY)
					&& now.get(Calendar.DAY_OF_MONTH) == appDate.get(Calendar.DAY_OF_MONTH)) ||
					now.get(Calendar.WEEK_OF_MONTH) == appDate.get(Calendar.WEEK_OF_MONTH)) {
				totalAppointments++;
				if (totalAppointments > 1) {
					msg = "Mutiple appointments";
					return msg;
				}
			}
		}
		Scheduler s = new Scheduler();
		msg = s.schedule(a);
		return msg;
	}

	public String addToWaitlist(){
		String msg = SUCCESS_MESSAGE;
		Appointment a = new Appointment();
		boolean r = a.initialize(this.studentMajor, this.studentName, this.studentID, this.studentEmail,
				this.advisorName, this.type, this.description, this.date, this.startHour, this.endHour,
				this.startMinute, this.endMinute, Constants.EMAIL_REQUEST, this.advisorEmail, this.priority);
		if (r == false) {
			return this.INITIALIZE_APPOINTMENT_FAIL;
		}
		DatabaseManager dm = new DatabaseManager();
		dm.addToWaitlist(a);
		return msg;
	}
	
	public String generateStudentMessage() {
		String message = "";
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String dd = sdf.format(date);
		message = "You have an appointment with " + advisorName + " at " + dd + " from " + startHour + ":" + startMinute
				+ " to " + endHour + ":" + endMinute;
		return message;
	}

	public String generateAdvisorMessage() {
		String message = "";
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String dd = sdf.format(date);
		message = "You have an appointment with " + studentName + " at " + dd + " from " + startHour + ":" + startMinute
				+ " to " + endHour + ":" + endMinute;
		message += " for the following issues: \n" + description;
		return message;
	}

	// Setters
	public void setStudentMajor(String sMajor) {
		this.studentMajor = sMajor;
	}

	public void setStudentName(String sName) {
		this.studentName = sName;
	}

	public void setStudentID(String sID) {
		this.studentID = sID;
	}

	public void setStudentEmail(String sEmail) {
		this.studentEmail = sEmail;
	}

	public void setAdvisorName(String aName) {
		this.advisorName = aName;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setDescription(String dp) {
		this.description = dp;
	}

	public void setDate(Date d) {
		this.date = d;
	}

	public void setStartHour(int sH) {
		this.startHour = sH;
	}

	public void setEndHour(int eH) {
		this.endHour = eH;
	}

	public void setStartMinute(int sM) {
		this.startMinute = sM;
	}

	public void setEndMinute(int eM) {
		this.endMinute = eM;
	}

	public void setAdvisorEmail(String aEmail) {
		this.advisorEmail = aEmail;
	}

	public void setAdvisor(String a) {
		setAdvisorName(a.substring(0, a.indexOf(",")).trim());
		setAdvisorEmail(a.substring(a.indexOf(",") + 1).trim());
		advisor = a;
	}
	
	public void setPriority(String priority) { 
        this.priority = priority;
    }
	
	// Getters
	public String getStudentMajor() {
		return this.studentMajor;
	}

	public String getStudentName() {
		return this.studentName;
	}

	public String getStudentID() {
		return this.studentID;
	}

	public String getStudentEmail() {
		return this.studentEmail;
	}

	public String getType() {
		return this.type;
	}

	public String getAdvisorName() {
		return this.advisorName;
	}

	public String getDescription() {
		return this.description;
	}

	public int getStartHour() {
		return this.startHour;
	}

	public int getEndHour() {
		return this.endHour;
	}

	public int getStartMinute() {
		return this.startMinute;
	}

	public int getEndMinute() {
		return this.endMinute;
	}

	public Date getDate() {
		return this.date;
	}

	public String getAdvisorEmail() {
		return this.advisorEmail;
	}

	public String getAdvisor() {
		return this.advisor;
	}
	public String getPriority() {
        return this.priority;
    }
}
