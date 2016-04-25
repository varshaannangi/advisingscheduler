/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.io.InputStream;
import java.sql.SQLException;
import java.sql.Timestamp;
import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.businessobjects.StudentAccount;

/**
 *
 * @author Andrew
 */
public class GetAnyUser extends RDBImplCommand{
    private String email;
    private String sqlQuery = "SELECT * FROM USER WHERE UserEmail = ?";
    
    public GetAnyUser(String email){
        this.email = email;
    }
    
    public void queryDB() throws SQLException{
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            processResult();
        }
        catch (SQLException e) {
            System.out.println("GetAdvisor failed");
            conn.close();
        } finally {
            statement.close();
        }
    }
    
    public void processResult(){
        try{
            
            if(resultSet.next()){
                String name = resultSet.getString("Name");
                String email = resultSet.getString("UserEmail");
                String phoneNumber = resultSet.getString("PhoneNumber");
                String department = resultSet.getString("UserDepartment");
                int ID = resultSet.getInt("UserID");
                int rank = resultSet.getInt("UserRank");
                String securityQuestion = resultSet.getString("SecurityQuestion");
                String securityAnswer = resultSet.getString("SecurityAnswer");
                Timestamp timeStamp = resultSet.getTimestamp("TimeStamp");
                String status = resultSet.getString("Status");
                if(rank == 0)
                {
                    result = new AdvisorAccount();
                    ((AdvisorAccount)result).initialize(name, email, department, ID, rank, status);
                }
                else if(rank == 2 || rank == 9)
                {
                    result = new StudentAccount();
                    ((StudentAccount)result).initialize(name, email, phoneNumber, department, ID, rank, securityQuestion, securityAnswer, timeStamp);
                }
            }
            else{
                result = null;
            }
        }
        catch(SQLException e){
            System.out.println("Get Any User process failed");
        }
    }
}
