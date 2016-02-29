/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.webhandle;

import com.sk.client.CollectionClient;
import com.sk.client.CommentsClient;
import com.sk.client.IngredientsListingClient;
import com.sk.client.RecipesClient;
import com.sk.entities.Comments;
import com.sk.entities.IngredientsListing;
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
public class RecipeManager {

    ArrayList<Recipe> recipeList = new ArrayList<>();

    public RecipeManager() {

    }

    /**
     * Fetch data From database
     */
    private void getAllRecipeFromDB() {
        List<Recipes> allRecipes = new ArrayList<>();

        RecipesClient rclient = new RecipesClient();
        GenericType<List<Recipes>> genType = new GenericType<List<Recipes>>() {
        };
        Response res = rclient.findAll_JSON(Response.class);
        System.out.println("Respons: " + res);
        System.out.println();
        allRecipes = res.readEntity(genType);
        for (Recipes rec : allRecipes) {
            Recipe recipe = new Recipe(rec);
            recipeList.add(recipe);
        }
        System.out.println("Total recipes:" + recipeList.size());

    }

    /**
     * Fetch data from database and gives the fromed recipe List
     *
     * @return recipeList
     */
    public ArrayList<Recipe> getAllRecipe() {
        getAllRecipeFromDB();
        return recipeList;
    }

    /**
     * gives a recipe ID and return the particular recipe
     *
     * @param ID the Recipe that required
     * @return the recipe
     */
    public Recipe getARecipeByID(String ID) {
        for (Recipe recipe : recipeList) {
            if (recipe.getId().equals(ID)) {
                return recipe;
            }
        }

        return null;
    }

    /**
     * Delete a particular recipe
     *
     * @param recipeID the recipe what to be deleted.
     */
    public void deleteARecipe(String recipeID) {
        //find all related foodlist
        List<IngredientsListing> foodList = new ArrayList<>();
        GenericType<List<IngredientsListing>> genericType = new GenericType<List<IngredientsListing>>() {
        };

        IngredientsListingClient ic = new IngredientsListingClient();
        Response rec = ic.findByRecipeID(Response.class, recipeID);
        System.out.println(rec.toString());
        foodList = rec.readEntity(genericType);

        for (IngredientsListing IL : foodList) {
            ic.remove(IL.getListID().toString());
        }
        ic.close();

        RecipesClient rc = new RecipesClient();
        rc.remove(recipeID);
        rc.close();

        //also needs to delete from users collection
        //Step1: Find all related records
        CollectionClient coClient = new CollectionClient();
        GenericType<List<RecipeListing>> gType = new GenericType<List<RecipeListing>>() {
        };
        Response coRes = coClient.findByRecipeID_JSON(Response.class, recipeID);
        System.out.println("FOR DELETING RES: " + coRes.toString());
        List<RecipeListing> rl = coRes.readEntity(gType);
        coClient.close();
        //Step2: Delete them one by one.
        for (RecipeListing item : rl) {
            coClient = new CollectionClient();
            coClient.remove(String.valueOf(item.getRlistID()));
            coClient.close();
        }

        //also needs to delete all comments
        CommentsClient comClient = new CommentsClient();
        try {
            Response comRes = comClient.findByRecipeID(Response.class, recipeID);
            GenericType<List<Comments>> geType = new GenericType<List<Comments>>() {
        };
            List<Comments> comList = comRes.readEntity(geType);
            for(Comments co : comList)
            {
                comClient.remove(String.valueOf(co.getCommentID()));
            }
                    
        } catch (Exception e) {
            System.out.println("Error When try to delete associated comments for a recipe: " + e);
        } finally {
            comClient.close();
        }

    }

    public void deleteARecipeWithOutChangingCollection(String recipeID) {
        //find all related foodlist
        List<IngredientsListing> foodList = new ArrayList<>();
        GenericType<List<IngredientsListing>> genericType = new GenericType<List<IngredientsListing>>() {
        };

        IngredientsListingClient ic = new IngredientsListingClient();
        Response rec = ic.findByRecipeID(Response.class, recipeID);
        System.out.println(rec.toString());
        foodList = rec.readEntity(genericType);

        for (IngredientsListing IL : foodList) {
            ic.remove(IL.getListID().toString());
        }
        ic.close();

        RecipesClient rc = new RecipesClient();
        rc.remove(recipeID);
        rc.close();

    }

}
