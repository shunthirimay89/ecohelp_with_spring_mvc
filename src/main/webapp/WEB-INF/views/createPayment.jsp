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
<title>Donation Form</title>
<!-- Add Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Add Bootstrap JavaScript and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
<div id="error" style="color:red;">${error}</div>
<div id="imageerror" style="color:red;">${imageerror}</div>
    <form:form action="/EcoHelp/createPayment" method="post" modelAttribute="payment_info" >
		<h2>Donation Form</h2>
		<p>Fill your Donation Info</p>
		<hr>
        <div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<span class="fa fa-user"></span>
					</span>                    
				</div>
				
				<form:input type="text" class="form-control" id="amount"  path="amount" placeholder="Amount" required="required"/>
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-paper-plane"></i>
					</span>                    
				</div>
				<input type="text" class="form-control" value="${bean.getName()}" disabled>
				<form:input type="hidden" path="donateplace_id" value="${bean.getId()}" />
			</div>
        </div>
        <!-- Ui Payment -->
        <div class="form-group">
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">
                    <i class="fa fa-credit-card"></i>
                </span>
            </div>
            <form:select class="form-control" path="paymentmethod_id" id="paymentMethod" name="paymentMethod">
                <option value="" disabled selected>Select Payment Method</option>
                <c:forEach items="${paymentList}" var="payment">
                    <form:option value="${payment.id}" label="${payment.paymentType}"/>
                </c:forEach>
            </form:select>
        </div>
    </div>
		
	<div class="form-group">
    <button type="submit" class="btn btn-primary btn-lg" 
    data-toggle="modal" data-target="#addConfirmationModal">Pay</button>
</div>

<!-- Add Confirmation Modal -->

            <button onclick="goBack()" class="btn btn-secondary col-md-2 ">Go Back</button>
    </form:form>
	
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var addButton = document.getElementById("addButton");

        if (addButton) {
            addButton.addEventListener("click", function (e) {
                var confirmation = confirm("Are you sure you want to add?");

                if (!confirmation) {
                    e.preventDefault(); // Cancel the form submission if not confirmed
                }
            });
        }
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var amountInput = document.getElementById("amount");

        amountInput.addEventListener("input", function () {
            var inputValue = amountInput.value;

            // Check if the input value is "0" or "00"
            if (inputValue === "0" || inputValue === "00") {
                amountInput.setCustomValidity("Amount cannot be 0 or 00");
            } else {
                amountInput.setCustomValidity(""); // Clear the custom validity message
            }
        });
    });
</script>
<script>
	document.getElementById("error").style.display = "block";
	document.getElementById("imageerror").style.display = "block";
	

    function goBack() {
        // Use history object to navigate back
        window.history.back();
    }
	
</script>
</body>
</html>