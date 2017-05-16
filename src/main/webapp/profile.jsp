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
<div class="col-md-offset-4 col-md-3 col-md-4">
<form action="loginAction.do" method="post">
<div class="controls">
  Username/Email
  <input type="text" name="email" placeholder=${user.username}><br>
  </div>
  <div class="controls">
  Password:<input type="password" name="password" placeholder=${user.password}><br>
  </div>
  <div class="controls">
  <input type="submit" value="Sign In">
  </div>
</form> 
<br><br><br><br><br>
</div>
<script>
 function checkLoginState() {
	 FB.getLoginStatus(function(response) {
		  if (response.status === 'connected') {
		    console.log('Logged in.');
		  }
		  else {
		    FB.login();
		  }
		});
 }
 function fb_logout() {
	 FB.logout(function(response) {
		   // Person is now logged out
		});
	 }

</script>
<jsp:include page="footer.jsp" flush="true" />
<!-- <fb:login-button 
  scope="public_profile,email"
  onlogin="checkLoginState();">
</fb:login-button>

<button onlogin="fb_logout();">
  fb logout
</button> -->