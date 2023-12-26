<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>Add NewPlace</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #fff;
	background: #19aa8d;
	font-family: 'Roboto', sans-serif;
}
.form-control {
	font-size: 15px;
}
.form-control, .form-control:focus, .input-group-text {
	border-color: #e1e1e1;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 400px;
	margin: 0 auto;
	padding: 30px 0;		
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form h2 {
	color: #333;
	font-weight: bold;
	margin-top: 0;
}
.signup-form hr {
	margin: 0 -30px 20px;
}
.signup-form .form-group {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 15px;
}
.signup-form .form-control {
	min-height: 38px;
	box-shadow: none !important;
}	
.signup-form .input-group-addon {
	max-width: 42px;
	text-align: center;
}	
.signup-form .btn, .signup-form .btn:active {        
	font-size: 16px;
	font-weight: bold;
	background: #19aa8d !important;
	border: none;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #179b81 !important;
}
.signup-form a {
	color: #fff;	
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #19aa8d;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}
.signup-form .fa {
	font-size: 21px;
}
.signup-form .fa-paper-plane {
	font-size: 18px;
}
.signup-form .fa-check {
	color: #fff;
	left: 17px;
	top: 18px;
	font-size: 7px;
	position: absolute;
}
</style>
</head>
<body>
<div class="signup-form">
    <form:form action="/EcoHelp/updateplace" method="post" modelAttribute="donate_info" enctype="multipart/form-data">
		<h2>Update Place</h2>
		<p>Update PlaceInfo</p>
		<hr>
		 <div class="form-group">
				<form:input type="hidden" class="form-control"  path="id" placeholder="Id" required="required"/>
        </div> 
        <div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<span class="fa fa-user"></span>
					</span>                    
				</div>
				<form:input type="text" class="form-control"  path="name" placeholder="Username" required="required"/>
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-paper-plane"></i>
					</span>                    
				</div>
				<form:input type="file" class="form-control"  path="file" placeholder="Photo"/>
			</div>
        </div>
		   <div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-envelope"></i>
					</span>                    
				</div>
				<form:input type="text" class="form-control"  path="description" placeholder="description" required="required"/>
			</div>
        </div> 
        				<form:input type="hidden" class="form-control"  path="imagePath"/>
        
	<!--  	<div class="form-group">
            <label for="category">Category</label>
            <form:select id="category" path="donatesector_id">
                <c:forEach items="${list}" var="sector" >
                    <form:option value="${sector.id}" label="${sector.name}"/>
                </c:forEach>
            </form:select>
        </div>-->
        <!-- Ui Payment -->
        <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <i class="fa fa-credit-card"></i>
                </span>
            </div>
            <form:select class="form-control" path="donatesector_id" id="category" name="paymentMethod">
                <option value="" disabled selected>Select Category</option>
                <c:forEach items="${list}" var="sector">
                    <form:option value="${sector.id}" label="${sector.name}"/>
                </c:forEach>
            </form:select>
        </div>
    </div>
		
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg">Add</button>
        </div>
        <button type="button" class="btn btn-secondary col-md-2 " onclick="location.href = '/EcoHelp/displayplace';">
                Back
            </button>
    </form:form>
	
</div>
</body>
</html>