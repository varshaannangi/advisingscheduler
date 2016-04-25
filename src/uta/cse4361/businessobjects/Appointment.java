/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.businessobjects;

import java.rmi.server.UID;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Han
 */
public class Appointment implements java.io.Serializable, Comparable<Appointment>{

    private int apptID = 0;
    private String studentMajor = null;
    private String studentName = null;
    private String studentID = null;
    private String studentEmail = null;
    private String advisorName = null;
    private String description = null;
    private String type = null;
    private int startHour = 0;
    private int startMinute = 0;
    private int endHour = 0;
    private int endMinute = 0;
    private Date date = null;
    private Date startDateTime = null;
    private Date endDateTime = null;
    private String uid = null;
    private String requestType = null;
    private String advisorEmail = null;
    private String priority = null;

    public Appointment() {
        UID uidTemp = new UID();
        this.setUID(uidTemp.toString());
    }
    
    public boolean initialize(String sMajor, String sName, String sID, String sEmail, String aName, String type, String dp, Date date, int sH, int eH, int sM, int eM, String requestType, String aEmail, String priority) {
        this.setStudentMajor(sMajor);
        this.setStudentName(sName);
        this.setStudentEmail(sEmail);
        if(this.setStudentID(sID) == false)
            return false;
        this.setAdvisorName(aName);
        this.setType(type);
        this.setDescription(dp);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR, sH);
        cal.set(Calendar.MINUTE, sM);
        this.setDate(cal.getTime());
        this.setStartDateTime(cal.getTime());
        cal.set(Calendar.HOUR, eH);
        cal.set(Calendar.MINUTE, eM);
        this.setEndDateTime(cal.getTime());
        this.setStartHour(sH);
        this.setEndHour(eH);
        this.setStartMinute(sM);
        this.setEndMinute(eM);
        this.setRequestType(requestType);
        this.setAdvisorEmail(aEmail);
        this.priority = priority;
        return true;
    }
    
    public void initialize(String sName, String sEmail, Date date) {
    	this.setStudentName(sName);
        this.setStudentEmail(sEmail);
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        this.setDate(cal.getTime());
    }
    
    // Setters
    public void setStudentMajor(String sMajor) {
        this.studentMajor = sMajor;
    }
    public void setApptID(int apptID) {
        this.apptID = apptID;
    }
    public void setStudentName(String sName) {
        this.studentName = sName;
    }
    public boolean setStudentID(String sID) {
        /*if(studentEmail.contains("mavs.uta.edu")) {
            if (sID.length() != 10)
              return false;
          else if (!sID.startsWith("100") || !sID.startsWith("6000"))
              return false;
            this.studentID = sID;
        } else 
            this.studentID = "";*/
        this.studentID = sID;
        return true;
    }
    public void setStudentEmail(String sEmail) {
        this.studentEmail = sEmail;
    }
    public void setType(String type) {
        this.type = type;
    }
    public void setAdvisorName(String aName) {
        this.advisorName = aName;
    }
    public void setDescription(String dp) {
        this.description = dp;
    }
    public void setDate(Date d) {
        this.date = d;
    }
    public void setStartHour(int sH) {
        this.startHour = sH;
    }
    public void setEndHour(int eH) {
        this.endHour = eH;
    }
    public void setStartMinute(int sM) {
        this.startMinute = sM;
    }
    public void setEndMinute(int eM) {
        this.endMinute = eM;
    }
    public void setUID(String uid) {
        this.uid = uid;
    }
    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }
    public void setAdvisorEmail(String aEmail) { 
        this.advisorEmail = aEmail;
    }
    public void setStartDateTime(Date startDateTime) { 
        this.startDateTime = startDateTime;
    }
    
    public void setEndDateTime(Date endDateTime) { 
        this.endDateTime = endDateTime;
    }
    public void setPriority(String priority) { 
        this.priority = priority;
    }
    
    // Getters
    public String getStudentMajor() {
        return this.studentMajor;
    }
    public int getApptID() {
        return this.apptID;
    }
    public String getType() {
        return this.type;
    }
    public String getStudentName() {
        return this.studentName;
    }
    public String getStudentID() {
        return this.studentID;
    }
    public String getStudentEmail() {
        return this.studentEmail;
    }
    public String getAdvisorName() {
        return this.advisorName;
    }
    public String getDescription() {
        return this.description;
    }
    public int getStartHour() {
        return this.startHour;
    }
    public int getEndHour() {
        return this.endHour;
    }
    public int getStartMinute() {
        return this.startMinute;
    }
    public int getEndMinute() {
        return this.endMinute;
    }
    public Date getDate() {
        return this.date;
    }
    public String getUID() {
        return this.uid;
    }
    public String getRequestType() {
        return this.requestType;
    }
    public String getAdvisorEmail() {
        return this.advisorEmail;
    }

    public Date getStartDateTime() {
        return this.startDateTime;
    }
    
    public Date getEndDateTime() {
        return this.endDateTime;
    }
    
    public String getPriority() {
        return this.priority;
    }
    
    @Override
    public int compareTo(Appointment other) {
        Appointment toCompare = other;
        int compare = 0;
        compare = this.getDate().compareTo(toCompare.getDate());
        
        if(compare == 0)
        {
            compare = this.getStartHour() - toCompare.getStartHour();
        }
        if(compare == 0)
        {
            compare = this.getStartMinute() - toCompare.getStartMinute();
        }
        return compare;
        
    }
    
    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("ApptID=");
        sb.append(getApptID());
        sb.append("\nStudentMajor=");
        sb.append(getStudentMajor());
        sb.append("\nStudentName=");
        sb.append(getStudentName());
        sb.append("\nStudentId=");
        sb.append(getStudentID());
        sb.append("\nStudentEmail=");
        sb.append(getStudentEmail());
        sb.append("\nAdvisorName=");
        sb.append(getAdvisorName());
        sb.append("\nAdvisorEmail=");
        sb.append(getAdvisorEmail());
        sb.append("\nDescription=");
        sb.append(getDescription());
        sb.append("\nType=");
        sb.append(getType());
        sb.append("\nDate=");
        sb.append(getDate());
        sb.append("\nStart DateTime=");
        sb.append(getStartDateTime());
        sb.append("\nEnd DateTime=");
        sb.append(getEndDateTime());
        sb.append("\nUID=");
        sb.append(getUID());
        sb.append("\nRequestType=");
        sb.append(getRequestType());
        
        return sb.toString();
    }
}
