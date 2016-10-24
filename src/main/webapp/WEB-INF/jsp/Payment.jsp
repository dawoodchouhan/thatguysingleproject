
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/pay.css" />" rel="stylesheet">
<title>Payment Details</title>
</head>
<body>
<div class="pay">.
<div class="form">
<h1>Payment</h1>
<h1>select Payment type </h1>

<form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="method">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
        Cash On Delivery<input type="radio" name="method" value="cod"><br>
       Credit/Debit Card <input type="radio" name="method" value="card"><br>
      <button value="Proceed">Proceed</button>
      <!-- <input type="submit" value="Proceed"> -->
        </form>
        </div>
</div>
</body>
</html>
