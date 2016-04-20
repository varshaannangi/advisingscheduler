/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import java.sql.Timestamp;
import uta.cse4361.businessobjects.Appointment;

/**
 *
 * @author Han
 */
public class SaveBugReport extends RDBImplCommand {

    private String report;
    private String sqlQuery = "INSERT INTO bugreport (report, timestamp) VALUES (?, ?)";

    public SaveBugReport(String report) {
        super();
        this.report = report;
    }

    @Override
    public void queryDB() throws SQLException {
        try {
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, report);             
            statement.setTimestamp(2, new Timestamp(new java.util.Date().getTime()));
            statement.executeUpdate();
            processResult();
        } catch (SQLException e) {
            System.out.println("SaveBugReport query Failed");
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
