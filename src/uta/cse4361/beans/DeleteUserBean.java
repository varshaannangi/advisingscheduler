/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;

/**
 *
 * @author includetech
 */
public class DeleteUserBean implements Constants{
    
    private String email = null;
    public DeleteUserBean() {
        
    }
    
    public String DeleteUser(String email)
    {
      String returnMessage = "Cannot Delete!";
      DatabaseManager databaseManager = new DatabaseManager();
      returnMessage = databaseManager.deleteUser(email);
      return returnMessage;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
}
