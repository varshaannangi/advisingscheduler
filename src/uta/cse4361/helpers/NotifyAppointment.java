package uta.cse4361.helpers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import uta.cse4361.businessobjects.Appointment;
import uta.cse4361.databases.DatabaseManager;

public class NotifyAppointment implements Runnable {

	@Override
	public void run() {
		DatabaseManager dbm = new DatabaseManager();
		ArrayList<Appointment> appointments = dbm.getAppointments();
		for (Appointment appointment : appointments) {
			int time = computeTime(appointment.getStartDateTime());
			if (time > 0 && time <= 60)
				sendRemainder(appointment.getStudentEmail(),
						dbm.getStudentAccount(appointment.getStudentEmail()).getPhoneNumber(),
						new SimpleDateFormat("MM/dd/yyyy").format(appointment.getDate()),
						new SimpleDateFormat("hh:mm a").format(appointment.getStartDateTime()),
						new SimpleDateFormat("hh:mm a").format(appointment.getEndDateTime()), appointment.getType());
		}

	}

	private int computeTime(Date startDate) {
		Calendar cal = Calendar.getInstance();		
		long secs = (startDate.getTime() - cal.getTime().getTime()) / 1000;
		int minutes = (int) (secs / 60);
		return minutes;
	}

	public void sendRemainder(String studentEmail, String phoneNumber, String advisingDate, String advisingStartTime,
			String advisingEndTime, String appointmentType) {
		try {
			String to = studentEmail;
			String subject = "You have an appointment with advisor";
			String body = "Appointment Date: " + advisingDate + "\nAppointment Type: " + appointmentType
					+ "\nStart Time: " + advisingStartTime + "\nEnd Time: " + advisingEndTime;
			String from = "maverickappointments@gmail.com";
			String pw = "gue#212!ns";
			String host = "smtp.gmail.com";
			String port = "465";
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.user", from);
			properties.put("mail.smtp.password", pw);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.socketFactory.port", "465");
			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

			Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("maverickappointments@gmail.com", "gue#212!ns");
				}
			});

			javax.mail.Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			if (!phoneNumber.isEmpty() && phoneNumber != null) {
				message.addRecipient(Message.RecipientType.BCC, new InternetAddress(phoneNumber + "@txt.att.net"));
				message.addRecipient(Message.RecipientType.BCC, new InternetAddress(phoneNumber + "@tmomail.net"));
			}
			message.setText(body);
			message.setSubject(subject);
			Transport.send(message);
			System.out.println("Message sent successfully.");
		} catch (Exception mex) {
			mex.printStackTrace();
		}
	}

	public static void sendCancelNotification(String studentEmail) {
		try {
			String to = studentEmail;
			String subject = "Appointment is canceled";
			String body = "Your Mav Appointment with Advisor is canceled. Please login to make new appointment.";
			String from = "maverickappointments@gmail.com";
			String pw = "gue#212!ns";
			String host = "smtp.gmail.com";
			String port = "465";
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.user", from);
			properties.put("mail.smtp.password", pw);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.socketFactory.port", "465");
			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

			Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("maverickappointments@gmail.com", "gue#212!ns");
				}
			});

			javax.mail.Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setText(body);
			message.setSubject(subject);
			Transport.send(message);
			System.out.println("Message sent successfully.");
		} catch (Exception mex) {
			mex.printStackTrace();
		}
	}
}