<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.Actor, com.movie.form.Movie, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<%-- <% 
	User user= (User)request.getSession().getAttribute("user");
	if(user==null){
		%>
		<script type="text/javascript">  
	    window.location="login.do";  
	    </script>  
	    <% 
	}
%> --%>
<link href="css/actorpage.css" rel="stylesheet" type="text/css"/>

<body>
    <div class="container">

        <div class="row col-md-12" style="background-color:">
            <div class="col-md-1"></div>
            <div class="col-md-3 col-md-4">
                <div class="row" style="background-color:">
                    <br>
                    <div class="col-sm-6">
                      <c:choose>
                          <c:when test="${ actor.mainImagePath != null}">
                            <img src="${actor.mainImagePath}" alt="">
                          </c:when>
                          <c:otherwise>
                              <img src="image/default_actor.jpg" alt="">
                          </c:otherwise>
                      </c:choose>

                    </div>

            </div>
            </div>
            <div class="col-md-6 col-md-12" style="background-color:">
                <div class="row" >
                        <h1>${actor.name}</h1><span class="glyphicons glyphicons-heart-empty"></span>
                        <br>
                        <h4>Actor|Producer|Director|Writer</h4>

                </div>
                <div class="btn-group">
                            <button type="button" class="btn btn-default"><a href="homepage.html">Overview</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Filmography</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Trailers</a></button>
                            <button type="button" class="btn btn-default"><a href="#">News</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Photos</a></button>



                        </div>
                <br>
                <div class="col-md-10 text-left" style="background-color:">
                    <br>
                    <h5>Date of Birth: ${actor.dob}</h5>

                    <c:choose>
                        <c:when test="${ actor.dod != null && actor.dod.length() > 1}">
                          <h5>Date of Death: ${actor.dod}</h5>
                        </c:when>
                    </c:choose>
                    <h5>Birth Place: ${actor.birthPlace}</h5>
                    <h5>IMDB ID: ${actor.imdbId}</h5>
                    <h3>Biograph</h3>
                    <p>
                      ${actor.biography}
                    </p>

                </div>
            </div>
        </div>
        <br>
        <br>
    </div>
</body>

<jsp:include page="footer.jsp" flush="true" />
