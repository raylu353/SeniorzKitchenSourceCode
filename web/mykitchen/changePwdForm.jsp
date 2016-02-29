<%-- 
    Document   : changePwdForm
    Created on : Sep 21, 2015, 2:07:37 PM
    Author     : Cecilia
--%>


<form id="changePasswordForm" name="changePasswordForm" class="form-horizontal">
    <div class="form-group">
        <label for="inputOldPassword" class="col-sm-3 control-label">Old Password:</label>
        <div class="col-sm-6">
            <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="Old Password">
        </div>
    </div>
    <div class="form-group">
        <label for="inputNewPassword" class="col-sm-3 control-label">New Password:</label>
        <div class="col-sm-6">
            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password">
        </div>
    </div>
    <div class="form-group">
        <label for="confirmNewPassword" class="col-sm-3 control-label">Confirm New Password:</label>
        <div class="col-sm-6">
            <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" placeholder="Confirm Password">
        </div>
    </div>
    <div class="row">
        <div class="col-sm-offset-2 col-sm-6">
            <button id="submitNewPassword" type="submit" class="btn btn-theme"  data-toggle="modal" data-target="#myModal">Change Password</button>
            <button type="reset" class="btn btn-theme">Reset</button>
        </div>
    </div>
    <br />
    <div class="row">
        
        <div id="changing"></div>
    </div>
</form>

<script>
    $(document).ready(function () {
        $('#changePasswordForm').validate({
            rules: {
                oldPassword: {
                    required: true,
                    minlength: 6,
                    maxlength: 15
                },
                newPassword: {
                    required: true,
                    minlength: 6,
                    maxlength: 15
                },
                confirmNewPassword: {
                    required: true,
                    equalTo: "#newPassword"
                }
            },
            messages: {
                oldPassword: {
                    required: "Please provide old password",
                    minlength: "Your password must be at least 6 characters long",
                    maxlength: "Your password must be at most 15 characters long"
                },
                newPassword: {
                    required: "Please provide new password",
                    minlength: "Your password must be at least 6 characters long",
                    maxlength: "Your password must be at most 15 characters long"
                },
                confirmNewPassword: {
                    required: "Please provide a password",
                    equalTo: "Please enter the same password as above"
                }
            },
            submitHandler: function () {
                var oldPassword = $('#oldPassword').val();
                var newPassword = $('#newPassword').val();

                $('#messagePanel').load("mykitchen/changePwdSuccess.jsp",
                        {
                            "oldPassword": oldPassword,
                            "newPassword": newPassword
                        });
            }
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