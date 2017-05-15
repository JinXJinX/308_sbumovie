<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<%-- <% 
	User user;
	if (!session.isNew()){
		   user = (User)session.getAttribute("user");
	   } 
%> --%>
<jsp:include page="header.jsp" flush="true" />
<form action="loginAction.do" method="post">
  Username/Email
  <input type="text" name="email" placeholder=${user.username}><br>
  Password:<input type="password" name="password" placeholder=${user.password}><br>
  <input type="submit" value="Sign In">
</form> 