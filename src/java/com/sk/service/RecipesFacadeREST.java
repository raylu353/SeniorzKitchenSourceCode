/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.service;

import com.sk.entities.Recipes;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
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
import javax.ws.rs.core.MediaType;

/**
 *
 * @author ray
 */
@Stateless
@Path("com.sk.entities.recipes")
public class RecipesFacadeREST extends AbstractFacade<Recipes> {
    @PersistenceContext(unitName = "SeniorzKitchenPU")
    private EntityManager em;

    public RecipesFacadeREST() {
        super(Recipes.class);
    }

    @POST
    @Override
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void create(Recipes entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Long id, Recipes entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Long id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Recipes find(@PathParam("id") Long id) {
        return super.find(id); 
    }

    @GET
    @Override
    
    public List<Recipes> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Recipes> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }
    
    @GET
    @Path("mockname/{mock}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Recipes findMock(@PathParam("mock") String name) {
        return (Recipes)(em.createNativeQuery("select * from recipes r where r.recipe_name = '" + name + "'and r.recipe_author_ID= 0 ",Recipes.class).getSingleResult());
    }
    
    @GET
    @Path("recipeCount/{authorID}")
    @Produces("text/plain")
    public String countRecipeByAuthorID(@PathParam("authorID") String authorID) {
        return String.valueOf(em.createNativeQuery("select count(*) from recipes where recipe_author_id="+authorID+";").getSingleResult());
    }
    
    @GET
    @Path("sumLikes/{authorID}")
    @Produces("text/plain")
    public String sumLikesByAuthorID(@PathParam("authorID") String authorID) {
        return String.valueOf(em.createNativeQuery("select sum(recipe_num_likes) from recipes where recipe_author_id="+authorID+";").getSingleResult());
    }
    
    @GET
    @Path("allID")
    @Produces("text/plain")
    public String findAllRecipeID() { 
        return  em.createNativeQuery("select recipe_id from recipes;").getResultList().toString();           
    }
    
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    @GET
    @Path("getNames/")
    @Produces({MediaType.APPLICATION_JSON})
    public String getNamesInDB() {
        String result = em.createNativeQuery("select distinct food_name from food_ingredients f,ingredients_listing i where f.food_id = i.list_food_id;").getResultList().toString();
        return result;
    }
    
    @GET
    @Path("getTags/")
    @Produces({MediaType.APPLICATION_JSON})
    public String getHasTagsInDB() {
        String result = em.createNativeQuery("select substr(recipe_desc,Locate('#',recipe_desc)) from recipes where recipe_desc like '%#%';").getResultList().toString();
        return result;
    }
    
    @GET
    @Path("byTag/{tag}")
    @Produces({MediaType.APPLICATION_JSON})
    public String getHasTagsInDB(@PathParam("tag") String tag) {
        String result = em.createNativeQuery("select recipe_id from recipes r where r.recipe_desc like '%#" + tag +"%';").getResultList().toString();
        return result;
    }
    
    
}
