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
@Table(name = "recipe_listing")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RecipeListing.findAll", query = "SELECT r FROM RecipeListing r"),
    @NamedQuery(name = "RecipeListing.findByRlistID", query = "SELECT r FROM RecipeListing r WHERE r.rlistID = :rlistID"),
    @NamedQuery(name = "RecipeListing.findByRlistDesc", query = "SELECT r FROM RecipeListing r WHERE r.rlistDesc = :rlistDesc"),
    @NamedQuery(name = "RecipeListing.findByRlistuserID", query = "SELECT r FROM RecipeListing r WHERE r.rlistuserID = :rlistuserID"),
    @NamedQuery(name = "RecipeListing.findByRlistrecipeID", query = "SELECT r FROM RecipeListing r WHERE r.rlistrecipeID = :rlistrecipeID")})
public class RecipeListing implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "rlist_ID")
    private Long rlistID;
    @Size(max = 100)
    @Column(name = "rlist_desc")
    private String rlistDesc;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rlist_user_ID")
    private long rlistuserID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "rlist_recipe_ID")
    private long rlistrecipeID;

    public RecipeListing() {
    }

    public RecipeListing(Long rlistID) {
        this.rlistID = rlistID;
    }

    public RecipeListing(Long rlistID, long rlistuserID, long rlistrecipeID) {
        this.rlistID = rlistID;
        this.rlistuserID = rlistuserID;
        this.rlistrecipeID = rlistrecipeID;
    }

    public Long getRlistID() {
        return rlistID;
    }

    public void setRlistID(Long rlistID) {
        this.rlistID = rlistID;
    }

    public String getRlistDesc() {
        return rlistDesc;
    }

    public void setRlistDesc(String rlistDesc) {
        this.rlistDesc = rlistDesc;
    }

    public long getRlistuserID() {
        return rlistuserID;
    }

    public void setRlistuserID(long rlistuserID) {
        this.rlistuserID = rlistuserID;
    }

    public long getRlistrecipeID() {
        return rlistrecipeID;
    }

    public void setRlistrecipeID(long rlistrecipeID) {
        this.rlistrecipeID = rlistrecipeID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (rlistID != null ? rlistID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RecipeListing)) {
            return false;
        }
        RecipeListing other = (RecipeListing) object;
        if ((this.rlistID == null && other.rlistID != null) || (this.rlistID != null && !this.rlistID.equals(other.rlistID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sk.entities.RecipeListing[ rlistID=" + rlistID + " ]";
    }
    
}
