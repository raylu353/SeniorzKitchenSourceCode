<%-- 
    Document   : recipeList
    Created on : Sep 18, 2015, Sep 7, 2015 3:07:41 PM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.webhandle.RecipeCollection"%>
<%@page import="com.sk.model.Recipe"%>
<%@page import="com.sk.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sk.webhandle.RecipeManager"%>


<%
    RecipeCollection rc = new RecipeCollection();
    RecipeManager rm = new RecipeManager();
    User user = new User();
    if (session.getAttribute("CurrentUser") != null) {
        user = (User) session.getAttribute("CurrentUser");
    } else {
        user.setID("9999");
    }

    if (request.getParameter("command") != null) {
        if (request.getParameter("command").equals("delete")) {
            rm.deleteARecipe(request.getParameter("deleteID"));
        }
    }

    String title = "My Recipes Collection";
    ArrayList<Recipe> recipeList = rc.getRecipesFromDB(user.getID());

    if (request.getParameter("cmd") != null) {
        if (request.getParameter("cmd").equals("likes")) {
            recipeList = rc.getPopular(user.getNickName());
            if (recipeList.size() != 0) {
                title = "My Popular Recipes";
            } else {
                title = "There are no likes for your recipes.";
            }
        }
        if (request.getParameter("cmd").equals("own")) {
            
            recipeList = rc.getOwn(user.getNickName());
            if(recipeList.size() != 0)
            title = "My Recipes";
            else
                title = "There are no recipes created by you.";
        }
        if (request.getParameter("cmd").equals("coll")) {
            title = "Favorite Recipes";
            recipeList = rc.getOthers(user.getNickName());
            if (recipeList.size() == 0)
                title = "There are no favorite recipes.";
        }
    }

    //Set the RecipeList session
    session.setAttribute("MyCollection", rc);

    int recipeNum = recipeList.size();
    System.out.println("How Many Recipes: " + recipeList.size());

%>
<!DOCTYPE html>

<!--<div class="container-fluid">-->
<div class="row">
    <div class="col-lg-12">
        <h3 class="page-header"><%=title%></h3>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="list-group">
            <%
                for (Recipe recipe : recipeList) {
            %>             
            <div class="list-group-item" id="<%=recipe.getId()%>" 
                 onclick="$('#recipeViewArea').load('mykitchen/recipeDetails.jsp', {'recID': $(this).attr('id'), 'from': 'myCollection'});
                         $('#page-wrapper').hide();
                         $('#recipeViewArea').show();">           
                <div class="row" style="cursor:pointer">
                    <div class="col-lg-2" id="recipePic">
                        <img src="img/default-recipe-img.png" class="img-box" alt="" />
                    </div>
                    <div class="col-lg-4" id="recipeNameandDesc">
                        <h4><%=recipe.getName()%></h4>
                        <p>
                            <%=recipe.getDescription()%>
                        </p>
                    </div>
                    <div class="col-lg-4" id="likecomment">
                        Likes: <%=recipe.getLikesNumber()%>
                    </div>
                    <div class="col-lg-4" id="Author Name">
                        Author:<b> <%=recipe.getAuthorName()%></b>
                    </div>
                </div>
            </div>

            <%}
                if (recipeList.size() == 0) {
                    out.println("Sorry, no recipes here.");
                }%>

        </div>
    </div>
</div>
<!--</div>-->
<script>
    $(document).ready(function () {
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
        $('#loadingArea').hide();

    });

</script>