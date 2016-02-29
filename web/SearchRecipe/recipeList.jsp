<%-- 
    Document   : recipeList
    Created on : Sep 7, 2015, Sep 7, 2015 3:37:41 AM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.webhandle.RecipeManager"%>
<%@page import="com.sk.model.Recipe"%>
<%@page import="java.util.ArrayList"%>
<%
    RecipeManager rm = new RecipeManager();

    if (request.getParameter("command") != null) {
        if (request.getParameter("command").equals("delete")) {
            rm.deleteARecipe(request.getParameter("deleteID"));
            System.out.println("Deleting.");
        }
    }

    ArrayList<Recipe> recipeList = rm.getAllRecipe();
    for (Recipe r : recipeList) {
        if (r.getId().equals(request.getParameter("deleteID"))) {
            recipeList.remove(r);
        }
    }
    //Set the RecipeList session
    session.setAttribute("RecipeList", rm);

    int recipeNum = recipeList.size();
    System.out.println("How Many Recipes: " + recipeList.size());

%>
<!DOCTYPE html>

<!--<div class="container-fluid">-->
<div>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="contentArea">

            <div class="row">
                <div class="col-lg-12">
                    <div class="list-group">
                        <%                for (Recipe recipe : recipeList) {
                        %>             
                        <div class="list-group-item" id="<%=recipe.getId()%>" onclick="$('#recipeViewArea').load('mykitchen/recipeDetails.jsp', {'recID': $(this).attr('id'), 'from': 'recipeList'});
                                $('#page-wrapper').hide();
                                $('#recipeViewArea').show();">
                            <div class="row" style="cursor: pointer">
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
                                out.println("Dont' have any recipe in library");
                            }%>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--</div>-->
<script>

    $(document).ready(function () {
        $('#listArea').show();
        $('#recipeViewArea').hide();
        $('#loadingArea').hide();
    });
    
    
</script>