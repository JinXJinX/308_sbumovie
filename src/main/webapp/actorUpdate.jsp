<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<body>
            <form class="form-horizontal" method="post" action="actorUpdate.do">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="title">name:</label>
              <div class="controls">
                <input id="name" name="name" class="form-control" type="text" placeholder="${actor.name}" class="input-large" required="" value="${actor.name}">
              </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="userid">birthPlace:</label>
              <div class="controls">
                <input id="birthPlace" name="birthPlace" class="form-control" type="text" placeholder="${actor.birthPlace }" class="input-large" required="" value="${actor.birthPlace}">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label" for="userid">biography:</label>
              <div class="controls">
                <input id="biography" name="biography" class="form-control" type="text" placeholder="${actor.biography}" class="input-large" required="  value="${actor.biography}">
              </div>
            </div>
                <input id="actorId" name="actorId" class="form-control" type="hidden" value="${actor.id}">
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