package uta.cse4361.databases;

import java.sql.SQLException;
import java.sql.Timestamp;
import uta.cse4361.businessobjects.Appointment;
/**
 *
 * @author Lakshman
 */
public class SaveFeedback extends RDBImplCommand {
    private String Feedback;
    private String sqlQuery = "INSERT INTO feedback (feedback,  timestamp) VALUES (?, ?)";
    
    public SaveFeedback(String Feedback) {
        super();
        this.Feedback = Feedback;
    }

    @Override
    public void queryDB() throws SQLException {
        try {
            statement = conn.prepareStatement(sqlQuery);             
            statement.setString(1, Feedback);
            statement.setTimestamp(2, new Timestamp(new java.util.Date().getTime()));
            statement.executeUpdate();
            processResult();
        } catch (SQLException e) {
            System.out.println("Feedback query Failed");
            conn.close();
        } finally {
            statement.close();
        }
    }

    @Override
    public void processResult() {
        result = "";
    }

}
