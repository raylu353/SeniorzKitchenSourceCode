<%-- 
    Document   : searchResult
    Created on : Sep 21, 2015, 12:02:57 AM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.sk.webhandle.SearchManager"%>
<%@page import="com.sk.model.Recipe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sk.webhandle.RecipeManager"%>


<%
    SearchManager sm = new SearchManager();
    if (request.getParameter("command") != null) {
        RecipeManager rm = new RecipeManager();
        rm.deleteARecipe(request.getParameter("deleteID"));
        System.out.println("Recipe " + request.getParameter("deleteID") + " has been deleted!");
        sm.removeARecipeFromList(request.getParameter("deleteID"));
    }

    //SearchManager sm = (SearchManager) session.getAttribute("SearchManager");
    if (request.getParameter("criteria") != null) {
        String criteriaString = request.getParameter("criteria");

        System.out.println("Param : " + criteriaString);
        //get the result, will call firstclass / secondclass function to retrive the result
        sm.searchRelatedRecipe(criteriaString);
    } else {
        sm = (SearchManager) session.getAttribute("SearchManager");
    }

    ArrayList<Recipe> recipeList = sm.getResultRecipes(sm.firstClassRecipes());
    session.setAttribute("SearchManager", sm);


%>
<div>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="contentArea">
            <div class="row">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="list-group">
                        </div>
                        <%       if (recipeList.size() != 0) {
                                for (Recipe recipe : recipeList) {
                        %>
                        <div class="list-group-item" id="<%=recipe.getId()%>" onclick="$('#recipeViewArea').load('mykitchen/recipeDetails.jsp', {'recID': $(this).attr('id'), 'from': 'searchResult'});
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
                            } else {
                                out.println("No Recipe Found.");
                            }

                        %>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

<script>
    $(document).ready(function () {
        $('#listArea').show();
        $('#recipeViewArea').hide();
        $('#loadingArea').hide();

    });

    
</script>