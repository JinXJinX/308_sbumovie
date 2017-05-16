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
<script type="text/javascript">

function send(){
	$.ajax({
        url: "news.do",
        data: {
            content: document.getElementById("content").value,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	alert("success");
            }else if(data=="login"){
               	alert("login");
            }else{
            	alert("fail");
            }
        }
    })
}
</script>
<div class="col-md-offset-3 col-md-6">
<h1>Create a News</h1>

	<h2>Content</h2><br>
            ​<textarea id="content" name="content" rows="3" cols="80" placeholder="type news content here"></textarea><br>
  
  <a onclick="send()">SEND</a>


</div>

<jsp:include page="footer.jsp" flush="true" />