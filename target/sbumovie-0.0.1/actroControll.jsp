<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.User, com.movie.form.Review" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" flush="true" />

<body>
<script type="text/javascript">
function editOrg(id){
	window.location.href="actorUpdatePre.do?actorId="+id;
}
function delOrg(id){
	$.ajax({
        url: "deleteActor.do",
        data: {
            actorId: id,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	alert("delete success");
    			window.location.href="actroControll.jsp";
            }else{
            	alert("delete fail");
    			window.location.href="actroControll.jsp";
            }
        }
    })
}
function his(id){
	window.location.href="actor.do?actorId="+id;
}
function setCenterListData(){
	$.ajax({
        url: "allActorPaging.do",
        data: {
            page: 1,
            pageSize: 20
        },
        success: function (json) {
            var data = json.info2;
            //console.log(JSON.stringify(data))
            var centerData = "<tr id='alldata_id'><th scope='col'>num</th><th scope='col'>name</th><th scope='col'>sex</th><th scope='col'>birthPlace</th>"
                + "<th scope='col'>dob</th><th scope='col'>dod</th><th scope='col'>biography</th><th scope='col'>movieDetail</th><th scope='col'>operate</th></tr>";
                for (var i = 0; i < data.length; i++) {
                	var sex="unknown";
                	if(data[i].sex=="1"){
						sex="male";                		
                	}else if(data[i].sex=="2"){
                		sex="female";
                	}
                    centerData += "<tr id='org-item-" + data[i].id + "'><td>" + (i + 1) + "</td><td>" + data[i].name + "</td><td>" + sex + "</td><td>" + data[i].birthPlace + "</td>"
                        + "<td>" + new Date(data[i].dob) + "</td><td>" + (data[i].dod==""?"":new Date(data[i].dod)) + "</td><td>" + data[i].biography+ "</td><td><a href='javascript:;' onclick='his(\"" + data[i].id + "\")'>detail</a></td><td><a href='javascript:void(0);' onclick='editOrg(" + data[i].id + ")'>update</a> <a href='javascript:void(0);' onclick='delOrg(" + data[i].id + ")'>delete</a></td></tr>"
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
        url: "allActorPaging.do?page=" + page + "&pageSize=20",
        success: function (json) {
            var data = json.info2;
            var centerData = "<tr id='alldata_id'><th scope='col'>num</th><th scope='col'>name</th><th scope='col'>sex</th><th scope='col'>birthPlace</th>"
                + "<th scope='col'>dob</th><th scope='col'>dod</th><th scope='col'>biography</th><th scope='col'>actorDetail</th><th scope='col'>operate</th></tr>";
                for (var i = 0; i < data.length; i++) {
                    centerData += "<tr id='org-item-" + data[i].id + "'><td>" + (i + 1) + "</td><td>" + data[i].name + "</td><td>" + data[i].sex + "</td><td>" + data[i].birthPlace + "</td>"
                        + "<td>" + new Date(data[i].dob) + "</td><td>" + new Date(data[i].dod) + "</td><td>" + data[i].biography+ "</td><td><a href='javascript:;' onclick='his(\"" + data[i].id + "\")'>detail</a></td><td><a href='javascript:void(0);' onclick='editOrg(" + data[i].id + ")'>update</a> <a href='javascript:void(0);' onclick='delOrg(" + data[i].id + ")'>delete</a></td></tr>"
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
$(document).ready(function()
		{
	setCenterListData()
		});

</script>
				<h2><span id="listaddress">Actor</span><span id="listTitle">List</span><span ></span></h2>
					<table  border="1" cellspacing="1" cellpadding="0" class="bdata-infoitem-table centerData noheight">
						<tr id="alldata_id">
							<!--class="levelth" -->
							<th scope="col">num</th>
							<th scope="col">name</th>
							<th scope="col">birthPlace</th>
							<th scope="col">dob</th>
							<th scope="col">dod</th>
							<th scope="col">biography</th>
							<th scope="col">actorDetail</th>
							<th scope="col"></th>
							<th scope="col">operate</th>
						</tr>
					</table>
					 <div class="mainlist_page"></div>
			<input type="hidden" id="currentpage" />
	<input type="hidden" id="totalpage" />


<p>
   Todays date is: <%= (new java.util.Date()).toLocaleString()%>
</p>

<jsp:include page="footer.jsp" flush="true" />
