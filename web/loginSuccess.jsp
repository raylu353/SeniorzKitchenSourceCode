<%-- 
    Document   : loginSuccess
    Created on : Sep 16, 2015, 21:30:48 PM
    Author     : ray
--%>
<%@page import ="com.sk.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.sk.webhandle.UserManagement" %>


<%
    User user = new User();
    UserManagement um = new UserManagement();
    String errorMsg = "";

    //1. Try to Check the email
    user.setEmail(request.getParameter("id"));
    user.setNickName(request.getParameter("id"));
    if (um.emailExist(user)) {
        User userForCheckPWD = um.getUserByEmail(user.getEmail());
        if (request.getParameter("password").trim().equals(userForCheckPWD.getPassword())) {
            session.setAttribute("CurrentUser", userForCheckPWD);
        } else {
            errorMsg = "Incorrect Password";
        }
    } else if (um.nameExist(user))//2. Check the UserName
    {
        User userForCheckPWD = um.getUserByName(user.getNickName());
        if (request.getParameter("password").trim().equals(userForCheckPWD.getPassword())) {
            session.setAttribute("CurrentUser", userForCheckPWD);
        } else {
            errorMsg = "Incorrect Password";
        }
    } else //3. No such user
    {
        errorMsg = "No Such User. Please Sign Up.";
    }

    //4. If session set
    Boolean loggedIn = false;
    if (session.getAttribute("CurrentUser") != null) {
        loggedIn = true;
    }
%>
<script>
    $(document).ready(function(){
    if ("<%=loggedIn%>" === "false")
    {
        $('#errMSG').text("<%=errorMsg%>");
    }
    else
    {
        $(location).attr('href','mykitchen.jsp');
    }});

</script>

