<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<body>
            <form class="form-horizontal" method="post" action="movieUpdate.do">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="title">title</label>
              <div class="controls">
                <input id="title" name="title" class="form-control" type="text" placeholder="${movie.title}" class="input-large" required="" value="${movie.title}">
              </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="userid">length:</label>
              <div class="controls">
                <input id="length" name="length" class="form-control" type="text" placeholder="20" class="input-large" required="" value="${movie.length}">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label" for="userid">synopsis:</label>
              <div class="controls">
                <input id="synopsis" name="synopsis" class="form-control" type="text" placeholder="synopsis" class="input-large" required="  value="${movie.synopsis}">
              </div>
            </div>
                <input id="movieId" name="movieId" class="form-control" type="hidden" value="${movie.id}">
            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="confirmsignup"></label>
              <div class="controls">
                <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="update">
              </div>
            </div>
            </fieldset>
            </form>
</body>