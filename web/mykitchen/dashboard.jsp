<%-- 
    Document   : dashboard
    Created on : Sep 15, 2015, 2:11:43 PM
    Author     : wjc1856
--%>

<%@page import="com.sk.entities.UserIntake"%>
<%@page import="com.sk.webhandle.intakeManager"%>
<%@page import="com.sk.webhandle.DashManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.model.Recipe"%>
<%@page import="com.sk.webhandle.RecipeManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sk.model.User"%>

<%
    User user = new User();
    intakeManager im = new intakeManager();
    UserIntake dailyIntake = new UserIntake();
    if (session.getAttribute("CurrentUser") != null) {
        user = (User) session.getAttribute("CurrentUser");
        im = new intakeManager(user.getID());
    }

    DashManager dm = new DashManager();
    String collectedRecipeNum = dm.countCollectRecipeFromDB(user.getID());
    String ownRecipeNum = dm.countOwnRecipeFromDB(user.getID());
    String sumLikes = dm.sumLikesFromDB(user.getID());

    if (sumLikes.isEmpty() || sumLikes == null) {
        sumLikes = "0";
    }
    System.out.println("How Many Collected Recipes: " + collectedRecipeNum);

    if (session.getAttribute("DashManager") != null) {
        dm = (DashManager) session.getAttribute("DashManager");
    }
    session.setAttribute("DashManager", dm);

    dailyIntake = im.getIntakeFromDB();

    if (dailyIntake != null) {
        session.setAttribute("dailyIntake", dailyIntake);

    }

    String showList = "false";
    if (dm.getListSize() > 0) {
        showList = "true";
    }

    String buttonClickable = "true";
    if (dm.getListSize() >= 3) {
        buttonClickable = "false";
    }


%>
<div class="row">
    <div class="row">
        <div class="col-lg-12">         
            <h1 class="navbar-brand"><span>My</span> Kitchen</h1>

        </div>
    </div>
    <div class="row">
        <div class="col-lg-4 col-md-6" id="creaPad">
                <div class="panel panel-info">
                    <div class="panel-heading" style="cursor:pointer">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-book fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div>My Recipes</div>
                                <div class="huge"><%=ownRecipeNum%></div>
                            </div>
                        </div>
                    </div>
                </div>         
            </div>
        
            <div class="col-lg-4 col-md-6" id="likePad">
                <div class="panel panel-green">
                    <div class="panel-heading" style="cursor:pointer">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-thumbs-o-up fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div>My Recipes' Likes</div>
                                <div class="huge"><%=sumLikes%></div>
                            </div>
                        </div>
                    </div>
                </div>         
            </div>
       
            
        

        <div class="col-lg-4 col-md-6" id="collPad">
            <div class="panel panel-yellow" >

                <div class="panel-heading" style="cursor:pointer">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-bookmark-o fa-4x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div>My Favorite Recipes</div>
                            <div class="huge"><%out.print(Integer.valueOf(collectedRecipeNum) - Integer.valueOf(ownRecipeNum));%></div>
                        </div>
                    </div>
                </div>

            </div>         
        </div>     

    </div>

    <!--Pick Up Recipe Area -->
    <!--===================-->
    <div class="row" id="dailyIntake">
        <div class="col-lg-12 col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading"> Today's Recipe</div>
                <div class="panel-body">
                    <div>
                        <button class="btn btn-theme" id="getARecipeBtn">Get a recipe</button>
                        <button class="btn btn-default" id="clearList">Clear</button>
                    </div>
                    <div>
                        <p>

                        </p>
                    </div>
                    <div id="recipeListArea">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Daily Intake Area -->
    <!--===================-->


    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o fa-fw"></i>Daily Nutrition Consumption
                </div>
                <div class="panel-body" id="intakebars">


                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $('#getARecipeBtn').click(function () {
        $('#recipeListArea').load("mykitchen/randomList.jsp");

    });

    $('#clearList').click(function () {
        var command = "clear";
        $('#recipeListArea').load("mykitchen/randomList.jsp", {"command": command});
    });

    $(document).ready(function () {

        $('#intakebars').load("mykitchen/intakebar.jsp");
        if ("<%=showList%>" === "true") {
            var command = "reload";
            $('#recipeListArea').load("mykitchen/randomList.jsp", {"command": command});
        }

        if ("<%=buttonClickable%>" === "false")
        {
            document.getElementById('getARecipeBtn').disabled = 'disabled';
        }
    });

    $(document).ready(function () {
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
        $('#loadingArea').hide();

    });

    $('#likePad').click(function () {
        $('#page-wrapper').load("mykitchen/myCollection.jsp",{"cmd":"likes"});
        $('#loadingArea').show();
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
    });

    $('#creaPad').click(function () {
        $('#page-wrapper').load("mykitchen/myCollection.jsp",{"cmd":"own"});
        $('#loadingArea').show();
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
    });

    $('#collPad').click(function () {
        $('#page-wrapper').load("mykitchen/myCollection.jsp",{"cmd":"coll"});
        $('#loadingArea').show();
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
    });


</script>
