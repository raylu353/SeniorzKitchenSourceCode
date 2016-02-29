<%-- 
    Document   : intakebar
    Created on : Sep 21, 2015, 6:54:29 PM
    Author     : ray
--%>


<%@page import="com.sk.entities.UserIntake"%>
<%@page import="com.sk.webhandle.DashManager"%>
<%@page import= "java.text.DecimalFormat"%>

<%
    DecimalFormat df = new DecimalFormat("######0.0");
    UserIntake dailyIntake = new UserIntake();
    DashManager dm = new DashManager();
    if (session.getAttribute("dailyIntake") != null) {
        dailyIntake = (UserIntake) session.getAttribute("dailyIntake");
    }
    if (session.getAttribute("DashManager") != null) {
        dm = (DashManager) session.getAttribute("DashManager");
    }
%>

<%
    if (dailyIntake.getEngergyLimit() != null) {
        String max = dailyIntake.getEngergyLimit().toString();
        String now = String.valueOf(dm.getEnergyIntake());
        Double width = (Double.valueOf(now) / Double.valueOf(max)) * 100;

%> 
<p><strong>Energy    <%=now%> / <%=max%> (KJ)</strong></p>
<%
    if (Integer.valueOf(now) < Integer.valueOf(max)) {
%>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:<%=df.format(width)%>%">
        <%=df.format(width)%>%
    </div>
</div>
<%
} else {%>
<div class="progress">
    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:100%">
        <%=df.format(width)%>%
    </div>
</div>


<%}
    }%>



<%
    if (dailyIntake.getProteinLimit() != null) {
        String max = dailyIntake.getProteinLimit().toString();
        String now = String.valueOf(dm.getProteinIntake());
        Double width = (Double.valueOf(now) / Double.valueOf(max)) * 100;
%>
<p><strong>Protein    <%=now%> / <%=max%> (g)</strong></p>
<%
    if (Integer.valueOf(now) < Integer.valueOf(max)) {
%>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:<%=df.format(width)%>%">
        <%=df.format(width)%>%
    </div>
</div>
<%
} else {%>
<div class="progress">
    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:100%">
        <%=df.format(width)%>%
    </div>
</div>


<%}
    }%>




<%
    if (dailyIntake.getFatLimit() != null) {
        String max = dailyIntake.getFatLimit().toString();
        String now = String.valueOf(dm.getFatIntake());
        Double width = (Double.valueOf(now) / Double.valueOf(max)) * 100;
%>
<p><strong>Fat    <%=now%> / <%=max%> (g)</strong></p>
<%
    if (Integer.valueOf(now) < Integer.valueOf(max)) {
%>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:<%=df.format(width)%>%">
        <%=df.format(width)%>%
    </div>
</div>
<%
} else {%>
<div class="progress">
    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:100%">
        <%=df.format(width)%>%
    </div>
</div>


<%}
    }%>

<%
    if (dailyIntake.getFatSaLimit() != null) {
        String max = dailyIntake.getFatSaLimit().toString();
        String now = String.valueOf(dm.getFatSaIntake());
        Double width = (Double.valueOf(now) / Double.valueOf(max)) * 100;
%>
<p><strong>Fat Saturated    <%=now%> / <%=max%> (g)</strong></p>
<%
    if (Integer.valueOf(now) < Integer.valueOf(max)) {
%>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:<%=df.format(width)%>%">
        <%=df.format(width)%>%
    </div>
</div>
<%
} else {%>
<div class="progress">
    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:100%">
        <%=df.format(width)%>%
    </div>
</div>


<%}
    }%>


<%
    if (dailyIntake.getCarboLimit() != null) {
        String max = dailyIntake.getCarboLimit().toString();
        String now = String.valueOf(dm.getCarboIntake());
        Double width = (Double.valueOf(now) / Double.valueOf(max)) * 100;
%>
<p><strong>Carbohydrates    <%=now%> / <%=max%> (g)</strong></p>
<%
    if (Integer.valueOf(now) < Integer.valueOf(max)) {
%>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:<%=df.format(width)%>%">
        <%=df.format(width)%>%
    </div>
</div>
<%
} else {%>
<div class="progress">
    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:100%">
        <%=df.format(width)%>%
    </div>
</div>


<%}
    }%>


<%
    if (dailyIntake.getSugarLimit() != null) {
        String max = dailyIntake.getSugarLimit().toString();
        String now = String.valueOf(dm.getSugerIntake());
        Double width = (Double.valueOf(now) / Double.valueOf(max)) * 100;
%>
<p><strong>Sugar    <%=now%> / <%=max%> (g)</strong></p>
<%
    if (Integer.valueOf(now) < Integer.valueOf(max)) {
%>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:<%=df.format(width)%>%">
        <%=df.format(width)%>%
    </div>
</div>
<%
} else {%>
<div class="progress">
    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:100%">
        <%=df.format(width)%>%
    </div>
</div>


<%}
    }%>


<%
    if (dailyIntake.getSodiumLimit() != null) {
        String max = dailyIntake.getSodiumLimit().toString();
        String now = String.valueOf(dm.getSodiumIntake());
        Double width = (Double.valueOf(now) / Double.valueOf(max)) * 100;
%>
<p><strong>Sodium    <%=now%> / <%=max%> (mg)</strong></p>
<%
    if (Integer.valueOf(now) < Integer.valueOf(max)) {
%>
<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:<%=df.format(width)%>%">
        <%=df.format(width)%>%
    </div>
</div>
<%
} else {%>
<div class="progress">
    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=now%>" aria-valuemin="0" aria-valuemax="<%=max%>" style="width:100%">
        <%=df.format(width)%>%
    </div>
</div>


<%}

    }
    if (dailyIntake.getEngergyLimit() == null
            && dailyIntake.getCarboLimit() == null
            && dailyIntake.getFatLimit() == null
            && dailyIntake.getFatSaLimit() == null
            && dailyIntake.getProteinLimit() == null
            && dailyIntake.getSodiumLimit() == null
            && dailyIntake.getSugarLimit() == null) {%>


<div>
    <h4 class="green">You have not setup your daily intake profile.</h4>

</div>
<div>
    <div type="button" class="btn btn-theme" id="editIntakeProfileBtn">Setup Intake Profile</div>
</div>

<%
    }
%>


<script>
    $('#editIntakeProfileBtn').click(function () {
        $('#page-wrapper').load("mykitchen/editMyProfile.jsp");
        $('#page-wrapper').show();
        $('#recipeViewArea').hide();
    });
</script>