<%-- 
    Document   : browseRecipe
    Created on : Sep 17, 2015, 11:21:42 AM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.sk.model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Browse Recipes</title>

        <!-- js -->
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" media="screen" />
        <script src ="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-accessibility.min.js"></script>
        <script src="//cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>

        <!-- css -->

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="css/sb-admin-2.css"/>
        <link href="css/sb-admin-2.css" rel="stylesheet">
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
            session.removeAttribute("SearchManager");
            String hasUser = "False";
            String userName = "";
            if (session.getAttribute("CurrentUser") != null) {
                hasUser = "True";
                User user = (User) session.getAttribute("CurrentUser");
                userName = user.getNickName();
            }

        %>

    </head>
    <body>
        <div class="se-pre-con"></div>
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
                                <li  class="active"><a href="browseRecipe.jsp">Browse Recipes</a></li>
                                <li><a href="mykitchen.jsp">My Kitchen</a></li>
                                <li><a href="contact.jsp">About Us</a></li>
                            </ul>
                        </div>
                        <div class="navbar-collapse collapse" >
                            <ul class="nav navbar-nav" id="login">
                                <li><a href="login.jsp">Login</a></li>
                                <li><a href="register.jsp">Sign Up</a></li>
                            </ul>
                        </div>
                        <div class="navbar-collapse collapse" id="logoutBtn">
                            <ul class="nav navbar-nav" id="logout">
                                <li><a>Sign Out</a></li>
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
                                <li><a href="index.html"><i class="fa fa-home"></i> Home</a><i class="icon-angle-right"></i></li>
                                <li><a class="active">Browse Recipes</a><i class="icon-angle-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end Inner header -->

            <div class="navbar-default sidebar" role="navigation" >
                <div class="sidebar-nav" style="padding-right: 5px;">
                    <div id="searchArea">

                    </div>
                </div>
            </div>




            <div id ="Container" class="Container">
                <div id="page-wrapper">
                    <div>
                        <ul class="nav nav-tabs" role="tablist" style="padding-top:40px">
                            <li id="allRecipes" class="active" role="presentation">
                                <a href="#" role="tab" data-toggle="tab"><h4 class="green">Recipe Library</h4></a></li>
                            <li id="SearchResult" role="presentation">
                                <a href="#"  role="tab" data-toggle="tab"><h4 class="green">Search Result</h4></a></li>
                        </ul>

                        <div id="listArea">

                        </div>

                        <div id="loadingArea" class="se-pre-con">

                        </div>

                    </div>

                </div>
                <div id="recipeViewArea" style="display:none">

                </div>
            </div>


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

            <script>
                $(document).ready(function () {
                    $('#searchArea').load("SearchRecipe/searchSideBar.jsp");
                    $('#recipeViewArea').hide();
                    $('#loadingArea').show();
                });

                $(document).ready(function () {
                    $('#listArea').load("SearchRecipe/recipeList.jsp");
                });
            </script>

            <script>
                $(document).ready(function () {
                    if ("<%=hasUser%>" === "True") {
                        $('#login').hide();
                        $('#logout').show();
                    }
                    else if ("<%=hasUser%>" === "False")
                    {
                        $('#login').show();
                        $('#logout').hide();
                    }
                });

                $('#logout').click(function () {
                    $('#page-wrapper').load("mykitchen/signout.jsp");
                })


                $('#allRecipes').click(function () {
                    $('#allRecipes').addClass("active");
                    $('#SearchResult').removeClass("active");
                    $('#listArea').load("SearchRecipe/recipeList.jsp");
                    $('#listArea').hide();
                    $('#recipeViewArea').hide();
                    $('#loadingArea').show();
                });

                $('#SearchResult').click(function () {
                    $('#allRecipes').removeClass("active");
                    $('#SearchResult').addClass("active");
                    $('#listArea').load("SearchRecipe/searchResult.jsp");
                    $('#listArea').hide();
                    $('#recipeViewArea').hide();
                    $('#loadingArea').show();
                });
            </script>


    </body>
</html>

