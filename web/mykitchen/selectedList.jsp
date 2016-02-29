<%-- 
    Document   : selectedList
    Created on : Sep 6, 2015, Sep 6, 2015 2:31:32 AM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.sk.model.Food" %>
<%@page import= "com.sk.model.NutritionCalc"%>
<%@page import= "java.text.DecimalFormat"%>


<%
    DecimalFormat df = new DecimalFormat("######0.00");
    NutritionCalc nc;
    
    if (request.getParameter("quantity") != null) {
        Food food = (Food) session.getAttribute("FoodCache");
        String num = request.getParameter("quantity").split(",")[0].trim();
        double quantity = Double.valueOf(df.format(Double.valueOf(num)));
        String unit = request.getParameter("quantity").split(",")[1].trim();
        if (unit.equals("liter")) {
            food.setQuantity(quantity * food.getGravity());
            food.setUnit("litre");
        } else {
            food.setQuantity(quantity);
            food.setUnit("gram");
        }

        nc = (NutritionCalc) session.getAttribute("SelectedList");
        nc.addFood(food);
        session.setAttribute("SelectedList", nc);

    } else if (request.getParameter("id") != null)
    {
        nc = (NutritionCalc) session.getAttribute("SelectedList");
        nc.removeByID(request.getParameter("id"));
        session.setAttribute("SelectedList", nc);
    }
    
    else {
        nc = (NutritionCalc) session.getAttribute("SelectedList");
    }
    
%>

<div class="panel panel-success" style="font-size: 14px">
    <div class="panel-heading" beforePageShow="pagePreLoad_CS">
        <h3 class="panel-title" class="green">Ingredients List</h3>
    </div>

    <div class="panel-body"> 
        <table class="table" id="resultList">
            <thead>
                <tr class="success">
                    <td>Name</td>
                    <td>Quantity (g)</td>
                    <td>Description</td>
                    <td></td>
                </tr>
            </thead>
            <tfoot>
                <tr class="success">
                    <td>Total</td>
                    <td><%=df.format(nc.getTotalWeight())%></td>
                    <td></td>
                    <td></td>
                <tr>
            </tfoot>
            <tbody>
                <%
                    for (Food item : nc.getFoodlist()) {
                %>
                <tr id="<%out.print(item.getId());%>">
                    <td><%=item.getName()%></td>
                    <td><%=df.format(item.getQuantity())%></td>
                    <td><%=item.getDesc()%></td>
                    <td id="dissmissBtn"><button id="removeBtn" type="button" class="close" onclick="$('#listPanel').load('mykitchen/selectedList.jsp',{'id':$(this).parent().parent().attr('id')})">
                            &times;
                        </button></td>
                </tr>
                <%}%>
            </tbody>

        </table>
    </div>
</div>
           

<script>
  
</script>