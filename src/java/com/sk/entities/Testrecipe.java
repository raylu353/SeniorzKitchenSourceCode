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
@Table(name = "testrecipe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Testrecipe.findAll", query = "SELECT t FROM Testrecipe t"),
    @NamedQuery(name = "Testrecipe.findByRecipeID", query = "SELECT t FROM Testrecipe t WHERE t.recipeID = :recipeID"),
    @NamedQuery(name = "Testrecipe.findByRecipeName", query = "SELECT t FROM Testrecipe t WHERE t.recipeName = :recipeName"),
    @NamedQuery(name = "Testrecipe.findByRecipeDesc", query = "SELECT t FROM Testrecipe t WHERE t.recipeDesc = :recipeDesc"),
    @NamedQuery(name = "Testrecipe.findByRecipeTags", query = "SELECT t FROM Testrecipe t WHERE t.recipeTags = :recipeTags"),
    @NamedQuery(name = "Testrecipe.findByRecipePic", query = "SELECT t FROM Testrecipe t WHERE t.recipePic = :recipePic"),
    @NamedQuery(name = "Testrecipe.findByRecipeNumLikes", query = "SELECT t FROM Testrecipe t WHERE t.recipeNumLikes = :recipeNumLikes"),
    @NamedQuery(name = "Testrecipe.findByRecipeCooktime", query = "SELECT t FROM Testrecipe t WHERE t.recipeCooktime = :recipeCooktime")})
public class Testrecipe implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "recipe_ID")
    private Long recipeID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "recipe_name")
    private String recipeName;
    @Size(max = 200)
    @Column(name = "recipe_desc")
    private String recipeDesc;
    @Size(max = 200)
    @Column(name = "recipe_tags")
    private String recipeTags;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "recipe_method")
    private String recipeMethod;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "recipe_pic")
    private String recipePic;
    @Column(name = "recipe_num_likes")
    private Integer recipeNumLikes;
    @Size(max = 45)
    @Column(name = "recipe_cooktime")
    private String recipeCooktime;
    @Lob
    @Size(max = 65535)
    @Column(name = "recipe_ingredients")
    private String recipeIngredients;

    public Testrecipe() {
    }

    public Testrecipe(Long recipeID) {
        this.recipeID = recipeID;
    }

    public Testrecipe(Long recipeID, String recipeName, String recipeMethod, String recipePic) {
        this.recipeID = recipeID;
        this.recipeName = recipeName;
        this.recipeMethod = recipeMethod;
        this.recipePic = recipePic;
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

    public String getRecipeTags() {
        return recipeTags;
    }

    public void setRecipeTags(String recipeTags) {
        this.recipeTags = recipeTags;
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

    public Integer getRecipeNumLikes() {
        return recipeNumLikes;
    }

    public void setRecipeNumLikes(Integer recipeNumLikes) {
        this.recipeNumLikes = recipeNumLikes;
    }

    public String getRecipeCooktime() {
        return recipeCooktime;
    }

    public void setRecipeCooktime(String recipeCooktime) {
        this.recipeCooktime = recipeCooktime;
    }

    public String getRecipeIngredients() {
        return recipeIngredients;
    }

    public void setRecipeIngredients(String recipeIngredients) {
        this.recipeIngredients = recipeIngredients;
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
        if (!(object instanceof Testrecipe)) {
            return false;
        }
        Testrecipe other = (Testrecipe) object;
        if ((this.recipeID == null && other.recipeID != null) || (this.recipeID != null && !this.recipeID.equals(other.recipeID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sk.entities.Testrecipe[ recipeID=" + recipeID + " ]";
    }
    
}
