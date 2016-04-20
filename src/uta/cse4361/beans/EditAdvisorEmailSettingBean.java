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
public class EditAdvisorEmailSettingBean implements Constants{
   private String email = null;
   private String emailSetting = null;
    public EditAdvisorEmailSettingBean() {
        
    }
    
    public String EditAdvisorEmailSetting(String email, String setting)
    {
      String returnMessage = "Cannot change Setting!";
      DatabaseManager databaseManager = new DatabaseManager();
      returnMessage = databaseManager.editAdvisorEmailSetting(email, setting);
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


    /**
     * @return the emailSetting
     */
    public String getEmailSetting() {
        return emailSetting;
    }

    /**
     * @param emailSetting the emailSetting to set
     */
    public void setEmailSetting(String emailSetting) {
        this.emailSetting = emailSetting;
    }
 
}
