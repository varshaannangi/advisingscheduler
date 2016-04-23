/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;

/**
 *
 * @author includetech
 */
public class UpdateUser extends RDBImplCommand {
	private String email;
	private String name;
	private String major;

	private String sqlQuery = "UPDATE USER SET UserName = ?, UserEmail = ?, UserDepartment = ? WHERE UserEmail = ?";

	public UpdateUser(String email, String name, String major) {
		super();
		this.email = email;
		this.name = name;
		this.major = major;
	}

	@Override
	public void queryDB() throws SQLException {
		try {
			statement = conn.prepareStatement(sqlQuery);
			statement.setString(1, name);
			statement.setString(2, email);
			statement.setString(3, major);
			statement.setString(4, email);			
			statement.executeUpdate();
			processResult();
		} catch (SQLException e) {
			System.out.println("Update User query failed");
			conn.close();
		} finally {
			statement.close();
		}
	}

	@Override
	public void processResult() {
		result = "";
	}
}
