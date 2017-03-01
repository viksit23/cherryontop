<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Category</title>
</head>
<body>
	<c:import url="/head" />
	<div class="container">
		<form:form action="addCategoryToDb" method="post"
			modelAttribute="category">
			<form:input type="text" placeholder="Enter Category"
				path="CategoryName" class="form-control" />
			<br />
			<input type="submit" value="Submit" class="btn btn-primary">
		</form:form>
	</div>
</body>
</html>