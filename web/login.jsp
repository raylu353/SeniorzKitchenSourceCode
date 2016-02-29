<%-- 
    Document   : login
    Created on : Sep 7, 2015, 1:02:39 AM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seniorz Kitchen | Member login</title>

        <!-- css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-accessibility.css">
        <link rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/racc.css"/>
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" media="screen" />
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
                                <li><a href="mykitchen.jsp">My Kitchen</a><i class="icon-angle-right"></i></li>
                                <li><a class="active">Login</a><i class="icon-angle-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end Inner header -->
        <div class="container" style="margin-top: 40px">
            <div class="row" >
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <div id="errMSG" style="font-size: 12px" class="error">
                                
                            </div>
                                <fieldset>
                                    <div class="form-group">
                                        <input id="theID" class="form-control" placeholder="Username/E-mail" name="authID" type="text" autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input id="password" class="form-control" placeholder="Password" name="password" type="password" value="">
                                    </div>
  
                                    <!-- Change this to a button or input when using this as a form -->
                                    <button id="signIn" class="btn btn-lg btn-theme">Sign in</button>
                                    <a href="register.jsp"><button  id = "signUp" class="btn btn-lg btn-theme">Register</button></a>
                                </fieldset>
                        </div>
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
            $('#signIn').click(function() {
                var theID = $('#theID').val();
                var pwd = $('#password').val();
                
                $('#errMSG').load("loginSuccess.jsp",{"id":theID,"password":pwd});
            });
            
            
        </script>
        
        
        
    </body>
</html>
