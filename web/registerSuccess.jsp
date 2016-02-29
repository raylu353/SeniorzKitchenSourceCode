<%-- 
    Document   : registerSuccess
    Created on : Sep 8, 2015, 10:44:45 AM
    Author     : Cecilia
--%>

<%@page import ="com.sk.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.sk.webhandle.UserManagement" %>

<%
    User user = new User();
    UserManagement um = new UserManagement();
    user.setEmail(request.getParameter("email"));
    user.setPassword(request.getParameter("password"));
    user.setNickName(request.getParameter("username"));
    user.setGender(request.getParameter("gender"));
    user.setType(request.getParameter("type"));

    String errMsg = "";
    if (um.emailExist(user)) {
        errMsg = errMsg.concat("The Email exists.<br>");
    }
    if (um.nameExist(user)) {
        errMsg = errMsg.concat("Your nick name exists.<br>Please try another one.");
    }

    out.println(errMsg);

    Boolean okToRedirect = false;
    
    if (errMsg.equals("")) {
        um.createUser(user.toDBEntity());
        session.setAttribute("CurrentUser", um.getUserByName(user.getNickName()));
        okToRedirect = true;
    }
%>
<script>
    $(document).ready(function () {
        if ("<%=okToRedirect%>" === "true") {
            $('html').load("index.jsp");
        };
    });
</script>