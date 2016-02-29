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
@Table(name = "ingredients_listing")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "IngredientsListing.findAll", query = "SELECT i FROM IngredientsListing i"),
    @NamedQuery(name = "IngredientsListing.findByListID", query = "SELECT i FROM IngredientsListing i WHERE i.listID = :listID"),
    @NamedQuery(name = "IngredientsListing.findByListfoodID", query = "SELECT i FROM IngredientsListing i WHERE i.listfoodID = :listfoodID"),
    @NamedQuery(name = "IngredientsListing.findByListrecipeID", query = "SELECT i FROM IngredientsListing i WHERE i.listrecipeID = :listrecipeID"),
    @NamedQuery(name = "IngredientsListing.findByQuantity", query = "SELECT i FROM IngredientsListing i WHERE i.quantity = :quantity")})
public class IngredientsListing implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "list_ID")
    private Integer listID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "list_food_ID")
    private String listfoodID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "list_recipe_ID")
    private long listrecipeID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private double quantity;

    public IngredientsListing() {
    }

    public IngredientsListing(Integer listID) {
        this.listID = listID;
    }

    public IngredientsListing(Integer listID, String listfoodID, long listrecipeID, double quantity) {
        this.listID = listID;
        this.listfoodID = listfoodID;
        this.listrecipeID = listrecipeID;
        this.quantity = quantity;
    }

    public Integer getListID() {
        return listID;
    }

    public void setListID(Integer listID) {
        this.listID = listID;
    }

    public String getListfoodID() {
        return listfoodID;
    }

    public void setListfoodID(String listfoodID) {
        this.listfoodID = listfoodID;
    }

    public long getListrecipeID() {
        return listrecipeID;
    }

    public void setListrecipeID(long listrecipeID) {
        this.listrecipeID = listrecipeID;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (listID != null ? listID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof IngredientsListing)) {
            return false;
        }
        IngredientsListing other = (IngredientsListing) object;
        if ((this.listID == null && other.listID != null) || (this.listID != null && !this.listID.equals(other.listID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sk.entities.IngredientsListing[ listID=" + listID + " ]";
    }
    
}
