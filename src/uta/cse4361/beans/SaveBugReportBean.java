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
public class SaveBugReportBean implements Constants{
    private String report;
    private String returnMessage;
    
    public SaveBugReportBean() {
    }

    
    public String BugReport(){       
       DatabaseManager dm = new DatabaseManager();
       returnMessage = dm.saveBugReport(report);
       return returnMessage;
    }    
   
    public void setReport(String report) {
        this.report = report;
    }  
    
    public String getReport() {
        return this.report;
    }
}
