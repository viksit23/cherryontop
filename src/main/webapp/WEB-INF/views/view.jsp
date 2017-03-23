<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detail</title>
<c:import url="/head-meta" />

</head>
	


<body>
	<c:import url="/head" />

	<div class="container-fluid">
	<div class="col-md-4 col-md-offset-4">
	<h3><b>PRODUCT DETAIL</b></h3>
	</div>
		
	</div>
	<hr>

	<div class="container">
		<div class="col-md-6">
			<img
					src="${pageContext.request.contextPath}/${ProductImg}" width="100%"
					class="img img-responsive img-thumbnail"></img>
		</div>
		
		<div class="col-md-6">
			<div><span style="font-size:25px"><strong>${ProductName}</strong></span></div>
			<hr>
			<div><span class="badge">&nbsp${ProductCategory}&nbsp</span><br>
		
			
			</div><br>
			
			
			<br>
			
			<div>${ProductDescription} </div><br>
			<div><span style="font-size:20px" class="text-warning"><strong>&#8377  ${ProductPrice}</strong></span></div>
			<br>
			
			<% if (!request.isUserInRole("ADMIN")) {    %>
        
        	<form action="${pageContext.request.contextPath}/addToCart" method="post">
        		<input type="hidden" value="${ProductId}" name="ProductId" />
				<div>
				<b>Quantity :</b>
				<input type="number" value="1" min="1" max="10"
						name="pqty"   />
				</div>
				<input type="submit" value="Add To Cart"
						class="btn btn-warning btn-lg" />
				
        	</form>

				
				
		</div>
		
		
		
		
		<%
}
%>
</div>

</body>
</html>