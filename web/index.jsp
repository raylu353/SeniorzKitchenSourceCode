<%-- 
    Document   : index
    Created on : Sep 16, 2015, 6:04:19 PM
    Author     : ray
--%>
<%@page import ="com.sk.model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Seniorz Kitchen</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" media="screen" />

        <!-- css -->

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <!--        <link rel="stylesheet" href="css/fancybox/jquery.fancybox.css">
                <link rel="stylesheet" href="css/flexslider.css"/>-->
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

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
                                <li class="active"><a href="index.html">Home</a></li>
                                <li><a href="calculator.jsp">Nutrition Calculator</a></li>
                                <li><a href="browseRecipe.jsp">Browse Recipes</a></li>
                                <li><a href="mykitchen.jsp">My Kitchen</a></li>
                                <li><a href="contact.jsp">About Us</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
            <!-- end header -->

            <!--<section id="featured">-->
            <!-- start slider -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="jumbotron " style="background-image: url(img/slides/1.jpg); background-size: cover">
                            <h2>Seniorz Kitchen</h2>
                            <p>Food Solution</p>
                            <p>Designed for Diabetic Seniors</p>
                            <br>
                            <script>

                            </script>

                            <div id ="loginButtons">
                                <p><a class="btn btn-theme btn-lg" href="register.jsp" role="button" style="width: 200px;">Become a member</a></p>
                                <p><a class="btn btn-theme btn-lg" href="login.jsp" role="button" style="width: 200px;">Member login</a></p>
                            </div>
                            <div id ="loggedInArea" style="display:none">
                                <p id="welcomeTitle"></p>
                                <p><a class="btn btn-theme btn-lg" role="button" style="width: 200px" id="logoutBtn">Logout</a></p>
                            </div>
                            <!--     
                            <!--                            <p><a class="btn btn-theme btn-lg" href="calculator.jsp" role="button">Nutrition calculator</a></p>
                                                        <p><a class="btn btn-theme btn-lg" href="mykitchen.jsp" role="button">My kitchen</a></p>-->
                        </div>
                    </div>
                </div>
            </div>	


            <div class="container" id="content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-md-4 col-lg-4">
                                <div class="box" style="cursor:pointer" id="toCalc">
                                    <div class="box-gray aligncenter">
                                        <h3>Nutrition Calculator</h3>
                                        <div class="icon">
                                            <!--<i class="fa fa-calendar fa-3x"></i>-->
                                            <img src="img/offer/offer1.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="box-bottom">
                                        <a href="calculator.jsp">Go to the Calculator</a>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <div class="box" style="cursor:pointer" id="toRecipe">
                                    <div class="box-gray aligncenter">
                                        <h3>Recipes</h3>
                                        <div class="icon">
                                            <!--<i class="fa fa-pagelines fa-3x"></i>-->
                                            <img src="img/offer/offer2.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="box-bottom">
                                        <a href="browseRecipe.jsp">Go to recipes</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-lg-4">
                                <div class="box" style="cursor:pointer" id="toKitchen">
                                    <div class="box-gray aligncenter">
                                        <h3>My Kitchen</h3>
                                        <div class="icon">
                                            <!--<i class="fa fa-edit fa-3x"></i>-->
                                            <img src="img/offer/offer3.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="box-bottom">
                                        <a href="mykitchen.jsp">My Kitchen</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- divider -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="solidline">
                        </div>
                    </div>
                </div>
                <!-- end divider -->

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
        </div>

        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
        <!-- javascript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-accessibility.min.js"></script>
        <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
    </body>
    <script>
                                $(document).ready(function () {
                                    if ("<%=hasUser%>" === "True") {
                                        $('#loginButtons').hide();
                                        $('#loggedInArea').show();
                                        $('#welcomeTitle').text("Welcome, <%=userName%>!");
                                    }
                                    ;
                                });

                                $('#toKitchen').click(function () {
                                    document.location.href = 'mykitchen.jsp';
                                });

                                $('#toRecipe').click(function () {
                                    document.location.href = 'browseRecipe.jsp';
                                });

                                $('#toCalc').click(function () {
                                    document.location.href = 'calculator.jsp';
                                });

                                $('#logoutBtn').click(function () {
                                    $('#content').load("mykitchen/signout.jsp");
                                });
    </script>
</html>
