<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<% 
	User user= (User)request.getSession().getAttribute("user");
	if(user==null){
		%>
		<script type="text/javascript">  
	    window.location="login.do";  
	    </script>  
	    <% 
	}
%>
<div class="col-md-offset-3 col-md-6">
<h1>Use Gift Card</h1>
<form action="redeemGiftcard.do" method="post">
	Gift card digits
           <input type="text" name="card" placeholder="card 6 digits" required=""><br>
  <input type="submit" value="submit">


</form> 
</div>

<jsp:include page="footer.jsp" flush="true" />