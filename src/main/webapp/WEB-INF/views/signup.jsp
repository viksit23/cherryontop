<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>

<script type="text/javascript">

	var myapp = angular.module("myApp",[]);
	
	myapp.controller("myCtrl",function($scope){
		
		$scope.overAllError = true;
		$scope.checkOverallError = function()
		{
			/* console.log($scope.emailError  );
			console.log($scope.phoneError  );
			console.log( $scope.emailError || $scope.phoneError );  */
			$scope.overAllError = ( $scope.emailError || !$scope.emailTouched || $scope.phoneError || !$scope.phoneTouched || $scope.passwordError);
		}
		
		$scope.email = '';
		$scope.emailError = false;
		$scope.emailTouched = false;
		$scope.CheckEmail = function()
		{
			$scope.emailTouched = true;
			var patt = /\S+@\S+\.\S+/;
			$scope.emailError = !patt.test($scope.email);
			$scope.checkOverallError();
		}
		
		$scope.phone = '';
		$scope.phoneError = false;
		$scope.phoneTouched = false;
		$scope.CheckPhone = function()
		{
			$scope.phoneTouched = true;
			var patt = /^[7-9][0-9]{9}$/;
			$scope.phoneError = !patt.test($scope.phone);
			$scope.checkOverallError();
			
		}
		$scope.password='';
		$scope.CheckPassword = function()
		
		{
			var patt=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			$scope.passwordError = !patt.test($scope.password);
			$scope.checkOverallError();
		}
		
		
		
		
	});

</script>

<body background="resources/images/su.jpg" ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head"/>

     
        <div class="register"></div>
       <center><h3>Create Your Account</h3></center>
         
          <div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
     
   
<form:form role="form" action="AddUserToDB" method="post" modelAttribute="User">
<label for="text" required>User Name:</label>
<form:input type="text" placeholder="Enter User Name"
				path="uName" class="form-control" required="required" />
        <label for="email">User Email:</label>   
 <form:input type="email" placeholder="Enter User Email"
				path="uEmail" class="form-control" required="required" ng-model="email" ng-change="CheckEmail()"/>
				
				<label class="text text-danger" ng-show="emailError">Incorrect Email</label>
				<br>
				
				
				
		<c:if test="${not empty passwordmismatch}">
			<p class="alert alert-danger" ><b>OOPS!</b>&nbsp Password Does't Match</p>
		</c:if>

		<c:if test="${not empty useralreadyexists}">	
			<p class="alert alert-danger"><b>OOPS!</b>&nbsp Username Already Exists</p>			
		</c:if>

		<c:if test="${not empty success}">			
			<p class="alert alert-success"><b>GREAT</b>&nbsp Account Created Successfully</p>			
		</c:if>
				
				
				<label for="text">User Password:</label>
<form:input type="password" placeholder="Enter User Password"
				path="uPassword" class="form-control" required="required" ng-model="password" ng-change="CheckPassword()" />
				<label for="text">Confirm Password:</label>
<form:input type="password" placeholder="Confirm Password"
				path="uCPassword" class="form-control" required="required"/>				
<label for="text">User Address:</label>
<form:input type="text" placeholder="Enter Address"
				path="uAddress" class="form-control" required="required"/>				
				
 <label for="text">User Phone Number:</label>
<form:input type="text" placeholder="Enter User Number"
				path="uPhone" class="form-control" ng-model="phone" ng-change="CheckPhone()" />
            
            <label class="text text-danger" ng-show="phoneError">Incorrect Phone Number</label>
				
              <br>
              <br>
              <input type="submit" value="Create Account" id="create-account" class="btn btn-success" ng-disabled="overAllError"/>
          </div>
          </div>
 </form:form>
</body>
</html>