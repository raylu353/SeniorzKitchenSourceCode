<%-- 
    Document   : giveQuantity
    Created on : Sep 5, 2015, Sep 5, 2015 6:04:02 PM
    Author     : ray
--%>

<%@page import = "com.sk.webhandle.FoodLibrary" %>
<%@page import = "com.sk.model.Food" %>
<%@page import = "com.sk.model.NutritionCalc" %>

<%
    FoodLibrary allFood;
    String foodDesc = request.getParameter("FoodDesc");
    if (session.getAttribute("FoodLibrary") != null) {
        allFood = (FoodLibrary) session.getAttribute("FoodLibrary");
    } else {
        //TODO
        //Handle Error!
        allFood = new FoodLibrary();
        session.setAttribute("FoodLibrary", allFood);
    }
    System.out.println("\"" + foodDesc.trim() + "\"");
    Food foodCandidate = allFood.findFoodByDesc(foodDesc);
    Boolean alreadyHas = false;
    if (((NutritionCalc) session.getAttribute("SelectedList")).hasItem(foodCandidate)) {
        alreadyHas = true;
    }

    System.out.println(foodCandidate.getDesc());
    Boolean hasLiter = true;
    if (foodCandidate.getGravity() == 0) {
        hasLiter = false;
    }
    System.out.println("Has Liter? " + hasLiter.toString());

    //FoodCache attribute is the food entity will be handled in selectedList.jsp
    session.removeAttribute("FoodCache");
    session.setAttribute("FoodCache", foodCandidate);
%>

<div class="panel-heading">
    <h3 class="panel-title"><%=foodDesc%>
        <button type="button" class="close" onclick="closeFood()">
            &times;
        </button>
    </h3>
</div>

<div> 
    <div class="input-group"> 
        <div class="input-group">
            <input type="text" id="quantityInput" placeholder="Enter Quantity" class="form-control">


            <span class="input-group-btn ">
                <%if (!hasLiter) {%>
                <button id="GramBtn" class="btn btn-theme" disabled>
                    g
                </button>
                <%} else {%>
                <button id="GramBtn" class="btn btn-theme" >
                    g
                </button>
                <button id="LiterBtn" class="btn">
                    ml
                </button>
                <%
                    }
                %>
            </span>   
        </div>
    </div>
    <div>
        <button id="submitQuantity" class="btn btn-theme" onclick="validateQuantity()">Submit</button>
    </div>
    <div id="errorMessage" style="color:red;font-size:14px">
        <%if (alreadyHas) {
        %>
        <%=foodCandidate.getName()%> is added. New Submit will update the quantity.
        <%}%>

    </div>



</div>

<script>
    var theUnit = "gram";

    $('#GramBtn').click(function () {
        $('#GramBtn').addClass("btn btn-theme");
        $('#LiterBtn').removeClass("btn btn-theme");
        $('#LiterBtn').addClass("btn");
        theUnit = "gram";
    });

    $('#LiterBtn').click(function () {
        $('#LiterBtn').addClass("btn btn-theme");
        $('#GramBtn').removeClass("btn btn-theme");
        $('#GramBtn').addClass("btn");
        theUnit = "liter";
    });


    function submitQuantity() {

        var quantity = document.getElementById("quantityInput").value;
        if (quantity === "") {
            errMsg = "Please give a Number";
            $('#errorMessage').text(errMsg);
        } else {
            var data = quantity + "," + theUnit;
           $('#foodInputTextBox').val('');
            $('#selectorPanel').hide();
            $('#listPanel').load("mykitchen/selectedList.jsp", {"quantity": data});
            
        }
    }
    ;


    $('#quantityInput').keyup(function () {
        $(this).val($(this).val().replace(/[^0-9.]/g, ''));
    }).bind("paste", function () {
        $(this).val($(this).val().replace(/[^0-9.]/g, ''));
    }).css("ime-mode", "disabled");

</script>
<script>
    function validateQuantity() {
        var theInput = document.getElementById("quantityInput").value;
        if (!isNaN(theInput))
        {
            if (theInput < 100000)
            {
                submitQuantity();
            }
            else {
                var errMsg = "The quantity should be less than 100000.";
            }

        }
        else {
            errMsg = "Please give a valid Number";
        }

        $('#errorMessage').text(errMsg);
        document.getElementById("quantityInput").value = "";
    }
</script>
