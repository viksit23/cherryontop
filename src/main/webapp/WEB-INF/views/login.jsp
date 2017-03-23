<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>



</head>
<body background="resources/images/lg.jpg">


<c:import url="/head"/>

<c:if test="${param.error != null}">
				<p class="alert alert-danger">
					<span>Invalid Username or password.</span>
				</p>
			</c:if>
			<c:if test="${param.logout != null}">
				<p class="alert alert-success">
					<span>You have been logged out successfully.</span>
				</p>
			</c:if>



<div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
	
		<form action="login" method="post" class="form-horizontal" role="form">



<center><h2><font color="white">Login Form</font></h2></center>
 <label for="text"><font color="white">User Name:</font></label>
<input type="text" placeholder="Enter User Name"
				name="Username" class="form-control" />
<label for="text"><font color="white">User Password:</font></label>
<input type="password" placeholder="Enter User Password"
				name="Password" class="form-control" />   
  <!--   <input type="checkbox" checked="checked"> <font color="white">Remember me</font> -->
    <br>
    <button type="submit" class="btn btn-success btn-block">Login</button>
   <!--  <button type="button" class="cancelbtn">Cancel</button> -->
    <!-- <a href="#">Forgot Password</a></span> -->

</div>
</div>
</form>
</body>
</html>