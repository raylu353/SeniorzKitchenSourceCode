<%@page import ="com.sk.model.Recipe" %>
<%@page import ="com.sk.model.NutritionCalc" %>
<%@page import ="com.sk.webhandle.RecipeManager" %>
<%@page import ="com.sk.model.User"%>
<%
    Recipe recipe = new Recipe();
    if (request.getParameter("reciptID") != null) {
        recipe.setId(request.getParameter("reciptID"));
    } else {
        recipe.setId("MockID");
    }

    recipe.setName(request.getParameter("name"));
    recipe.setDescription(request.getParameter("desc"));
    recipe.setPictureURL(request.getParameter("picURL"));
    recipe.setMethod(request.getParameter("method"));
    recipe.setServing(Integer.valueOf(request.getParameter("serving")));
    if (request.getParameter("likeNum") != null) {
        recipe.setLikesNumber(Integer.valueOf(request.getParameter("likeNum")));
    } else {
        recipe.setLikesNumber(0);
    }
    recipe.setNc((NutritionCalc) (session.getAttribute("SelectedList")));
    recipe.setAuthorID(((User) session.getAttribute("CurrentUser")).getID());

    if (request.getParameter("command") != null) {
        System.out.println("With Command!");
        if (request.getParameter("command").equals("update")) {
            System.out.println("Will Update!");
            RecipeManager rm = new RecipeManager();
            recipe.updateRecipeToDB();
            System.out.println("Updated!");
        }
    } else {
        recipe.saveRecipeToDB();
        System.out.println("NEW RECIPE SAVED!");
    }

    NutritionCalc nc = new NutritionCalc();
    session.setAttribute("SelectedList", nc);
%>

<script>
    $(document).ready(function () {
        $('#page-wrapper').load("mykitchen/dashboard.jsp");
        $('#page-wrapper').hide();
        $('#recipeViewArea').hide();
        $('#loadingArea').show();

    });
</script>