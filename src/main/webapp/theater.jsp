<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />

<script type="text/javascript">

/* function likeTheater(id){
	$.ajax({
        url: "theaterLike.do",
        data: {
        	theaterId: id,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	alert("success");
            }else if(data=="login"){
               	alert("login");
            }else{
            	alert("fail");
            }
        }
    })
} */

function likeTheater(id){
	$.ajax({
		url: "theaterLike.do",
        data: {
        	theaterId: id,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	/* alert("success"); */
            }else if(data=="login"){
               	alert("login");
            }else{
            	/* alert("fail"); */
            }
        }
    })
    var str = document.getElementById('theaterLike').src
    if (str.includes('unfav')) {
        document.getElementById('theaterLike').src='img/fav.png'
    }else{
    	document.getElementById('theaterLike').src='img/unfav.png'
    }
}

</script>

<div class="row col-md-12">
            <div class="col-md-offset-3 col-md-3 col-md-4">
                <div class="row">
                    <h2>${theater.name }</h2>
                    <c:choose>
	                          <c:when test="${like}">
	                              <img id="theaterLike" src="img/fav.png" onclick="likeTheater(${theater.id})">
	                          </c:when>
	                          <c:otherwise>
	                              <img id="theaterLike" src="img/unfav.png" onclick="likeTheater(${theater.id})">
	                          </c:otherwise>
	                </c:choose>
                  <%--   <a href="javascript:void(0);" onclick="likeTheater(${theater.id})">Like</a> --%>
					<h3>${theater.address } ${theater.zipcode }</h3>
                    
                    <div class="col-sm-6">
                      
						<c:choose>
						      <c:when test="${user != None && user.zipcode != null}">
						      <iframe 
						      width="600"
						  	  height="450"
						      src="//www.google.com/maps/embed/v1/directions?origin=${user.zipcode }
						      &destination=${theater.name }
						      &key=AIzaSyDyZQzrsEjhzK8j-lZtNIablNfYxR7hExg">
						  		</iframe>
						  		</c:when>
						      <c:otherwise>
						     <iframe 
						     width="600"
						     height="450"
						     src="//www.google.com/maps/embed/v1/directions?origin=11720
						      &destination=${theater.name }
						      &key=AIzaSyDyZQzrsEjhzK8j-lZtNIablNfYxR7hExg">
						      </iframe>
						    </c:otherwise>
						</c:choose>
   
                </div>
            </div>
            </div>
</div>
<jsp:include page="footer.jsp" flush="true" />