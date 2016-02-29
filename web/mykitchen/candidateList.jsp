<%-- 
    Document   : giveQuantity
    Created on : Sep 5, 2015, Sep 5, 2015 6:04:02 PM
    Author     : ray
--%>

<%@page import = "com.sk.webhandle.FoodLibrary" %>
<%@page import = "com.sk.model.Food" %>

<% String foodName = request.getParameter("FoodName");
    FoodLibrary foodLibrary = (FoodLibrary) session.getAttribute("FoodLibrary");%>

<div class="panel-heading">
    <h3 class="panel-title">Choose from the list 
        <button type="button" class="close" onclick="closeFood()">
            &times;
        </button>
    </h3>
</div>
<div class="panel-body" style="height: 300px; overflow-y:scroll"> 
    <table id ="theTable" class="table-hover" cellspacing="0" width="100%">    
        <thead></thead>
        <tfoot></tfoot>
        <tbody style="font-size:14px">
            
            <%if(foodLibrary.findFoodByName(foodName).size()!=0) {
                for (Food food : foodLibrary.findFoodByName(foodName)) {%>
            <tr style="border:dotted;border-width:1px ">
                <td>
                    <%=food.getDesc()%>
                </td>
            </tr>
            <%}
            } else {
            %>
            <div style="color:red;font-size: 14px">
                Sorry, we don't have such food in our food library. <br>
                Please use the hint list to select food.
            </div>
        <%}%>
        </tbody>
    </table>
</div>


<script>
    $('#theTable tbody').on('click', 'tr', function () {
        var foodDesc = $(this).text();
        $('#selectorPanel').load("mykitchen/giveQuantity.jsp", {"FoodDesc": foodDesc});
    });
</script>
