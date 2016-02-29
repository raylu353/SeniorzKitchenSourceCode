<%-- 
    Document   : collecting
    Created on : Sep 19, 2015, 1:21:16 PM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.webhandle.RecipeManager"%>
<%@page import="com.sk.model.Recipe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sk.model.NutritionCalc"%>
<%@page import="com.sk.model.Food" %>
<%@page import="com.sk.model.User" %>
<%@page import="com.sk.webhandle.RecipeCollection"%>
<%@page import= "java.text.DecimalFormat"%>

<%
   Recipe recipe = new Recipe();
   User user = new User();
   if(session.getAttribute("CurrentRecipe") != null)
   {
       recipe = (Recipe) session.getAttribute("CurrentRecipe");
   }
   if(session.getAttribute("CurrentUser") != null)
   {
       user = (User) session.getAttribute("CurrentUser");
   }
   
   //update recipe and recipe Listing
   if(request.getParameter("command").trim().equals("like"))
   {
        recipe.setLikesNumber(recipe.getLikesNumber() + 1);
        recipe.updateRecipeToDB();
        System.out.println("Recipe Likes Updaetd");
        RecipeCollection rc = new RecipeCollection();
        rc.addRecipeToCollection(recipe.getId(), user.getID());
        System.out.println("Recipe has been added to Collection");
   }
   if(request.getParameter("command").trim().equals("unlike"))
   {
        recipe.setLikesNumber(recipe.getLikesNumber() - 1);
        recipe.updateRecipeToDB();
        System.out.println("Recipe Likes Updaetd");
        
        RecipeCollection rc = new RecipeCollection();
        rc.removeReipeFromCollection(recipe.getId(), user.getID());
        System.out.println("Recipe has been Removed to Collection");
   }
   
    
    
    
    
    
%>