/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uta.cse4361.databases;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import uta.cse4361.businessobjects.AdvisorAccount;
import uta.cse4361.businessobjects.Appointment;
import uta.cse4361.businessobjects.EmailManager;
import uta.cse4361.businessobjects.Slot;
import uta.cse4361.businessobjects.StudentAccount;
import uta.cse4361.businessobjects.User;
import uta.cse4361.interfaces.Constants;

/**
 *
 * @author Han
 */
public class RelationalDatabaseImpl implements DatabaseImpInterface{
    
    public RelationalDatabaseImpl() {
        
    }

    @Override
    public String saveSlots(ArrayList<Slot> slots) {
        RDBImplCommand saveSlots = new SaveSlots(slots);
        saveSlots.execute();
        ArrayList<Integer> savedSlots = (ArrayList<Integer>)saveSlots.getResult();
        if(savedSlots.size() == slots.size()){
            return "";
        }
        return "failed";
    }

    @Override
    public String saveAppointment(Appointment appt) {
        RDBImplCommand saveAppointment = new SaveAppointment(appt);
        saveAppointment.execute();
        return (String)saveAppointment.getResult();
    }

    @Override
    public String modifyAppointment(int id, Appointment appt) {
        if (appt == null) {
            RDBImplCommand getAppointment = new GetAppointment(id);
            Appointment apt = getAppointments().get(0);
            apt.setRequestType(Constants.EMAIL_CANCEL);
            EmailManager emailManager = new EmailManager(apt);
            emailManager.setSubject("Appointment Deletion.");
            emailManager.setBody("Appointment Deletion for " + apt.getRequestType() + 
                    "\n\nTime deatils in the meeting invite.");
            emailManager.sendOutlookEmail();
        
            RDBImplCommand deleteAppointment = new DeleteAppointment(id);
            deleteAppointment.execute();
            return (String)deleteAppointment.getResult();
        } else {
            RDBImplCommand editAppointment = new EditAppointment(id, appt);
            editAppointment.execute();
            return (String)editAppointment.getResult();
        }
    }
    
    @Override
    public String deleteStudentAppointment(int apptID)
    {
        RDBImplCommand deleteAppointment = new DeleteAppointment(apptID);
        deleteAppointment.execute();
        return (String)deleteAppointment.getResult();
    }


    @Override
    public String modifySlot(Date d, int startHour, int endHour, int startMin, int endMin, int slotID) {
        RDBImplCommand modifySlot = new DeleteSlot(d, startHour, endHour, startMin, endMin, slotID);
        modifySlot.execute();
        return (String) modifySlot.getResult();
    }
    
    @Override
    public ArrayList<Appointment> getAllUserAppointments(String email) {
        RDBImplCommand getAppointments = new GetAllUserAppointments(email);
        getAppointments.execute();
        return (ArrayList<Appointment>) getAppointments.getResult();
    }

    @Override
    public ArrayList<Appointment> getAppointments() {
        RDBImplCommand getAppointments = new GetAppointments();
        getAppointments.execute();
        return (ArrayList<Appointment>) getAppointments.getResult();
        
    }

    @Override
    public Appointment getAppointment(int apptID) {
        RDBImplCommand getAppointment = new GetAppointment(apptID);
        getAppointment.execute();
        return (Appointment) getAppointment.getResult();
    }
    
    @Override
    public ArrayList<Slot> getSlot(){
        RDBImplCommand getSlots = new GetSlot();
        getSlots.execute();
        return (ArrayList<Slot>) getSlots.getResult();
    }
    @Override
    public ArrayList<Slot> getApptSlots(){
        RDBImplCommand getApptSlot = new GetApptSlots();
        getApptSlot.execute();
        return (ArrayList<Slot>) getApptSlot.getResult(); 
    }
    
    @Override
    public ArrayList<Slot> getAvailSlots(){
        RDBImplCommand getAvailSlot = new GetAvailSlots();
        getAvailSlot.execute();
        return(ArrayList<Slot>) getAvailSlot.getResult();
    }
    
    @Override
    public ArrayList<Slot> getAvailSlotsByTime(Date d, int startHour, int endHour, int startMin, int endMin){
        RDBImplCommand getAvailSlot = new GetAvailSlotsByTime(d, startHour, endHour, startMin, endMin);
        getAvailSlot.execute();
        return(ArrayList<Slot>) getAvailSlot.getResult();
    }
    
    @Override
    public String register(AdvisorAccount aa){
        RDBImplCommand register = new RegisterAdvisor(aa);
        register.execute();
        return (String)register.getResult();
    }
    
    @Override
    public String registerStudent(StudentAccount sa){
        RDBImplCommand register = new RegisterStudents(sa);
        register.execute();
        return (String)register.getResult();
    }
        
    @Override
    public String changePassword(String email, String password)
    {
        RDBImplCommand register = new ChangePassword(email,password);
        register.execute();
        return (String)register.getResult();
    }
    
    @Override
    public String validate(String email, String password){
       
        RDBImplCommand validate = new ValidateLogin(email, password);
        validate.execute();
        return (String)validate.getResult();
    }
    
    @Override
    public AdvisorAccount getAccount(String email){
        RDBImplCommand getAccount = new GetAnyUser(email);
        getAccount.execute();
        return (AdvisorAccount)getAccount.getResult();
    }
    
    @Override
    public Object  getAnyAccount(String email){
        RDBImplCommand getAccount = new GetAnyUser(email);
        getAccount.execute();        
        return getAccount.getResult();
    }
    
    @Override
    public StudentAccount getStudentAccount(String email){
        RDBImplCommand getAccount = new GetAnyUser(email);
        getAccount.execute();
        return (StudentAccount)getAccount.getResult();
    }
    @Override
    public String saveBugReport(String report) {
       RDBImplCommand saveBugReport = new SaveBugReport(report);
        saveBugReport.execute();
        return (String) saveBugReport.getResult();
    }
    @Override
    public String saveFeedback(String Feedback){
    RDBImplCommand saveFeedback = new SaveFeedback(Feedback);
        saveFeedback.execute();
        return (String) saveFeedback.getResult();
    }
    
    @Override
    public String deleteUser(String email)
    {
       RDBImplCommand deleteUser = new DeleteUser(email);
       deleteUser.execute();
       return (String)deleteUser.getResult(); 
    }
    
    @Override
    public HashMap<String, ArrayList<User>> getUsersByRank(int rank) {
        RDBImplCommand getUsersByRank = new GetUserByDepartmentAndRank(rank);
        getUsersByRank.execute();
        return (HashMap<String, ArrayList<User>>) getUsersByRank.getResult();
    }
    
     @Override
     public String editAdvisorEmailSetting(String email, String setting)
     {
       RDBImplCommand editEmailSetting = new EditAdvisorEmailSetting(email,setting);
       editEmailSetting.execute();
       return (String)editEmailSetting.getResult();   
     }
     
     @Override
     public String updateUser(String email, String name, String major){
    	 RDBImplCommand updateUser = new UpdateUser(email, name, major);
    	 updateUser.execute();
    	 return (String)updateUser.getResult();
     }

	@Override
	public ArrayList<AdvisorAccount> getAdvisors() {
		RDBImplCommand getAdvisors = new GetAdvisors();
		getAdvisors.execute();		
		return (ArrayList<AdvisorAccount>) getAdvisors.getResult();
	}

	@Override
	public String changeAdvisorStatus(String email, String status) {
		RDBImplCommand changeAdvisorStatus = new ChangeAdvisorStatus(email, status);
		changeAdvisorStatus.execute();
		return (String)changeAdvisorStatus.getResult();
	}
    
}
