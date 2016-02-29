/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author wjc1856
 */
@Entity
@Table(name = "food_ingredients")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FoodIngredients.findAll", query = "SELECT f FROM FoodIngredients f"),
    @NamedQuery(name = "FoodIngredients.findByFoodID", query = "SELECT f FROM FoodIngredients f WHERE f.foodID = :foodID"),
    @NamedQuery(name = "FoodIngredients.findByFoodName", query = "SELECT f FROM FoodIngredients f WHERE f.foodName = :foodName"),
    @NamedQuery(name = "FoodIngredients.findByFoodDescription", query = "SELECT f FROM FoodIngredients f WHERE f.foodDescription = :foodDescription"),
    @NamedQuery(name = "FoodIngredients.findByFoodEnergyKj", query = "SELECT f FROM FoodIngredients f WHERE f.foodEnergyKj = :foodEnergyKj"),
    @NamedQuery(name = "FoodIngredients.findByFoodProteinG", query = "SELECT f FROM FoodIngredients f WHERE f.foodProteinG = :foodProteinG"),
    @NamedQuery(name = "FoodIngredients.findByFoodFatG", query = "SELECT f FROM FoodIngredients f WHERE f.foodFatG = :foodFatG"),
    @NamedQuery(name = "FoodIngredients.findByFoodFatSatuatedG", query = "SELECT f FROM FoodIngredients f WHERE f.foodFatSatuatedG = :foodFatSatuatedG"),
    @NamedQuery(name = "FoodIngredients.findByFoodCarbG", query = "SELECT f FROM FoodIngredients f WHERE f.foodCarbG = :foodCarbG"),
    @NamedQuery(name = "FoodIngredients.findByFoodSugarG", query = "SELECT f FROM FoodIngredients f WHERE f.foodSugarG = :foodSugarG"),
    @NamedQuery(name = "FoodIngredients.findByFoodSodiumG", query = "SELECT f FROM FoodIngredients f WHERE f.foodSodiumG = :foodSodiumG"),
    @NamedQuery(name = "FoodIngredients.findByFoodGravity", query = "SELECT f FROM FoodIngredients f WHERE f.foodGravity = :foodGravity")})
public class FoodIngredients implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "food_ID")
    private String foodID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "food_name")
    private String foodName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "food_description")
    private String foodDescription;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "food_energy_kj")
    private String foodEnergyKj;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "food_protein_g")
    private String foodProteinG;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "food_fat_g")
    private String foodFatG;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "food_fat_satuated_g")
    private String foodFatSatuatedG;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "food_carb_g")
    private String foodCarbG;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "food_sugar_g")
    private String foodSugarG;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "food_sodium_g")
    private String foodSodiumG;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "food_gravity")
    private String foodGravity;

    public FoodIngredients() {
    }

    public FoodIngredients(String foodID) {
        this.foodID = foodID;
    }

    public FoodIngredients(String foodID, String foodName, String foodDescription, String foodEnergyKj, String foodProteinG, String foodFatG, String foodFatSatuatedG, String foodCarbG, String foodSugarG, String foodSodiumG, String foodGravity) {
        this.foodID = foodID;
        this.foodName = foodName;
        this.foodDescription = foodDescription;
        this.foodEnergyKj = foodEnergyKj;
        this.foodProteinG = foodProteinG;
        this.foodFatG = foodFatG;
        this.foodFatSatuatedG = foodFatSatuatedG;
        this.foodCarbG = foodCarbG;
        this.foodSugarG = foodSugarG;
        this.foodSodiumG = foodSodiumG;
        this.foodGravity = foodGravity;
    }

    public String getFoodID() {
        return foodID;
    }

    public void setFoodID(String foodID) {
        this.foodID = foodID;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodDescription() {
        return foodDescription;
    }

    public void setFoodDescription(String foodDescription) {
        this.foodDescription = foodDescription;
    }

    public String getFoodEnergyKj() {
        return foodEnergyKj;
    }

    public void setFoodEnergyKj(String foodEnergyKj) {
        this.foodEnergyKj = foodEnergyKj;
    }

    public String getFoodProteinG() {
        if(foodProteinG.contains(","))
            return foodProteinG.split(",")[0]+"."+foodProteinG.split(",")[1];
        return foodProteinG;
    }

    public void setFoodProteinG(String foodProteinG) {
        this.foodProteinG = foodProteinG;
    }

    public String getFoodFatG() {
        if (foodFatG.contains(","))
            return foodFatG.split(",")[0]+"."+foodFatG.split(",")[1];
        return foodFatG;
    }

    public void setFoodFatG(String foodFatG) {
        this.foodFatG = foodFatG;
    }

    public String getFoodFatSatuatedG() {
        if (foodFatSatuatedG.contains(","))
            return foodFatSatuatedG.split(",")[0]+"."+foodFatSatuatedG.split(",")[1];
        return foodFatSatuatedG;
    }

    public void setFoodFatSatuatedG(String foodFatSatuatedG) {
        this.foodFatSatuatedG = foodFatSatuatedG;
    }

    public String getFoodCarbG() {
        if(foodCarbG.contains(","))
            return foodCarbG.split(",")[0]+"."+foodCarbG.split(",")[0];
        return foodCarbG;
    }

    public void setFoodCarbG(String foodCarbG) {
        this.foodCarbG = foodCarbG;
    }

    public String getFoodSugarG() {
        if(foodSugarG.contains(","))
            return foodSugarG.split(",")[0]+"."+foodSugarG.split(",")[0];
        return foodSugarG;
    }

    public void setFoodSugarG(String foodSugarG) {
        this.foodSugarG = foodSugarG;
    }

    public String getFoodSodiumG() {
        return foodSodiumG;
    }

    public void setFoodSodiumG(String foodSodiumG) {
        this.foodSodiumG = foodSodiumG;
    }

    public String getFoodGravity() {
        if(foodGravity.contains(","))
            return foodGravity.split(",")[0]+"."+foodGravity.split(",")[0];
        return foodGravity;
    }

    public void setFoodGravity(String foodGravity) {
        this.foodGravity = foodGravity;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (foodID != null ? foodID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FoodIngredients)) {
            return false;
        }
        FoodIngredients other = (FoodIngredients) object;
        if ((this.foodID == null && other.foodID != null) || (this.foodID != null && !this.foodID.equals(other.foodID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sk.entities.FoodIngredients[ foodID=" + foodID + " ]";
    }

}
