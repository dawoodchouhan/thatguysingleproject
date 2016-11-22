<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>

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
<div class="text-center">
<div class="header" >
  <img src="F:\DevOps\DeVops Project\ThatGuy\src\main\webapp\resources\images\header1.png" alt="logo" />

</div>
</div>
<br>
<br>
	<div class="w3">
		
			<ul class="w3-navbar w3-black w3-card-2 w3-medium "
				style="opacity: 0.9">
				<li>  <a class="navbar-brand" href="#"></a><a href="Welcome" class="w3-hover-none"><i
						class="fa fa-home"></i> ThatGuy </a></li>
						<li><a href="Aboutus" class="w3-hover-none"><i class="fa fa-info" aria-hidden="true"></i>
						
						 AboutUs </a></li>
						<li><a href="Contactus" class="w3-hover-none"><i class="fa fa-envelope" aria-hidden="true"></i>
						
						ContactUs </a></li>
				<c:choose>
					<c:when test="${LoggedIn}">

						<li style="float: right"><a href="perform_logout"
							class="w3-hover-none">Logout</i></a></li>
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
						
						<li style="float: right"><a href="login"
							class="w3-hover-none">Login Here<i class="fa fa-sign-in"></i></a></li>
					</c:otherwise>
				</c:choose>
			</ul>

	

