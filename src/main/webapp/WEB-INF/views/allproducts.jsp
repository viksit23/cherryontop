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
<body background="resources/images/nb1.jpg"  ng-app="myApp" ng-controller="myCtrl">
		<div class="container">
		<h3><b>ALL PRODUCTS</b></h3>
		<hr/>
		<%
			if(request.isUserInRole("ROLE_ADMIN"))
			{
		%>

<div class="col-lg-12">
<a href="${pageContext.request.contextPath}/addproduct" align="left" class="btn btn-danger">Add Product</a> 

</div>
<%
				}
		%>

<div class="row">
<b>
	<div class="col-sm-1"><span>Product Id</span></div>
    <div class="col-sm-2"><span>Product Category</span></div>
    <div class="col-sm-2"><span>Product Description</span></div>
	<div class="col-sm-1"><span>Product Price</span></div>
	<div class="col-sm-2"><span>Product Name</span></div>
	<div class="col-sm-1"><span>Product Quantity</span></div>
	<div class="col-sm-2" align="right"><span>Product Image</span></div>
</b>
</div>


<div class="row" ng-repeat="cat in data">

	<div class="col-sm-1"><span>{{cat.ProductId}}</span></div>
    <div class="col-sm-2"><span>{{cat.ProductCategory}}</span></div>
    <div class="col-sm-2"><span>{{cat.ProductDescription}}</span></div>
	<div class="col-sm-1"><span>{{cat.ProductPrice}}</span></div>
	<div class="col-sm-2"><span>{{cat.ProductName}}</span></div>
	<div class="col-sm-1"><span>{{cat.ProductQuantity}}</span></div>
		<div class="panel-body">
			<div class="col-md-2">
			
				<img class="img-rounded" align="right" ng-src="${pageContext.request.contextPath}/resources/images/image_{{ cat.ProductId }}.jpg" height=" 50px" width="100px">

				</div></div>
					
	<%
						if(request.isUserInRole("ROLE_USER")){
					%>
				<div class="container" align="center">
				<div class="col-md-2 col-md-offset-9" align="center" style="margin-top:10px;">
					<a href="${pageContext.request.contextPath}/view/{{cat.ProductId}}" class="btn btn-warning btn-block btn-xs">View Product</a>
					</div></div>
					<hr>
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
	</div> 	<hr>
	<%
						}
%>
</div>






<h2><center><font face="verdana" color="blue">We Provide Cakes For Every Occations</center></h2></font>
<marquee> <font face="verdana" color="red">We also make Cakes On Special Orders-We Provide Delivery At Mid Night Also-Same Day Delivery Also Available </font></marquee>

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
</ul>
</div>

</body>
</html>