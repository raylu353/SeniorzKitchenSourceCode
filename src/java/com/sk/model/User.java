/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.model;

import com.sk.entities.Users;

/**
 *
 * @author ray
 */
public class User {
    private String ID = "0";
    private String email;
    private String gender;
    private String nickName;
    private String password;
    private String type;

    /**
     * @return the nickName
     */
    public String getNickName() {
        return nickName;
    }

    /**
     * @param nickName the nickName to set
     */
    public void setNickName(String nickName) {
        this.nickName = nickName;
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
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
    
    
    public Users toDBEntity() {
        Users dbEntity = new Users();
        dbEntity.setDiabetesType(Integer.valueOf(this.type));
        dbEntity.setUserEmail(this.email);
        dbEntity.setUserGender(this.gender);
        dbEntity.setUserName(this.nickName);
        dbEntity.setUserPassword(this.password);
        dbEntity.setUserID(Long.valueOf(this.ID));
        return dbEntity;
    }
    
    public void fromDBEntity(Users dbEntity) {
        this.ID = dbEntity.getUserID().toString();
        this.email= dbEntity.getUserEmail();
        this.gender = dbEntity.getUserGender();
        this.nickName = dbEntity.getUserName();
        this.password = dbEntity.getUserPassword();
        this.type = String.valueOf(dbEntity.getDiabetesType());
    }

    /**
     * @return the ID
     */
    public String getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(String ID) {
        this.ID = ID;
    }
    
}
