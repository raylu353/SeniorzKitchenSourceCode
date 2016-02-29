<%-- 
    Document   : changePwdSuccess
    Created on : Sep 20, 2015, 6:16:22 PM
    Author     : Cecilia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="com.sk.model.User"%>
<%@page import ="com.sk.webhandle.UserManagement"%>

<%
    String msg = "";

    UserManagement um=new UserManagement();
    User user = (User) session.getAttribute("CurrentUser");
    String pwd = user.getPassword();

    String oldPassword = request.getParameter("oldPassword");
    String newPassword = request.getParameter("newPassword");

    if (oldPassword.equals(pwd)) {
        um.updatePassword(user, newPassword);
        msg = "Your password has been updated.";
    } else {
        msg = "Old password is incorrect, please input again.";
    }

%>

<div id="" style="font-size: 14px">
    <center><h5 id="changePassworderrmsg"></h5></center>
        </div>

<script>
    $(document).ready(function () {
        if("<%=msg%>" === "Your password has been updated.")
        {
            $('#changePassworderrmsg').removeClass("error");
        }
        $('#changePassworderrmsg').text("<%=msg%>");
    
    }

    );
    
    
</script>


