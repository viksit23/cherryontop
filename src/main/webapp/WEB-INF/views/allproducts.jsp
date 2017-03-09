<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Products</title>

<c:import url="/head-meta"/>

</head>
<script type="text/javascript">

var myApp=angular.module("myApp",[]);

myApp.controller("myCtrl",function($scope)
		{
	console.log("angular is working");
	$scope.data=${ProductJSON};
		});

</script>

<body>
<c:import url="/head"/>
<body background="resources/images/bg5.jpg"  ng-app="myApp" ng-controller="myCtrl">

<%
			if(request.isUserInRole("ROLE_ADMIN"))
			{
		%>
<div class="container">
<div class="col-lg-12">
<a href="${pageContext.request.contextPath}/addproduct" class="btn btn-danger">Add Product</a> 

</div>
<%
				}
		%>

<div class="row">
<div ng-repeat="cat in data">
	<div class="col-sm-2"><span>{{cat.ProductId}}</span></div>
    <div class="col-sm-2"><span>{{cat.ProductCategory}}</span></div>
    <div class="col-sm-2"><span>{{cat.ProductDescription}}</span></div>
	<div class="col-sm-2"><span>{{cat.ProductPrice}}</span></div>
	<div class="col-sm-2"><span>{{cat.ProductName}}</span></div>
	<div class="col-sm-2"><span>{{cat.ProductQuantity}}</span></div>
	<%
						if(request.isUserInRole("ROLE_USER")){
					%>
				<div class="col-md-12" align="center" style="margin-top:10px;">
					<a href="${pageContext.request.contextPath}/view/{{cat.ProductId}}" class="btn btn-warning btn-block btn-xs">VIEW</a>
					</div>
					<%} %>
	
	<%
						if(request.isUserInRole("ROLE_ADMIN"))
						{
					%>
	
		<form action="DeleteProductFromDB" method="post">
<div class="container">	
		<input type="hidden" name="text" value="{{cat.ProductId}}">  
	    
		<input type="submit" value="Delete">
</div>
	</form>
	 <div class="container">
	<form action="updateproduct" method="post">
	<input type="hidden" name="text" value="{{cat.ProductId}}">  
	        
	<input type="submit" value="Edit">
	</form>
	</div> 
	<%
						}
%>
</div>






<h2><center><font face="verdana" color="blue">We Provide Cakes For Every Occations</center></h2></font>
<ul><b><i><h3>
<li>Birthday Cakes</li>
<li>Wedding Cakes</li>
<li>Cakes For Every Festival</li>
<li>Cartoon Cakes For Kids</li>
<li>Fruit Cakes</li></h3>
</ul>
<h2><u><font color="red">Our Speciality</h2></font></u>
<ul>
<li><b><i>Apple Cake</li>
<li>Banana Cake</li>
<li>Black Forest Cake</li>
<li>Coconut Cake</li>
<li>Ice Cream Cake</li>
<li>Snowball Cake</li>
<marquee> <font face="verdana" color="red">We also make Cakes On Special Orders-We Provide Delivery At Mid Night Also-Same Day Delivery Also Available </font></marquee>
</body>
</html>