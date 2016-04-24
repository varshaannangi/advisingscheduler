/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import java.util.ArrayList;

import uta.cse4361.businessobjects.AdvisorAccount;

/**
 *
 * @author Andrew
 */
public class GetAdvisors extends RDBImplCommand {
	private String sqlQuery = "SELECT * FROM USER WHERE UserRank = 0";
	private ArrayList<AdvisorAccount> advisors;

	public GetAdvisors() {
		advisors = new ArrayList<AdvisorAccount>();
	}

	public void queryDB() throws SQLException {
		try {
			statement = conn.prepareStatement(sqlQuery);
			resultSet = statement.executeQuery();
			processResult();
		} catch (SQLException e) {
			System.out.println("GetAdvisor failed");
			conn.close();
		} finally {
			statement.close();
		}
	}

	public void processResult() {
		result = null;
		try {
			while (resultSet.next()) {
				String name = resultSet.getString("Name");
				String email = resultSet.getString("UserEmail");
				String department = resultSet.getString("UserDepartment");
				int ID = resultSet.getInt("UserID");
				int rank = resultSet.getInt("UserRank");
				String status = resultSet.getString("Status");
				AdvisorAccount advisor = new AdvisorAccount();
				advisor.initialize(name, email, department, ID, rank, status);
				advisors.add(advisor);
			}
			result = advisors;

		} catch (SQLException e) {
			System.out.println("Get Advisor process failed");
		}
	}
}
