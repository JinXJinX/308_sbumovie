<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />

${theater.name }

${theater.address }

${theater.zipcode }


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

<jsp:include page="footer.jsp" flush="true" />