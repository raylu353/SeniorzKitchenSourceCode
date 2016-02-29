<%-- 
    Document   : testIndex
    Created on : Sep 3, 2015, 2:59:43 PM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Seniorz Kitchen</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- css -->

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <link rel="stylesheet" href="css/fancybox/jquery.fancybox.css">
        <link rel="stylesheet" href="css/flexslider.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

        <!--         Theme skin 
                <link href="skins/default.css" rel="stylesheet" />-->

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
                                <li><a href="mykitchen.jsp">My kitchen</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
            <!-- end header -->

            <!--<section id="featured">-->
            <!-- start slider -->

            <div style="height: 360px; background-image: url('img/slides/1.jpg'); background-size: 100% 100%;">
                <h1>Hello, world!</h1>
                <p>...</p>
                <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
            </div>

            <!-- Slider -->
            <!--                        <div id="main-slider" class="flexslider">
                                        <ul class="slides">
                                            <li>
                                                <img src="img/slides/1.jpg" alt="" />
                                                <div class="flex-caption">
                                                    <h3>Seniorz Kitchen</h3> 
                                                    <h4>Food solution</h4> 
                                                    <h4>Designed for seniors</h4> 
                                                    <a href="register.jsp" class="btn btn-theme">Become a member</a>
                                                </div>
                                            </li>-->
            <!--                                <li>
                                                <img src="img/slides/2.jpg" alt="" />
                                                <div class="flex-caption">
                                                    <h3>Fully Responsive</h3> 
                                                    <p>Sodales neque vitae justo sollicitudin aliquet sit amet diam curabitur sed fermentum.</p> 
                                                    <a href="#" class="btn btn-theme">Learn More</a>
                                                </div>
                                            </li>
                                            <li>
                                                <img src="img/slides/3.jpg" alt="" />
                                                <div class="flex-caption">
                                                    <h3>Clean & Fast</h3> 
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit donec mer lacinia.</p> 
                                                    <a href="#" class="btn btn-theme">Learn More</a>
                                                </div>
                                            </li>-->
            <!--                            </ul>
                                    </div>-->
            <!-- end slider -->



            <!--</section>-->
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-md-4 col-lg-4">
                                    <div class="box">
                                        <div class="box-gray aligncenter">
                                            <h3>Nutrition Calculator</h3>
                                            <div class="icon">
                                                <!--<i class="fa fa-desktop fa-3x"></i>-->
                                                <img src="img/offer/offer1.jpg" alt="" />
                                            </div>
                                            <p>
                                                Nutrition calculator provided by Seniorz Kitchen.
                                            </p>

                                        </div>
                                        <div class="box-bottom">
                                            <a href="calculator.jsp">Go to the Calculator</a>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-4 col-lg-4">
                                    <div class="box">
                                        <div class="box-gray aligncenter">
                                            <h3>Recipes</h3>
                                            <div class="icon">
                                                <!--<i class="fa fa-pagelines fa-3x"></i>-->
                                                <img src="img/offer/offer2.jpg" alt="" />
                                            </div>
                                            <p>
                                                Recipes provided by Seniorz Kitchen. 
                                            </p>

                                        </div>
                                        <div class="box-bottom">
                                            <a href="#">Go to recipes</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-lg-4">
                                    <div class="box">
                                        <div class="box-gray aligncenter">
                                            <h3>Tips</h3>
                                            <div class="icon">
                                                <!--<i class="fa fa-edit fa-3x"></i>-->
                                                <img src="img/offer/offer3.jpg" alt="" />
                                            </div>
                                            <p>
                                                The health tips provided by Seniorz Kitchen.
                                            </p>

                                        </div>
                                        <div class="box-bottom">
                                            <a href="#">Tips</a>
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
            </section>
            <!--==============================footer=================================-->
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="copyright">
                                <p>
                                    <img src="img/teamlogo.png" style="height:65px">&nbsp;&nbsp;&copy; 2015 provided by R.A.C.C &nbsp;| &nbsp;<a href="#">Privacy Policy</a>
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
        <script src="/js/bootstrap-accessibility.min.js"></script>
        <script src="js/jquery.fancybox.pack.js"></script>
        <script src="js/jquery.fancybox-media.js"></script>
        <script src="js/jquery.flexslider.js"></script>
        <script src="js/animate.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
