<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<body>
            <form class="form-horizontal" method="post" action="register.do">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="Email">Email:</label>
              <div class="controls">
                <input id="Email" name="Email" class="form-control" type="text" placeholder="username@emailname.com" class="input-large" required="">
              </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="userid">Username:</label>
              <div class="controls">
                <input id="userid" name="userid" class="form-control" type="text" placeholder="XuJing" class="input-large" required="">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label" for="userid">FirstName:</label>
              <div class="controls">
                <input id="firstName" name="firstName" class="form-control" type="text" placeholder="fname" class="input-large" required="">
              </div>
            </div>
			 <div class="control-group">
              <label class="control-label" for="userid">lastName:</label>
              <div class="controls">
                <input id="lastName" name="lastName" class="form-control" type="text" placeholder="lname" class="input-large" required="">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="userid">zipcode:</label>
              <div class="controls">
                <input id="zipcode" name="zipcode" class="form-control" type="text" placeholder="000000" class="input-large" required="">
              </div>
            </div>
            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="password">Password:</label>
              <div class="controls">
                <input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="">
                <em>Use 8 or more characters with a letter and a number or symbol. No more than 3 of the same character in a row.</em>
              </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="reenterpassword">Re-Enter Password:</label>
              <div class="controls">
                <input id="reenterpassword" class="form-control" name="reenterpassword" type="password" placeholder="********" class="input-large" required="">
              </div>
            </div>

            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="confirmsignup"></label>
              <div class="controls">
                <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="JOIN NOW FOR FREE">
              </div>
            </div>
            </fieldset>
            </form>
</body>