<%-- 
    Document   : editMyProfile
    Created on : Sep 20, 2015, 4:55:01 PM
    Author     : Cecilia
--%>
<div>
<ul class="nav nav-tabs" role="tablist" style="padding-top:40px">

    <li id="editNutriButton" class="active" role="presentation">
        <a href="#" role="tab" data-toggle="tab"><h4 class="green">Daily Nutrition Consumption</h4></a></li>

    <li id="changePwdButton" role="presentation">
        <a href="#"  role="tab" data-toggle="tab"><h4 class="green">Change Password</h4></a></li>

</ul>

 <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="editMyProfileForm">...</div>
 </div>

</div>
<script>
    $(document).ready(function () {
        $('#editMyProfileForm').load("mykitchen/editDailyNutritionForm.jsp");
    });

    $('#changePwdButton').click(function () {
        $('#editMyProfileForm').load("mykitchen/changePwdForm.jsp");
    });

    $('#editNutriButton').click(function () {
        $('#editMyProfileForm').load("mykitchen/editDailyNutritionForm.jsp");
    });

     $(document).ready(function () {
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
        $('#loadingArea').hide();

    });

</script>
