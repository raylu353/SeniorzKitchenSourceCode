/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.webhandle;

import com.sk.client.IntakeClient;
import com.sk.entities.UserIntake;
import javax.ws.rs.core.Response;

/**
 *
 * @author ray
 */
public class intakeManager {
    private UserIntake userIntake;
    private IntakeClient client;
    private String userID;
    
    public intakeManager(String id) {
        userID =id;
    }
    
    public intakeManager() {
        userIntake = new UserIntake();
        userID = "0";
    }
    
    public UserIntake getIntakeFromDB()
    {
        IntakeClient iclient = new IntakeClient();
        try{
            Response res = iclient.find_JSON(Response.class, getUserID());
            System.out.println("Intake Read Status: " + res.getStatus());
            System.out.println(res.toString());
            
            setUserIntake(res.readEntity(UserIntake.class));
            
            return getUserIntake();
            
        }catch(Exception e)
        {
            System.out.println("Error get Intake: " + e);
        }
        finally{
            iclient.close();
        }
        return null;
    }
    
    public void saveIntakeToDB()
    {
        IntakeClient iclient = new IntakeClient();
        try{
            iclient.create_JSON(getUserIntake());           
        }catch(Exception e)
        {
            System.out.println("Error get Intake: " + e);
        }
        finally{
            iclient.close();
        }        
    }
    
    public void updateIntakeToDB()
    {
        IntakeClient iclient = new IntakeClient();
        try{
            iclient.edit_JSON(getUserIntake(), getUserIntake().getUserId().toString());           
        }catch(Exception e)
        {
            System.out.println("Error get Intake: " + e);
        }
        finally{
            iclient.close();
        }        
    }

    /**
     * @return the userIntake
     */
    public UserIntake getUserIntake() {
        return userIntake;
    }

    /**
     * @param userIntake the userIntake to set
     */
    public void setUserIntake(UserIntake userIntake) {
        this.userIntake = userIntake;
    }

    /**
     * @return the userID
     */
    public String getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(String userID) {
        this.userID = userID;
    }
}
