<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<div class="col-md-offset-3 col-md-6">
<form action="giftcard.do" method="post">
<h1>Buy Gift Card</h1>
  Message:<br>
  ​<textarea name="message" id="txtArea" rows="3" cols="80" placeholder="type your message here"></textarea><br>
  
  Amount:
  <input id="amount" name="amount" class="form-control" type="int" placeholder="0" class="input-large" required="">
   
  Receiver Email:
  <input id="email" name="email" class="form-control" type="text" placeholder="email" class="input-large" required="">           
  
  Bank Card:
  <input id="Bank" name="Bank" class="form-control" type="int" placeholder="0" class="input-large" required="">
   
  Expire Date:
  <input id="Expire" name="Expire" class="form-control" type="int" placeholder="0" class="input-large" required="">
  
  CVV:
  <input id="CVV" name="CVV" class="form-control" type="int" placeholder="0" class="input-large" required="">
  
  <input type="submit" class = "button" value="submit">

</form> 
</div>
<jsp:include page="footer.jsp" flush="true" />