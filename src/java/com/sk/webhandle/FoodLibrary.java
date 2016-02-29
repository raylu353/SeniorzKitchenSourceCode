package com.sk.webhandle;

import com.sk.entities.FoodIngredients;
import com.sk.client.FoodIngredientsClient;
import com.sk.model.Food;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;

/**
 * Food Library will be used as an session that user can get certain food item
 * without DB connection
 *
 * @author raylu
 */
public class FoodLibrary {

    private FoodIngredientsClient client;
    private ArrayList<Food> foodList;

    public FoodLibrary() {
        foodList = new ArrayList<>();
        System.out.println("Executing Fetching Process...");
        try {
            getAll();
        } catch (Exception e) {
        } finally {
            client.close();
        }
    }

    /**
     * Retrieve All Food data from database Form the Food Entities into a List
     */
    private void getAll() {
        try {
            client = new FoodIngredientsClient();
            System.out.println("DB Client Preparing....");
            GenericType<List<FoodIngredients>> genericType = new GenericType<List<FoodIngredients>>() {
            };
            List<FoodIngredients> data = new ArrayList<>();
            Response res = client.findAll_JSON(Response.class);
            System.out.println("Database Repsone: " + res.toString());
            data = res.readEntity(genericType);
            System.out.println("FoodLibrary Response:" + res.toString());
            for (FoodIngredients ft : data) {
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
                        1);
                foodList.add(food);
            }
            System.out.println("Data Read Ready!");
        } catch (Exception e) {
            System.out.println("Something Wrong!");
            System.out.println("Error: " + e);
        } finally {
            client.close();
        }
    }

    /**
     * Get the size of food list
     *
     * @return the size of food list
     */
    public String getFoodNumber() {
        return String.valueOf(foodList.size());
    }

    /**
     * Find a Food List related to a given name
     *
     * @param name the name of food
     * @return the list of food sharing the same name
     */
    public ArrayList<Food> findFoodByName(String name) {
        ArrayList<Food> foods = new ArrayList<>();
        for (Food food : foodList) {
            if (food.getName().toLowerCase().trim().contains(name.toLowerCase().trim())) {
                foods.add(food);
            }
        }
        return foods;
    }

    /**
     * Find food by description
     *
     * @param desc the description of food
     * @return food
     */
    public Food findFoodByDesc(String desc) {
        for (Food food : foodList) {
            if (food.getDesc().toLowerCase().trim().equals(desc.toLowerCase().trim())) {
                return food;
            }
        }
        return null;
    }

    public String getUniqeFoodNameToString() {
        ArrayList<String> foodName = new ArrayList<>();
        String foodNameList = "";
        for (Food food : foodList) {
            if (foodName.contains(food.getName().trim())) {
                continue;
            } else {
                foodName.add(food.getName().trim());
            }
            foodNameList = foodNameList + "\"" + food.getName() + "\",";
        }

        return foodNameList;
    }
}
