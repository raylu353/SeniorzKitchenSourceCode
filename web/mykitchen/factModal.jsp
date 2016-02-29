<%-- 
    Document   : selectedList
    Created on : Sep 7, 2015, Sep 6, 2015 2:31:32 AM
    Author     : ray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.sk.model.Food" %>
<%@page import= "com.sk.model.NutritionCalc"%>
<%@page import= "java.text.DecimalFormat"%>


<%
    DecimalFormat df = new DecimalFormat("######0.00");
    NutritionCalc nc = (NutritionCalc) session.getAttribute("SelectedList");
    nc.setServing(Integer.valueOf(request.getParameter("serving")));
    System.out.println("Serving: " + nc.getServing());
    System.out.println("Modal Called");

%>
<div class="panel panel-success" style="font-size: 14px">
    <div class="panel-heading">
        <h3 class="panel-title" class="green">Nutrition Fact (Per Serving)
            <button type="button" class="close"  data-dismiss="modal">
                &times;
            </button>
        </h3>
    </div>

    <div class="panel-body"> 
        <table class="table" id="resultList">
            <thead>
                <tr class="success">
                    <td>Name</td>
                    <td>Quantity (g)</td>
                    <td>Energy (KJ)</td>
                    <td>Protein (g)</td>
                    <td>Fat (g)</td>
                    <td>Fat Saturated (g)</td>
                    <td>Carbohydrates (g)</td>
                    <td>Sugar (g)</td>
                    <td>Sodium  (mg)</td>
                </tr>
            </thead>
            <tfoot>
                <tr class="success">
                    <td>Total</td>
                    <td><%=df.format(nc.getTotalWeightPerServing())%></td>
                    <td><%=df.format(nc.getEnergy())%></td>
                    <td><%=df.format(nc.getProtein())%></td>
                    <td><%=df.format(nc.getFat())%></td>
                    <td><%=df.format(nc.getFatStatuated())%></td>
                    <td><%=df.format(nc.getCarbohydrates())%></td>
                    <td><%=df.format(nc.getSugar())%></td>
                    <td><%=df.format(nc.getSalt())%></td>
                <tr>
            </tfoot>
            <tbody>
                <%
                    for (Food item : nc.getFoodlist()) {
                %>
                <tr id="<%out.print(item.getId());%>">
                    <td><%=item.getName()%></td>
                    <td><%=df.format(item.getQuantity() / nc.getServing())%></td>
                    <td><%=df.format(item.getEnergy() * item.getQuantity() / 100 / nc.getServing())%></td>
                    <td><%=df.format(item.getProtein() * item.getQuantity() / 100 / nc.getServing())%></td>
                    <td><%=df.format(item.getFat() * item.getQuantity() / 100 / nc.getServing())%></td>
                    <td><%=df.format(item.getFatSatuated() * item.getQuantity() / 100 / nc.getServing())%></td>
                    <td><%=df.format(item.getCarbohydrates() * item.getQuantity() / 100 / nc.getServing())%></td>
                    <td><%=df.format(item.getSugars() * item.getQuantity() / 100 / nc.getServing())%></td>
                    <td><%=df.format(item.getSodium() * item.getQuantity() / 100000 / nc.getServing())%></td>
                </tr>
                <%}%>
            </tbody>

        </table>
    </div>
    <div class="panel-footer" >
        <button type="button" class="btn btn-block btn-theme"  data-dismiss="modal">
            close
        </button>
    </div>
</div>

<script>
   
</script>