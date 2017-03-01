
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>


<c:import url="/head-meta"/>
  
  
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
</head>
<body>
<c:import url="/head"/>
<marquee> <font face="verdana" color="red">Midnight Same day Delivery - Lowest Price - 100% Secured Transactions - Delivery to 250 cities & towns within India - Deliveries on Sunday & Public Holiday - Cash On Delivery Available</font></marquee><div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/images/2.jpg" alt="Chania" width="460" height="345">
      </div>

      <div class="item">
        <img src="resources/images/3.jpg" alt="Chania" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="resources/images/4.jpg" alt="Flower" width="460" height="345">
      </div>

      <div class="item">
        <img src="resources/images/5.jpg" alt="Flower" width="460" height="345">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="conatiner">
<table class="table">
<thread>
<tr><tbody>
<td>
<figure>
<img src="resources/images/image2.jpg" class="img-thumbnail" alt="Cinque Terre" width="200" height="200">
<figcaption><a href="see more">see more</a></figcaption></figure>
</td>
<td><figure>
<img src="resources/images/image1.jpg" class="img-thumbnail" alt="Cinque Terre" width="200" height="200">
<figcaption><a href="see more">see more</a></figcaption></figure>
</td>
<td><figure>
<img src="resources/images/image2.jpg" class="img-thumbnail" alt="Cinque Terre" width="200" height="200">
<figcaption><a href="see more">see more</a></figcaption></figure></td>
<td><figure>
<img src="resources/images/image1.jpg" class="img-thumbnail" alt="Cinque Terre" width="200" height="200">
<figcaption><a href="see more">see more</a></figcaption></figure></td>
</tr></tbody>
</thread>
</table>
</div>
</body>
</html>

    