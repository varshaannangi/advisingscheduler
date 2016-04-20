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
public class DeleteUser extends RDBImplCommand{
   private String email;
    private String sqlQuery = "DELETE FROM USER WHERE UserEmail = ?";
    
    public DeleteUser(String email) {
        super();
        this.email = email;
    }

    @Override
    public void queryDB() throws SQLException {
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setString(1, this.email);
            statement.executeUpdate();
            processResult();
        }
        catch (SQLException e){
            System.out.println("Delete User query failed");
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
