<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<c:import url="/head-meta" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
</head>
<body>
	<c:import url="/head" />
	<div class="container">
		<form:form action="addProductToDb" method="post" enctype="multipart/form-data"
			modelAttribute="product">
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
			
		
			<form:input type="text" placeholder="Enter Product Description"
				path="Description" class="form-control" />
			<br />
			<form:input type="text" placeholder="Enter Product Price"
				path="Price" class="form-control" />
				
				<br />
				<form:input type="text" placeholder="Enter Product Name"
				path="ProductName" class="form-control" />
				<br />
				<form:input type="text" placeholder="Enter Product Quantity"
				path="Quantity" class="form-control" />
				<br />
				
				<label class="btn btn-default btn-file">
			   Select Product Image <form:input path="ProductFile" type="file" style="display: none;" id="imageFile" 
			   onchange="filePathDisp()" /> 
			</label><br>
			<span id =file_location>&nbsp</span>
			<script type="text/javascript">
					function filePathDisp() {
							document.getElementById("file_location").innerHTML = $('#imageFile').val();}
			</script> 
					
				
			<input type="submit" value="Submit" class="btn btn-primary">
		
		</form:form>
	</div>
</body>
</html>