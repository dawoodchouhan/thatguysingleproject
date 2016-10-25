<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
   body {
  
background:url('http://www.fondsecran.eu/pictures/2015/0908/1/blurred-greenish-background-4k-wallpapers-234758.jpg');

  margin:0px;
  
   background-repeat:no-repeat;

   background-size:cover;
  
font-family: 'Ubuntu', sans-serif;

}
ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.menu {
	display: flex;
	justify-content: space-around;
}

li {
	hover: none;
}
ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.menu {
	display: flex;
	justify-content: space-around;
}

li {
	hover: none;
}

.container{
height:450px;
}
</style>
<meta charset="ISO-8859-1">
<title>ThatGuy</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="w3-top">
		<nav>
			<ul class="w3-navbar w3-red w3-card-2 w3-medium "
				style="opacity: 0.9">
				<li><a href="Welcome" class="w3-hover-none"><i
						class="fa fa-home"></i> ThatGuy </a></li>
						<li><a href="Aboutus" class="w3-hover-none">
						 AboutUs </a></li>
						<li><a href="Contactus" class="w3-hover-none">
					ContactUs </a></li>
				<c:choose>
					<c:when test="${LoggedIn}">

						<li style="float: right"><a href="perform_logout"
							class="w3-hover-none"><i class="fa fa-sign-out"></i></a></li>
						<c:choose>
							<c:when test="${!Administrator}">
								<li style="float: right"><a href="viewcart"
									class="w3-hover-none"><i class="fa fa-shopping-cart"></i>(${cartsize})</a></li>
							</c:when>
						</c:choose>

						<li style="float: right"><a href="#" class="w3-hover-none"><i
								class="fa fa-user"></i> Hi, ${name}</a></li>
					</c:when>

					<c:otherwise>
						<!-- <li style="float: right"><a href="Register"
							class="w3-hover-none"><i class="fa fa-user-plus"></i></a></li> -->
						<li style="float: right"><a href="login"
							class="w3-hover-none"><i class="fa fa-sign-in"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>

	



<div class="container">
 <h2 class="text-center"><strong>About Us</strong></h2>  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Our Journey</a></li>
    <li><a data-toggle="tab" href="#menu1">Our Moto</a></li>
    <li><a data-toggle="tab" href="#menu2">Founder</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h1>How We Started</h1>
      <h3>Every Fashion store in more dedicated towars the female stuff's. But we decided to roll the dices and set <strong><em>ThatGuy</em></strong> which is completely dedicated on fashion accessories for Guys</h3>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h1>Customer Satisfaction</h1>
      <h3>We work hard to keep our customer happy. We are always here for help</h3>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h2><em>MD Dawood Ibrahim</em>,Founder</h2>
      <h3>The creater of <strong><em>ThatGuy</em></strong> which is completely for guys. </h3>
     </div>
     
  </div>
  </div>
<!-- 	importing footer  -->


</body>
</html>