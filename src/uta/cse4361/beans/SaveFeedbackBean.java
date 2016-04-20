/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.databases.RelationalDatabaseImpl;
import uta.cse4361.interfaces.Constants;
import static uta.cse4361.interfaces.Constants.SUCCESS_MESSAGE;

/**
 *
 * @author Nabin
 */
public class SaveFeedbackBean implements Constants{
    private String feedback;
    private String returnMessage;
    
    public SaveFeedbackBean() {
    }

    
    public String SaveFeedback(){       
       DatabaseManager dm = new DatabaseManager();
       returnMessage = dm.saveFeedback(feedback);
       return returnMessage;
    }    
   
    public void setFeedback(String Feedback) {
        this.feedback = Feedback;
    }  
    
    public String getFeedback() {
        return this.feedback;
    }
}
