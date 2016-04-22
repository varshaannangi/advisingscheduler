/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.businessobjects;

import java.sql.Timestamp;

/**
 *
 * @author includetech
 */
public class StudentAccount {

	private String email = null;
	private int studentID = 0;
	private String tempPassword = null;
	private String tempPasswordString = null;
	private String name = null;
	private String username = null;
	private String major = null;
	private String securityQuestion = null;
	private String securityAnswer = null;
	private Timestamp timeStamp = null;
	private int rank = 100;

	public StudentAccount() {

	}

	public boolean initialize(String name, String email, String major, int ID, int rank, String securityQuestion, String securityAnswer, Timestamp timeStamp) {
		boolean result = true;

		if (name != null && !name.isEmpty() && email != null && !email.isEmpty() && major != null && !major.isEmpty()) {
			this.name = name;
			this.email = email;
			this.studentID = ID;
			this.major = major;
			this.rank = rank;
			this.timeStamp = timeStamp;
			this.securityQuestion = securityQuestion;
			this.securityAnswer = securityAnswer;
		} else {
			result = false;
		}

		return result;
	}

	public boolean initialize(String name, String tempPassword, String email, String uname, String major,
			String securityQuestion, String securityAnswer, int rank) {
		boolean result = true;

		if (name != null && !name.isEmpty() && email != null && !email.isEmpty() && major != null && !major.isEmpty()
				&& uname != null && !uname.isEmpty()) {
			this.name = name;
			this.email = email;
			this.username = uname;
			this.major = major;
			this.rank = rank;
			this.tempPasswordString = tempPassword;
			this.tempPassword = hashPassword(tempPassword);
			this.securityQuestion = securityQuestion;
			this.securityAnswer = securityAnswer;
		} else {
			result = false;
		}

		return result;
	}

	public static String hashPassword(String tempPassword) {
		int hash = tempPassword.hashCode();
		return Integer.toString(hash);
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the studentID
	 */
	public int getStudentID() {
		return studentID;
	}

	/**
	 * @param studentID
	 *            the studentID to set
	 */
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the major
	 */
	public String getMajor() {
		return major;
	}

	/**
	 * @param major
	 *            the major to set
	 */
	public void setMajor(String major) {
		this.major = major;
	}

	/**
	 * @return the rank
	 */
	public int getRank() {
		return rank;
	}

	/**
	 * @param rank
	 *            the rank to set
	 */
	public void setRank(int rank) {
		this.rank = rank;
	}

	/**
	 * @return the tempPassword
	 */
	public String getTempPassword() {
		return tempPassword;
	}

	/**
	 * @param tempPassword
	 *            the tempPassword to set
	 */
	public void setTempPassword(String tempPassword) {
		this.tempPassword = tempPassword;
	}

	/**
	 * @return the tempPasswordString
	 */
	public String getTempPasswordString() {
		return tempPasswordString;
	}

	/**
	 * @param tempPasswordString
	 *            the tempPasswordString to set
	 */
	public void setTempPasswordString(String tempPasswordString) {
		this.tempPasswordString = tempPasswordString;
	}

	public void setTimeStamp(Timestamp TimeStamp) {
		this.timeStamp = TimeStamp;
	}

	public Timestamp getTimeStamp() {
		return timeStamp;
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
