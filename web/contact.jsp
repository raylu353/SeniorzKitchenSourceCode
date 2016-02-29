<%-- 
    Document   : contact
    Created on : Sep 8, 2015, 6:15:17 PM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.sk.model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us</title>
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" media="screen" />
        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
        <%
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
                                <li><a href="calculator.jsp">Nutrition Calculator</a></li>
                                <li><a href="browseRecipe.jsp">Browse Recipes</a></li>
                                <li><a href="mykitchen.jsp">My Kitchen</a></li>
                                <li class="active"><a href="#">About Us</a></li>
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
                                <li><a class="active">About Us</a><i class="icon-angle-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end Inner header -->
            <div class="Container" style="margin-left: 40px; margin-right: 40px" id="content">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">About Us</h1>
                            <p>The project ‘SeniorzKitchen’ aims to provide a social platform to the aged diabetic people where they can share their healthy lifestyles like food recipes and suggestions based on their personal experiences. </p>
                                <p>Focusing on Healthy Lifestyles, ‘SeniorzKitchen’ has integrated a Nutrition Calculator for recipe ingredients. This feature will allow all users to input the ingredients of their recipe and check the total nutritional content in their recipe. Based on the nutritional value of their recipe, users can decide whether to go for that particular recipe or modify their recipe in order to accommodate their maximum nutrition intake. Member users can view recipes posted by other members whereas this functionality will not be available to non-member users. Members will have the ability to search and browse recipes, like and comment on the information posted by other members and see whether it is related to recipes or tips to control diabetes. Based on the most liked recipe by fellow member users, ‘SeniorzKitchen’ will post those recipes for all users regularly.</p>
                                <p>‘SeniorzKitchen’ have also included a Dashboard functionality for the better usability of the My Kitchen functionality in which user will be able to view the number of like for their recipes, number of recipes posted by them and total recipes (including recipes added from other users), get a recipe suggestion on daily basis and track their daily nutrition intake.</p>

                                
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <h2 class="page-header">Our Team</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="row" style="display:inline-block;width: 590px">
                        <div class="col-lg-2 col-sm-2 " style="height:200px; width:200px">
                            <img class="img-circle img-responsive img-center" src="images/xinyi.png">
                        </div>
                        <div class="col-lg-4 col-sm-4 "> 
                            <h3>Xinyi Wang (Cecilia)
                                <small>Developer</small>
                            </h3>
                            <p><a href="mailto:ceciliawang1211@gmail.com">ceciliawang1211@gmail.com</a></p>
                        </div>
                    </div>
                    <div class="row" style="display:inline-block;width:590px">
                        <div class="col-lg-2 col-sm-2 " style="height:200px; width:200px">
                            <img class="img-circle img-responsive img-center" src="images/ray.png" >
                        </div>
                        <div class="col-lg-4 col-sm-4 "> 
                            <h3>Jue Lu (Ray)
                                <small>Developer</small>
                            </h3>
                            <p><a href="mailto:ray.lujue@gmail.com">ray.lujue@gmail.com</a></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="row" style="display:inline-block;width:590px">
                        <div class="col-lg-2 col-sm-2" style="height:200px; width:200px">
                            <img class="img-circle img-responsive img-center" src="images/ash.png">
                        </div>
                        <div class="col-lg-4 col-sm-4 ">
                            <h3>Ashutosh Gupta (Ash)
                                <small>Team Leader</small>
                            </h3>
                            <p><a href="mailto:ashugupta18@gmail.com">ashugupta18@gmail.com</a></p>
                        </div>
                    </div>
                    <div class="row" style="display:inline-block;width:590px">
                        <div class="col-lg-2 col-sm-2" style="height:200px; width:200px">
                            <img class="img-circle img-responsive img-center" src="images/junchen.png">                     
                        </div>
                        <div class="col-lg-4 col-sm-4 ">
                            <h3>Junchen Wang (Chen)
                                <small>Database Admin</small>
                            </h3>
                            <p><a href="mailto:junchenw@icloud.com">junchenw@icloud.com</a></p>
                        </div>
                    </div>
                </div>
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

        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-accessibility.min.js"></script>

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
            });

        </script>
    </body>
</html>
