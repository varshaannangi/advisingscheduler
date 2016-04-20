/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.interfaces.Constants;
import static uta.cse4361.interfaces.Constants.SUCCESS_MESSAGE;

/**
 *
 * @author Nabin
 */
public class ChangePasswordBean implements Constants{
    private String email= null;
    private String newPassword= null;

    public ChangePasswordBean() {
    }

    public String ChangePassword()
    {
        String Msg = SUCCESS_MESSAGE;
        DatabaseManager DM = new DatabaseManager();
        System.out.println("Email "+this.email +" Password :"+this.getNewPassword());
        Msg = DM.changePassword(this.email, this.getNewPassword());           
        return Msg;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the newPassword
     */
    public String getNewPassword() {
        return newPassword;
    }

    /**
     * @param newPassword the newPassword to set
     */
    public void setNewPassword(String newPassword) {
        int hash = newPassword.hashCode();
        this.newPassword = Integer.toString(hash);
    }
    
    
}
