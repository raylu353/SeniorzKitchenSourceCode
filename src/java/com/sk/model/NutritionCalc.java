package com.sk.model;

import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 * The Class NutritionCalc represents the selected list of food to calculate the
 * nutrition fact
 *
 * @author raylu
 */
public class NutritionCalc {

    private ArrayList<Food> foodlist;
    private int serving;
    
    DecimalFormat df = new DecimalFormat("######0.00");  
    public NutritionCalc() {
        foodlist = new ArrayList<>();
        serving = 1;
    }

    /**
     * @return the foodlist
     */
    public ArrayList<Food> getFoodlist() {
        return foodlist;
    }

    /**
     * @param foodlist the foodlist to set
     */
    public void setFoodlist(ArrayList<Food> foodlist) {
        this.foodlist = foodlist;
    }

    /**
     *
     * @return total energy from the food list
     */
    public double getEnergy() {
        double totalEnergy = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalEnergy += foodlist.get(i).getEnergy() * foodlist.get(i).getQuantity() / 100;
        }
        return totalEnergy/serving;
    }

    /**
     *
     * @return total protein from the food list
     */
    public double getProtein() {
        double totalProtein = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalProtein += foodlist.get(i).getProtein() * foodlist.get(i).getQuantity() / 100;
        }
        return totalProtein/serving;
    }

    /**
     *
     * @return total fat from the food list
     */
    public double getFat() {
        double totalFat = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalFat += foodlist.get(i).getFat() * foodlist.get(i).getQuantity() / 100;
        }
        return totalFat/serving;
    }

    public double getFatStatuated() {
        double totalFat = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalFat += foodlist.get(i).getFatSatuated() * foodlist.get(i).getQuantity() / 100;
        }
        return totalFat/serving;
    }

    /**
     *
     * @return total carbohydrates from the food list
     */
    public double getCarbohydrates() {
        double totalCarbohydrates = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalCarbohydrates += foodlist.get(i).getCarbohydrates() * foodlist.get(i).getQuantity() / 100;
        }
        return totalCarbohydrates/serving;
    }

    /**
     *
     * @return total sugar from the food list
     */
    public double getSugar() {
        double totalSugar = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalSugar += foodlist.get(i).getSugars() * foodlist.get(i).getQuantity() / 100;
        }
        return totalSugar/serving;
    }
    
    /**
     * get the total salt quantity
     * @return the total salt quantity
     */
    public double getSalt() {
        double totalSalt = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalSalt += foodlist.get(i).getSodium()* foodlist.get(i).getQuantity()/100000;
        }
        return totalSalt/serving;
    }

    
    /**
     * Add food into food list
     *
     * @param food the food need to be add
     */
    public void addFood(Food food) {
        boolean hasItem = false;
        for(Food item:foodlist){
            if (item.getDesc().trim().equals(food.getDesc().trim()))
            {
                foodlist.remove(item);
                foodlist.add(food);
                hasItem = true;
                
            }
        }
        if(!hasItem)
            foodlist.add(food);
    }

    /**
     * Delete food from food list
     *
     * @param food the food need to be delete
     */
    public void delFood(Food food) {
        for(Food item:foodlist)
        {
            if(item.getId().equals(food.getId()))
            {
                foodlist.remove(item);     
            }
        }
    }

    /*
     * Delete food from food list by given id
     *
     * @param id the id of food need to be delete
     */
    public void removeByID(String id)
    {
        for(Food item:foodlist)
        {
            if(item.getId().equals(id.trim()))
            {
                foodlist.remove(item);     
                break;
            }
        }
    }
    
    /**
     * calculate the total quantity
     * @return the calculated value
     */
    public double getTotalWeightPerServing() {
        double totalWeight = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalWeight += foodlist.get(i).getQuantity();
        }
        return totalWeight/serving;
    }
    
    public double getTotalWeight() {
        double totalWeight = 0;
        for (int i = 0; i < foodlist.size(); i++) {
            totalWeight += foodlist.get(i).getQuantity();
        }
        return totalWeight;
    }
    
    
    /**
     * if the food list contains a particular food, return true or return false.
     * @param the food need to check whether exist in current list
     * @return boolean value to indicate if the food exists.
     */
    public boolean hasItem(Food food)
    {
        for (Food item:foodlist){
            if(item.getDesc().trim().equals(food.getDesc().trim()))
            {
                return true;
            }
        }
        
        return false;
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
}
