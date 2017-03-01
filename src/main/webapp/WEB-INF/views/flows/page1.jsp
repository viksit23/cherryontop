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
	var myApp = angular.module("myApp",[]);
	
	myApp.factory("UserService",["$http","$q",function($http,$q)
	{
		var target_url = 'http://localhost:8090/firstFurious/';
		
		return{
			
			deleteFromCart : function(item) {
				return $http.post(target_url + 'flows/deleteFromCart/',item)
						.then(
								function(response) 
								{
									return response.data;
								},
								function(errResponse)
								{
									console.error('Error while sending data');
									return $q.reject(errResponse);
								});
			},
			
			
			
			fetchAllItems : function()
			{
				return $http.post( target_url + 'REST/fetchAllItems' ).then(
					function( response ){
						return response.data;
					},
					function( errResponse ){
						return $q.reject(errResponse);
					}
				);
			}
		};
	}]);
	
	myApp.controller("abc",["$scope","UserService",function($scope,$UserService){
		
		
		$scope.deleteFromCart = function(cartId) {
			$UserService.deleteFromCart(cartId).then(
					function(response) {
						try {
							$scope.data = response;
						} catch (e) {
							$scope.data = [];
						}
						console.log($scope.data);
					},
					function(errResponse) {
						console.error('Error while Sending Data.');
					});
		}
		
		
		$UserService.fetchAllItems().then(function(response)
		{
			//console.log(response);
			$scope.data = response;
		},function(errResponse)
		{
			console.log('Error fetching Items');
		});
	}]);
</script>



<body ng-app="myApp" ng-controller="abc">
<c:import url="/head"/>


	<div class="container">
		<a href="${pageContext.request.contextPath}/allProducts"
			class="btn btn-danger btn pull-left">BACK TO PRODUCTS</a>


		<a href="${flowExecutionUrl}&_eventId=goToCheckout"
			class="btn btn-warning  btn pull-right">CHECK OUT</a>
				</div>
<hr/>

	<div class="container-fluid">
	
	<div class="col-md-4 col-md-offset-4">
	<div  ng-repeat="x in data ">
			<div class="panel panel-default">
			
				 <div class="panel-body">
				 
					 <div class="col-md-6">
				  	 <img
					ng-src="${pageContext.request.contextPath}/{{ x.ProductImage }}" height=" 80px" width="170px" class="img img-responsive img-thumbnail">
				    </div>
				    
				    <div class="col-md-6">
					<div><span style="font-size:20px"><strong>{{x.ProductName}}</strong></span></div>
					
					<div><b>Quantity :{{x.ProductQty}} </b></div>
					
					<div><span style="font-size:15px" class="text-warning"><strong>&#8377  {{x.ProductPrice}}</strong></span></div>
				    </div>
			    
			    
				    <div class="col-md-12" style="margin-top:10px;" align="center">
				    <a href="${pageContext.request.contextPath}/view/{{x.ProductId}}" class="btn btn-warning btn-xs">VIEW</a>
					&nbsp &nbsp
					<input type="button" value="Delete from Cart"
					class="btn btn-danger btn-xs" ng-click="deleteFromCart(x.CartId)" />
				    </div>
			    		    
			    </div>  
		    
		  	</div>
	 </div>
  </div>
		</div>
	
</body>
</html>