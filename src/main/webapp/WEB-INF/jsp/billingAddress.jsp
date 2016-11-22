<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div class="container">
	<form:form class="form-horizontal" role="form" 
		commandName="billingAddress">
		<%-- method="post" action="shippingAddress"> --%>
		<h2>Please fill the Billing Address</h2>

		<div class="form-group">
			<form:label for="fullName" path="fullName"
				class="col-sm-3 control-label">Full Name</form:label>
			<div class="col-sm-9">
				<form:input path="fullName" type="text" id="fullName"
					placeholder="eg: Akshay Jala" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<form:label path="addressLine" for="addressLine"
				class="col-sm-3 control-label">Address Line</form:label>
			<div class="col-sm-9">
				<form:input path="addressLine" type="text" id="addressLine"
					placeholder="Address Line" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<form:label path="city_Town" for="city_Town"
				class="col-sm-3 control-label">City/ Town</form:label>
			<div class="col-sm-9">
				<form:input path="city_Town" type="text" id="city_Town"
					placeholder="City/Town" class="form-control" />
			</div>
		</div>


		<div class="form-group">
			<form:label for="state_Province_RegionNumber"
				path="state_Province_RegionNumber" class="col-sm-3 control-label">State/ Province/ Region No</form:label>
			<div class="col-sm-9">
				<form:input type="text" id="state_Province_RegionNumber"
					path="state_Province_RegionNumber"
					placeholder="State / Province / Region
					" class="form-control" />
			</div>
		</div>


		<div class="form-group">
			<form:label for="zip_PostalCode" path="zip_PostalCode"
				class="col-sm-3 control-label">Zip/ Postal Code</form:label>
			<div class="col-sm-9">
				<form:input type="text" id="Zip/Postal Code" path="zip_PostalCode"
					class="form-control" placeholder="Zip / Postal Code" />
			</div>
		</div>
		<div class="form-group">
			<form:label for="country" path="country"
				class="col-sm-3 control-label">Country</form:label>
			<div class="col-sm-9">
				<form:input type="text" id="country" path="country"
					placeholder="Country" 
					 class="form-control" />
			</div>
		</div>


		<!-- /.form-group -->
		<div class="form-group">
			<div class="col-sm-9 col-sm-offset-3">
				<input type="submit" name="_eventId_submitBillingAddress"
					value="save" class="btn btn-primary btn-block">
			</div>
		</div>

	</form:form>
</div>

<!-- ./container -->


