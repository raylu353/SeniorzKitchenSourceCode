<%-- 
    Document   : tempmykitchen
    Created on : Sep 7, 2015, 12:13:31 AM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width; initial-scale=1.0">
        <title>My Kitchen temp</title>

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
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
                                <li class="active"><a href="mykitchen.jsp">My kitchen</a></li>
                                <li><a href="#">Contact</a></li>
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
                    <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-nav">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                        </div>
                    <div class="col-md-3 col-lg-3 sidebar-nav navbar-collapse">
                        <ul class="nav in" id="side-menu">
                            <li>
                                <a class="active"><i class="fa fa-user fa-fw"></i> My kitchen</a>
                            </li>
                            <li>
                                <a href="create_recipe.jsp"><i class="fa fa-edit fa-fw"></i> Create recipe</a>
                            </li>
                        </ul>
                    </div>
                </div>
            <!-- end side navbar -->
            <!-- start main content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Blank</h1>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end main content -->
        </div>
        <!--</div>-->

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

        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
        <!-- javaScript ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="/js/bootstrap-accessibility.min.js"></script>

    </body>
</html>
