<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="/head-meta"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
</head>
<body>
<c:import url="/head"/>

	<form:form method="POST" action="${pageContext.request.contextPath}/UpdateProductToDB" modelAttribute="Product">
<div class="container">
		<div style="margin-bottom: 25px; margin-top: 25px" class="col-lg-12">
			<form:select path="ProductCategory" class="form-control">
                    		
                    	<c:choose>
                    	<c:when test="${not empty AllCategories }">
                    	<c:forEach var="cat" items="${AllCategories}">
                    	<form:option value="${cat}"/>
                    	</c:forEach>
                    	</c:when>
                    	
                    	<c:otherwise>
                    	   	<form:option value="None"/>
                    	</c:otherwise>
                    	
                    	</c:choose>
                    		
                    		
                    	</form:select>
             		
			</div>


<form:input type="text" path="Description" class="form-control"/>
<form:input type="text" path="Price" class="form-control"/>
<form:input type="text" path="ProductName" class="form-control"/>
<form:input type="text" path="Quantity" class="form-control"/>
<form:input path="ProductId" type="hidden" />

<br>
  <input type="submit" class="btn btn-success btn-block" value="Update"/>                    
</form:form>
</div>
</body>
</html>