/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author includetech
 */
public class ChangeAdvisorStatus extends RDBImplCommand {

	private String email;
	private String status;
	private String sqlQuery = "UPDATE USER SET Status = ? WHERE UserEmail = ?";

	public ChangeAdvisorStatus(String email, String status) {
		this.email = email;
		this.status = status;
	}

	@Override
	public void queryDB() throws SQLException {
		try {

			System.out.println("Inside Change Status Db");
			statement = conn.prepareStatement(sqlQuery);
			statement.setString(1, status);
			statement.setString(2, email);
			statement.executeUpdate();
			processResult();
		} catch (SQLException e) {
			System.out.println("Change Status Failed");
			e.printStackTrace();
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
