/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.model;

import com.sk.client.CollectionClient;
import com.sk.client.FoodIngredientsClient;
import com.sk.client.IngredientsListingClient;
import com.sk.client.RecipesClient;
import com.sk.client.UserClient;
import com.sk.entities.FoodIngredients;
import com.sk.entities.IngredientsListing;
import com.sk.entities.RecipeListing;
import com.sk.entities.Recipes;
import com.sk.entities.Users;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;

/**
 *
 * @author ray
 */
public class Recipe {

    private String id;
    private String name;
    private String description;
    private String method;
    private String pictureURL;
    private int likesNumber;
    private String authorID;
    private int serving;
    private NutritionCalc nc;

    public Recipe() {
        id = "";
        name = "";
        description = "";
        method = "";
        pictureURL = "";
        likesNumber = 0;
        authorID = "0";
        nc = new NutritionCalc();
    }

    /**
     * the form a recipe from a db entity
     *
     * @param dbEntity the recipe entity fetched from db
     */
    public Recipe(Recipes dbEntity) {
        id = dbEntity.getRecipeID().toString();
        name = dbEntity.getRecipeName();
        description = dbEntity.getRecipeDesc();
        pictureURL = dbEntity.getRecipePic();
        method = dbEntity.getRecipeMethod();
        serving = dbEntity.getRecipe_serving();
        likesNumber = dbEntity.getRecipeNumLikes();
        authorID = String.valueOf(dbEntity.getRecipeauthorID());
        nc = new NutritionCalc();

        //food id+quantity list
        IngredientsListingClient pc = new IngredientsListingClient();
        GenericType<List<IngredientsListing>> genericType = new GenericType<List<IngredientsListing>>() {
        };
        List<IngredientsListing> foodIDList = new ArrayList<>();
        try {
            Response res = pc.findByRecipeID(Response.class, id);
            System.out.println("For Food List: " + res.toString());
            foodIDList = res.readEntity(genericType);
        } catch (Exception e) {
            System.out.println("PC Client error: " + e);
        } finally {
            pc.close();
        }
        //get the food details

        GenericType<List<FoodIngredients>> gct = new GenericType<List<FoodIngredients>>() {
        };

        for (IngredientsListing list : foodIDList) {
            FoodIngredientsClient fic = new FoodIngredientsClient();
            Double quantityNumber = list.getQuantity();
            try {
                
                Response res = fic.find_JSON(Response.class, list.getListfoodID());
                FoodIngredients ft = res.readEntity(FoodIngredients.class);
                Food food = new Food(ft.getFoodID(),
                        ft.getFoodName(),
                        ft.getFoodDescription(),
                        Integer.valueOf(ft.getFoodEnergyKj()),
                        Double.valueOf(ft.getFoodProteinG()),
                        Double.valueOf(ft.getFoodFatG()),
                        Double.valueOf(ft.getFoodFatSatuatedG()),
                        Double.valueOf(ft.getFoodCarbG()),
                        Double.valueOf(ft.getFoodSugarG()),
                        Double.valueOf(ft.getFoodSodiumG()),
                        Double.valueOf(ft.getFoodGravity()),
                        //quantity
                        list.getQuantity());
                System.out.println("The Quantity?: " + list.getQuantity());
                nc.addFood(food);
            } catch (Exception e) {
                System.out.println("Read food Ingridents error : " + e);
            } finally {
                fic.close();
            }
            nc.setServing(serving);
        }

        System.out.println("NC number: " + nc.getFoodlist().size());
    }

    /**
     * save this recipe to DB
     */
    public void saveRecipeToDB() {
        //Step1: Create a empty 
        Recipes dbmodel = new Recipes();
        //whatever input, the id will be updated by DB
        dbmodel.setRecipeID(Long.valueOf(121));
        dbmodel.setRecipeName(name);
        dbmodel.setRecipeDesc(description);
        dbmodel.setRecipeMethod(method);
        dbmodel.setRecipePic(pictureURL);
        dbmodel.setRecipe_serving(serving);
        dbmodel.setRecipeNumLikes(likesNumber);

        //mockValue Comes First
        dbmodel.setRecipeauthorID(0l);

        //Create for the primary key
        RecipesClient crclient = new RecipesClient();
        try {
            crclient.create_JSON(dbmodel);

            System.out.println("Name: " + name);
            GenericType<Recipes> genericType = new GenericType<Recipes>() {
            };
            Response res = crclient.findMockByName_JSON(Response.class, this.name);
            System.out.println(res.toString());

            Recipes forIDEntity = res.readEntity(genericType);
            id = forIDEntity.getRecipeID().toString();
            //set the real author ID
            dbmodel.setRecipeauthorID(Long.valueOf(authorID));
            dbmodel.setRecipeID(forIDEntity.getRecipeID());
            crclient.edit_JSON(dbmodel, id);
        } catch (Exception e) {
            System.out.println("CRClint Meet Some Problem: " + e);
        } finally {
            crclient.close();
        }

        IngredientsListingClient iclient = new IngredientsListingClient();
        try {
            for (Food food : nc.getFoodlist()) {
                System.out.println("SAVE QUANTITY?: " + food.getQuantity());
                IngredientsListing pair = new IngredientsListing();
                pair.setListfoodID(food.getId());
                pair.setListrecipeID(Long.valueOf(this.id));
                pair.setQuantity(food.getQuantity());
                pair.setListID(0);
                iclient.create_JSON(pair);
            }
        } catch (Exception e) {
            System.out.println("IClient Meet some problem: " + e);
        } finally {
            iclient.close();
        }

        //Add recipe to self's collection
        CollectionClient coClient = new CollectionClient();
        RecipeListing collectionItem = new RecipeListing();
        collectionItem.setRlistrecipeID(Long.valueOf(id));
        collectionItem.setRlistuserID(Long.valueOf(authorID));
        try {
            coClient.create_JSON(collectionItem);
        } catch (Exception e) {
            System.out.println("Error? :" + e);
        } finally {
            coClient.close();
        }

        System.out.println("SaveD!!");
    }

    public void updateRecipeToDB() {
        //Step1: Create a empty 
        Recipes dbmodel = new Recipes();
        //whatever input, the id will be updated by DB
        dbmodel.setRecipeID(Long.valueOf(id));
        dbmodel.setRecipeName(name);
        dbmodel.setRecipeDesc(description);
        dbmodel.setRecipeMethod(method);
        dbmodel.setRecipePic(pictureURL);
        dbmodel.setRecipe_serving(serving);
        dbmodel.setRecipeNumLikes(likesNumber);
        dbmodel.setRecipeauthorID(Long.valueOf(authorID));

        //modify the recipe table
        RecipesClient crclient = new RecipesClient();
        try {
            crclient.edit_JSON(dbmodel, id);
        } catch (Exception e) {
            System.out.println("UpdateException: " + e);
        } finally {
            crclient.close();
        }
        //modify the ingredients table
        //stpe1. Find all related ingredients and delete them
        IngredientsListingClient iclient = new IngredientsListingClient();
        GenericType<List<IngredientsListing>> genericType = new GenericType<List<IngredientsListing>>() {
        };
        try {
            Response res = iclient.findByRecipeID(Response.class, id);
            List<IngredientsListing> forDel = res.readEntity(genericType);
            for (IngredientsListing item : forDel) {
                iclient.remove(String.valueOf(item.getListID()));
            }
        } catch (Exception e) {
            System.out.println("Read Ingrid when update Recipe Error: " + e);
        } finally {
            iclient.close();
        }

        //step2: update the list in case any updates.
        iclient = new IngredientsListingClient();
        try {
            for (Food food : nc.getFoodlist()) {
                System.out.println("SAVE QUANTITY?: " + food.getQuantity());
                IngredientsListing pair = new IngredientsListing();
                pair.setListfoodID(food.getId());
                pair.setListrecipeID(Long.valueOf(this.id));
                pair.setQuantity(food.getQuantity());
                pair.setListID(0);
                iclient.create_JSON(pair);
            }
        } catch (Exception e) {
            System.out.println("IClient Meet some problem: " + e);
        } finally {
            iclient.close();
        }

    }

    /**
     * @return the recipe id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id set the recipe ID
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @param method the method to set
     */
    public void setMethod(String method) {
        this.method = method;
    }

    public String getMethod() {
        return this.method;
    }

    /**
     * @return the pictureURL
     */
    public String getPictureURL() {
        return pictureURL;
    }

    /**
     * @param pictureURL the pictureURL to set
     */
    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    /**
     * @return the likesNumber
     */
    public int getLikesNumber() {
        return likesNumber;
    }

    /**
     * @param likesNumber the likesNumber to set
     */
    public void setLikesNumber(int likesNumber) {
        this.likesNumber = likesNumber;
    }

    /**
     * @return the authorID
     */
    public String getAuthorID() {
        return authorID;
    }

    /**
     * @param authorID the authorID to set
     */
    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    /**
     * @return the nc
     */
    public NutritionCalc getNc() {
        return nc;
    }

    /**
     * @param nc the nc to set
     */
    public void setNc(NutritionCalc nc) {
        this.nc = nc;
    }

    /**
     * @return the serving
     */
    public int getServing() {
        return serving;
    }

    /**
     * @param serving the serving to set
     */
    public void setServing(int serving) {
        this.serving = serving;
    }

    /**
     *
     */
    public String getAuthorName() {
        UserClient uClient = new UserClient();
        try {
            Response res = uClient.find_JSON(Response.class, authorID);
            System.out.println(res.toString());
            GenericType<Users> genericType = new GenericType<Users>() {
            };
            Users user = res.readEntity(genericType);
            if (res.getStatus() == 204) {
                return "Anonymous";
            }
            System.out.println("UserName???: " + user.getUserName());
            if (user.getUserName() != null) {
                return user.getUserName();
            }
        } catch (Exception e) {
            System.out.println("get User Name has Error: " + e);

        } finally {
            uClient.close();

        }
        return "Anonymous";

    }

}
