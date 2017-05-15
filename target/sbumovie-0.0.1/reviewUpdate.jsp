<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<body>
            <form class="form-horizontal" method="post" action="reviewUpdate.do">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="title">title</label>
              <div class="controls">
                <input id="title" name="title" class="form-control" type="text" placeholder="${review.title}" class="input-large" required="" value="${review.title}">
              </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="userid">content:</label>
              <div class="controls">
                <input id="content" name="content" class="form-control" type="text" placeholder="${review.content}" class="input-large" required="" value="${review.content}">
              </div>
            </div>
                <input id="reviewId" name="reviewId" class="form-control" type="hidden" value="${review.id}">
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