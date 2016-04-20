/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 *
 * @author Akshay
 */
public class GetUsers extends RDBImplCommand {
     
    private HashMap<Integer,String> users ;
    
    public HashMap<Integer,String> getUsers(){
        return users;
    }
    
    public void setUsers(HashMap<Integer,String> rs){
        this.users=rs;
    }
    
    private String sqlQuery = "SELECT * FROM USER";
    
    public void queryDB() throws SQLException{
        
        try{
            statement = conn.prepareStatement(sqlQuery);
            ResultSet rs =statement.executeQuery();
            HashMap<Integer,String> userMap = new HashMap<Integer,String>();
            while(rs.next()){
                userMap.put(rs.getInt("UserId"),rs.getString("UserName"));
            }
            setUsers(userMap);
        }
        catch(SQLException e){
        System.out.println("No user found exception");
            conn.close();
        } finally {
            statement.close();
        }
    }

    @Override
    public void processResult() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
