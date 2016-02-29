/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ray
 */
@Entity
@Table(name = "recipes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Recipes.findAll", query = "SELECT r FROM Recipes r"),
    @NamedQuery(name = "Recipes.findByRecipeID", query = "SELECT r FROM Recipes r WHERE r.recipeID = :recipeID"),
    @NamedQuery(name = "Recipes.findByRecipeName", query = "SELECT r FROM Recipes r WHERE r.recipeName = :recipeName"),
    @NamedQuery(name = "Recipes.findByRecipeDesc", query = "SELECT r FROM Recipes r WHERE r.recipeDesc = :recipeDesc"),
    @NamedQuery(name = "Recipes.findByRecipeNumLikes", query = "SELECT r FROM Recipes r WHERE r.recipeNumLikes = :recipeNumLikes"),
    @NamedQuery(name = "Recipes.findByRecipeauthorID", query = "SELECT r FROM Recipes r WHERE r.recipeauthorID = :recipeauthorID")})
public class Recipes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "recipe_ID")
    private Long recipeID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "recipe_name")
    private String recipeName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 500)
    @Column(name = "recipe_desc")
    private String recipeDesc;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "recipe_method")
    private String recipeMethod;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "recipe_pic")
    private String recipePic;
    @Basic(optional = false)
    @NotNull
    @Column(name = "recipe_num_likes")
    private int recipeNumLikes;
    @Basic(optional = false)
    @NotNull
    @Column(name = "recipe_author_ID")
    private long recipeauthorID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "recipe_serving")
    private int recipe_serving;

    public Recipes() {
    }

    public Recipes(Long recipeID) {
        this.recipeID = recipeID;
    }

    public Recipes(Long recipeID, String recipeName, String recipeDesc, String recipeMethod, String recipePic, int recipeNumLikes, long recipeauthorID) {
        this.recipeID = recipeID;
        this.recipeName = recipeName;
        this.recipeDesc = recipeDesc;
        this.recipeMethod = recipeMethod;
        this.recipePic = recipePic;
        this.recipeNumLikes = recipeNumLikes;
        this.recipeauthorID = recipeauthorID;
    }

    public Long getRecipeID() {
        return recipeID;
    }

    public void setRecipeID(Long recipeID) {
        this.recipeID = recipeID;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getRecipeDesc() {
        return recipeDesc;
    }

    public void setRecipeDesc(String recipeDesc) {
        this.recipeDesc = recipeDesc;
    }

    public String getRecipeMethod() {
        return recipeMethod;
    }

    public void setRecipeMethod(String recipeMethod) {
        this.recipeMethod = recipeMethod;
    }

    public String getRecipePic() {
        return recipePic;
    }

    public void setRecipePic(String recipePic) {
        this.recipePic = recipePic;
    }

    public int getRecipeNumLikes() {
        return recipeNumLikes;
    }

    public void setRecipeNumLikes(int recipeNumLikes) {
        this.recipeNumLikes = recipeNumLikes;
    }

    public long getRecipeauthorID() {
        return recipeauthorID;
    }

    public void setRecipeauthorID(long recipeauthorID) {
        this.recipeauthorID = recipeauthorID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (recipeID != null ? recipeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Recipes)) {
            return false;
        }
        Recipes other = (Recipes) object;
        if ((this.recipeID == null && other.recipeID != null) || (this.recipeID != null && !this.recipeID.equals(other.recipeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sk.entities.Recipes[ recipeID=" + recipeID + " ]";
    }

    /**
     * @return the recipe_serving
     */
    public int getRecipe_serving() {
        return recipe_serving;
    }

    /**
     * @param recipe_serving the recipe_serving to set
     */
    public void setRecipe_serving(int recipe_serving) {
        this.recipe_serving = recipe_serving;
    }
    
}
