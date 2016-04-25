/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import uta.cse4361.businessobjects.Appointment;
import uta.cse4361.businessobjects.Slot;
import uta.cse4361.businessobjects.SlotFactory;
import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.businessobjects.StudentAccount;
import uta.cse4361.businessobjects.User;

/**
 *
 * @author Han
 */
public class DatabaseManager {
    DatabaseImpInterface imp = new RelationalDatabaseImpl();
    
    public DatabaseManager() {
        
    }
    
    public boolean isFree(Date date, int startHour, int endHour, int startMinute, int endMinute) {
        ArrayList<Slot> slots = imp.getAvailSlotsByTime(date, startHour, endHour, startMinute, endMinute);
        SlotFactory f = SlotFactory.getInstance();
        int apptSize = f.determineNumberOfFlyweights(startHour, endHour, startMinute, endMinute);
        if(slots.size() >= apptSize){
            return true;
        }
        return false;
    }
    
    public ArrayList<Appointment> getAllUserAppointments(String email) {
        ArrayList<Appointment> appointments = imp.getAllUserAppointments(email);
        Collections.sort(appointments);
        return appointments;
    }
    
    public ArrayList<Appointment> getAppointments() {
        
        ArrayList<Appointment> appointments = imp.getAppointments();
        Collections.sort(appointments);
        return appointments;
    }
    
    public Appointment getAppointment(int apptID) {
        return imp.getAppointment(apptID);
    }
    
    public String saveSlots(ArrayList<Slot> slots) {
        return imp.saveSlots(slots);
    }
    public String saveAppointment(Appointment appt) {
        return imp.saveAppointment(appt);
    }
    public String modifyAppointment(int id, Appointment appt) {
        return imp.modifyAppointment(id, appt);
    }
    public String deleteStudentAppointment(int apptID){
        return imp.deleteStudentAppointment(apptID);
    }
    public String modifySlot(Date d, int startHour, int startMin, int endHour, int endMin, int slotID) {
        return imp.modifySlot(d, startHour, startMin, endHour, endMin, slotID);
    }
    
    public ArrayList<Slot> getSlots(){
        return imp.getSlot();
    }
    
    public ArrayList<Slot> getTypeSlots(){
        ArrayList<Slot> avail = imp.getAvailSlots();
        ArrayList<Slot> appt = imp.getApptSlots();
        avail.addAll(appt);
        Collections.sort(avail);
        return avail;
    }
    public ArrayList<Slot> getAvailableSlots() {
         return imp.getAvailSlots();
     }
    
    public String register(AdvisorAccount aa){
        return imp.register(aa);
    }
    
    public String registerStudent(StudentAccount sa){
        return imp.registerStudent(sa);
    }
   
    public String changePassword(String email, String password){
        return imp.changePassword(email,password);
    }

    
    public String validate(String email, String password){
        String result=imp.validate(email, password);
        return result;
    }
    
    //todo
    public AdvisorAccount getAccount(String email){
        return imp.getAccount(email);
    }
    
    public StudentAccount getStudentAccount(String email){
        return imp.getStudentAccount(email);
    }
    
    public <T> T getAnyAccount(String email){
    	return (T) imp.getAnyAccount(email);
    }
    
     public String saveBugReport(String report){
        return imp.saveBugReport(report);
    }
    
     public String saveFeedback(String Feedback){
         return imp.saveFeedback(Feedback);
     
     }
     
     public String deleteUser(String email) {
        return imp.deleteUser(email);
    }
     
    public HashMap<String, ArrayList<User>> getUsersByRank(int rank) {
        return imp.getUsersByRank(rank);
    }
    
    public String editAdvisorEmailSetting(String email, String setting)
    {
        return imp.editAdvisorEmailSetting(email, setting);
    }
    
    public String updateUser(String email, String name, String major){
    	return imp.updateUser(email, name, major);
    }
    
    public ArrayList<AdvisorAccount> getAdvisors(){
    	return imp.getAdvisors();
    }
    
    public String changeAdvisorStatus(String email, String status){
    	return imp.changeAdvisorStatus(email, status);
    }
    
    public String addToWaitlist(Appointment appt){
    	return imp.addToWaitlist(appt);
    }
    
    public ArrayList<Appointment> getAllWaitlist(){
    	return imp.getAllWaitlist();
    }
}
