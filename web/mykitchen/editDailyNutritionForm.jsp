<%-- 
    Document   : editDailyNutritionForm
    Created on : Sep 21, 2015, 4:07:24 PM
    Author     : Cecilia & Ray
--%>

<%@page import="com.sk.entities.UserIntake"%>
<%@page import="com.sk.webhandle.intakeManager"%>
<%@page import="com.sk.model.User"%>

<%
    UserIntake dailyIntake = new UserIntake();
    if(session.getAttribute("dailyIntake") != null)
    {
        dailyIntake = (UserIntake) session.getAttribute("dailyIntake");
    }
    
    String en = "";
    if(dailyIntake.getEngergyLimit() != null)
    {
        en = dailyIntake.getEngergyLimit().toString();
    }
    
    String pr = "";
    if(dailyIntake.getProteinLimit()!= null)
    {
        pr = dailyIntake.getProteinLimit().toString();
    }
    
    String fa = "";
    if(dailyIntake.getFatLimit()!=null)
    {
        fa = dailyIntake.getFatLimit().toString();
    }
    
    String fs = "";
    if(dailyIntake.getFatSaLimit()!=null)
    {
        fs = dailyIntake.getFatSaLimit().toString();
    }
    
    String ca = "";
    if(dailyIntake.getCarboLimit()!=null)
    {
        ca = dailyIntake.getCarboLimit().toString();
    }
    
    String su = "";
    if(dailyIntake.getSugarLimit()!=null)
    {
        su = dailyIntake.getSugarLimit().toString();
    }
    
    String so = "";
    if(dailyIntake.getSodiumLimit()!=null)
    {
        so = dailyIntake.getSodiumLimit().toString();
    }
                
    
    

%>



<form id="profileForm" name="profileForm" class="form-horizontal">
    <div class="form-group">
        <label for="inputEnergy" class="col-sm-3 control-label">Energy: (KJ)</label>
        <div class="col-sm-6">
            <input class="form-control" id="energy" name="energy" value="<%=en%>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputProtein" class="col-sm-3 control-label">Protein: (g)</label>
        <div class="col-sm-6">
            <input class="form-control" id="protein" name="protein" value="<%=pr%>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputFat" class="col-sm-3 control-label">Fat: (g)</label>
        <div class="col-sm-6">
            <input class="form-control" id="fat" name="fat" value="<%=fa%>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputFatSaturated" class="col-sm-3 control-label">Fat Saturated: (g)</label>
        <div class="col-sm-6">
            <input class="form-control" id="fatSaturated" name="fatSaturated" value="<%=fs%>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputCarbohydrates" class="col-sm-3 control-label">Carbohydrates: (g)</label>
        <div class="col-sm-6">
            <input class="form-control" id="carbohydrates" name="carbohydrates" value="<%=ca%>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputSugar" class="col-sm-3 control-label">Sugar: (g)</label>
        <div class="col-sm-6">
            <input class="form-control" id="sugar" name="sugar" value="<%=su%>">
        </div>
    </div>
    <div class="form-group">
        <label for="inputSodium" class="col-sm-3 control-label">Sodium: (mg)</label>
        <div class="col-sm-6">
            <input class="form-control" id="sodium" name="sodium" value="<%=so%>">
        </div>
    </div>
    <div class="row">
        <div class="col-sm-offset-2 col-sm-6">
            <button id="submitProfile" type="submit" class="btn btn-theme" data-toggle="modal" data-target="#myModal">Submit</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="resetBtn" class="btn btn-default">Reset</button>
        </div>
    </div>
    <br />
    <div class="row">
        <div id="changePassworderrmsg" class="error" style="font-size: 14px">

        </div>
    </div>
</form>
<script>
    $(document).ready(function () {
        $('#profileForm').validate({
            rules: {
                energy: {
                    minlength: 0,
                    maxlength: 5,
                    number: true
                },
                protein: {
                    minlength: 0,
                    maxlength: 3,
                    number: true
                },
                fat: {
                    minlength: 0,
                    maxlength: 3,
                    number: true
                },
                fatSaturated: {
                    minlength: 0,
                    maxlength: 3,
                    number: true
                },
                carbohydrates: {
                    minlength: 0,
                    maxlength: 3,
                    number: true
                },
                sugar: {
                    minlength: 0,
                    maxlength: 3,
                    number: true
                },
                sodium: {
                    minlength: 0,
                    maxlength: 4,
                    number: true
                }
            },
            messages: {
                energy: {
                    maxlength: "Please input no more than 5 digits.",
                    number: "Please input a number."
                },
                protein: {
                    maxlength: "Please input no more than 3 digits.",
                    number: "Please input a number."
                },
                fat: {
                    maxlength: "Please input no more than 3 digits.",
                    number: "Please input a number."
                },
                fatSaturated: {
                    maxlength: "Please input no more than 3 digits.",
                    number: "Please input a number."
                },
                carbohydrates: {
                    maxlength: "Please input no more than 3 digits.",
                    number: "Please input a number."
                },
                sugar: {
                    maxlength: "Please input no more than 3 digits.",
                    number: "Please input a number."
                },
                sodium: {
                    maxlength: "Please input no more than 4 digits.",
                    number: "Please input a number."
                }
            },
            submitHandler: function () {
                var energy = $('#energy').val();
                var protein = $('#protein').val();
                var fat = $('#fat').val();
                var fatSaturated = $('#fatSaturated').val();
                var carbohydrates =$('#carbohydrates').val();
                var sugar = $('#sugar').val();
                var sodium = $('#sodium').val();

                //alert(energy + "," + protein + "," + fat + "," + fatSaturated + "," + carbohydrates + "," + sugar + "," + sodium);
                
                $('#messagePanel').load("mykitchen/editDailyNutritionFormSuccess.jsp",
                        {
                            "en":energy,
                            "pr":protein,
                            "fa":fat,
                            "fs":fatSaturated,
                            "ca":carbohydrates,
                            "su":sugar,
                            "so":sodium
                        });
            }
        });
        
        $('#resetBtn').click(function() {
            $(".form-control").val("");
            
            
            
            
        });
        
    });

</script>
<div id="myModal" class="modal modal-lg fade  col-lg-offset-2" role="dialog">
    <div class="modal-dialog modal-lg">
        <div id="modalBody" class="modal-body">
            <div class="panel panel-success" style="font-size: 14px">
                <div class="panel-heading">
                    <h3 class="panel-title" class="green">Nutrition Fact (Per Serving)
                        <button type="button" class="close"  data-dismiss="modal">
                            &times;
                        </button>
                    </h3>
                </div>

                <div class="panel-body" id="messagePanel"> 
                </div>
                <div class="panel-footer" >

                    <button type="button" class="btn btn-block btn-theme"  data-dismiss="modal">
                        close
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

