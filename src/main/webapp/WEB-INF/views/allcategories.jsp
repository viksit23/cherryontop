<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<script type="text/javascript">

var myApp=angular.module("myApp",[]);

myApp.controller("myCtrl",function($scope)
		{
	console.log("angular is working");
	$scope.data=${CategoryJSON};
		});

</script>
<body background="resources/images/cat2.jpg" ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head" />
<div class="container">
<div class="col-lg-12">
<a href="${pageContext.request.contextPath}/addcategory" class="btn btn-danger">Add Category</a> 

</div>

<div ng-repeat="cat in data">
		<span>{{cat.CategoryId}}</span>
		<span>{{cat.CategoryName}}</span>
		<form action="DeleteCategoryFromDB" method="post">
<div class="container">	
		<input type="hidden" name="text" value="{{cat.CategoryId}}">  
	    
		<input type="submit" value="Delete">
</div>
	</form>
	 <div class="container">
	<form action="updatecategory" method="post">
	<input type="hidden" name="text" value="{{cat.CategoryId}}">  
	        
	<input type="submit" value="Edit">
	</form>
	</div> 
</div>


</div>


</body>
</html>