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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ray
 */
@Entity
@Table(name = "user_intake")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserIntake.findAll", query = "SELECT u FROM UserIntake u"),
    @NamedQuery(name = "UserIntake.findByUserId", query = "SELECT u FROM UserIntake u WHERE u.userId = :userId"),
    @NamedQuery(name = "UserIntake.findByEngergyLimit", query = "SELECT u FROM UserIntake u WHERE u.engergyLimit = :engergyLimit"),
    @NamedQuery(name = "UserIntake.findByProteinLimit", query = "SELECT u FROM UserIntake u WHERE u.proteinLimit = :proteinLimit"),
    @NamedQuery(name = "UserIntake.findByFatLimit", query = "SELECT u FROM UserIntake u WHERE u.fatLimit = :fatLimit"),
    @NamedQuery(name = "UserIntake.findByFatSaLimit", query = "SELECT u FROM UserIntake u WHERE u.fatSaLimit = :fatSaLimit"),
    @NamedQuery(name = "UserIntake.findByCarboLimit", query = "SELECT u FROM UserIntake u WHERE u.carboLimit = :carboLimit"),
    @NamedQuery(name = "UserIntake.findBySugarLimit", query = "SELECT u FROM UserIntake u WHERE u.sugarLimit = :sugarLimit"),
    @NamedQuery(name = "UserIntake.findBySodiumLimit", query = "SELECT u FROM UserIntake u WHERE u.sodiumLimit = :sodiumLimit")})
public class UserIntake implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "user_id")
    private Long userId;
    @Column(name = "engergy_limit")
    private Integer engergyLimit;
    @Column(name = "protein_limit")
    private Integer proteinLimit;
    @Column(name = "fat_limit")
    private Integer fatLimit;
    @Column(name = "fat_sa_limit")
    private Integer fatSaLimit;
    @Column(name = "carbo_limit")
    private Integer carboLimit;
    @Column(name = "sugar_limit")
    private Integer sugarLimit;
    @Column(name = "sodium_limit")
    private Integer sodiumLimit;

    public UserIntake() {
    }

    public UserIntake(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getEngergyLimit() {
        return engergyLimit;
    }

    public void setEngergyLimit(Integer engergyLimit) {
        this.engergyLimit = engergyLimit;
    }

    public Integer getProteinLimit() {
        return proteinLimit;
    }

    public void setProteinLimit(Integer proteinLimit) {
        this.proteinLimit = proteinLimit;
    }

    public Integer getFatLimit() {
        return fatLimit;
    }

    public void setFatLimit(Integer fatLimit) {
        this.fatLimit = fatLimit;
    }

    public Integer getFatSaLimit() {
        return fatSaLimit;
    }

    public void setFatSaLimit(Integer fatSaLimit) {
        this.fatSaLimit = fatSaLimit;
    }

    public Integer getCarboLimit() {
        return carboLimit;
    }

    public void setCarboLimit(Integer carboLimit) {
        this.carboLimit = carboLimit;
    }

    public Integer getSugarLimit() {
        return sugarLimit;
    }

    public void setSugarLimit(Integer sugarLimit) {
        this.sugarLimit = sugarLimit;
    }

    public Integer getSodiumLimit() {
        return sodiumLimit;
    }

    public void setSodiumLimit(Integer sodiumLimit) {
        this.sodiumLimit = sodiumLimit;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserIntake)) {
            return false;
        }
        UserIntake other = (UserIntake) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sk.entities.UserIntake[ userId=" + userId + " ]";
    }
    
}
