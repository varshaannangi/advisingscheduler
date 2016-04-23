/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import uta.cse4361.businessobjects.Appointment;
import uta.cse4361.businessobjects.Email;
import uta.cse4361.businessobjects.Slot;

import uta.cse4361.businessobjects.SlotFactory;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;

public class ManageGroupAppointmentsBean implements Constants {

	private Date date;
	private String emailMessage = "";

	public ManageGroupAppointmentsBean() {

	}

	public void sendGroupEmail() {
		DatabaseManager dbm = new DatabaseManager();
		ArrayList<Appointment> appointments = dbm.getAppointments();
		for (Appointment appointment : appointments) {
			Date appointmentDate = appointment.getDate();
			if (appointmentDate.getYear() == date.getYear() && appointmentDate.getMonth() == date.getMonth()
					&& appointmentDate.getDay() == date.getDay()) {

				Email emailClient = new Email();
				emailClient.sendSimpleEmail(appointment.getStudentEmail(),
						"Message from " + appointment.getAdvisorName(), emailMessage);
			}
		}
	}

	public void cancelGroupAppointments() {
		DatabaseManager dbm = new DatabaseManager();
		ArrayList<Appointment> appointments = dbm.getAppointments();
		for (Appointment appointment : appointments) {
			Date appointmentDate = appointment.getDate();
			if (appointmentDate.getYear() == date.getYear() && appointmentDate.getMonth() == date.getMonth()
					&& appointmentDate.getDay() == date.getDay()) {
			}

			dbm.modifyAppointment(appointment.getApptID(), null);
		}
	}

	// Setters
	public void setDate(Date d) {
		this.date = d;
	}

	public void setEmailMessage(String emailMessage) {
		this.emailMessage = emailMessage;
	}

	// Getters
	public Date getDate() {
		return this.date;
	}

	public String getEmailMessage() {
		return this.emailMessage;
	}
}
