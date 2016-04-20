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
public class ChangePassword extends RDBImplCommand{
    
    private String email;
    private String password;
    private String sqlQuery = "UPDATE USER SET UserPassword = ?,UserRank = ?,TimeStamp=?  WHERE UserEmail = ?"; 
    
    public ChangePassword(String email, String password){
        this.email = email;
        this.password = password;
    }

    @Override
    public void queryDB() throws SQLException {
        try{
           
            System.out.println("Inide change Password Db");
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, password);
            statement.setInt(2, 2); // Set as Student
            statement.setTimestamp(3,new Timestamp(new java.util.Date().getTime()));
            statement.setString(4, email);
            statement.executeUpdate();
            processResult();
        }
        catch (SQLException e){
            System.out.println("Change Password Failed");
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
