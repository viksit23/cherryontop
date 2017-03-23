<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>



<script type="text/javascript">
'use strict';
		var myApp = angular.module('myApp',[]);
	
		myApp.factory('UserService', ['$http', '$q', function($http, $q)
		{
	 
    	return {
         
            updateAddresses: function(item){
            	var target_url = 'http://localhost:8080/cherryonbottom/';
                    return $http.post( target_url + 'flows/updateAddresses/', item)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while sending data');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            
            getaddress : function()
			{
            	var target_url = 'http://localhost:8080/cherryonbottom/';
				return $http.post( target_url + 'REST/getaddress' ).then(
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
	
	///////////////
	
	
	myApp.controller("abc",['$scope', 'UserService' ,function($scope , $UserService)
	{
		$scope.shippingAddress = '';
		$scope.billingAddress = '';
        	
        $scope.UpdateAddresses = function()
        {
        	$scope.data = { "shippingAddress" : $scope.shippingAddress , "billingAddress" : $scope.billingAddress };
        	
        	console.log( $scope.data );
        	
        	$UserService.updateAddresses( JSON.stringify( $scope.data ) )
        	.then
        	(
        			function(response)
        			{
        				console.log(response);
        				$scope.updated = response.status;
        			window.setTimeout(function()
        			{
        	$scope.$apply($scope.updated='');
        			},3000);
        			
        			}
        			
        			,
        			 
     	            function(errResponse)
     	            {
     	            	console.error('Error while Sending Data.');
     	            } 
        	);	
        }
        
        $UserService.getaddress().then(function(response)
        		{
        			console.log(response);
        			$scope.data = response;
        			for (var i = 0; i < $scope.data.length; i++) {
						try {
							$scope.shippingAddress = $scope.data[i].address;
							$scope.billingAddress = $scope.data[i].address;
						} catch (e) {
							console.log(e);
						}
					}
        		},function(errResponse)
        		{
        			console.log('Error fetching Items');
        		});
        
	}]); 
	
</script>







<body background="resources/images/nb1.jpg"  ng-app="myApp" ng-controller="abc">
<c:import url="/head"/>
<div class="container">
<a href="${flowExecutionUrl}&_eventId=BackToCart"
		class="btn btn-danger btn pull-left">Back To Cart</a>

	<a href="${flowExecutionUrl}&_eventId=ViewCompleteOrder"
		class="btn btn-warning btn pull-right" ng-click="UpdateAddresses()" >Confirm Details</a>
</div>
	<hr>	
		
<div class="container">		
<div class="col-md-4 col-md-offset-4">
	
	<div>
	<label>SHIPPING ADDRESS</label><br>
	<textarea rows="4" placeholder="Enter Your Shipping Address" name="n1" id="n1" class="form-control" style="resize: none;" ng-model="shippingAddress"></textarea>
	</div>
	<br>
	
	
	<div>
	<label>BILLING ADDRESS</label><br>
	<!-- <div>
	<input type="checkbox" name="check" onchange='sync()' />&nbsp Same As Above
	</div> -->
	<textarea rows="4" placeholder="Enter your billing Address" name="n2" id="n2" class="form-control" style="resize: none;" ng-model="billingAddress"></textarea>
	</div>
	<br><br>
	<div align="center"><input type="button" value="Update" style="position: absolute;" class="btn btn-warning btn-block" ng-click="UpdateAddresses()" ng-disabled="shippingAddress=='' || billingAddress==''">
	</div><br>
	<br>
	<div align="center">
	 <label class="alert alert-success" style="position: relative; top: 20px; " ng-show="updated=='updated'">Updated</label>
</div>
</div>
</div>
</body>
</html>