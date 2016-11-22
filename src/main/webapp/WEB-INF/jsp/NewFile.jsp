
	<div class="row">

		<div
			ng-repeat="product in listOfProducts | filter : searchProduct">

			<%-- 	<c:forEach items="${products}" var="product"> --%>
			<%-- onclick="myhref('${contextPath}/productDetail/{{product.product.productId}}')" --%>
			<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 productDiv">
			
				<img alt="${product.id}" src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>"
					class="img-rounded img-thumbnail"
					alt="{{product.name}}"
					title="{{product.name }}"
					style="height: 120px; width: 170px;" />
				<p class="pricePara">
					<b><span class="fa fa-inr"></span> {product.price}</b>
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
