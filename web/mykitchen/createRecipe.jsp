<%-- 
    Document   : createRecipe
    Created on : Sep 7, 2015, Sep 7, 2015 4:12:23 AM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.sk.webhandle.FoodLibrary"%>
<%@page import="com.sk.model.NutritionCalc"%>

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
    if (session.getAttribute("SelectedList") == null) {
        NutritionCalc nc = new NutritionCalc();
        session.setAttribute("SelectedList", nc);
    }

%>
<!DOCTYPE html>
<div class="container-fluid">
    <div class="form-horizontal well">
        <fieldset>
            <h1 class="green">Create Recipe</h1>
            <div class="control-group">
                <h4 class="green">Recipe Name*</h4>
                <div class="controls">
                    <input id="inputRecipeName" type="text" class="form-control input-xlarge" maxlength="200" >
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <h4 class="green">Recipe Description</h4>
                    <textarea class="form-control input-xlarge" maxlength="500" id="inputRecipeDes" rows="3"></textarea>
                </div>
            </div>
            <div class="control-group" style="display:none"> 
                <h4 class="green" >Upload Picture</h4>
                <div class="controls">
                    <input class="file" id="picInput" type="file" name="recipeImg[]">
                </div>
            </div>
            <div id ="servingPanel">
                <h4 class="green" >How many serving for this recipe?</h4>
                Serving Number: &nbsp;&nbsp; <select name="servingList" id="servingSelector">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                </select>
                <hr>


            </div>


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
            <textarea class="form-control input-xlarge" maxlength="5000" id="inputRecipeMethod" rows="15"></textarea>
        </div>
    </div>
    <div class="control-group">
        <div class="form-actions">
            <center>
                <div style="width:600px">
                    <br><!--a href="mykitchen/factModal.jsp" data-toggle="modal" data-target="#myModal"-->
                    <button type="button" class="btn btn-theme pull-left" id="viewNutrition" style="width:200px">View Nutrition</button>
                    <!--/a-->
                    <a href="mykitchen.jsp?command=clearAll">
                        <button type="reset" class="btn btn-theme pull-right"  id="clearAll" style="width:200px">Clear All</button>                         
                    </a>
                </div>

                <div>
                    <br><br>
                    <button type="submit" class="btn btn-block btn-theme" id="createRecipe" style="width:600px">
                        Create
                    </button>
                    <br>
                    <div id ="errMSG" style="font-size:14px;color:red">


                    </div>

                </div>
            </center>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal modal-lg col-lg-offset-1 fade" role="dialog">
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
            if($('#foodInputTextBox').val() !== "") {
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
    
    $('#createRecipe').click(function () {
        var errmsg = "";
        var name = htmlEncode($('#inputRecipeName').val());
        if (name.trim(name) === "")
        {
            $('#errMSG').text("Recipe Name can't be empty");
        } else if ($("tbody").html().trim() === '') {
            $('#errMSG').text("Please Specify Ingredients");
        }
        else {
            var desc = htmlEncode($('#inputRecipeDes').val());
            if ($.trim(desc) === "")
            {
                desc = "No Description";
            }
            var picURL = "noPics";
            var servingNumber = $('#servingSelector').val();
            var method = htmlEncode($('#inputRecipeMethod').val());
            if ($.trim(method) === "")
            {
                method = "No Cooking Method";
            }
            $('#modalBody').load("mykitchen/saveRecipe.jsp",
                    {
                        "name": name,
                        "desc": desc,
                        "picURL": picURL,
                        "method": method,
                        "serving": servingNumber
                    });
            $('#errMSG').text("Saved!");
            $('#createRecipe').hide();s
            $('#clearAll').hide();
            $('#viewNutrition').hide();
            


        }
    });</script>

<script>
    function closeFood() {
        document.getElementById("selectorPanel").style.display = "none";
    }
    ;
    $(document).ready(function () {
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
        $('#loadingArea').hide();
    });
</script>
