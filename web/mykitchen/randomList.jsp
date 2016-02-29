
<%@page import="java.util.List"%>
<%@page import="com.sk.webhandle.DashManager"%>
<%@page import="com.sk.model.Recipe"%>
<%@page import="com.sk.webhandle.RecipeManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sk.model.User"%>

<%
    DashManager dm = new DashManager();
    String buttonClickable = "true";


    dm = (DashManager) session.getAttribute("DashManager");
    ArrayList<Recipe> randomList = dm.getRandomList();

    if (request.getParameter("command") == null) {
        dm.AddARandomRecipeToList();
        randomList = dm.getRandomList();
        session.setAttribute("DashManager", dm);

    } else if (request.getParameter("command").equals("reload")) {
        randomList = dm.getRandomList();

    } else if (request.getParameter("command").equals("clear")) {
        dm.reSetTheList();
        session.setAttribute("DashManager", dm);
        randomList = new ArrayList();

    }
    
    if(dm.getListSize() >= 3)
    {
       buttonClickable="false";
    }


%>

<div class="row">

    <div class="col-lg-12">
        <div class="list-group">
            <%               
                int count = 0;
                for (Recipe recipe : randomList) {
                    if (count++ < 3) {
            %>             
            <div class="list-group-item" id="<%=recipe.getId()%>" onclick="$('#recipeViewArea').load('mykitchen/recipeDetails.jsp', {'recID': $(this).attr('id'),'from':'randomList'});
                    $('#page-wrapper').hide();
                    $('#recipeViewArea').show();">

                <div class="row" style="cursor: pointer">
                    <div class="col-lg-2" id="recipePic">
                        <img src="img/default-recipe-img.png" class="img-box" alt="" />
                    </div>
                    <div class="col-lg-4" id="recipeNameandDesc">
                        <h4><%=recipe.getName()%></h4>
                        <p>
                            <%=recipe.getDescription()%>
                        </p>
                    </div>
                    <div class="col-lg-4" id="likecomment">
                        Likes: <%=recipe.getLikesNumber()%>
                    </div>
                </div>
            </div>

            <%}}%>

        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        if ("<%=buttonClickable%>" === "false")
        {
            document.getElementById('getARecipeBtn').disabled = 'disabled';
        }
        else
        {
            $('#getARecipeBtn').prop("disabled", false);
        }

        $('#intakebars').load("mykitchen/intakebar.jsp");

    });

</script>


