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
     
              		<c:choose>
                       <c:when test="${user != null}">
                           <input id="Email" name="Email" class="form-control" type="text" placeholder="username@emailname.com" class="input-large" value = "${user.email}" required="">
                       </c:when>
                       <c:otherwise>
                           <input id="Email" name="Email" class="form-control" type="text" placeholder="username@emailname.com" class="input-large" required="">
                        </c:otherwise>
                    </c:choose>
              
              </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="userid">Username:</label>
              <div class="controls">
                
              
              <c:choose>
                 <c:when test="${user != null}">
                     <input value="${user.username}" id="userid" name="userid" class="form-control" type="text" placeholder="..." class="input-large" required="">
                 </c:when>
                 <c:otherwise>
                     <input id="userid" name="userid" class="form-control" type="text" placeholder="..." class="input-large" required="">
                  </c:otherwise>
              </c:choose>
              
              </div>
            </div>
             <div class="control-group">
              <label class="control-label" for="userid">FirstName:</label>
              <div class="controls">  
              
              <c:choose>
                 <c:when test="${user != null}">
                     <input value="${user.fname }" id="firstName" name="firstName" class="form-control" type="text" placeholder="fname" class="input-large" required="">
                 </c:when>
                 <c:otherwise>
                     <input id="firstName" name="firstName" class="form-control" type="text" placeholder="fname" class="input-large" required="">
                  </c:otherwise>
              </c:choose>
              
              </div>
            </div>
			 <div class="control-group">
              <label class="control-label" for="userid">lastName:</label>
              <div class="controls">
               
              <c:choose>
                 <c:when test="${user != null}">
                     <input value="${user.lname }" id="lastName" name="lastName" class="form-control" type="text" placeholder="lname" class="input-large" required="">
                 </c:when>
                 <c:otherwise>
                     <input id="lastName" name="lastName" class="form-control" type="text" placeholder="lname" class="input-large" required="">
                  </c:otherwise>
              </c:choose>
              
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="userid">zipcode:</label>
              <div class="controls">
              
              <c:choose>
                 <c:when test="${user != null}">
                       <input value="${user.zipcode }" id="zipcode" name="zipcode" class="form-control" type="text" placeholder="000000" class="input-large" required="">
                 </c:when>
                 <c:otherwise>
                       <input id="zipcode" name="zipcode" class="form-control" type="text" placeholder="000000" class="input-large" required="">
              
                  </c:otherwise>
              </c:choose>
              
              </div>
            </div>
            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="password">Password:</label>
              <div class="controls">
         
              <c:choose>
                 <c:when test="${user != null}">
                       <input value="${user.password }" id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="">
                </c:when>
                 <c:otherwise>
                       <input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="">
              
                  </c:otherwise>
              </c:choose>
              
              </div>
            </div>
            
            <!-- Newsletter input-->
            <div class="control-group">
              <label class="control-label" for="password">receive Newsletter:</label>
              <div class="controls">
         
              <c:choose>
                 <c:when test="${user != null && user.news == true}">
                       <input type="checkbox" name="newsletter" class="form-control" value="1" checked> receive Newsletter<br>
                </c:when>
                 <c:otherwise>
                       <input type="checkbox" name="newsletter" class="form-control" value="1"> receive Newsletter<br>
                
                  </c:otherwise>
              </c:choose>
              
              </div>
            </div>
            
            <!-- money amount -->
            
              <c:choose>
                 <c:when test="${user != null && user.news == true}">
                     <div class="control-group">
		              <label class="control-label" for="password">receive Newsletter:</label>
			              <div class="controls">
			                     Price amount $: ${user.money}
			                </div>
		            </div>
                </c:when>
              </c:choose>
              
              

            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="confirmsignup"></label>
              <div class="controls">
               <c:choose>
                 <c:when test="${user != null}">
                     <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="SAVE">
                  </c:when>
                 <c:otherwise>
                        <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="JOIN NOW FOR FREE">
                </c:otherwise>
              </c:choose>
              
              
              </div>
            </div>
            </fieldset>
            </form>
</body>