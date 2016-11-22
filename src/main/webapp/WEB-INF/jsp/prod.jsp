<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.products {
  display: flex;
  flex-wrap: wrap;
}
.products {
  display: flex;
  flex-wrap: wrap;
}

.product-card {
  padding: 2%;
  flex-grow: 1;
  flex-basis: 16%;

  display: flex; /* so child elements can use flexbox stuff too! */
}

.product-card {
  flex: 1 16%;
}
.product-image img {
  max-width: 100%;
}

.product-info {
  margin-top: auto;
  text-align: center;
}


@media (max-width: 920px) {
  .product-card {
    flex: 1 21%;
  }
}

@media (max-width: 600px) {
  .product-card {
    flex: 1 46%;
  }
}

@media (max-width: 480px) {
  .product-filter {
    flex-direction: column;
  }
}
@media (max-width: 480px) {
  .product-filter {
    flex-direction: column;
  }
  .sort {
    align-self: flex-start;
  }
}
</style>
</head>
<body>
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
							
			



<section class="products">
<c:forEach items="${productList6}" var="product">
  <div class="product-card">
    <div class="product-image">
      <img alt="${product.id}" src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>"
					class="img-rounded img-thumbnail"
					alt="${product.name}"
					title="${product.name }"style="height: 120px; width: 170px;">
    
    <div class="product-info">
      <h3>${product.name}</h3>
      <p class="pricePara">
					<b>
      <h4><span class="fa fa-inr">${product.price}</span></h4></b></p>
      </div>
      <c:choose>
								<c:when test="${LoggedIn}">
									<form action="addtoCart/${userId}/${product.id}">
								
											<br>
											<input type="number" value="1" name="quantity"
											class=" form-control  btn-block  "><input
											type="submit" value="Add to Cart"
											class="btn btn-xs btn-danger btn-block">
									</form>
								</c:when>
							</c:choose>
							</div>
							</div>
							</c:forEach>
							</section>
							
      
  </div></div></c:if></c:when></c:choose></c:if>
</body>
</html>