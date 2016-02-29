/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.webhandle;

import com.sk.client.CollectionClient;
import com.sk.client.RecipesClient;
import com.sk.entities.Recipes;
import com.sk.model.Recipe;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;

/**
 *
 * @author wjc1856
 */
public class DashManager {

    String userID;
    ArrayList<Recipe> recipeList;
    ArrayList<String> recipeIDList;
    Recipe recipe;
    Random randomGenerator;
    int sugarLimit;
    int carboLimit;
    ArrayList<String> choose;

    public DashManager() {
        userID = "";
        choose = new ArrayList<>();
        recipeList = new ArrayList<>();
        sugarLimit = 0;
        carboLimit = 0;
        randomGenerator = new Random();
        recipeIDList = new ArrayList<>();
    }

    public String countCollectRecipeFromDB(String userID) {
        CollectionClient coClient = new CollectionClient();
        String res = coClient.countRecipe(userID);
        System.out.println(res);
        coClient.close();
        return res;

    }

    public String countOwnRecipeFromDB(String authorID) {
        RecipesClient rClient = new RecipesClient();
        String res = rClient.countRecipe(authorID);
        System.out.println(res);
        rClient.close();
        return res;
    }

    public String sumLikesFromDB(String authorID) {
        RecipesClient rClient = new RecipesClient();
        try {
            String res = rClient.sumLikes(authorID);
            if(res.equals("null"))
                return "0";
            return res;
        } catch (Exception e) {
            System.out.println("Like Error: " + e);
            return "0";
        } finally {
            rClient.close();
        }
    }

    private ArrayList<String> getAllRecipeIDFromDB() {
        RecipesClient rc = new RecipesClient();
        try {
            String st = rc.findAllRecipeID().trim();
            String[] sp = st.substring(1, st.length() - 1).trim().split(",");
            for (String s : sp) {
                recipeIDList.add(s);
            }

            return recipeIDList;
        } catch (Exception e) {
            System.out.println("eRRor: " + e);
        } finally {
            rc.close();
        }
        return null;

    }

    public void AddARandomRecipeToList() {

        ArrayList<String> theList = new ArrayList<>();
        theList = getAllRecipeIDFromDB();
        System.out.println("The List size: " + theList.size());

        int index = randomGenerator.nextInt(theList.size());

        while (choose.contains(theList.get(index))) {
            index = randomGenerator.nextInt(theList.size());
        }
        choose.add(theList.get(index));

        RecipesClient rc = new RecipesClient();
        try {
            GenericType<Recipes> genType = new GenericType<Recipes>() {
            };
            Response res = rc.find_JSON(Response.class, String.valueOf(Integer.valueOf(theList.get(index).trim())));
            Recipes dbresult = (Recipes) res.readEntity(Recipes.class);
            Recipe theRecipe = new Recipe(dbresult);
            recipeList.add(theRecipe);
        } catch (Exception e) {
            System.out.println("getARandomRecipeError: " + e);
        } finally {
            rc.close();
        }
    }

    public int getEnergyIntake() {
        int energy = 0;

        for (Recipe re : recipeList) {
            energy += re.getNc().getEnergy();
        }
        return energy;
    }

    public int getProteinIntake() {
        int protein = 0;

        for (Recipe re : recipeList) {
            protein += re.getNc().getProtein();
        }
        return protein;
    }

    public int getFatIntake() {
        int fat = 0;

        for (Recipe re : recipeList) {
            fat += re.getNc().getFat();
        }
        return fat;
    }

    public int getFatSaIntake() {
        int fatSa = 0;

        for (Recipe re : recipeList) {
            fatSa += re.getNc().getFatStatuated();
        }
        return fatSa;
    }

    public int getCarboIntake() {
        int carboIntake = 0;

        for (Recipe re : recipeList) {
            carboIntake += re.getNc().getCarbohydrates();
        }
        return carboIntake;
    }

    public int getSugerIntake() {
        int sugarIntake = 0;

        for (Recipe re : recipeList) {
            sugarIntake += re.getNc().getSugar();
        }

        return sugarIntake;
    }

    public int getSodiumIntake() {
        int sodium = 0;

        for (Recipe re : recipeList) {
            sodium += re.getNc().getSalt();
        }

        return sodium;
    }

    public ArrayList<Recipe> getRandomList() {
        return recipeList;
    }

    public void reSetTheList() {
        recipeList = new ArrayList<>();
        choose = new ArrayList<>();
    }

    public Recipe getARecipeByID(String ID) {
        for (Recipe recipe : recipeList) {
            if (recipe.getId().equals(ID)) {
                return recipe;
            }
        }

        return null;
    }

    public int getListSize() {
        return recipeList.size();
    }

}
