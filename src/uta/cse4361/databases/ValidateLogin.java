/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Andrew
 */
public class ValidateLogin extends RDBImplCommand {

	private String email;
	private String password;
	private String sqlQuery = "SELECT * FROM USER WHERE UserEmail = ? AND UserPassword = ?";

	public ValidateLogin(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public void queryDB() throws SQLException {
		try {
			System.out.println("Inide quesry Db");
			statement = conn.prepareStatement(sqlQuery);
			statement.setString(1, email);
			statement.setString(2, password);
			resultSet = statement.executeQuery();
			processResult();
		} catch (SQLException e) {
			System.out.println("ValidateLogin Failed");
			conn.close();
		} finally {
			statement.close();
		}
	}

	public void processResult() {
		try {
			result = "Invalid login";

			if (resultSet.next()) {
				int ID = resultSet.getInt("UserID");
				int rank = resultSet.getInt("UserRank");
				int loginFails = resultSet.getInt("LoginFails");
				if (loginFails > 3) {
					result = "locked";
				} else {
					String query = "UPDATE USER SET LoginFails = ? WHERE UserEmail = ?";
					statement = conn.prepareStatement(query);
					statement.setInt(1, 0);
					statement.setString(2, email);
					statement.executeUpdate();
					result = "" + ID + rank;
				}
			} else {
				String query = "SELECT LoginFails from USER WHERE UserEmail = ?";
				statement = conn.prepareStatement(query);
				statement.setString(1, email);
				ResultSet resultFails = statement.executeQuery();
				int fails = 0;
				if (resultFails.next()) {
					fails = resultFails.getInt(1);
				}

				query = "UPDATE USER SET LoginFails = ? WHERE UserEmail = ?";
				statement = conn.prepareStatement(query);
				statement.setInt(1, ++fails);
				statement.setString(2, email);
				statement.executeUpdate();
			}
		} catch (SQLException e) {
			System.out.println("ValidateLogin failed");
		}
	}
}
