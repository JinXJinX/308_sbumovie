<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />

<form action="giftcard.do" method="post">
  Message:
  ​<textarea name="question" id="txtArea" rows="10" cols="40" placeholder="type your message here"></textarea><br>
  
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
  
  <input type="submit" value="submit">

</form> 

<jsp:include page="footer.jsp" flush="true" />