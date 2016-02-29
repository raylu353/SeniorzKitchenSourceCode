package com.sk.model;

/**
 * The class Food represents a foot item
 * @author raylu
 */
public class Food {

    private String id;
    private String name;
    private String desc;
    //kj per 100g
    private double energy;
    // g
    private double protein;
    //g
    private double fat;
    //g
    private double fatSatuated;
    //g
    private double carbohydrates;
    //g
    private double sugars;
    //mg
    private double sodium;
    
    private double gravity;
    private double quantity;
    private String unit;
    
    public Food() {
        id = "";
        name = "";
        desc = "";
        energy = 0;
        protein = 0;
        fat = 0;
        fatSatuated = 0;
        carbohydrates = 0;
        sugars = 0;
        sodium = 0;
        gravity = 0;
        quantity = 1;
        this.unit = "Gram";
    }
    
    public Food(String id,String name, String desc, int energy, double protein, double fat, double fatSatuated , double carbohydrates, double sugars, double sodium, double gravity,double quantity) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.energy = energy;
        this.protein = protein;
        this.fat = fat;
        this.fatSatuated = fatSatuated;
        this.carbohydrates = carbohydrates;
        this.sugars = sugars;
        this.sodium = sodium;
        this.gravity = gravity;
        this.quantity = quantity;
        this.unit = "Gram";
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
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
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the energy
     */
    public double getEnergy() {
        return energy;
    }

    /**
     * @param energy the energy to set
     */
    public void setEnergy(int energy) {
        this.energy = energy;
    }

    /**
     * @return the protein
     */
    public double getProtein() {
        return protein;
    }

    /**
     * @param protein the protein to set
     */
    public void setProtein(double protein) {
        this.protein = protein;
    }

    /**
     * @return the fat
     */
    public double getFat() {
        return fat;
    }

    /**
     * @param fat the fat to set
     */
    public void setFat(double fat) {
        this.fat = fat;
    }

    /**
     * @return the fatSatuated
     */
    public double getFatSatuated() {
        return fatSatuated;
    }

    /**
     * @param fatSatuated the fatSatuated to set
     */
    public void setFatSatuated(double fatSatuated) {
        this.fatSatuated = fatSatuated;
    }

    /**
     * @return the carbohydrates
     */
    public double getCarbohydrates() {
        return carbohydrates;
    }

    /**
     * @param carbohydrates the carbohydrates to set
     */
    public void setCarbohydrates(double carbohydrates) {
        this.carbohydrates = carbohydrates;
    }

    /**
     * @return the sugars
     */
    public double getSugars() {
        return sugars;
    }

    /**
     * @param sugars the sugars to set
     */
    public void setSugars(double sugars) {
        this.sugars = sugars;
    }

    /**
     * @return the sodium
     */
    public double getSodium() {
        return sodium;
    }

    /**
     * @param sodium the sodium to set
     */
    public void setSodium(double sodium) {
        this.sodium = sodium;
    }

    /**
     * @return the gravity
     */
    public double getGravity() {
        return gravity;
    }

    /**
     * @param gravity the gravity to set
     */
    public void setGravity(double gravity) {
        this.gravity = gravity;
    }

    /**
     * @return the quantity
     */
    public double getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }
    
    /**
     * set the unit, to be gram or liter
     * @param unit 
     */
    public void setUnit(String unit)
    {
        this.unit = unit;
    }
    
    /**
     * to find what unit in selected for this food.
     * @return either gram or liter
     */
    public String getUnit()
    {
        return unit;
    }
}
