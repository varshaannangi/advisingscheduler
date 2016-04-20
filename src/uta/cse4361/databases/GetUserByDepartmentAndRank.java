/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import uta.cse4361.businessobjects.User;

/**
 *
 * @author Ethan Bowen
 */
public class GetUserByDepartmentAndRank extends RDBImplCommand {
    
    public int rank;
    private HashMap<String, ArrayList<User>> 
            usersByDepartment = new HashMap<String, ArrayList<User>>();
    
    private ArrayList<String> departments;
    
    private String sqlQuery = "SELECT * FROM USER WHERE UserRank = ?";
    
    public GetUserByDepartmentAndRank(){ }
    
    public GetUserByDepartmentAndRank(int rank){
        this.rank=rank;
    }
    
    public HashMap<String, ArrayList<User>> getUsersByDepartments() {
        return usersByDepartment;
    }
    public ArrayList<User> getUsersByDepartments(String department){
        return usersByDepartment.get(department);
    }
    
    public Set<String> getDepartments() {
        return usersByDepartment.keySet();
    }
    public void queryDB() throws SQLException{
        ResultSet rs = null;
        try{
            statement = conn.prepareStatement(sqlQuery);
            statement.setInt(1, rank);
            rs =statement.executeQuery();
            ArrayList<User> users;
            while(rs.next()){
                User user = new User(
                    rs.getInt("UserId"),
                    rs.getString("UserEmail"),
                    rs.getString("UserName"),
                    rs.getString("UserDepartment"),
                    rs.getInt("UserRank"));
                if(usersByDepartment.get(user.getDepartment()) == null) {
                    users = new ArrayList<User>();
                    users.add(user);
                    usersByDepartment.put(user.getDepartment(), users);
                } else {
                    users = usersByDepartment.get(user.getDepartment());
                    users.add(user);
                }
            }
            result = getUsersByDepartments();
        }
        catch(SQLException e){
            System.out.println("No user found exception");
            e.printStackTrace();
            conn.close();
        } finally {
            statement.close();
            rs.close();
        }
    }
    
    @Override
    public void processResult() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }   
}
