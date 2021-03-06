/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import java.sql.Timestamp;
import java.util.Calendar;
import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.businessobjects.Email;
import uta.cse4361.businessobjects.StudentAccount;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;

/**
 *
 * @author Nabin
 */
public class LogInBean implements Constants {
	private String email = null;
	private String password = null;
	private String securityQuestion = null;
	private String securityAnswer = null;

	public LogInBean() {
	}

	public String LogIn() {
		String Msg = SUCCESS_MESSAGE;
		DatabaseManager DM = new DatabaseManager();
		System.out.println("Email " + this.email + " Password :" + this.password);
		Msg = DM.validate(this.email, this.password);
		return Msg;
	}

	public boolean UpdatePassword() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		Timestamp updateTime = Timestamp.valueOf(year + "-06-02 12:00:00.0");
		DatabaseManager dm = new DatabaseManager();
		StudentAccount sd = dm.getStudentAccount(email);
		Timestamp lastUpdateTime = sd.getTimeStamp();
		if ((updateTime.getTime() - lastUpdateTime.getTime()) / (24 * 60 * 60 * 1000) >= 365) {
			return true;
		} else {
			return false;
		}
	}

	public String ForgotPassword() {
		String Msg = SUCCESS_MESSAGE;
		DatabaseManager dm = new DatabaseManager();
		if (dm.getAnyAccount(email) == null) {
			Msg = "Incorrect";
			return Msg;
		}
		StudentAccount sa = dm.getStudentAccount(email);
		if(sa.getSecurityQuestion().equals(securityQuestion)&& sa.getSecurityAnswer().equals(securityAnswer))
		{
			String link = "http://localhost:8080/AdvisingScheduler/ChangePassword.jsp?u=" + email;
			Email emailClient = new Email();
			emailClient.sendSimpleEmail(email, "Reset password",
					"Please click the below link to reset your password,\n" + link);
		}
		else
		{
			Msg = "Incorrect details provided. Please check the details and try again";
		}
		
		return Msg;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = AdvisorAccount.hashPassword(password);
	}
	
	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getSecurityAnswer() {
		return securityAnswer;
	}

	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}


}
