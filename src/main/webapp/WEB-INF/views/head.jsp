<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <div>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index" > <img src="${pageContext.request.contextPath}/resources/images/logo1.png"
				alt="logo" width="40" height="30"></a>
    </div>
   <%--  <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Home</a> --%>
    </div>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
 <li><a href="${pageContext.request.contextPath}/contactus">Contact Us</a></li>
 <li><a href="${pageContext.request.contextPath}/allproducts">All Products</a></li>
 
 <%
	if (request.isUserInRole("ROLE_ADMIN")) {
%>
 
 <li><a  href="allcategories">Categories</a></li>
  <%
	}
    %>
  </ul>  
   
    <ul class="nav navbar-nav navbar-right">
    <c:choose>
    
					<c:when test="${not empty pageContext.request.userPrincipal.name }">
					
					<%
					if (request.isUserInRole("ROLE_USER")) {
				%>
				<li>
					<a href="${pageContext.request.contextPath}/initiateFlow"> View
						Cart <i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
				</li>
				
				<%
					}
				%>
					
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>Welcome ${pageContext.request.userPrincipal.name }</a></li>
    <li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li> 
    
				
  </c:when>
    	
			
    		<c:otherwise>
    		
    <li><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath}/loginpage"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    
    		
    		</c:otherwise>
    		
    	</c:choose>
    </ul>
 
  </div>
  </div>
</nav>
