<%-- 
    Document   : signout
    Created on : Sep 18, 2015, 11:36:19 AM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    session.removeAttribute("CurrentUser");
    session.invalidate();
%>
<script>
    $(document).ready(function(){
       location.href="index.html";  
    });
    
</script>
