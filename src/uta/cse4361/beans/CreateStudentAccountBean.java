/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.beans;

import java.security.SecureRandom;
import java.sql.Timestamp;
import uta.cse4361.businessobjects.Email;
import uta.cse4361.businessobjects.StudentAccount;
import uta.cse4361.databases.DatabaseManager;
import uta.cse4361.databases.GetAnyUser;
import uta.cse4361.interfaces.Constants;
import static uta.cse4361.interfaces.Constants.SUCCESS_MESSAGE;

/**
 *
 * @author includetech
 */
public class CreateStudentAccountBean implements Constants{
    private String email= null;
    private int studentID = 0;
    private String name = null;
    private String username = null;
    private String major = null;
    private String tempPassword = null;
    private String tempPasswordString = null;
    private Timestamp TimeStamp=null;
    private int rank = 0;
    
    public CreateStudentAccountBean(){
    }
    
    public String Student()
    {
       DatabaseManager dm = new DatabaseManager();
       // Check if student already exists
       StudentAccount retrievedSA = dm.getStudentAccount(this.email);
       if(retrievedSA != null)
           return this.STUDENT_ALREADY_REGISTERED;
       
       String returnMessage = SUCCESS_MESSAGE;
       StudentAccount SA = new StudentAccount();
       System.out.println("Rank value :"+this.rank);
       if(this.rank == 9)
       {
           if(this.tempPassword == null)
            this.tempPassword = createTempPassword();
           this.tempPasswordString = this.tempPassword;
       }
       boolean a = SA.initialize(this.name,this.tempPassword, this.email, this.username, this.major, this.rank);
       if (a == false)
           return this.CREATE_STUDENT_FAIL;
       returnMessage = dm.registerStudent(SA);
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
     * @return the studentID
     */
    public int getStudentID() {
        return studentID;
    }

    /**
     * @param studentID the studentID to set
     */
    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the major
     */
    public String getMajor() {
        return major;
    }

    /**
     * @param major the major to set
     */
    public void setMajor(String major) {
        this.major = major;
    }

    /**
     * @return the rank
     */
    public int getRank() {
        return rank;
    }

    /**
     * @param rank the rank to set
     */
    public void setRank(int rank) {
        this.rank = rank;
    }

    /**
     * @return the tempPassword
     */
    public String getTempPassword() {
        if(this.tempPassword == null)
            this.tempPassword = createTempPassword();
        return tempPassword;
    }

    /**
     * @param tempPassword the tempPassword to set
     */
    public void setTempPassword(String tempPassword) {
        this.tempPassword = tempPassword;
    }
    
    public static String createTempPassword()
    {
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom rnd = new SecureRandom();
        StringBuilder sb = new StringBuilder( 8 );
         for( int i = 0; i < 8; i++ ) {
                sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );}
        String tempPassword = sb.toString();
        return tempPassword;
    }

    /**
     * @return the tempPasswordString
     */
    public String getTempPasswordString() {
        return tempPasswordString;
    }

    /**
     * @param tempPasswordString the tempPasswordString to set
     */
    public void setTempPasswordString(String tempPasswordString) {
        this.tempPasswordString = tempPasswordString;
    }
    
    public void setTimeStamp(Timestamp TimeStamp){
        this.TimeStamp=TimeStamp;
    }
    public Timestamp getTimeStamp(){
        return TimeStamp; 
    }
}
