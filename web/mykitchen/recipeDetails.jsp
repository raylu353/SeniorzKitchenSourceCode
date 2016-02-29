<%-- 
    Document   : recipeDetails
    Created on : Sep 9, 2015, Sep 9, 2015 1:15:51 PM
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
<%@page import="com.sk.client.UserClient"%>
<%@page import= "java.text.DecimalFormat"%>
<%@page import="com.sk.webhandle.DashManager"%>
<%@page import="com.sk.webhandle.SearchManager"%>

<%
    NutritionCalc nc = new NutritionCalc();
    Recipe recipe = new Recipe();
    String from = request.getParameter("from");
    if (from.equals("recipeList") && session.getAttribute("RecipeList") != null) {
        RecipeManager rm = (RecipeManager) session.getAttribute("RecipeList");
        //Find the particular recipe
        recipe = rm.getARecipeByID(request.getParameter("recID"));
    } else if (from.equals("myCollection") && session.getAttribute("MyCollection") != null) {
        RecipeCollection rc = (RecipeCollection) session.getAttribute("MyCollection");
        recipe = rc.getARecipeByID(request.getParameter("recID"));
    } else if (from.equals("randomList") && session.getAttribute("DashManager") != null) {
        DashManager dm = (DashManager) session.getAttribute("DashManager");
        recipe = dm.getARecipeByID(request.getParameter("recID"));
        System.out.println("NC Weight: " + recipe.getNc().getTotalWeight());
    } else if (from.equals("searchResult") && session.getAttribute("SearchManager") != null) {
        SearchManager sm = (SearchManager) session.getAttribute("SearchManager");
        recipe = sm.getARecipeByID(request.getParameter("recID"));
        System.out.println("Recipe Loaded? " + recipe.getName());
    }

    //set the reipe to session
    if (session.getAttribute("CurrentRecipe") != null) {
        session.removeAttribute("CurrentRecipe");
    }
    session.setAttribute("CurrentRecipe", recipe);

    nc = recipe.getNc();
    DecimalFormat df = new DecimalFormat("######0.00");

    String userStatus = "";
    String canChange = "";
    String socialFunction = "";
    String inCollection = "";
    if (session.getAttribute("CurrentUser") != null)// logged in.
    {
        User user = (User) session.getAttribute("CurrentUser");
        userStatus = "true";
        if (user.getID().trim().equals(recipe.getAuthorID().trim())) {
            canChange = "true";

        } else {
            canChange = "false";
        }
        RecipeCollection checkCollection = new RecipeCollection();
        inCollection = String.valueOf(checkCollection.inCollection(recipe.getId(), user.getID()));
        socialFunction = "true";

    } else {
        userStatus = "false";
        canChange = "false";
        socialFunction = "false";

    }


%>

<!DOCTYPE html>
<div class="row" style="margin: 5px">
    <div class="fa fa-arrow-left btn btn-theme btn-small" id="backBtn" type="button">Back</div>
</div>
<div class="row">
    <div id="RecipeHeader">
        <h2 class="page-header col-sm-offset-1 col-sm-6"><%=recipe.getName()%>

        </h2>
        <% if (recipe.getAuthorName().equals("seniorzkitchen")) { %>
        <h5 id="ukrecipe" class="col-sm-offset-1 col-sm-6">
            *This recipe is reproduced by permission of Diabetes UK.<br>
            For more information or support in managing diabetes go to www.diabetes.org.uk
        </h5>
        <%}%>

        <h4 class="col-sm-offset-1 col-sm-6">By <%=recipe.getAuthorName()%><br><br>
            <i class="green" id="likeNum"><%=recipe.getLikesNumber()%> Likes</i></h4>
        <div id="likeIt">
            <button id="likebtn" class="btn btn-theme btn-lg fa fa-thumbs-up col-sm-offset-1 col-sm-6" style="width: 100px">Like it</button>
        </div>
        <div id="liked">
            <b><h4 class="col-sm-offset-1 col-sm-6 fa fa-check green">Favorite</h4></b>
        </div>
        <div id="owner">
            <b><h4 class="col-sm-offset-1 col-sm-6 fa fa-check green">My Recipe</h4></b>
        </div>
        <div id="functionArea">

        </div>
    </div>


    <div class=" col-sm-offset-1 col-sm-6">
        <h4 class="green">Recipe Description</h4>
        <p><textarea style="height:150px;width:100%;resize:none" onfocus="blur()"><%=recipe.getDescription()%></textarea></p>
        <h4 class="green">Serving: &nbsp; <b style="color:black"><%=recipe.getServing()%></b></h4>
        <h4 class="green" style="display:none">Picture</h4>
        <p style="display:none"><%=recipe.getPictureURL()%></p>

        <h4 class="green">Ingredients List</h4>
        <table class="table table-condensed" id="nameAndQuantity">
            <thead>
                <tr class="success">
                    <td>Name</td>
                    <td>Quantity (g)</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Food item : nc.getFoodlist()) {
                %>
                <tr id="<%out.print(item.getId());%>">
                    <td><%=item.getName()%></td>
                    <td><%=df.format(item.getQuantity())%></td>  
                </tr>
                <%}%>
            </tbody>
        </table>

        <h4 class="green">Cooking Method</h4>
        <P><textarea style="height:300px;width:100%;resize:none" onfocus="blur()"><%out.print(recipe.getMethod());%></textarea></p>


        <h4 class="green">Nutrition Facts</h4>
        <!--</div>-->
        <!--<div class="panel-body">--> 
        <table class="table table-condensed" id="facts">
            <thead>
                <tr class="success">
                    <td>Nutrition</td>
                    <td>Quantity (Per Serving)</td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Energy</td>
                    <td><%=df.format(nc.getEnergy())%> &nbsp;KJ</td>  
                </tr>
                <tr>
                    <td>Protein</td>
                    <td><%=df.format(nc.getProtein())%> &nbsp;g </td>  
                </tr>
                <tr>
                    <td>Fat</td>
                    <td><%=df.format(nc.getFat())%> &nbsp;g</td>  
                </tr>
                <tr>
                    <td>Fat Saturated</td>
                    <td><%=df.format(nc.getFatStatuated())%> &nbsp;g</td>  
                </tr>
                <tr>
                    <td>Carbohydrates</td>
                    <td><%=df.format(nc.getCarbohydrates())%>&nbsp;g</td>  
                </tr>
                <tr>
                    <td>Sugar</td>
                    <td><%=df.format(nc.getSugar())%>&nbsp;g</td>  
                </tr>
                <tr>
                    <td>Sodium</td>
                    <td><%=df.format(nc.getSalt())%> &nbsp;mg</td>  
                </tr>
            </tbody>
        </table>

        <div class="col-sm-offset-1 col-sm-11">
            <button type="button" class="btn btn-theme btn-lg pull-left" id="viewNutrition" data-toggle="modal" data-target="#myModal">View Detailed Nutrition</button>
        </div>

        <!--</div>-->
        <!--    <div class="col-sm-5">-->
        <!--<div id ="ingredientsPanel" class="panel panel-success" style="display:inline-block">-->
        <!--<div class="panel-heading">-->

        <!--</div>-->
        <!--<div class="panel-body">--> 
    </div>
</div>
<!--</div>-->
<!--</div>-->
<div class="row">

</div>

<div class="row">
    <div class="panel panel-success" id="commentPanel">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-target="#commentsCollapse" 
                   href="#commentsCollapse" class="collapsed">
                    View Comments
                </a>
            </h4>

        </div>

        <div id="commentsCollapse" class="panel-collapse collapse">
            <div class="panel-body" id="commentsBody">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</div>
        </div>

    </div>
</div>




<!--</div>-->

<div class="control-group" id="modifictionButtons">
    <div>
        <button type="reset" class="btn btn-default btn-small pull-right"  id="edit" style="width:100px"> Edit Recipe</button>
        <button type="reset" class="btn btn-default btn-small pull-right"  id="delete" style="width:100px">Delete Recipe</button>
        <br>
        <br>
    </div>
</div>
<div id="unlikeIt" class="control-group">
    <button type="reset" class="btn btn-default btn-small pull-right"  id="unlikebtn" > Remove from My Collection</button>
</div>


<div id="myModal" class="modal modal-lg fade  col-lg-offset-2" role="dialog">
    <div class="modal-dialog modal-lg">
        <div id="modalBody" class="modal-body">
            <div class="panel panel-success" style="font-size: 14px">
                <div class="panel-heading">
                    <h3 class="panel-title" class="green">Nutrition Fact (Per Serving)
                        <button type="button" class="close"  data-dismiss="modal">
                            &times;
                        </button>
                    </h3>
                </div>

                <div class="panel-body"> 
                    <div style="overflow-x:auto">
                        <table class="table" id="resultList">
                            <thead>
                                <tr class="success">
                                    <td>Name</td>
                                    <td>Quantity (g)</td>
                                    <td>Energy (KJ)</td>
                                    <td>Protein (g)</td>
                                    <td>Fat (g)</td>
                                    <td>Fat Saturated (g)</td>
                                    <td>Carbohydrates (g)</td>
                                    <td>Sugar (g)</td>
                                    <td>Sodium  (mg)</td>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr class="success">
                                    <td>Total</td>
                                    <td><%=df.format(nc.getTotalWeightPerServing())%></td>
                                    <td><%=df.format(nc.getEnergy())%></td>
                                    <td><%=df.format(nc.getProtein())%></td>
                                    <td><%=df.format(nc.getFat())%></td>
                                    <td><%=df.format(nc.getFatStatuated())%></td>
                                    <td><%=df.format(nc.getCarbohydrates())%></td>
                                    <td><%=df.format(nc.getSugar())%></td>
                                    <td><%=df.format(nc.getSalt())%></td>
                                <tr>
                            </tfoot>
                            <tbody>
                                <%
                                    for (Food item : nc.getFoodlist()) {
                                %>
                                <tr id="<%out.print(item.getId());%>">
                                    <td><%=item.getName()%></td>
                                    <td><%=df.format(item.getQuantity() / nc.getServing())%></td>
                                    <td><%=df.format(item.getEnergy() * item.getQuantity() / 100 / nc.getServing())%></td>
                                    <td><%=df.format(item.getProtein() * item.getQuantity() / 100 / nc.getServing())%></td>
                                    <td><%=df.format(item.getFat() * item.getQuantity() / 100 / nc.getServing())%></td>
                                    <td><%=df.format(item.getFatSatuated() * item.getQuantity() / 100 / nc.getServing())%></td>
                                    <td><%=df.format(item.getCarbohydrates() * item.getQuantity() / 100 / nc.getServing())%></td>
                                    <td><%=df.format(item.getSugars() * item.getQuantity() / 100 / nc.getServing())%></td>
                                    <td><%=df.format(item.getSodium() * item.getQuantity() / 100000 / nc.getServing())%></td>
                                </tr>
                                <%}%>
                            </tbody>

                        </table>
                    </div>
                </div>
                <div class="panel-footer" >
                    <button type="button" class="btn btn-block btn-theme"  data-dismiss="modal">
                        close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $('#delete').click(function () {
        var deleteID = <%=recipe.getId()%>;
        var command = "delete";
        switch ("<%=from%>")
        {
            case "recipeList":
                $('#page-wrapper').load("SearchRecipe/recipeList.jsp", {"command": command, "deleteID": deleteID});
                $('#page-wrapper').show();
                $('#recipeViewArea').hide();
                break;
            case "searchResult":
                $('#page-wrapper').load("SearchRecipe/searchResult.jsp", {"command": command, "deleteID": deleteID});
                $('#page-wrapper').show();
                $('#recipeViewArea').hide();
                break;

            case "randomList":
            case "myCollection":
            default:
                $('#page-wrapper').load("mykitchen/myCollection.jsp", {"command": command, "deleteID": deleteID});
                $('#page-wrapper').show();
                $('#recipeViewArea').hide();
        }

    });
    $('#edit').click(function () {
        var editItem = <%=recipe.getId()%>;
        var command = "edit";
        $('#page-wrapper').load("mykitchen/editRecipe.jsp", {"command": command, "editItem": editItem});
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
    });



    $(document).ready(function () {
        if ("<%=canChange%>" === "false")
        {
            $('#modifictionButtons').hide();
            $('#owner').hide();
            if ("<%=userStatus%>" === "true")
            {
                if ("<%=inCollection%>" === "true") {
                    $('#unlikeIt').show();
                }
                else
                {
                    $('#unlikeIt').hide();
                }
            }
            else
            {
                $('#unlikeIt').hide();
            }
        }
        else
        {
            $('#modifictionButtons').show();
            $('#owner').show();
            $('#unlikeIt').hide();
        }

    });

    $(document).ready(function () {
        if ("<%=socialFunction%>" === "false")
        {
            $('#likeIt').hide();
            $('#liked').hide();
        }
        else {
            if ("<%=inCollection%>" === "true")
            {
                $('#likeIt').hide();
                if ("<%=canChange%>" === "false") {
                    $('#liked').show();
                }
                else {
                    $('#liked').hide();
                }
            }
            else
            {
                $('#likeIt').show();
                $('#liked').hide();
            }
        }
    });



    $('#likebtn').click(function () {
        $('#functionArea').load("mykitchen/collecting.jsp", {"command": "like"});
        $('#likeNum').text(<%=recipe.getLikesNumber()%> + 1 + " Likes");
        $('#likeIt').hide();
        $('#liked').show();
    });


    $('#unlikebtn').click(function () {
        $('#functionArea').load("mykitchen/collecting.jsp", {"command": "unlike"});
        $('#likeNum').text(<%=recipe.getLikesNumber()%> - 1 + " Likes");
        $('#likeIt').show();
        $('#liked').hide();
        $('#unlikeIt').hide();
    });

    $(document).ready(function () {
        $('#commentsBody').load("mykitchen/commentsPanel.jsp");
    });


    $('#backBtn').click(function () {
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
    });



</script>
