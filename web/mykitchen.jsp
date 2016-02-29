<%-- 
    Document   : mykitchen
    Created on : Sep 1, 2015, 10:21:25 AM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.model.NutritionCalc"%>
<%@page import="com.sk.model.User"%>
<%@page import="com.sk.webhandle.DashManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Kitchen</title>

        <!-- js -->
        <script src ="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-accessibility.min.js"></script>
        <script src="//cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>
        <script src="js/fileinput.js"></script>
        <script src="js/fileinput.min.js"></script>
        <script scr="js/canvas-to-blob.min.js" type="text/javascript"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
        <script src="js/racc.js"></script>

        <!-- css -->
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" media="screen" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/jquery.dataTables.min.css">
        <link href="css/sb-admin-2.css" rel="stylesheet">
        <link href="css/fileinput.css" rel="stylesheet">
        <link href="css/fileinput.min.css" rel="stylesheet">
        <style>
            .se-pre-con{
                position: static;
                left: 0px;
                top: 0px;
                width: inherit;
                height: 100%;
                z-index: 9999;
                background: url(img/loading.gif) center no-repeat #fff;
            }

        </style>

        <%
            //Check Which Page Should be load in main contain area
            String command = "";
            if (request.getParameter("command") != null) {
                command = request.getParameter("command");
                session.setAttribute("kitchenCommand", command);
            } else {
                session.setAttribute("SelectedList", new NutritionCalc());
            }
            //clear all selected food and turn to create recipe page.
            if (command.equals("clearAll")) {
                session.setAttribute("SelectedList", new NutritionCalc());
            }
            if (session.getAttribute("kitchenCommand") != null && session.getAttribute("CurrentUser") != null) {
                command = (String) session.getAttribute("kitchenCommand");
                session.removeAttribute("kitchenCommand");
            }

            User user = new User();
            String userStatus = "";
            if (session.getAttribute("CurrentUser") == null) {
                user.setNickName("Please Login");

                userStatus = "false";
            } else {
                user = (User) session.getAttribute("CurrentUser");
                userStatus = "true";
            }

            if (session.getAttribute("DashManager") != null) {
                DashManager dm = new DashManager();
                session.setAttribute("DashManager", dm);
            }

        %>
        <script>
            $(document).ready(function () {
                if ("<%=userStatus%>" === "true")
                {
                    if ("<%=command%>" === "GenerateRecipe") {
                        $('#page-wrapper').load("mykitchen/createRecipe.jsp");
                    }
                    else if ("<%=command%>" === "clearAll") {//clear all selected food and turn to create recipe page.
                        $('#page-wrapper').load("mykitchen/createRecipe.jsp");
                    }
                    else {
                        $('#page-wrapper').load("mykitchen/dashboard.jsp");
                    }
                }
                else {
                    location.href = "login.jsp";
                }
            });
        </script>

    </head>
    <body>
        <div id="wrapper">
            <!-- start header -->
            <header>
                <div class="navbar navbar-default navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="index.html"><span>S</span>eniorz <span>K</span>itchen</a>
                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="calculator.jsp">Nutrition Calculator</a></li>
                                <li><a href="browseRecipe.jsp">Browse Recipes</a></li>
                                <li class="active"><a href="mykitchen.jsp">My Kitchen</a></li>
                                <li><a href="contact.jsp">About Us</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
            <!-- end header -->
            <!-- start Inner header -->
            <section id="inner-headline">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <ul class="breadcrumb">
                                <li><a href="index.html"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
                                <li><a class="active">My Kitchen</a><i class="icon-angle-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end Inner header -->
            <!--<div class="content">-->
            <!-- Start side navbar-->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li style="color: green">
                            <i class="fa fa-user fa-fw" style="color: green"></i><%=user.getNickName()%>
                        </li>
                        <li id="MyKitchenButton">
                            <a><i  class="fa fa-cutlery fa-fw"></i> My Kitchen</a>
                        </li>
                        <li id="CreateRecipeButton">
                            <a><i  class="fa fa-edit fa-fw"></i> Create Recipe</a>
                        </li>

                        <li id="RecipeCollectionButton">
                            <a><i  class="fa fa-book fa-fw"></i> Recipe Collection</a>
                        </li>
                        <li id="editProfile">
                            <a><i  class="fa fa-info fa-fw"></i> Edit My Profile</a>
                        </li>
                        <li id="signout">
                            <a><i  class="fa fa-fw fa-sign-out"></i> Sign Out</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- end side navbar -->
            <!-- start main content -->
            <div id ="Container" class="Container">
                <div id="page-wrapper" style="display:none" >

                </div>
                <div id="recipeViewArea" style="display:none">

                </div>
                <div id="loadingArea" class="se-pre-con">

                </div>
            </div>
            <!-- end main content -->
            <!--</div>-->

            <!--==============================footer=================================-->
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="copyright">
                                <p>
                                    <a href="contact.jsp"><img src="img/teamlogo.png" style="height:65px" alt="R.A.C.C"></a>&nbsp;&nbsp;&copy; 2015 provided by <a href="contact.jsp">R.A.C.C</a> &nbsp;| &nbsp;<a href="privacy.jsp">Privacy Policy</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!--================End footer=================== -->

            <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <!-- javaScript ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
        </div>
    </body>
</html>
<script>
    $('#MyKitchenButton').click(function () {
        $('#page-wrapper').load("mykitchen/dashboard.jsp");
        $('#loadingArea').show();
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
    });

    $('#CreateRecipeButton').click(function () {
        $('#page-wrapper').load("mykitchen/createRecipe.jsp");
        $('#loadingArea').show();
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
    });
    $('#editProfile').click(function () {
        $('#page-wrapper').load("mykitchen/editMyProfile.jsp");
        $('#loadingArea').show();
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
    });
    $('#RecipeCollectionButton').click(function () {
        $('#page-wrapper').load("mykitchen/myCollection.jsp");
        $('#loadingArea').show();
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
    });
    $('#signout').click(function () {
        $('#page-wrapper').empty().addClass("se-pre-con");
        $('#page-wrapper').load("mykitchen/signout.jsp");
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
    });

</script>
