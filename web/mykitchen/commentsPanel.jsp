<%-- 
    Document   : commentsPanel
    Created on : Sep 19, 2015, 4:32:24 PM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sk.model.User" %>
<%@page import="com.sk.model.Recipe"%>
<%@page import="com.sk.webhandle.CommentManager"%>
<%@page import="com.sk.entities.Comments"%>
<%@page import="com.sk.model.Comment"%>

<%
    
    User user = new User();
    String canAdd = "true";
    if (session.getAttribute("CurrentUser") == null) {
        canAdd = "false";

    } else {
        user = (User) session.getAttribute("CurrentUser");
    }
    System.out.println("UserID?: " + user.getID());

    Recipe recipe = new Recipe();
    if (session.getAttribute("CurrentRecipe") != null) {
        recipe = (Recipe) session.getAttribute("CurrentRecipe");
    }

    CommentManager cm = new CommentManager();


%>


<table class="table" id="resultList">
    <thead>
        <tr class="success">
            <td width="30%">Name</td>
            <td width="70%">Comments</td>
        </tr>
    </thead>

    <tbody>


        <%                for (Comment comment : cm.getCommentsByRecipeID(recipe.getId())) {
        %>
        <tr id="<%=comment.getId()%>">
            <td width="30%"><%=comment.getName()%>
                <br><%=comment.getDate()%></td>
            <td width="70%"><%=comment.getContent()%></td>
        </tr>
        <%}%>

    </tbody>
</table>
<div class="panel panel-success" id="newCom">
    <div class="panel panel-heading">
        Your comments:
    </div>
    <div class="panel-body">
        <input type="text" id="commentText" class="input-group" placeholder="Enter Your Comment" style="width:100%">
    </div>
    <div>
        <button class="btn btn-theme" id="addComments">Add</button>
    </div>
</div>

<Script>
    $(document).ready(function () {
        if ("<%=canAdd%>" === "false")
        {
            $('#newCom').hide();
        }

    });

    $('#addComments').click(function () {
        var userID = "<%=user.getID()%>";
        var recipeID = "<%=recipe.getId()%>";
        var comment = htmlEncode($('#commentText').val());

        $('#newCom').load("mykitchen/saveComment.jsp", {"user": userID, "recipe": recipeID, "content": comment});
    });


</script>