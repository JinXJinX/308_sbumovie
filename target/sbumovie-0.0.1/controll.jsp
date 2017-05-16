<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.User, com.movie.form.Review" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" flush="true" />
<body>
<script type="text/javascript">
function editOrg(id){
	window.location.href="movieUpdatePre.do?movieId="+id;
}
function delOrg(id){
	$.ajax({
        url: "deleteMovie.do",
        data: {
            movieId: id,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	alert("delete success");
    			window.location.href="controll.jsp";
            }else{
            	alert("delete fail");
    			window.location.href="controll.jsp";
            }
        }
    })
}
function his(id){
	window.location.href="movieDetail.do?movieId="+id;
}
function setCenterListData(){
	$.ajax({
        url: "allMoviePaging.do",
        data: {
            page: 1,
            pageSize: 20
        },
        success: function (json) {
            var data = json.info2;
            //console.log(JSON.stringify(data))
            var centerData = "<tr id='alldata_id'><th scope='col'>num</th><th scope='col'>title</th><th scope='col'>length</th><th scope='col'>language</th>"
                + "<th scope='col'>releaseDate</th><th scope='col'>movieDetail</th><th scope='col'>operate</th></tr>";
            for (var i = 0; i < data.length; i++) {
                centerData += "<tr id='org-item-" + data[i].id + "'><td>" + (i + 1) + "</td><td>" + data[i].title + "</td><td>" + data[i].length + "</td><td>" + data[i].language + "</td>"
                    + "<td>" + new Date(data[i].releaseDate) + "</td><td><a href='javascript:;' onclick='his(\"" + data[i].id + "\")'>detail</a></td><td><a href='javascript:void(0);' onclick='editOrg(" + data[i].id + ")'>update</a> <a href='javascript:void(0);' onclick='delOrg(" + data[i].id + ")'>delete</a></td></tr>"
            }
            $(".centerData").html(centerData);
            document.getElementById("currentpage").value = json.currentpage;
            document.getElementById("totalpage").value = json.totalpage;
            currentpage = parseInt($("#currentpage").val());
            totalpage = parseInt($("#totalpage").val());
            initPage(currentpage, totalpage);
        }
    })
}
function topage(page) {
	$.ajax({
        type: "get",
        url: "allMoviePaging.do?page=" + page + "&pageSize=20",
        success: function (json) {
            var data = json.info2;
            var centerData = "<tr id='alldata_id'><th scope='col'>num</th><th scope='col'>title</th><th scope='col'>length</th><th scope='col'>language</th>"
                + "<th scope='col'>releaseDate</th><th scope='col'>movieDetail</th><th scope='col'>operate</th></tr>";
            for (var i = 0; i < data.length; i++) {
                centerData += "<tr id='org-item-" + data[i].id + "'><td>" + (i + 1) + "</td><td>" + data[i].title + "</td><td>" + data[i].length + "</td><td>" + data[i].language + "</td>"
                    + "<td>" + data[i].releaseDate + "</td><td><a href='javascript:;' onclick='his(\"" + data[i].id + "\")'>detail</a></td><td><a href='javascript:void(0);' onclick='editOrg(" + data[i].id + ")'>update</a> <a href='javascript:void(0);' onclick='delOrg(" + data[i].id + ")'>delete</a></td></tr>"
            }
            $(".centerData").html(centerData);
            document.getElementById("currentpage").value = json.currentpage;
            document.getElementById("totalpage").value = json.totalpage;
            currentpage = parseInt($("#currentpage").val());
            totalpage = parseInt($("#totalpage").val());
            initPage(currentpage, totalpage);
        }
    });
}
</script>
 <table border="1">
	<tr>
		<td>userid</td>
		<td>userName</td>
		<td>firstName</td>
		<td>lasetName</td>
		<td>emmail</td>
		<td>zipcode</td>
	</tr>

<c:forEach items="${users}" var="user" varStatus="status1">
	<tr>
                   <td> <div class="col-md-8">
                        <div class="span8">
                            <h4><strong>${ user.id }</strong></h4>
                        </div>
					</td>
					<td>
                    <div class="span6">
                         ${user.username}
                    </div>
                    </td>
                    <td>
                    <div class="span6">
                         ${user.fname}
                    </div>
                    </td>
                    <td>
                    <div class="span6">
                         ${user.lname}
                    </div>
                    </td>
                    <td>
                    <div class="span6">
                         ${user.email}
                    </div>
                     </td>
                    <td>
                    <div class="span6">
                         ${user.zipcode}
                    </div>
                    </td>
                    </tr>
        </c:forEach>
</table>

<%-- <a href="movieControll.jsp">movie list</a>
<a href="actroControll.jsp">actor list</a>
<a href="reviewControll.jsp">review list</a>
<p>
   Todays date is: <%= (new java.util.Date()).toLocaleString()%>
</p> --%>

<jsp:include page="footer.jsp" flush="true" />
