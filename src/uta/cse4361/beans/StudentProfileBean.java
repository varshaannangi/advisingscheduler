/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;
import static uta.cse4361.interfaces.Constants.SUCCESS_MESSAGE;

/**
 *
 * @author Nabin
 */
public class StudentProfileBean implements Constants {
	private String email = null;
	private String name = null;
	private String major = null;

	public StudentProfileBean() {
	}

	public String ChangeProfilePicture() {
		String Msg = SUCCESS_MESSAGE;
		DatabaseManager DM = new DatabaseManager();
		Msg = DM.updateUser(email, name, major);
		return Msg;

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

}
