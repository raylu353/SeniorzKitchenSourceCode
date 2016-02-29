/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.service;

import java.util.Set;
import javax.ws.rs.core.Application;
/**
 *
 * @author wjc1856
 */
@javax.ws.rs.ApplicationPath("webresources")

public class ApplicationConfig extends Application {
    
    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<> ();
        addRestResourcesClasses(resources);
        return resources;
    }
    
    private void addRestResourcesClasses(Set<Class<?>> resources) {
        resources.add(com.sk.service.FoodIngredientsFacadeREST.class);
        resources.add(com.sk.service.TestrecipeFacadeREST.class);
        resources.add(com.sk.service.UsersFacadeREST.class);
        resources.add(com.sk.service.RecipesFacadeREST.class);
        resources.add(com.sk.service.IngredientsListingFacadeREST.class);
        resources.add(com.sk.service.RecipeListingFacadeREST.class);
        resources.add(com.sk.service.CommentsFacadeREST.class);
        resources.add(com.sk.service.UserIntakeFacadeREST.class);
    }

    
}
