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

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: 0 auto;
}

footer {
	background:  #7F7F7F;
	width: 100%;
	overflow: hidden;
	opacity: 0.90;
}

footer p, footer h3 {
	color: #7F7F7F;
}

footer p a {
	color: #7F7F7F;
	text-decoration: none;
}

ul.social li {
	display: inline;
}

ul.social li img {
	height: 30px;
}

footer.second {
	border-top: 1px solid #4D4E50;
	background-color:  	#000000;
	max-height: 30px;
	text-align: center;
	opacity: 0.90;
}
</style>
<meta charset="ISO-8859-1">
<title>ThatGuy</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/demo.css" />" rel="stylesheet">
<link
	href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/registers.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/logins.css" />"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

	
			<c:choose>	
		<c:when test="${!Administrator}">	
			<!-- Category List -->
			<c:if test="${!empty categoryList}">
				<div>
					<ul
						class="w3-navbar w3-gray w3-round w3-small menu w3-card-4 "
						Style="width: 70%; margin-left: 15%; margin-top:-2px;">
						<c:forEach items="${categoryList}" var="category">
							<li><a href="view/${category.id}" class="w3-hover-none"><i class="fa fa-list-alt" aria-hidden="true"></i> ${category.name}</a></li>
						</c:forEach>
						
					</ul>
				</div>
			</c:if>	
		</c:when>	
				
			<c:when test="${Administrator}">
					<ul
						class="w3-navbar w3-light-grey w3-round w3-small menu w3-card-4 "
						Style="width: 100%;">
						<!-- 		<li><a href="Report" class="w3-hover-none"><i
								class="fa fa-cog fa-spin  fa-fw"></i> <span class="sr-only">Loading...</span>
								Recent Order</a></li> -->
						<li><a href="product" class="w3-hover-none"><i
								class="fa fa-list   fa-fw"></i> <span class="sr-only">Loading...</span>
								Products</a></li>
						<li><a href="category" class="w3-hover-none"><i
								class="fa fa-list  fa-fw"></i> <span class="sr-only">Loading...</span>
								Category</a></li>
						<li><a href="supplier" class="w3-hover-none"><i
								class="fa fa-list  fa-fw"></i> <span class="sr-only">Loading...</span>
								Supplier</a></li>
					</ul>
				</c:when>
			</c:choose>
		</nav>
			
	</div>
	<c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/jsp/cart.jsp">
			</c:import>
		</c:when>
		<c:when test="${IndividualItemClicked}">
			<c:import url="/WEB-INF/jsp/IndividualItem.jsp">
			</c:import>
		</c:when>

		<c:when test="${IfPaymentClicked}">
			<c:import url="/WEB-INF/jsp/Payment.jsp">
			</c:import>
		</c:when>
	</c:choose>
	<!-- Category List End -->
	<c:choose>
		<c:when test="${IfLoginClicked}">
			<c:import url="/WEB-INF/jsp/logins.jsp">
			</c:import>
		</c:when>

		<c:when test="${IfRegisterClicked}">
			<c:import url="/WEB-INF/jsp/logins.jsp">
			</c:import>
		</c:when>
		<c:when test="${ViewCategoryClicked}">
			<c:import url="/WEB-INF/jsp/viewitem.jsp">
			</c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${ProductPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${CategoryPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminCategory.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${SupplierPageClicked}">
			<c:import url="/WEB-INF/jsp/AdminSupplier.jsp"></c:import>
		</c:when>
	</c:choose>

	<!-- carousel -->
	<c:choose>
		<c:when test="${!Administrator}">
			<c:if test="${empty HideOthers}">
				<div>
					<div id="carousel-home" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li class=" item1 active"></li>
							<li class="item2"></li>
							<li class="item3"></li>
							<li class="item4"></li>
							<li class="item5"></li>
							<li class="item6"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img
									src="<c:url value="F:/DevOps/DeVops Project/ThatGuy/src/main/webapp/resources/images/corousel/hat.jpeg"></c:url>"
									alt="Hat">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item ">
								<img
									src="<c:url value="F:/DevOps/DeVops Project/ThatGuy/src/main/webapp/resources/images/corousel/watch.jpeg"></c:url>"
									alt="Watch">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="F:/DevOps/DeVops Project/ThatGuy/src/main/webapp/resources/images/corousel/sunglasses.jpeg"></c:url>"
									alt="Sunglasses">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="F:/DevOps/DeVops Project/ThatGuy/src/main/webapp/resources/images/corousel/shoe.jpeg"></c:url>"
									alt="Shoe">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="F:/DevOps/DeVops Project/ThatGuy/src/main/webapp/resources/images/corousel/belt.jpeg"></c:url>"
									alt="Belt">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
							<div class="item">
								<img
									src="<c:url value="F:/DevOps/DeVops Project/ThatGuy/src/main/webapp/resources/images/corousel/tie.jpeg"></c:url>"
									alt="Tie">
								<div class="carousel-caption">
									<span></span>
								</div>
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" role="button"
							href="#carousel-home" style="color: black"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control " href="#carousel-home"
							role="button" style="color: black"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</c:if>
		</c:when>
	</c:choose>
	<!-- Corousel End -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:if test="${empty HideOthers}">
	
	<div class="class-distributed w3-card-1 w3-white w3-margin-0"></div>
		<div class="row  w1-red " style="padding-left: 40px; opacity: 0.1">
			<h5>NEW in Stock</h5>
		</div> 
		<c:choose>
			<c:when test="${!Administrator}">
				<c:if test="${!empty productList6}">
					<div>
						<!-- <ul> -->
						<div class="row w3-card-8 "
							style="padding-top: 20px; padding-botton: 20px; padding-left: 20px; padding-bottom: 20px;">
							
			<!--  			<div class="text-center col-md-6">
							
						
							<c:forEach items="${productList6}" var="product">
								<div class="col-xs-2 ">
									<div class="img">
										<img height="192px" width="192px" alt="${product.id}"
											src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>">
										<div class="desc">
											<p>
												${product.name}<br> <i class="fa fa-inr"
													aria-hidden="true"></i> ${product.price}
												
											</p>

										</div>
									</div>
								</div>
								</c:forEach>-->	
								
								
								
								
							<div class="row">


			<%-- 	<c:forEach items="${products}" var="product"> --%>
			<%-- onclick="myhref('${contextPath}/productDetail/{{product.product.productId}}')" --%>
			<c:forEach items="${productList6}" var="product">
								<div class="col-xs-2 ">
			
			
				<img alt="${product.id}" src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>"
					class="img-rounded img-thumbnail"
					alt="${product.name}"
					title="${product.name }$"
					style="height: 120px; width: 170px;" />
					<div class="desc">
											<p>
												${product.name}<br> <i class="fa fa-inr"
													aria-hidden="true"></i></p>
				<p class="pricePara">
					<b><span class="fa fa-inr"></span> ${product.price}</b>
				</p>
			<c:choose>
								<c:when test="${LoggedIn}">
									<form action="addtoCart/${userId}/${product.id}">
										<input type="number" value="1" name="quantity"
											class=" form-control  btn-block  "> 
											<br><input
											type="submit" value="Add to Cart"
											class="btn btn-xs btn-danger btn-block">
									</form>
								</c:when>
							</c:choose>
</div>
</div>
</c:forEach>
</div>
								
		
		
		
		
		
		
		
		
		
		
		
		
		
		
								</div>
						</div>
						
				</c:if>
			</c:when>
		</c:choose>
	</c:if>
</div>

<footer class="footer-distributed w3-card-2 w3-black w3-margin-0"
		style="opacity: 0.4">
		<div class="footer-left">
			<h4>
				<b>ThatGuy</b>
			</h4>
		
		</div>
		<div class="footer-center">
			Join us here
			<ul class="social">
				<a href="https://www.facebook.com/"><img
						src="http://www.w3newbie.com/wp-content/uploads/facebook.png" /></a>
				<a href="https://www.youtube.com/"><img
						src="http://www.w3newbie.com/wp-content/uploads/youtube.png" /></a>
				<a href="https://www.twitter.com/"><img
						src="http://www.w3newbie.com/wp-content/uploads/twitter.png" /></a>
			</ul>
		</div>
		

		<div class="footer-right">
			<p class="footer-company-about">
				
			<p>
				ThatGuy <i class="fa fa-copyright" aria-hidden="true">
					@copyrights reserved</i>
			</p>
			  <ul class="bank_list">
                    <div class="bank_item"><a href="#" class="bank_link"><img alt="" src="resources/i/visa.svg" class="bank_i"/></a></div>
                    <div class="bank_item"><a href="#" class="bank_link"><img alt="" src="resources/i/mastercard.svg" class="bank_i"/></a></div>
                    <div class="bank_item"><a href="#" class="bank_link"><img alt="" src="resources/i/paypal.svg" class="bank_i"/></a></div>
                  </ul>
			

		</div>
	</footer> 
	
	
	
	

	
	
	
	
	
	
	<script>
		$(document).ready(function() {
			// Activate Carousel
			$("#carousel-home").carousel();
			// Enable Carousel Indicators
			$(".item1").click(function() {
				$("#carousel-home").carousel(0);
			});
			$(".item2").click(function() {
				$("#carousel-home").carousel(1);
			});
			$(".item3").click(function() {
				$("#carousel-home").carousel(2);
			});
			$(".item4").click(function() {
				$("#carousel-home").carousel(3);
			});
			$(".item5").click(function() {
				$("#carousel-home").carousel(4);
			});
			$(".item6").click(function() {
				$("#carousel-home").carousel(5);
			});
			// Enable Carousel Controls
			$(".left").click(function() {
				$("#carousel-home").carousel("prev");
			});
			$(".right").click(function() {
				$("#carousel-home").carousel("next");
			});
		});
	</script>
	<!-- Carousel Script End  -->


</body>
</html>