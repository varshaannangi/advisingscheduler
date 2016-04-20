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
public class EditAdvisorEmailSetting extends RDBImplCommand{
   private String setting;
   private String email;

    private String sqlQuery = "UPDATE USER SET isEmailOn = ? WHERE UserEmail = ?";
    
    
    
    public EditAdvisorEmailSetting (String email, String setting) {
        super();
        this.email = email;
        this.setting = setting;
    }

    @Override
    public void queryDB() throws SQLException {
        try {
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, this.setting);
            statement.setString(2, this.email);
            statement.executeUpdate();
            processResult();
        } catch (SQLException e) {
            System.out.println("Edit Email Setting query failed");
        } finally {
            statement.close();
        }
    }

    @Override
    public void processResult() {
        result = "";
    }
     
}
