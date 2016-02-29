<%-- 
    Document   : cal
    Created on : Aug 29, 2015, 8:51:58 PM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.model.NutritionCalc"%>
<%@page import ="com.sk.model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nutrition Calculator</title>
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" media="screen" />

        <!-- js -->
        <script src ="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-accessibility.min.js"></script>
        <script src="//cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js"></script>
        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/jquery.dataTables.min.css">



        <%--JSP PART --%>
        <%@page import = "com.sk.webhandle.FoodLibrary"%>
        <%
            /*Check Food Library Session
             This process could be done async, will enhance session.
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
            if (request.getParameter("command") != null) {
                if (request.getParameter("command").equals("clear")) {

                    session.setAttribute("SelectedList", new NutritionCalc());
                }
            }

            NutritionCalc nc = new NutritionCalc();
            session.setAttribute("SelectedList", nc);

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
                                <li class="active"><a href="calculator.jsp">Nutrition Calculator</a></li>
                                <li><a href="browseRecipe.jsp">Browse Recipes</a></li>
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
                                <li><a href="index.html"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
                                <li><a class="active">Nutrition Calculator</a><i class="icon-angle-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end Inner header -->
            <!--==============================calculator=================================-->
            <section id="content">



                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-lg-offset-2">
                            <h1 class="green">Nutrition Calculator</h1>

                            <div class="input-group">
                                <input type="text" id="foodInputTextBox" class="form-control" placeholder="Enter ingredient" required>
                                <div class="help-block with-errors"></div>       
                                <%--//TODO Search Food--%>
                                <span class="input-group-btn">
                                    <button id="foodSearchButton" class="btn btn-theme">
                                        Search Ingredient
                                    </button>       
                                </span>
                            </div><!-- /input-group -->
                        </div>
                    </div>
                </div>
                <%--Select Food From List Area --%>                
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-lg-offset-2" id="selectorPanel">

                        </div>
                    </div>
                </div>

                <%-- Food List (Selected) --%>
                <!--  Selected Ingredient List start -->            
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-lg-offset-2"  id="foodListPanel">

                        </div>
                    </div>

                </div>
                <!--  Selected Ingredient List end --> 

                <%--Calculate Button --%>
                <div class="container">
                    <center>
                        <div style="display:inline-block">
                            <a href="calculator.jsp?command=clear">
                                <button class="btn btn-theme" id="clearAll">
                                    Clear All
                                </button>
                            </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <div style="display:inline-block">
                            <a href="mykitchen.jsp?command=GenerateRecipe">
                                <button class="btn btn-theme" id="createRecipe">
                                    Create Recipe
                                </button>
                            </a>
                        </div>
                    </center>

                </div>
            </section>

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
                        $('#selectorPanel').load("calculator/candidateList.jsp", {"FoodName": theName});
                    }

                });


                $('#foodSearchButton').click(function () {
                    if ($('#foodInputTextBox').val() !== "") {
                        $('#selectorPanel').show();
                        var theName = document.getElementById("foodInputTextBox").value;
                        $('#selectorPanel').load("calculator/candidateList.jsp", {"FoodName": theName});
                    }
                });
            });


        </script>

        <script>
            function closeFood() {
                document.getElementById("selectorPanel").style.display = "none";
            }
            ;

        </script>


        <script>
            $(document).ready(function () {
                $('#foodListPanel').load("calculator/selectedList.jsp");
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
                $('#content').load("mykitchen/signout.jsp");
            })

        </script>



    </body>
</html>


