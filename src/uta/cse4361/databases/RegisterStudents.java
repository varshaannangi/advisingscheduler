/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.SQLException;
import java.sql.Timestamp;
import uta.cse4361.businessobjects.StudentAccount;

/**
 *
 * @author includetech
 */
public class RegisterStudents extends RDBImplCommand{
    
    private StudentAccount sa;
    private String sqlQuery = "INSERT INTO USER(UserEmail, UserPassword,"
            + " UserName, UserDepartment, UserRank, TimeStamp, SecurityQuestion, SecurityAnswer) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    public RegisterStudents(StudentAccount sa){
        this.sa = sa;
    }

    @Override
    public void queryDB() throws SQLException {
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, sa.getEmail());
            statement.setString(2, sa.getTempPassword());
            statement.setString(3, sa.getUsername());
            statement.setString(4, sa.getMajor());
            statement.setInt(5, sa.getRank());
            statement.setTimestamp(6,new Timestamp(new java.util.Date().getTime()));
            statement.setString(7, sa.getSecurityQuestion());
            statement.setString(8, sa.getSecurityAnswer());
            statement.executeUpdate();
            processResult();
        }
        catch(SQLException e){
        System.out.println("StudentAdvisor Failed");
            conn.close();
        } finally {
            statement.close();
        }
    }

    @Override
    public void processResult() {
        result ="";
    }
    
}
