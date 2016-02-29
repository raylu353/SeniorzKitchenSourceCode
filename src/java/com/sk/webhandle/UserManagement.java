/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.webhandle;

import com.sk.client.UserClient;
import com.sk.entities.Users;
import com.sk.model.User;
import javax.ws.rs.core.Response;

/**
 *
 * @author Cecilia
 */
public class UserManagement {

    private UserClient client;

    public UserManagement() {

    }

    public void createUser(Users user) {
        //send to create user
        client = new UserClient();
        try {
            client.create_JSON(user);
            System.out.println("Create user success");
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Wrong with create User.");
        } finally {
            client.close();
        }
    }

    public boolean emailExist(User user) {
        client = new UserClient();
        try {
            Response res = client.findByEmail_JSON(Response.class, user.getEmail());
            System.out.println("Check Email: " + res.getStatus());
            if (res.getStatus() == 200) {
                client.close();
                return true;
            }
        } catch (Exception e) {
            System.out.println("Email Check :" + e);
        } finally {
            client.close();
        }
        return false;
    }

    public boolean nameExist(User user) {
        client = new UserClient();
        try {
            Response res = client.findByName_JSON(Response.class, user.getNickName());
            System.out.println("Check Name: " + res.getStatus());
            if (res.getStatus() == 200) {
                client.close();
                return true;
            }
        } catch (Exception e) {
            System.out.println("Name Exist: " + e);
        } finally {
            client.close();
        }
        return false;
    }

    public User getUserByName(String name) {
        client = new UserClient();
        Users dbEntity = new Users();
        User user = new User();
        try {
            Response res = client.findByName_JSON(Response.class, name);
            dbEntity = res.readEntity(Users.class);
            user.fromDBEntity(dbEntity);
        } catch (Exception e) {
            System.out.println("Name Exist has error: " + e);
        } finally {
            client.close();
        }

        return user;

    }

    public User getUserByEmail(String email) {
        client = new UserClient();
        Users dbEntity = new Users();
        User user = new User();
        try {
            Response res = client.findByEmail_JSON(Response.class, email);
            dbEntity = res.readEntity(Users.class);
            user.fromDBEntity(dbEntity);
        } catch (Exception e) {
            System.out.println("Name Exist has error: " + e);
        } finally {
            client.close();
        }

        return user;

    }

    public void updatePassword(User user, String password) {
        client = new UserClient();

        user.setPassword(password);
        Users users = user.toDBEntity();

        try {
            client.edit_JSON(users, users.getUserID().toString());
            System.out.println("Update passed");

        } catch (Exception e) {
            System.out.println("Change Password has errors: " + e);
        } finally {
            client.close();
        }

    }
}
