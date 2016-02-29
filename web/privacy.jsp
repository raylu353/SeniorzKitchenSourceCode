<%-- 
    Document   : privacy
    Created on : Sep 8, 2015, 6:43:37 PM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.sk.model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width; initial-scale=1.0">
        <title>Privacy Policy</title>

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
                                <li><a class="active">Privacy Policy</a><i class="icon-angle-right"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end Inner header -->
            <div class="Container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <h1>Privacy Policy</h1>
                        <h4>SeniorzKitchen Privacy Policy</h4>
                        <p>Seniorz Kitchen respects and upholds people’s privacy rights in the way we collect, use, disclose, hold and destroy personal information. Personal information includes sensitive information such as health information about an individual. The kinds of information we collect and hold may include a person’s gender, age, contact details and the details of their dealings with Diabetes in Victoria. This includes information we have collected over the telephone, via mail, personal contact or over the Internet.</p>
                        <p>We do not lend or give away information collected from any of our activities, except:
                        <ul>
                            <li>To lessen or prevent a serious and imminent threat to an individual’s health and/or safety and it is unreasonable or impracticable to obtain the individual’s consent;</li>
                            <li>When required by law or a court/tribunal order;</li>
                            <li>In preparation for, or conduct of legal proceedings in a court or tribunal;</li>
                            <li>In the public interest, e.g. to lessen or prevent a serious threat to public health and/or safety and it is unreasonable or impracticable to obtain the individual’s consent.</li>
                            <li>The identified data may be used for research purposes.</li>
                        </ul>
                        </P>
                        <br><br>
                        <h4>Seniorz Kitchen Terms of Use</h4>
                        <p>The datasets provided through this site have been retrieved from Food Standards Australia and New Zealand - www.foodstandards.gov.au. We do not represent or warrant that any dataset is accurate, authentic or complete, or suitable for your needs. Changes in circumstances after the time of publication may impact the accuracy of datasets and their contents.</p>

                        <p>Recipes of this website are mostly posted by users. The recipes posted by Seniorz Kitchen are from The British Diabetic Association - www.diabetes.org.uk. Seniorz Kitchen don’t have the copyright of all the recipes but have taken approval from The British Diabetic Association for using their recipes (Reproduced by permission of Diabetes UK, September 2015. For more information or support in managing diabetes go to www.diabetes.org.uk). </p>

                        <p>The contents of this website are designed for reference purpose, please follow the doctors’ advices. We are not responsible for any issue. </p>
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
            <script src="/js/bootstrap-accessibility.min.js"></script>
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
