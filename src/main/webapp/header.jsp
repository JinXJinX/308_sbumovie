<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SBU MOVIE</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/homepage.css" rel="stylesheet">

<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/carousel-1.js" type="text/javascript"></script>
<script src="js/carousel-2.js" type="text/javascript"></script>
<script src="js/filter.js" type="text/javascript"></script>
<script type="text/javascript" src="js/pageView.js"></script>


<nav class="navbar navbar-default" role="navigation">
  <div class="container">

    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-brand-centered">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="./" title="">
      <div class="navbar-brand navbar-brand-centered">SBU MOVIE</div>
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-brand-centered">
	      <ul class="nav navbar-nav">
	        <li><a href="./">Home</a></li>
	        <li><a href="./">Movie News</a></li>
	        <li>
			    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
			    Genre
				</button>
			    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=now">Now Playing</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=upcoming">Upcoming</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=box">Top Box Office</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Thriller">Thriller</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Documentary">Documentary</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Comedy">Comedy</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Adventure">Adventure</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Drama">Drama</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Action">Action</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Horror">Horror</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Fantasy">Fantasy</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Family">Family</a></li>
			      <li role="presentation"><a role="menuitem" tabindex="-1" href="searchGenre.do?genre=Romance">Romance</a></li>
			    </ul>
			</li>
	        
	        <c:choose>
                      <c:when test="${user != None && user.type == 1}">
                      <li>
								    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
								    Admin
									</button>
								    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
								      <li role="presentation"><a role="menuitem" tabindex="-1" href="controll.do">User List</a></li>
								      <li role="presentation"><a role="menuitem" tabindex="-1" href="movieControll.jsp">Movie List</a></li>
								      <li role="presentation"><a role="menuitem" tabindex="-1" href="actroControll.jsp">Actor List</a></li>
								      <li role="presentation"><a role="menuitem" tabindex="-1" href="reviewControll.jsp">Review List</a></li>
								    </ul>
						</li>
                      </c:when>
           </c:choose>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
           
                <li>
                  <c:choose>
                      <c:when test="${user != None}">
                          <li>
		                    <a href="register.jsp">${user.email}</a>
		                    </li>
		                    <li>
		                    <a href="logout.do">Logout</a>
		                    </li>
                      </c:when>
                      <c:otherwise>
	                    <li>
	                    <a href="login.do">Sign In</a>
	                    </li>
	                    <li>
	                    <a href="register.jsp">Sign Up</a>
	                    </li>
                    </c:otherwise>
                </c:choose>



                </li>

		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->

                  <div class="row-row2">
                      <div class="col-sm-3"><br></div>
                      <div class="col-sm-6">
                          <form method="post" action="search.do"class="form-inline">
                              <input type="text" name="query" class="form-control"  style="width: 600px"placeholder="keyword">
                              <!-- <select name="searchFlag" class="form-control" >
                              	<option value="movieFlag" >movie</option>
                              	<option value="actorFlag">actor</option>
                              </select> -->
                              <input type="submit" class="btn btn-primary" value="Search"> 
                          </form>
                      </div>
                  </div>

		</nav>
</head>
