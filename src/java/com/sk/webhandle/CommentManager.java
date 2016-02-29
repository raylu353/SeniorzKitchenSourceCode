/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.webhandle;

import com.sk.client.CommentsClient;
import com.sk.client.UserClient;
import com.sk.entities.Comments;
import com.sk.entities.Users;
import com.sk.model.Comment;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;
import java.text.SimpleDateFormat;

/**
 *
 * @author ray
 */
public class CommentManager {
    
    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy  hh:mm");

    public void addCommentToDB(Comments comment) {
        CommentsClient cClient = new CommentsClient();
        try {
            cClient.create_JSON(comment);
        } catch (Exception e) {
        } finally {
            cClient.close();
        }
    }

    public List<Comment> getCommentsByRecipeID(String recipeID) {
        List<Comments> commentsList = new ArrayList<>();
        CommentsClient cClient = new CommentsClient();
        try {
            Response res = cClient.findByRecipeID(Response.class, recipeID);
            GenericType<List<Comments>> genType = new GenericType<List<Comments>>() {
            };
            commentsList = res.readEntity(genType);
        } catch (Exception e) {
        } finally {
            cClient.close();
        }

        List<Comment> resultList = new ArrayList<>();
        for (Comments c : commentsList) {
            UserClient uClient = new UserClient();
            Users user = new Users();
            try {
                Response res = uClient.find_JSON(Response.class, String.valueOf(c.getCommentuserID()));
                user = (Users) res.readEntity(Users.class);

            } catch (Exception e) {
                System.out.println("Error: " + e);
            } finally {
                uClient.close();
            }
            Comment item = new Comment();
            item.setName(user.getUserName());
            item.setDate(df.format(c.getCommentDatetime()));
            item.setContent(c.getCommentContent());
            item.setId(c.getCommentID().toString());
            resultList.add(item);

        }

        return resultList;
    }

}
