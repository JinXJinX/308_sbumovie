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
	    window.location="index.do";  
	    </script>  
	    <% 
	}
%>

<div class="col-md-offset-3 col-md-6">
<c:forEach items="${supports}" var="s" varStatus="status1">
                  <li class="list-group-item">
                  <div class="gallery_product filter all theaters">
                      <div class="row">

                          <div class="item">
                              <!-- <div class="item col-md-3" style="background-color:">
                                  <img class="item-image" src="img/theater.jpg" alt="">
                              </div> -->
                              <div class="item-detail col-md-9">
                                  <div class="col-md-5">
                                      <br>
                                      <div class="item-title">
                                          <h4>${s.id }&nbsp;&nbsp;${s.email } </h4>
                                      </div>
                                    
                                      <h3>${s.question }</h3>
                                  </div>
                              </div>
                          </div>

                      </div>
                  </div>
              </li>
            </c:forEach>
</div>

<jsp:include page="footer.jsp" flush="true" />