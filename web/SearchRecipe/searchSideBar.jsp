<%-- 
    Document   : searchSideBar
    Created on : Sep 20, 2015, 12:11:18 PM
    Author     : ray
--%>

<%@page import="com.sk.webhandle.SearchManager"%>
<%
    SearchManager sm = new SearchManager();
    String criteria = sm.getCriteriasToString();
    session.setAttribute("SearchManager", sm);

%>





<ul class="nav" id="side-menu">
    <li id="MyKitchenButton" class="green">
        <B>Add Search Criteria</B>
    </li>
    <li class="input-group">
        <input id="criteriaInput" type="text" class="form-control" placeholder="Keyword">
        <!--span class="input-group-addon btn btn-theme" id="addCriteriaBtn">Add</span-->
    </li>
    <div style="color:red">
        <div id="msgArea">

        </div>


    </div>
    <div style="padding-top: 5px;padding-bottom: 5px" id="criteriaList">
        <div class="alert" style="font-size:14px;padding: 0px">

        </div>
    </div>

</li>
<li>
    <button id="searchButton" class="btn btn-theme btn-block">
        Search
    </button>  
</li>
</ul>

<script>
    var criteria = [];
    var count = 0;
    $('#addCriteriaBtn').click(function () {
        $('#msgArea').text("");
        var hasItem = false;
        for (var i = 0; i < criteria.length; i++)
        {
            if (criteria[i] === $('#criteriaInput').val())
            {
                hasItem = true;
                $('#msgArea').text("You've already got that.");
                break;
            }
        }

        if (hasItem === false && $('#criteriaInput').val() !== "") {
            $('#criteriaList').append(
                    '<div class="alert" style="font-size:14px;padding: 0px;margin:0px" id="' + $('#criteriaInput').val() + '">\n\
                        <div style="display:inline-block" id="xxx">' + $('#criteriaInput').val()
                    + '</div><button id="x' + count++ + '" style="display:inline-block" type="button" class="close" onclick=" var item = ($(this).parent().attr(\'id\'));removeItem(item);" data-dismiss="alert" >&times;</button></div>'
                    );
            criteria.push($('#criteriaInput').val());
        }

        document.getElementById("criteriaInput").value = "";
    });
    $(document).ready(function () {
        var availableTags = [<%=criteria%>""];
                $("#criteriaInput").autocomplete({
            source: function (request, response) {
                var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i");
                response($.grep(availableTags, function (item) {
                    return matcher.test(item);
                }).slice(0, 5));
            },
            minLength: 1
        });
        $('#criteriaInput').on("autocompleteclose", function () {
            $('#msgArea').text("");
            var hasItem = false;
            for (var i = 0; i < criteria.length; i++)
            {
                if (criteria[i] === $('#criteriaInput').val())
                {
                    hasItem = true;
                    $('#msgArea').text("You've already got that.");
                    break;
                }
            }

            if (hasItem === false && $('#criteriaInput').val() !== "") {
                $('#criteriaList').append(
                        '<div class="alert" style="font-size:14px;padding: 0px;margin:0px" id="' + $('#criteriaInput').val() + '">\n\
                        <div style="display:inline-block" id="xxx">' + $('#criteriaInput').val()
                        + '</div><button id="x' + count++ + '" style="display:inline-block" type="button" class="close" onclick=" var item = ($(this).parent().attr(\'id\'));removeItem(item);" data-dismiss="alert" >&times;</button></div>'
                        );
                criteria.push($('#criteriaInput').val());
            }

            document.getElementById("criteriaInput").value = "";

            $('#page-wrapper').show();
            $('#recipeViewArea').hide();
            if (criteria.length === 0)
            {
                $('#msgArea').text("Please enter a criteria.");
            } else {
                var paraString = criteria.toString();
                $('#allRecipes').removeClass("active");
                $('#SearchResult').addClass("active");
                $('#loadingArea').show();
                $('#listArea').load("SearchRecipe/searchResult.jsp", {"criteria": paraString});
            }


        });

    });
    $('#searchButton').click(function () {

        if (criteria.length === 0)
        {
            $('#msgArea').text("Please enter a criteria.");
        } else {
            $('#allRecipes').removeClass("active");
            $('#SearchResult').addClass("active");
            $('#loadingArea').show();
            $('#listArea').hide();
            $('#recipeViewArea').hide();
            var paraString = criteria.toString();
            $('#listArea').load("SearchRecipe/searchResult.jsp", {"criteria": paraString});
        }
    });

    function removeItem(item) {
        $('#msgArea').text("");
        var tempList = null;
        var tempList = [];
        for (var i = 0; i < criteria.length; i++) {
            if (criteria[i] !== item && criteria[i] !== null && criteria[i] != "") {
                tempList.push(criteria[i]);
            }
        }

        criteria = null;
        criteria = tempList;
    }


</script>
