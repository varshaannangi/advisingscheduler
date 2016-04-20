/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import uta.cse4361.beans.CreateAdvisorAccountBean;

/**
 *
 * @author Akshay
 */
public class GetUser extends RDBImplCommand {
    
    public int id;
    
    
    public GetUser(){
        
    }
    public GetUser(int id){
        this.id=id;
    }
    
    private HashMap<Integer,String> user ;
    
    public HashMap<Integer,String> getUser(){
        return user;
    }
    
    public void setUser(HashMap<Integer,String> rs){
        this.user=rs;
    }
    
    private String sqlQuery = "SELECT * FROM USER WHERE UserId = ?";
    
    public void queryDB() throws SQLException{
        
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, id);
            
            ResultSet rs =statement.executeQuery();
            HashMap<Integer,String> userMapping = new HashMap<Integer,String>();
            while(rs.next()){
                StringBuilder sb = new StringBuilder();
                 
                sb.append(rs.getString("UserDepartment"));
                sb.append(";");
                sb.append(rs.getInt("UserRank"));
                sb.append(";");
                sb.append(rs.getString("UserEmail"));
                sb.append(";");
                sb.append(rs.getString("UserName"));
                sb.append(";");
                sb.append(rs.getString("UserPassword"));
                if(rs.getInt("UserRank") == 0)
                {
                    sb.append(";");
                    sb.append(rs.getString("isEmailOn"));
                }
                System.out.println(sb.toString());
                userMapping.put(rs.getInt("UserId"),sb.toString());

                
            }
            setUser(userMapping);
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
