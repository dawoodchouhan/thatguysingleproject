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

</head>
<body>
		
<%@ include file="header.jsp" %>
			
			<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h1 class="text-center">Contact us</h1>
  <h3 class="text-center"><em>we are always here to help</em></h3>

  <div class="row">
    <div class="col-md-4">
     
      <p><span class="glyphicon glyphicon-map-marker"></span>Hyderabad,INDIA</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +91 8297052931</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: dawoodchauhan.93@gmail.com</p>
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
       <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Send Response</button>
      <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Hey!!</h4>
        </div>
        <div class="modal-body">
          <p>ThankYou for Submitting Your Response</p>
        </div>
        <div class="modal-footer">
          <button href="Contactus.jsp" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
     
      </div>
    </div>
  </div>
  <br>
  <br>
  <br>



</body>
</html>