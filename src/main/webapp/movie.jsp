<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User, com.movie.dao.impl.LikeDaoImpl" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" flush="true" />
<c:set var="actors" scope="session" value="${adao.getActorsByMovieId(movie.id)}"/>
<link href="css/moviepage.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
<script src="commenteditor.js" type="text/javascript"></script>
<!--
<hr>
<a href="/CSE308/edit?action=4&id=${movie.id}">Edit</a> ||
<a href="/CSE308/edit?action=401&id=${movie.id}">Delete</a>
<hr>
-->

<body>

<script type="text/javascript">

function likeMovie(id){
	$.ajax({
        url: "movieLike.do",
        data: {
            movieId: id,
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
    var str = document.getElementById('movieLike').src
    if (str.includes('unfav')) {
        document.getElementById('movieLike').src='img/fav.png'
    }else{
    	document.getElementById('movieLike').src='img/unfav.png'
    }
}
function alertMovie(id){
	$.ajax({
        url: "movieAlert.do",
        data: {
            movieId: id,
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
    var str = document.getElementById('movieAlert').src
    if (str.includes('unalert')) {
        document.getElementById('movieAlert').src='img/alert.png'
    }else{
    	document.getElementById('movieAlert').src='img/unalert.png'
    }
}
function sentAlert(id){
	$.ajax({
        url: "sentAlert.do",
        data: {
            movieId: id,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	alert("alert success");
            }else if(data=="login"){
               	alert("login");
            }else{
            	alert("alert fail");
            }
        }
    })
}
function likeReview(id, status){
	$.ajax({
        url: "reviewLike.do",
        data: {
            reviewId: id,
            status: status,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="login"){
            	alert("login");
            	window.location="login.do";
            }else{
	            /* if(data=="success"){
	            	alert("+1");
	            }else{
	            	alert("-1");
	            } */
	            location.reload();
        	}
        }
    })
    if (status == 1) {
        document.getElementById('reviewImgL').src='img/like.png'
        document.getElementById('reviewImgD').src='img/undislike.png'
    }else if(status == 0){
    	document.getElementById('reviewImgL').src='img/unlike.png'
        document.getElementById('reviewImgD').src='img/undislike.png'
    }else{
    	document.getElementById('reviewImgL').src='img/unlike.png'
    	document.getElementById('reviewImgD').src='img/dislike.png'
    }
}
function deleteReview(id){
	$.ajax({
        url: "deleteReview.do",
        data: {
            reviewId: id,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	alert("delete success");
            }else{
            	alert("delete fail");
            }
            location.reload();
        }
    })
}
</script>

    <div class="container">
        <br>
        <br>
        <br>
        <br>
        <div class="row col-md-12" style="background-color: ">
            <div class="col-md-1"></div>
            <div class="col-md-3 col-md-4">
                <div class="row" style="background-color:">
                    <br>
                    <div class="col-sm-6" style="background-color: #28a4c9">
                      <c:choose>
                          <c:when test="${movie.releaseDate != null }">
                              <img src="${movie.mainImagePath}" alt="">
                          </c:when>
                          <c:otherwise>
                              <img src="image/default_actor.jpg" alt="">
                          </c:otherwise>
                      </c:choose>

                </div>

            </div>
            </div>
            <div class="col-md-8 col-md-12" style="background-color:">
                <div class="row" >
                        <h1>${ movie.title }&nbsp;&nbsp;
                        <c:choose>
   						    <c:when test="${ movie.releaseDate != null }">
   						        (${(fn:split(movie.releaseDate, ' '))[0]})
   						    </c:when>
   						</c:choose>
                        <br>
                        <c:choose>
	                          <c:when test="${like}">
	                              <img id="movieLike" src="img/fav.png" onclick="likeMovie(${movie.id})">
	                          </c:when>
	                          <c:otherwise>
	                              <img id="movieLike" src="img/unfav.png" onclick="likeMovie(${movie.id})">
	                          </c:otherwise>
	                    </c:choose>
						
						<c:choose>
	                          <c:when test="${alert}">
	                              <img id="movieAlert" src="img/alert.png" onclick="alertMovie(${movie.id})">
	                          </c:when>
	                          <c:otherwise>
	                              <img id="movieAlert" src="img/unalert.png" onclick="alertMovie(${movie.id})">
	                          </c:otherwise>
	                    </c:choose>
						
 						<%-- <a href="javascript:void(0);" onclick="alertMovie(${movie.id})">Alert</a>  --%> 
 						
 						<c:choose>
	                          <c:when test="${user != null && user.type ==1}">
	                              <a href="javascript:void(0);" onclick="sentAlert(${movie.id})">Sent Alert</a>
	                          </c:when>
	                    </c:choose> 
                        
                        <br>
                        

                        </h1><span class="glyphicons glyphicons-heart-empty"></span>
                        <br>
                        <%-- <h4>${ movie.length } min - ${ movie.genre } </h4>
 --%>
                </div>

                        <!-- <div class="btn-group">
                            <button type="button" class="btn btn-default"><a href="homepage.html">Synopsis</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Movie Times</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Trailers</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Cast</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Reviews</a></button>
                            <button type="button" class="btn btn-default"><a href="#">News</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Photos</a></button>

                            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>

                        </div> -->
                        <br>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-2 col-md-2 text-center" style="background-color:" >
                                    <h1 class="rating-num">${movie.fanRating}</h1>
                                    <div class="rating">
                                      <c:forEach  var = "i" begin="2" end="10" step="2">
                                      <c:choose>
                                            <c:when test="${ i <= movie.fanRating }">
                                              <span class="glyphicon glyphicon-star"></span>
                                            </c:when>
                                            <c:otherwise>
                                              <span class="glyphicon glyphicon-star-empty"></span>
                                            </c:otherwise>
                                        </c:choose>
                                      </c:forEach>
                                    </div>
                    <div>
                        <span class="glyphicon glyphicon-user"></span>${movie.numFanRatings} total
                    </div>
                    <!-- <div class="row rating-desc">
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>5
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                    <span class="sr-only">80%</span>
                                </div>
                            </div>
                        </div>
                        end 5
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>4
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                    <span class="sr-only">60%</span>
                                </div>
                            </div>
                        </div>
                        end 4
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>3
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                    <span class="sr-only">40%</span>
                                </div>
                            </div>
                        </div>
                        end 3
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>2
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                    <span class="sr-only">20%</span>
                                </div>
                            </div>
                        </div>
                        end 2
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>1
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                                    <span class="sr-only">15%</span>
                                </div>
                            </div>
                        </div>
                        end 1
                    </div> -->
                                    <br></div>
                <div class="col-md-3 text-left" style="background-color: ">
                    <br>
                    <h5>Cast:
                      <c:forEach items="${actors}" var="actor" varStatus="status1">

                          <c:choose>
                                <c:when test="${ status1.index < 10 && actor.name != null}">
                                  <a href="actor.do?actorId=${actor.id}">
                                    <c:out value="${actor.name}"/> /
                                  </a>
                                </c:when>
                          </c:choose>

                      </c:forEach>
					</h5>
                    <h5>Genre: ${ movie.genre } </h5>
                    <h5>Country/Region: United States</h5>
                    <h5>Released Time: ${movie.releaseDate}</h5>
                    <h5>Duration: ${movie.length} min</h5>
                    <h5>Language: ${movie.language} </h5>
                    <h5>IMDB ID: ${movie.imdbId} </h5>
                    <h5>Synopsis: ${movie.synopsis} </h5>
                    <br>

                </div>

            </div>
                           <!--  <div class="container">
                                <div class="row">
                                    <div class="col-md-4 text-left" style="background-color:; width: 150px; height: 100px">


            </div>
                                    <div class="btn-group col-md-4">
                        <button type="button" class="btn btn-default">Write Comment</button>
                        <button type="button" class="btn btn-default">Write Review</button>
                    </div>

                                </div>
                            </div> -->

        </div>

                </div>
        <br>
 <c:choose>
         <c:when test="${movie.trailerPath != null }">
        <h3>TRAILER-----------------------------------------------------------------------------------------------------------</h3>

            <div class="col-md-9 col-md-offset-3">
                
                        <iframe width="560" height="315" src="${movie.trailerPath }" frameborder="0" allowfullscreen></iframe>
 
            </div>
        <br><br><br><br><br><br><br><br>
         </c:when>
      </c:choose>
      
            <h3>CAST + CREW-----------------------------------------------------------------------------------------------------</h3>
       <div class="visual-list-container  native-scrolling text-left" style="background-color: s">

        <ul class="list-inline">
            <c:forEach items="${actors}" var="actor" varStatus="status1">
            	<c:choose>
                              <c:when test="${actor.id != null }">
                <li class="list-group-item">
                    <a href="actor.do?actorId=${actor.id}">
                        <c:choose>
                              <c:when test="${ actor.mainImagePath != null && actor.mainImagePath.length() > 1 }">
                                <img src="${actor.mainImagePath}" width="185" height ="250" alt="">
                              </c:when>
                              <c:otherwise>
                                <img src="img/default_actor.jpg" width="185" height ="250" alt="">
                              </c:otherwise>
                          </c:choose>
                    </a>
                    <h6>${actor.name}</h6>
                    <h6 style="color: lightgray"><i>${adao.getCharacter(movie.id, actor.id)}</i></h6>
                </li>
                 </c:when>
                </c:choose>
            </c:forEach>

        </ul>

    </div>
    
		<h3>REVIEWS----------------------------------------------------------------------------------------------------------</h3>

            <div class="col-md-10">
                <div class="widget-area no-padding blank">
                    <div class="status-upload">
                        <form action="addReview.do" method="post">
                        	title:<input type="text" name="title">
                        	<br>
                            content:<textarea placeholder="Say something" name="content"></textarea>
                            <br>
                            <input type="hidden" name="movieId" value="${movie.id}">
                            <input type="hidden" name="userId" value="${user.id}" >
                            <input type="submit" class="btn btn-success green" value="comment"><i class="fa fa-share"></i>
                        </form>
                    </div>
                </div>
            </div>
		<br><br><br><br>
        <c:forEach items="${reviews}" var="review" varStatus="status1">
                    <div class="col-md-8">
                    
                        <div class="span8">
                            <h3><strong>${ review.title }</strong></h3>
                        </div>

                    <div class="span6">
                        <h4> ${review.content }</h4>
                        <div style="display:inline;">
                        <c:choose>
                              <c:when test="${s == 1}">
								<img id="reviewImgL" src="img/like.png" onclick="likeReview(${review.id}, 0)">
								&nbsp;&nbsp;<p id="numLike">${review.numLike}</p>&nbsp;&nbsp;
								<img id="reviewImgD" src="img/undislike.png" onclick="likeReview(${review.id}, -1)">
							  </c:when>
							  <c:when test="${s == -1}">
								<img id="reviewImgL" src="img/unlike.png" onclick="likeReview(${review.id}, 1)">
								&nbsp;&nbsp;<p id="numLike">${review.numLike}</p>&nbsp;&nbsp;
								<img id="reviewImgD" src="img/dislike.png" onclick="likeReview(${review.id}, 0)">
							  </c:when>
			 				  <c:otherwise>
                                <img id="reviewImgL" src="img/unlike.png" onclick="likeReview(${review.id}, 1)">
                                &nbsp;&nbsp;<p id="numLike">${review.numLike}</p>&nbsp;&nbsp;
								<img id="reviewImgD" src="img/undislike.png" onclick="likeReview(${review.id}, -1)">
                              </c:otherwise>
                        </c:choose>
                        </div>
                        <%-- <a href="javascript:void(0);" onclick="likeReview(${review.id}, 1)">Like</a>
                        ${review.numLike}
                        <a href="javascript:void(0);" onclick="likeReview(${review.id}, -1)">Dislike</a> --%>
                         <c:choose>
                              <c:when test="${ user != null && (user.id == review.userId || user.type==1) }">
                                <%-- <a href="deleteR.do?reviewId=${review.id}">
			                        Delete
			                        </a> --%>
			                    <a href="javascript:void(0);" onclick="deleteReview(${review.id})">Delete</a>
                              </c:when>
                          </c:choose>
                        
                    </div>

                    <div class="span8">
                        <p>
              <%-- <i class="icon-user"></i> by <a href="#">${review.authorName}</a> --%>
              | <i class="icon-calendar"></i> ${review.time}
            </p>
                    </div>

                    </div>
        	<br>
        </c:forEach>

        </div>
</body>
<jsp:include page="footer.jsp" flush="true" />
