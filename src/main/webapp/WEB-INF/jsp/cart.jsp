<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/cart.css" />" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body> <!-- style="padding-top: 70px"> -->


<br>
<br>
<br>
<br>
<br>
<br>
	<div id="cart">
		<div class="container" width="70%">
			<div class="row">
				<div class="col-xs-2"></div>
				<div class="col-xs-8">
					<div class="panel panel-primary ">
						<div class="panel-heading">
							<div class="panel-title">
								<div class="row">
									<div class="col-xs-6">
										<h4 style="color: white">
											<span class="glyphicon glyphicon-shopping-cart"></span>
											Your Cart
										</h4>
									</div>
									<div class="col-xs-3"></div>
									<div class="col-xs-3">
										<h5 style="color: white">
											<a href="#" class="btn btn-success btn-block ">your
												Orders</a>
										</h5>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">

							<div class="row">
								<div class="col-xs-5">
									<label><font size="3">Product Details</font></label>
								</div>
								
								<div class="col-xs-2 ">
									<label><font size="3"> Total Price</font></label>
								</div>

								<div class="col-xs-4">
									<div class="col-xs-6">
										<label><font size="3">Quantity</font></label>
									</div>
									<div class="col-xs-6">
										<label><font size="3">Update</font></label>
									</div>
								</div>
								<div class="col-xs-1">
									<a href="#"><span
										class="glyphicon glyphicon-trash"> </span></a>
								</div>
							</div>
							<hr>
							<c:if test="${!empty EmptyCart}">
								<div
									style="display: table-cell; vertical-align: middle; text-align: center">
									<img width="50%" alt="Empty Cart"
										src="<c:url value="/resources/images/emptycart.jpg"></c:url>">
								</div>
							</c:if>
							<c:if test="${!empty CartList}">
								<c:forEach items="${CartList}" var="cart">
									<div class="row" >
										<div class="col-xs-5">
										<div class="col-xs-6">
										<a href="IndividualItem/${cart.productid}">
											<img height="72px" width="72px"  alt="${cart.productid}"
											src="<c:url value="/resources/images/product/${cart.productid}.jpg"></c:url>">
											</a>
										</div>
										<div class="col-xs-6" style="padding-top: 22px" >
											<label><font size="5">${cart.productname}</font></label>
										</div>
										</div>
									
										<div class="col-xs-2 text-right" style="padding-top: 22px">
											<label><font size="4">Rs.${cart.price}</font></label>
										</div>

										<div class="col-xs-4" style="padding-top: 22px">
											<form action="editorder/${cart.id}">
												<div class="col-xs-6">
													<input type="text" class="form-control input-sm"
														value="${cart.quantity}" name="quantity">
												</div>
												<div class="col-xs-6" >
													<button type="submit"
														class="btn btn-default btn-sm btn-block"><font size="2"><b>U
														</b></font></button>
												</div>

											</form>
										</div>
										<div class="col-xs-1" style="padding-top: 22px">
											<a href="deleteitem/${cart.id}"><span
												class="glyphicon glyphicon-trash"> </span></a>
										</div>
									</div>
									<hr>
								</c:forEach>
							</c:if>
						</div>
						<div class="panel-footer">
							<div class="row text-center">
								<div class="col-xs-3">
									<a href="Welcomepage" class="btn btn-primary btn-sm btn-block">Shop More</a>
								</div>
								<c:if test="${empty EmptyCart}">
								<div class="col-xs-6">
									<h3 class="text-right">Total : Rs ${CartPrice}</h3>
								</div>
								<form action="placeorder">
								
									<div class="col-xs-3">
										 <a class="btn btn-md btn-success" style="text-decoration: none"
							href="/viewcart/checkout">Checkout</a>
									</div>
									
								</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  -->
	
</body>
</html>