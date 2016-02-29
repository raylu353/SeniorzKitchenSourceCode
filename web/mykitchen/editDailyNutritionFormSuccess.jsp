<%-- 
    Document   : editDailyNutritionFormSuccess
    Created on : Sep 22, 2015, 12:46:00 AM
    Author     : ray
--%>


<%@page import="com.sk.entities.UserIntake"%>
<%@page import="com.sk.webhandle.intakeManager"%>
<%@page import="com.sk.model.User"%>

<%
    User user = new User();
    intakeManager im = new intakeManager();
    if (session.getAttribute("CurrentUser") != null) {
        user = (User) session.getAttribute("CurrentUser");
    }
    UserIntake dailyIntake = new UserIntake();

    dailyIntake.setUserId(Long.valueOf(user.getID()));

    if (!request.getParameter("en").equals("") && !request.getParameter("en").equals("0")) {
        dailyIntake.setEngergyLimit(Integer.valueOf(request.getParameter("en")));
    } else {
        dailyIntake.setEngergyLimit(null);
    }
    if (!request.getParameter("pr").equals("") && !request.getParameter("pr").equals("0")) {
        dailyIntake.setProteinLimit(Integer.valueOf(request.getParameter("pr")));
    } else {
        dailyIntake.setProteinLimit(null);
    }
    if (!request.getParameter("fa").equals("") && !request.getParameter("fa").equals("0") ) {
        dailyIntake.setFatLimit(Integer.valueOf(request.getParameter("fa")));
    } else {
        dailyIntake.setFatLimit(null);
    }

    if (!request.getParameter("fs").equals("") && !request.getParameter("fs").equals("0")) {
        dailyIntake.setFatSaLimit(Integer.valueOf(request.getParameter("fs")));
    } else {
        dailyIntake.setFatSaLimit(null);
    }

    if (!request.getParameter("ca").equals("") && !request.getParameter("ca").equals("0")) {
        dailyIntake.setCarboLimit(Integer.valueOf(request.getParameter("ca")));
    } else {
        dailyIntake.setCarboLimit(null);
    }

    if (!request.getParameter("su").equals("") && !request.getParameter("su").equals("0")) {
        dailyIntake.setSugarLimit(Integer.valueOf(request.getParameter("su")));
    } else {
        dailyIntake.setSugarLimit(null);
    }
    if (!request.getParameter("so").equals("") && !request.getParameter("so").equals("0")) {
        dailyIntake.setSodiumLimit(Integer.valueOf(request.getParameter("so")));
    } else {
        dailyIntake.setSodiumLimit(null);
    }

    im.setUserID(user.getID());
    im.setUserIntake(dailyIntake);

    String message = "";
    if (session.getAttribute("dailyIntake") != null) {
        im.updateIntakeToDB();
        message = "Daily Intake Has Been Updated!";

    } else {
        im.saveIntakeToDB();
        message = "Daily Intake Has Been Saved!";
    }
%>
<div>
    <center><h5><%=message%></h5></center>
</div>