<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<div class="col-md-offset-4 col-md-6">
<form action="support.do" method="post">
<h1>Ask For Support</h1>
  Question:<br>
  ​<textarea name="question" id="txtArea" rows="10" cols="40" placeholder="type your question here"></textarea><br>
  
  Your email:
  <c:choose>
     <c:when test="${user != null}">
           <input type="text" rows="4" cols="50" name="email" placeholder="email" value = "${user.email}" required=""><br>
    </c:when>
     <c:otherwise>
           <input type="text" name="email" placeholder="email" required=""><br>
      </c:otherwise>
  </c:choose>
  
  <input type="submit" value="submit">


</form> 
</div>
<jsp:include page="footer.jsp" flush="true" />