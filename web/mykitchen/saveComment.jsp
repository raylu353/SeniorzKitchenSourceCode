<%-- 
    Document   : saveComment
    Created on : Sep 19, 2015, 5:34:05 PM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.entities.Comments"%>
<%@page import="com.sk.webhandle.CommentManager"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<%
    CommentManager cm = new CommentManager();
    Comments comment = new Comments();
    comment.setCommentContent(request.getParameter("content"));
    comment.setCommentuserID(Long.valueOf(request.getParameter("user")));
    comment.setCommentrecipeID(Long.valueOf(request.getParameter("recipe")));
    comment.setCommentID(0l);
    Date date = new Date();
    comment.setCommentDatetime(date);
    cm.addCommentToDB(comment);

%>

<h4>Your comment has been saved.</h4>

<script>
    $(document).ready(function () {
        $('#commentsBody').delay(2000).load("mykitchen/commentsPanel.jsp");
    });
</script>