/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.service;

import com.sk.entities.RecipeListing;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author ray
 */
@Stateless
@Path("com.sk.entities.recipelisting")
public class RecipeListingFacadeREST extends AbstractFacade<RecipeListing> {
    @PersistenceContext(unitName = "SeniorzKitchenPU")
    private EntityManager em;

    public RecipeListingFacadeREST() {
        super(RecipeListing.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(RecipeListing entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Long id, RecipeListing entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Long id) {
        super.remove(super.find(id));
    }
   
    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public RecipeListing find(@PathParam("id") Long id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<RecipeListing> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<RecipeListing> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }
    
    
    
    
    @GET
    @Path("user/{userID}")
    @Produces({"application/xml", "application/json"})
    public List<RecipeListing> findByUserID(@PathParam("userID") String userID) {
        return em.createNativeQuery("select * from recipe_listing where rlist_user_id="+userID+";", RecipeListing.class).getResultList();
    }
    
    @GET
    @Path("has/{recipeID}/{userID}")
    @Produces({"application/xml", "application/json"})
    public RecipeListing hasARecord(@PathParam("userID") String userID, @PathParam("recipeID") String recipeID) {
        return (RecipeListing)em.createNativeQuery("select * FROM recipe_listing r where r.rlist_user_id=" +userID+" and r.rlist_recipe_id =" + recipeID +";",RecipeListing.class).getSingleResult();
    }
    
    
    @GET
    @Path("recipe/{recipeID}")
    @Produces({"application/xml", "application/json"})
    public List<RecipeListing> findByRecipeID(@PathParam("recipeID") String recipeID) {
        return em.createNativeQuery("select * from recipe_listing where rlist_recipe_id="+recipeID+";", RecipeListing.class).getResultList();
    }
    
    @GET
    @Path("userCount/{userID}")
    @Produces("text/plain")
    public String countRecipeByUserID(@PathParam("userID") String userID) {
        return String.valueOf(em.createNativeQuery("select count(*) from recipe_listing where rlist_user_id="+userID+";").getSingleResult());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
