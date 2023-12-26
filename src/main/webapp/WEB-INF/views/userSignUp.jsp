
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Animated Login Form</title>
<link rel="stylesheet" type="text/css" href="style1.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	overflow: auto;
}

.wave {
	position: fixed;
	bottom: 0;
	left: 0;
	height: 100%;
	z-index: -1;
}

.container {
	width: 100vw;
	height: 100vh;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	grid-gap: 7rem;
	padding: 0 2rem;
}

.img {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.login-content {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	text-align: center;
}

.img img {
	width: 500px;
}

form {
	width: 360px;
}

.login-content img {
	height: 100px;
}

.login-content h2 {
	margin: 15px 0;
	color: #333;
	text-transform: uppercase;
	font-size: 2.9rem;
}

.login-content .input-div {
	position: relative;
	display: grid;
	grid-template-columns: 7% 93%;
	margin: 25px 0;
	padding: 5px 0;
	border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one {
	margin-top: 0;
}

.i {
	color: #d9d9d9;
	display: flex;
	justify-content: center;
	align-items: center;
}

.i i {
	transition: .3s;
}

.input-div>div {
	position: relative;
	height: 45px;
}

.input-div>div>h5 {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 18px;
	transition: .3s;
}

.input-div:before, .input-div:after {
	content: '';
	position: absolute;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background-color: #38d39f;
	transition: .4s;
}

.input-div:before {
	right: 50%;
}

.input-div:after {
	left: 50%;
}

.input-div.focus:before, .input-div.focus:after {
	width: 50%;
}

.input-div.focus>div>h5 {
	top: -5px;
	font-size: 15px;
}

.input-div.focus>.i>i {
	color: #38d39f;
}

.input-div>div>input {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: none;
	outline: none;
	background: none;
	padding: 0.5rem 0.7rem;
	font-size: 1.2rem;
	color: #555;
	font-family: 'poppins', sans-serif;
}

.input-div.pass {
	margin-bottom: 4px;
}

a {
	display: block;
	text-align: right;
	text-decoration: none;
	color: #999;
	font-size: 0.9rem;
	transition: .3s;
}

a:hover {
	color: #38d39f;
}

.btn-container {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.btn {
	flex: 1;
	min-width: 150px;
	height: 50px;
	border-radius: 25px;
	outline: none;
	border: none;
	background-image: linear-gradient(to right, #32be8f, #38d39f, #32be8f);
	background-size: 200%;
	font-size: 1.2rem;
	color: #fff;
	font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	margin: 1rem 0;
	cursor: pointer;
	transition: .5s;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
}

.btn:hover {
	background-position: right;
}
#message{
	color : red;
}
@media screen and (max-width: 1050px) {
	.container {
		grid-gap: 5rem;
	}
}

@media screen and (max-width: 1000px) {
	form {
		width: 290px;
	}
	.login-content h2 {
		font-size: 2.4rem;
		margin: 8px 0;
	}
	.img img {
		width: 400px;
	}
}

@media screen and (max-width: 900px) {
	.container {
		grid-template-columns: 1fr;
	}
	.img {
		display: none;
	}
	.wave {
		display: none;
	}
	.login-content {
		justify-content: center;
	}
}
</style>
<body>
	<img class="wave" src="">
	<div class="container">
		<div class="img">
			<img src="img/Agreement-bro.png">
		</div>
		<div class="login-content">
			<form:form class="login-form" action="/EcoHelp/Register"
				method="post" modelAttribute="user_info" id="registration-form" onsubmit="return validatePassword();">
				<img
					src="img/0-02-06-5d90663339016f0ad348704997052e5dc8426a3b1a0e2200e68615e99d3a92d3_9ec7e04483ba2e07.jpg">
				<h2 class="title">Please Sign Up</h2>
				<div style="color: red;">${error}</div>
				<div style="color: red;">${emailerror}</div>
				<div style="color: red;">${inserterror}</div>
				<div style="color: red;">${existerror}</div>
				<div style="color: red;">${nameerror}</div>
				<div style="color: red;">${nameError}</div>
				<div style="color: red;">${emailError}</div>

				<div style="display: none;">
					<form:input type="text" path="id" />
				</div>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user-circle"></i>
					</div>
					<div class="div">
						<form:input id="name" type="text" class="login-input" path="name"
							name="name" placeholder="User" />

					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-envelope"></i>
					</div>
					<div class="div">

						<form:input id="email" type="email" class="login-input"
							path="email" name="email" placeholder="Email" />

					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">

						<form:input id="password" type="password" class="login-input"
							path="password" name="password" placeholder="Enter your password" />
							<form:errors path="password" cssStyle="color : red "></form:errors>


					</div>
				</div>
				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">

						<input id="confirmPassword" type="password" class="login-input"
							name="confirmPassword" placeholder="Re-enter your password" />

					</div>
				</div>
				    <div id="message"></div>
				
				

				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					
						<!--<form:input id="address" type="text" class="login-input"
							path="address" name="Address" placeholder="Address" />-->
							
						<form:select id="address" type="text" class="login-input"
							path="address" name="address" placeholder=" Address">
							 <option value="" disabled selected>Select Your Address</option>
							<form:option value="KaChin" ></form:option>
							<form:option value="KaYar"></form:option>
							<form:option value="KaYin"></form:option>
							<form:option value="Chin"></form:option>
							<form:option value="Shan"></form:option>
							<form:option value="Mon"></form:option>
							<form:option value="Yagon"></form:option>
							<form:option value="Mandalay"></form:option>
							<form:option value="Bago"></form:option>
							<form:option value="Sagaing"></form:option>
							<form:option value="MaGway"></form:option>
							<form:option value="RaKhine"></form:option>
							<form:option value="TaninTharyi"></form:option>
							<form:option value="Ayawaday"></form:option>
						</form:select>
						
				
				</div>

				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-phone"></i>
					</div>
					<div class="div">
						<form:input id="phone" type="text" class="login-input"
							path="phone" name="Phone" placeholder="Phone" />
					</div>
				</div>

				<form:input id="role" type="hidden" class="login-input" path="role" />

				<form:input id="locked" type="hidden" class="login-input"
					path="locked" />

				<div class="btn-container">
					<a href="/EcoHelp/Login" class="btn">Back</a>
					<button type="submit" class="btn">SignUp</button>

				</div>
			</form:form>
		</div>
	</div>
	<script>
	
	function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var messageContainer = document.getElementById("message");

            // Check if passwords match
            if (password !== confirmPassword) {
                messageContainer.textContent = "Passwords do not match!";
                return false; // Prevent form submission
            }

            // Passwords match
            messageContainer.textContent = "Passwords match!";
            return true;
        }
	
	</script>

</body>
</html>
