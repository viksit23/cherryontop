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
<body background="resources/images/lg4.jpg">
<c:import url="/head"/>
<center><h2>Login Form</h2></center>
 <label for="text">User Name:</label>
<input type="text" placeholder="Enter User Name"
				path="uName" class="form-control" />
<label for="text">User Password:</label>
<input type="password" placeholder="Enter User Password"
				path="uPassword" class="form-control" />   
    <input type="checkbox" checked="checked"> Remember me
    <br>
    <button type="submit">Login</button>
    <button type="button" class="cancelbtn">Cancel</button>
    <a href="#">Forgot Password</a></span>

</form>
</body>
</html>