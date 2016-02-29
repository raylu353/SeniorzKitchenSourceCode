/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sk.webhandle;

import com.sk.client.FoodIngredientsClient;
import com.sk.client.RecipesClient;
import com.sk.entities.Recipes;
import com.sk.model.Recipe;
import java.util.ArrayList;
import java.util.HashMap;
import javax.ws.rs.core.Response;

/**
 *
 * @author ray
 */
public class SearchManager {

    ArrayList<String> criteriaList;
    private ArrayList<String> nameList;
    private ArrayList<String> tagsList;
    private ArrayList<String> nameCriteria;
    private ArrayList<String> tagCriteria;
    HashMap<String, Integer> recipes;

    ArrayList<Recipe> recipeList = new ArrayList<>();

    public SearchManager() {
        criteriaList = new ArrayList<>();
        tagsList = new ArrayList<>();
        nameList = new ArrayList<>();
        nameCriteria = new ArrayList<>();
        tagCriteria = new ArrayList<>();
    }

    private void setFoodNameList() {
        RecipesClient rc = new RecipesClient();

        try {
            Response res = rc.getAllFoodNames(Response.class);
            String result = res.readEntity(String.class);

            result = result.substring(1, result.length() - 1);
            String[] resultArray = result.split(",");

            for (String item : resultArray) {
                nameList.add(item.trim());
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            rc.close();
        }
        System.out.println("GetFoodNameList Done.");
    }

    private void setTagList() {
        RecipesClient rc = new RecipesClient();
        ArrayList<String> resultList = new ArrayList<>();
        try {
            Response res = rc.getAllTags(Response.class);
            String result = res.readEntity(String.class);
            result = result.substring(1, result.length() - 1).toLowerCase();
            char[] charList = result.toCharArray();
            StringBuilder sb = new StringBuilder();
            Boolean flag = false;
            for (int i = 0; i < result.length(); i++) {
                if (charList[i] == '#') {
                    sb = new StringBuilder();
                    sb.append(charList[i]);
                    flag = true;
                    continue;
                }
                if (charList[i] < 'a' || charList[i] > 'z') {
                    if (flag) {
                        if (resultList.contains(sb.toString())) {
                            flag = false;
                            continue;
                        }
                        resultList.add(sb.toString());
                        flag = false;
                    }
                }
                if (flag) {
                    sb.append(charList[i]);
                }
            }

            tagsList = resultList;
        } catch (Exception e) {
        } finally {
            rc.close();
        }
        System.out.println("GetTagsNameList Done.");
    }

    /**
     * @return the nameList
     */
    public ArrayList<String> getNameList() {
        setFoodNameList();
        return nameList;
    }

    /**
     * @return the tagsList
     */
    public ArrayList<String> getTagsList() {
        setTagList();
        return tagsList;
    }

    public String getCriteriasToString() {
        String criteris = "";
        ArrayList<String> x = getTagsList();
        ArrayList<String> y = getNameList();
        for (String s : x) {
            criteris = criteris + "\"" + s + "\",";
        }

        for (String s : y) {
            criteris = criteris + "\"" + s + "\",";
        }
        return criteris;
    }

    private void setCriteriaString(String criteriaString) {

        String[] criterias = criteriaString.split(",");
        for (String s : criterias) {
            if (s.contains("#")) {
                tagCriteria.add(s.trim());
                System.out.println("Tags: " + s);
            } else {
                nameCriteria.add(s.trim());
                System.out.println("Foods: " + s);
            }
        }
    }

    public HashMap<String, Integer> searchRelatedRecipe(String criteriaString) {
        recipes = new HashMap<String, Integer>();
        setCriteriaString(criteriaString);
        System.out.println("CriteriaString in SM: " + criteriaString);
        //food name -> food id -> ingredients list -> recipe ID -> ID List
        for (String foodname : nameCriteria) {
            FoodIngredientsClient fiClient = new FoodIngredientsClient();
            try {
                Response res = fiClient.getRecipeIdByFoodName(Response.class, foodname);
                String result = res.readEntity(String.class);
                String[] resultlist = result.substring(1, result.length() - 1).split(",");
                for (String s : resultlist) {
                    if (recipes.containsKey(s.trim())) {
                        int count = recipes.get(s.trim());
                        recipes.put(s.trim(), ++count);
                    } else {
                        recipes.put(s.trim(), 1);
                    }
                }
            } catch (Exception e) {
                System.out.println("Error?: " + e);
            } finally {
                fiClient.close();
            }
        }
        System.out.println(recipes.keySet());
        for (String tag : tagCriteria) {
            RecipesClient rClient = new RecipesClient();
            try {
                Response res = rClient.getRecipesByTag(Response.class, tag.substring(1));
                String result = res.readEntity(String.class);
                String[] resultlist = result.substring(1, result.length() - 1).split(",");
                for (String s : resultlist) {
                    if (recipes.containsKey(s.trim())) {
                        int count = recipes.get(s.trim());
                        recipes.put(s.trim(), ++count);
                    } else {
                        recipes.put(s.trim(), 1);
                    }
                }
            } catch (Exception e) {
                System.out.println("Error?: " + e);
            } finally {
                rClient.close();
            }
        }

        System.out.println(recipes.keySet());
        //tags -> recipe ID ->ID List
        return recipes;
    }

    public ArrayList<String> firstClassRecipes() {
        ArrayList<String> firstClass = new ArrayList<>();
        try {
            for (String s : recipes.keySet()) {
                if (recipes.get(s) == nameCriteria.size() + tagCriteria.size()) {
                    firstClass.add(s);
                }
            }
            return firstClass;
        } catch (Exception e) {

        }

        return null;

    }

    public ArrayList<String> secondClassRecipes() {
        ArrayList<String> secondClass = new ArrayList<>();
        for (String s : recipes.keySet()) {
            if (recipes.get(s) == nameCriteria.size() + tagCriteria.size() - 1) {
                secondClass.add(s);
            }
        }
        return secondClass;
    }

    public ArrayList<Recipe> getResultRecipes(ArrayList<String> ids) {
        recipeList = new ArrayList<>();
        try {
            for (String id : ids) {
                RecipesClient rclient = new RecipesClient();
                try {
                    Response res = rclient.find_JSON(Response.class, id);
                    Recipe recipe = new Recipe(res.readEntity(Recipes.class));
                    recipeList.add(recipe);

                } catch (Exception e) {
                    System.out.println("Error??: " + e);
                } finally {
                    rclient.close();
                }

            }
            return recipeList;
        } catch (Exception e) {
        }
        return new ArrayList<Recipe>();
    }

    public Recipe getARecipeByID(String ID) {
        for (Recipe recipe : recipeList) {
            if (recipe.getId().equals(ID)) {
                return recipe;
            }
        }

        return null;
    }

    public void removeARecipeFromList(String id) {
        for (Recipe recipe : recipeList) {
            if (recipe.getId().equals(id)) {
                recipeList.remove(recipe);
                break;
            }
        }
    }

}
