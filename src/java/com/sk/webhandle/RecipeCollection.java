/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.webhandle;

import com.sk.client.CollectionClient;
import com.sk.client.RecipesClient;
import com.sk.entities.RecipeListing;
import com.sk.entities.Recipes;
import com.sk.model.Recipe;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;

/**
 *
 * @author ray
 */
public class RecipeCollection {

    ArrayList<Recipe> recipeList;
    String userID;

    public RecipeCollection() {
        recipeList = new ArrayList<>();
        userID = "";
    }

    /**
     * Add a recipe to collection
     */
    public void addRecipeToCollection(String recipeId, String userId) {
        CollectionClient coClient = new CollectionClient();
        RecipeListing rl = new RecipeListing();
        rl.setRlistID(0L);
        rl.setRlistDesc("");
        rl.setRlistuserID(Long.valueOf(userId));
        rl.setRlistrecipeID(Long.valueOf(recipeId));
        try{
            coClient.create_JSON(rl);
        }
        catch(Exception e)
        {
            System.out.println("Error When add a Recipe to Collection: " + e);
        }
        finally
        {
            coClient.close();
        }
    }

    /**
     * Remove a recipe from collection
     */
    public void removeReipeFromCollection(String recipeId,String UserId) {
        CollectionClient coClient = new CollectionClient();
        try{
        Response res = coClient.findByRecipeIDAndUserID_JSON(Response.class, UserId, recipeId);
        RecipeListing rl = res.readEntity(RecipeListing.class);
        coClient.remove(String.valueOf(rl.getRlistID()));
        
        }
        catch(Exception e)
        {
            System.out.println("Remove a Collection Has An Error: "+ e);
        }
        finally
        {
            coClient.close();
        }
        
    }

    /**
     * get User's collection
     */
    public ArrayList<Recipe> getRecipesFromDB(String userID) {
        CollectionClient coClient = new CollectionClient();
        GenericType<List<RecipeListing>> genericType = new GenericType<List<RecipeListing>>() {
        };
        Response res = coClient.findByUserID_JSON(Response.class, userID);
        //get all recipes in user's collection
        System.out.println(res.toString());
        List<RecipeListing> pairList = res.readEntity(genericType);
        for (RecipeListing rl : pairList) {
            RecipesClient rc = new RecipesClient();
            Response rcres = rc.find_JSON(Response.class, String.valueOf(rl.getRlistrecipeID()));
            System.out.println("Find Each Recipe Res: " + rcres.toString());
            System.out.println("Find Each Recipe rID: " + rl.getRlistrecipeID());
            Recipes recipeDBEntity = rcres.readEntity(Recipes.class);

            Recipe aRecipe = new Recipe(recipeDBEntity);
            recipeList.add(aRecipe);
            rc.close();
        }
        coClient.close();

        return recipeList;
    }

    public Recipe getARecipeByID(String ID) {
        for (Recipe recipe : recipeList) {
            if (recipe.getId().equals(ID)) {
                return recipe;
            }
        }

        return null;
    }

    public boolean inCollection(String recipeID, String userID) {
        CollectionClient coClient = new CollectionClient();
        try {
            Response res = coClient.findByRecipeIDAndUserID_JSON(Response.class, userID, recipeID);
            if (res.getStatus() == 200) {
                return true;
            }
        } catch (Exception e) {

        } finally {
            coClient.close();
        }

        return false;
    }
    
    public ArrayList<Recipe> getPopular(String user){
        ArrayList<Recipe> rl = new ArrayList<>();
        for (Recipe r :recipeList)
        {
            if(r.getAuthorName().trim().equals(user.trim())) {
                if(r.getLikesNumber() != 0)
                    rl.add(r);
            }
        }
        return rl;
    }
    
    public ArrayList<Recipe> getOwn(String user){
        ArrayList<Recipe> rl = new ArrayList<>();
        for (Recipe r :recipeList)
        {
            if(r.getAuthorName().trim().equals(user.trim()))
            {
                rl.add(r);
            }
        }
        return rl;
    }
    
    public ArrayList<Recipe> getOthers(String user){
        ArrayList<Recipe> rl = new ArrayList<>();
        for (Recipe r :recipeList)
        {
            if(!r.getAuthorName().trim().equals(user.trim()))
            {
                rl.add(r);
            }
        }
        return rl;
    }

}
