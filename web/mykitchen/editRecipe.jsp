<%-- 
    Document   : editRecipe
    Created on : Sep 9, 2015, Sep 7, 2015 6:12:23 PM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.webhandle.RecipeManager"%>
<%@page import="com.sk.webhandle.RecipeCollection"%>
<%@page import="com.sk.model.Recipe"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sk.model.NutritionCalc"%>
<%@page import="com.sk.model.Food" %>
<%@page import="com.sk.webhandle.FoodLibrary" %>
<%@page import= "java.text.DecimalFormat"%>
<%
    /*Check Food Library Session
     TODO!
     !!!!!!Handle the Session!!!!!!
     */
    FoodLibrary foodLibrary;

    if (session.getAttribute("FoodLibrary") != null) {
        System.out.println("FoodLibrary is in Session!");
        foodLibrary = (FoodLibrary) session.getAttribute("FoodLibrary");
    } else {
        System.out.println("No FoodLibrary Session!, please prepare to meet an Error!");
        foodLibrary = new FoodLibrary();
        session.setAttribute("FoodLibrary", foodLibrary);
    }

    String foodNameList = foodLibrary.getUniqeFoodNameToString();
    /*
     *
     */
    Recipe recipe = new Recipe();
    if (session.getAttribute("RecipeList") == null && session.getAttribute("MyCollection") == null) {
        session.setAttribute("RecipeList", new RecipeManager().getAllRecipe());
    } else if (session.getAttribute("MyCollection") != null) {
        RecipeCollection rc = (RecipeCollection) session.getAttribute("MyCollection");
        recipe = rc.getARecipeByID(request.getParameter("editItem"));
    } else if (session.getAttribute("RecipeList") != null) {
        RecipeManager rm = (RecipeManager) session.getAttribute("RecipeList");
        //Find the particular recipe
        recipe = rm.getARecipeByID(request.getParameter("editItem"));
    }

    NutritionCalc nc = recipe.getNc();
    session.setAttribute("SelectedList", nc);
%>
<!DOCTYPE html>
<div class="container-fluid">
    <div class="form-horizontal well">
        <fieldset>
            <h1 class="green">Edit Recipe</h1>
            <div class="control-group">
                <h4 class="green">Recipe Name*</h4>
                <div class="controls">
                    <input id="inputRecipeName" type="text" class="form-control input-xlarge" maxlength="200" value="<%=recipe.getName()%>" >
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <h4 class="green">Recipe Description</h4>
                    <textarea class="form-control input-xlarge" maxlength="500" id="inputRecipeDes" rows="3"><%=recipe.getDescription().trim()%> 
                    </textarea>
                </div>
            </div>
            <div class="control-group" style="display:none"> 
                <h4 class="green" >Upload Picture</h4>
                <div class="controls">
                    <input class="file-control input-file" id="picInput" type="file">
                </div>
            </div>
            <div id ="servingPanel">
                <h4 class="green" >How many serving for this recipe?</h4>
                Serving Number: &nbsp;&nbsp; <select name="servingList" id="servingSelector">
                    <%
                        for (int i = 1; i <= 7; i++) {
                            if (i != recipe.getServing()) {
                                out.println("<option value=\"" + i + "\">" + i + "</option>");
                            } else {
                                out.println("<option value=\"" + i + "\" selected>" + i + "</option>");
                            }
                        }
                    %>

                </select>
                <hr>


                <div class="control-group">

                    <div id ="listPanel">
                    </div>

                    <div class="input-group" style="width:400px">
                        <input type="text" id="foodInputTextBox" class="form-control" placeholder="Add More Ingredient" required>
                        <div class="help-block with-errors"></div>       
                        <%--//TODO Search Food--%>
                        <span class="input-group-btn">
                            <button id="foodSearchButton" class="btn btn-theme">
                                Search Ingredient
                            </button>       
                        </span>
                    </div><!-- /input-group -->  



                    <div id="selectorPanel" class="panel panel-success" style="display: inline-block">

                    </div>



                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <h4 class="green">Cooking Method</h4>
                    <textarea class="form-control input-xlarge" maxlength="5000" id="inputRecipeMethod" rows="15"><%=recipe.getMethod().trim()%>
                    </textarea>
                </div>
            </div>
            <div class="control-group">
                <div class="form-actions">
                    <center>
                        <div style="width:600px">
                            <br><!--a href="mykitchen/factModal.jsp" data-toggle="modal" data-target="#myModal"-->
                            <button type="button" class="btn btn-theme pull-left" id="viewNutrition" style="width:200px">
                                View Nutrition</button>
                            <!--/a-->
                            <br><br>
                            <button type="submit" class="btn btn-theme pull-left" id="saveRecipe" style="width:200px">
                                Save the changes
                            </button>
                        </div>
                        <br><br>
                        <div id ="errMSG" style="font-size:14px;color:red">


                        </div>
                        <br><br>
                    </center>
                </div>
            </div>
    </div>

    <!-- Modal -->
    <div id="myModal" class="modal modal-lg col-lg-offset-2 fade" role="dialog">
        <div class="modal-dialog modal-lg">

            <div id="modalBody" class="modal-body">

            </div>


        </div>
    </div>


    <script>
        $(document).ready(function () {
            var availableTags = [<%=foodNameList%>""];
                    $("#foodInputTextBox").autocomplete({
                source: function (request, response) {
                    var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i");
                    response($.grep(availableTags, function (item) {
                        return matcher.test(item);
                    }).slice(0, 5));
                },
                minLength: 1
            });
            $('#foodInputTextBox').on("autocompleteclose", function () {
                if ($('#foodInputTextBox').val() !== "") {
                    $('#selectorPanel').show();
                    var theName = document.getElementById("foodInputTextBox").value;
                    $('#selectorPanel').load("mykitchen/candidateList.jsp", {"FoodName": theName});
                }
            });
        });

        $(document).ready(function () {
            $("#foodSearchButton").click(function () {
                if ($('#foodInputTextBox').val() !== "") {
                    $('#selectorPanel').show();
                    var theName = document.getElementById("foodInputTextBox").value;
                    $("#selectorPanel").load("mykitchen/candidateList.jsp", {"FoodName": theName});
                }
            });
        });
        $(document).ready(function () {
            $('#listPanel').load("mykitchen/selectedList.jsp");
        });

        $('#viewNutrition').click(function () {
            $('#modalBody').load("mykitchen/factModal.jsp", {"serving": $('#servingSelector').val()});
            $("#myModal").modal('show');
        });

        $('#saveRecipe').click(function () {
            var errmsg = "";
            var reciptID = "<%=recipe.getId()%>";
            var name = htmlEncode($('#inputRecipeName').val());
            if ($.trim(name) === "")
            {
                $('#errMSG').text("Recipe Name can't be empty");
            } else if ($("tbody").html().trim() === '') {
                $('#errMSG').text("Please Specify Ingredients");
            } else {
                var desc = htmlEncode($('#inputRecipeDes').val());
                if ($.trim(desc) === "")
                {
                    desc = "No Description";
                }
                var picURL = "noPics";
                var method = htmlEncode($('#inputRecipeMethod').val());
                if ($.trim(method) === "")
                {
                    method = "No Cooking Method";
                }
                var servingNumber = $('#servingSelector').val();
                $('#modalBody').load("mykitchen/saveRecipe.jsp",
                        {"reciptID": reciptID,
                            "name": name,
                            "desc": desc,
                            "picURL": picURL,
                            "method": method,
                            "command": "update",
                            "likeNum": "<%=String.valueOf(recipe.getLikesNumber())%>",
                            "serving": servingNumber
                        });
                $('#errMSG').text("Saved!");

                $('#saveRecipe').hide();
                $('#page-wrapper').load("mykitchen/dashboard.jsp");
                $('#page-wrapper').show();
                $('#recipeViewArea').hide();
            }
        });


    </script>

    <script>
        function closeFood() {
            document.getElementById("selectorPanel").style.display = "none";
        }
    </script>