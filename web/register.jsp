<%-- 
    Document   : register
    Created on : Sep 2, 2015, 11:23:45 PM
    Author     : Cecilia & Ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Become a member</title>

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
                                <li><a class="active">Sign up</a><i class="icon-angle-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end Inner header -->

            <section id="content">
                <div class="container" id="container">
                    <div class="row">
                        <div class="col-md-8 col-lg-offset-2">
                            <h1 class="page-header green">Sign up</h1>
                            <div id="errMsg" class="error" style="font-size: 14px">

                            </div>
                            <form id="registerForm" name="registerForm" class="form-horizontal" method='post'>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="inputEmail">Email</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword" class="col-sm-3 control-label">Password</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="confirmPassword" class="col-sm-3 control-label">Confirm Password</label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label id="nickname" for="inputUsername" class="col-sm-3 control-label">Username</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                                    </div>
                                </div>
                                <div class="form-group" id="genderSelect">
                                    <label class="col-sm-3" style="text-align: right">Gender</label>
                                    <label class="col-sm-2 ">
                                        <input type="radio" name="genderRadios" id="genderRadio1" value="female" checked> female
                                    </label>
                                    <label class="col-sm-2 ">
                                        <input type="radio" name="genderRadios" id="genderRadio2" value="male"> male
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3" style="text-align: right">Diabetes type</label>
                                    <label class="col-sm-2 ">
                                        <input type="radio" name="typeRadios" id="typeRadio0" value="0" checked> None
                                    </label>
                                    <label class="col-sm-2 ">
                                        <input type="radio" name="typeRadios" id="typeRadio1" value="1"> Type 1
                                    </label>
                                    <label class="col-sm-2 ">
                                        <input type="radio" name="typeRadios" id="typeRadio2" value="2"> Type 2
                                    </label>
                                    <label class="col-sm-2 ">
                                        <input type="radio" name="typeRadios" id="typeRadio3" value="3"> Others
                                    </label>
                                </div>
                                <button id="submitUserInfo" type="submit" class="btn btn-theme">Submit</button>
                                <button type="reset" class="btn btn-theme">Reset</button>
                            </form>
                        </div>
                    </div>
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

            <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <!-- javaScript ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->

            <script src="//code.jquery.com/jquery-1.10.2.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/bootstrap-accessibility.min.js"></script>
            <script src="js/jquery.validate.min.js"></script>

            <script>
                $(document).ready(function () {
                    $('#registerForm').validate({
                        rules: {
                            email: {
                                required: true,
                                email: true
                            },
                            username: {
                                required: true,
                                minlength: 4,
                                maxlength: 15
                            },
                            password: {
                                required: true,
                                minlength: 6,
                                maxlength: 15
                            },
                            confirmPassword: {
                                required: true,
                                equalTo: "#password"
                            }
                        },
                        messages: {
                            username: {
                                required: "Please enter your nickname",
                                minlength: "Your nickname must consist of at least 4 characters",
                                maxlength: "Your nickname must consist of at most 15 characters"
                            },
                            password: {
                                required: "Please provide a password",
                                minlength: "Your password must be at least 6 characters long",
                                maxlength: "Your password must be at most 15 characters long"
                            },
                            confirmPassword: {
                                required: "Please provide a password",
                                equalTo: "Please enter the same password as above"
                            },
                            email: {
                                email: "Please enter a valid email address"
                            }
                        },
                        submitHandler: function () {
                            var emailAdress = $('#email').val();
                            var password = $('#password').val();
                            var username = $('#username').val();

                            var gender;
                            var genders = document.getElementsByName("genderRadios");
                            for (var i = 0; i < genders.length; i++)
                            {
                                if (genders[i].checked)
                                    gender = genders[i].value;
                            }


                            var type;
                            var types = document.getElementsByName("typeRadios");
                            for (var i = 0; i < types.length; i++)
                            {
                                if (types[i].checked)
                                    type = types[i].value;
                            }

                            $('#errMsg').load("registerSuccess.jsp",
                                    {
                                        "email": emailAdress,
                                        "password": password,
                                        "username": username,
                                        "gender": gender,
                                        "type": type
                                    });
                        }
                    });
                });




            </script>
    </body>
</html>