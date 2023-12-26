<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<!-- divinectorweb.com -->
<head>
<meta charset="UTF-8">
<title>HTML CSS Responsive Website Design</title>
<!-- Add Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Add Bootstrap JavaScript and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link href="donateMVC/CSS/about.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: montserrat;
}

nav {
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 100px;
	color: #fff;
	background: rgba(165, 236, 183, 0.5);
}

.logo {
	font-size: 25px;
	color: #fff;
	padding: 0 15px;
}

.menu ul li {
	display: inline-block;
	margin: 0 15px;
}

.menu ul li a {
	text-decoration: none;
	cursor: pointer;
	font-weight: bold;
	font-size: 18px;
	text-transform: uppercase;
	font-family: montserrat;
	color: #fff;
	padding: 5px 15px;
}

.menu ul li a:hover {
	background: green;
}

.socials a {
	text-decoration: none;
	background: green;
	color: #fff;
	padding: 10px 35px;
}

.header {
	height: 100vh;
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url(img/home5.jpg);
	-webkit-background-size: cover;
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
}

.banner-text {
	color: #fff;
	position: absolute;
	top: 50%;
	left: 26%;
	transform: translate(-50%, -50%);
	text-align: left;
}

.banner-text h1 {
	font-size: 60px;
	margin: 0;
}

.banner-text p {
	margin: 15px 0 40px;
}

.banner-text button {
	background: green;
	border: none;
	outline: none;
	color: #fff;
	padding: 10px 30px;
	font-size: 20px;
	font-family: montserrat;
	display: inline-block;
}

body {
	background: #044934;
	font-family: 'Montserrat', sans-serif;
}

.wrapper {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
	margin: 6% auto 0;
}

.single-card {
	position: relative;
	width: 280px;
	height: 400px;
	margin: 15px;
	box-shadow: 0 2px 20px rgba(124, 228, 141, 0.5);
	transition: box-shadow 0.3s ease;
	overflow: hidden;
	background: #BDE1D6;
	border-radius: 15px;
	transition: all 0.8s ease-in-out;
}

.single-card:hover {
	transform: translateY(-10px);
}

.img-area {
	position: relative;
	width: 100%;
	height: 200px;
	overflow: hidden;
}

.img-area img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease;
}

.img-area:hover img {
	transform: scale(1.1);
}

.overlay {
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 174, 255, 0.8);
	opacity: 0;
	transition: opacity 0.3s ease;
}

.single-card:hover .overlay {
	opacity: 1;
}

.add-to-cart, .view-details {
	background-color: #fff;
	color: #BDE1D6;
	padding: 10px 15px;
	border-radius: 4px;
	font-size: 12px;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 1px;
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease;
	margin-bottom: 10px;
}

.add-to-cart:hover, .view-details:hover {
	background-color: orangered;
	color: #fff;
	border: none;
}

.info {
	padding: 10px;
	text-align: center;
	color: #0e0d0d;
}

.info h3 {
	margin: 15px 0 10px;
	font-size: 30px;
	font-weight: bold;
	text-transform: uppercase;
	font-family: 'Bebas Neue', sans-serif;
}

.info .price {
	margin: 0;
	font-size: 30px;
	font-weight: bold;
	color: #0e0d0d;
}

@media ( max-width : 1000px) {
	nav {
		flex-direction: column;
		align-items: flex;
	}
	.menu ul {
		padding: 0;
	}
	.menu ul li {
		margin: 0 15px 0 0;
	}
	.socials {
		margin-top: 25px;
	}
	.banner-text {
		left: 50%;
		text-align: center;
		width: 70%;
	}
	.banner-text h1 {
		font-size: 40px;
	}
}

@media ( max-width : 600px) {
	.logo {
		margin-top: 0;
		font-size: 17px;
	}
	nav {
		padding: 15px;
	}
	.menu ul li a {
		font-size: 10px;
		padding: 5px;
	}
	.socials {
		display: none;
	}
	.banner-text {
		left: 50%;
		text-align: center;
		width: 80%;
	}
	.banner-text h1 {
		font-size: 18px;
	}
	.banner-text p {
		margin: 15px 0;
		font-size: 11px;
	}
	.banner-text button {
		font-size: 12px;
	}
}

section {
	width: 80%;
	margin: 80px auto;
}

.title {
	text-align: center;
	font-size: 4vmin;
	color: darkblue;
}

.row {
	display: flex;
	align-items: center;
	width: 100%;
	justify-content: space-between;
}

.row .col img {
	width: 80%;
}

.row .col {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.events .row {
	margin-top: 50px;
}

h4 {
	font-size: 3vmin;
	color: rgb(16, 5, 112);
	margin: 20px auto;
}
/* Add styling for the "Learn More" link */
.ctn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007BFF; /* Background color */
	color: #fff; /* Text color */
	text-decoration: none; /* Remove underline */
	border: 2px solid #007BFF; /* Border */
	border-radius: 5px; /* Rounded corners */
	transition: background-color 0.3s, color 0.3s;
	/* Smooth hover effect */
}

.ctn:hover {
	background-color: #0056b3; /* Background color on hover */
	border-color: #0056b3; /* Border color on hover */
	color: #fff; /* Text color on hover */
}

.donation-progress {
	text-align: center;
	padding: 20px;
	background-color: #f0f0f0;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.progress-bar {
	width: 80%;
	max-width: 300px;
	margin: 10px auto;
	background-color: #ddd;
	height: 20px;
	border-radius: 5px;
	overflow: hidden;
}

.progress-fill {
	background-color: #007BFF;
	height: 100%;
	width: 75%; /* Adjust this to change the progress */
}

p {
	margin-top: 10px;
	font-weight: bold;
	font-size: 16px;
}

* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	font-family: 'Roboto', sans-serif;
}

body {
	background-color: #B9F7E4;
}

.heading {
	width: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	text-align: center;
	margin: 20px auto;
}

.heading h1 {
	font-size: 50px;
	color: #000;
	margin-bottom: 25px;
	position: relative;
}

.heading h1::after {
	content: "";
	position: absolute;
	width: 100%;
	height: 4px;
	display: block;
	margin: 0 auto;
	background-color: #c21717;
}

.heading p {
	font-size: 18px;
	color: #c21717;
	margin-bottom: 35px;
}

.container {
	width: 90%;
	margin: 0 auto;
	padding: 10px 20px;
}

.about {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
}

.about-image {
	flex: 1;
	margin-right: 40px;
	overflow: hidden;
}

.about-image img {
	max-width: 100%;
	height: auto;
	display: block;
	transition: 0.5s ease;
}

.about-image:hover img {
	transform: scale(1.2);
}

.about-content {
	flex: 1;
}

.about-content h2 {
	font-size: 23px;
	margin-bottom: 15px;
	color: aqua;
}

.about-content p {
	font-size: 18px;
	line-height: 1.5;
	color: black;
}

.about-content .read-more {
	display: inline-block;
	background-color: green;
	padding: 10px 20px;
	color: #fff;
	font-size: 19px;
	text-decoration: none;
	border-radius: 25px;
	margin-top: 35px;
	transition: 0.3s ease;
}

.about-content .read-more:hover {
	background-color: bisque;
}

@media screen and ( max-width: 768px) {
	.heading {
		padding: 0px 20px;
	}
	.heading h1 {
		font-size: 36px;
	}
	.heading p {
		font-size: 17px;
	}
	.container {
		padding: 0px;
	}
	.about {
		padding: 20px;
		flex-direction: column;
	}
	.about-image {
		margin-right: 0px;
		margin-bottom: 20px;
	}
	.about-content p {
		padding: 0px;
		font-size: 16px;
	}
	.about-content .read-more {
		font-size: 16px;
	}
}

footer {
	background-color: #729389;
	position: relative;
	width: 100%;
	min-height: 350px;
	padding: 3rem 1rem;
}

.container {
	max-width: 1140px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.row {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.col {
	min-width: 250px;
	color: #f2f2f2f2;
	font-family: poppins;
	padding: 0 2rem;
}

.col .logo {
	width: 100px;
	margin-bottom: 25px;
}

.col h3 {
	color: #ff014fff;
	margin-bottom: 20px;
	position: relative;
	cursor: pointer;
}

.col h3::after {
	content: '';
	height: 3px;
	width: 0px;
	background-color: #ff014fff;
	position: absolute;
	bottom: 0;
	left: 0;
	transition: 0.3s ease;
}

.col h3:hover::after {
	width: 30px
}

.col .social a i {
	color: #ff014fff;
	margin-top: 2rem;
	margin-right: 5px;
	transition: 0.3s ease;
}

.col .social a i:hover {
	transform: scale(1.5);
	filter: grayscale(25);
}

.col .links a {
	display: block;
	text-decoration: none;
	color: #f2f2f2;
	margin-bottom: 5px;
	position: relative;
	transition: 0.3s ease;
}

.col .links a::before {
	content: '';
	height: 16px;
	width: 3px;
	position: absolute;
	top: 5px;
	left: -10px;
	background-color: #ff014fff;
	transition: 0.5s ease;
	opacity: 0;
}

.col .links a:hover::before {
	opacity: 1;
}

.col .links a:hover {
	transform: translateX(-8px);
	color: #ff014fff;
}

.col .contact-details {
	display: inline-flex;
	justify-content: space-between;
}

.col .contact-details i {
	margin-right: 15px;
}

.row .form {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 2rem 0;
}

.row .form input {
	background-color: #1a1c20ff;
	border: 0;
	outline: none;
	padding: 14px 20px;
	border-radius: 6px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.form button {
	padding: 14px 20px;
	border: 0;
	border-radius: 6px;
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
	background-color: #ff014fff;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
}

.card-row {
	display: flex;
	justify-content: space-between;
	margin: 20px; /* Add margin to create space between rows */
}

.donation-card {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
	padding: 20px;
	max-width: 300px;
}

img {
	max-width: 100%;
	border-radius: 8px;
}

.progress-bar {
	background-color: #e0e0e0;
	height: 20px;
	border-radius: 10px;
	margin-top: 10px;
	position: relative;
}

.progress-fill {
	background-color: #3498db;
	height: 100%;
	border-radius: 10px;
	color: #fff;
	font-weight: bold;
	position: absolute;
	text-align: center;
	line-height: 20px;
}

.percentage {
	font-size: 24px;
	font-weight: bold;
	color: #3498db;
	margin-top: 10px;
}

p {
	margin-top: 10px;
}

/* custom-alert.css */
/* custom-alert.css */
.custom-alert {
	display: flex;
	align-items: center; /* Vertical center alignment */
	justify-content: center; /* Horizontal center alignment */
	background-color: #63AB51; /* Background color */
	color: white; /* Text color */
	border: 1px solid #f5c6cb; /* Border color */
	border-radius: 0.25rem; /* Border radius */
	padding: 10px; /* Padding */
	margin-top: 10px; /* Margin top */
}

.custom-alert strong {
	font-weight: bold; /* Bold text */
}

.custom-alert .close {
	position: relative;
	top: -0.5rem;
	right: -0.5rem;
}
</style>
<body>

	<form:form action="/EcoHelp/donateplace" method="get">
		<div>
			<c:if test="${!empty message}">
				<div
					class="custom-alert alert alert-warning alert-dismissible fade show"
					role="alert" id="myAlert">
					<strong class="text-center">${message}</strong>
				</div>
			</c:if>
		</div>


		<!-- alert box -->
		<div class="header">

			<nav>
				<div class="logo">EcoHelp</div>
				<div class="menu">
					<ul>
						<li><a href="/EcoHelp/">Home</a></li>
						<li><a href="/EcoHelp/donarList">Donation Progress</a></li>
						<li><a href="/EcoHelp/donateplace">DonatePlaces</a></li>
					</ul>
				</div>
				<c:if test="${!empty user}">
					<div class="socials">
						<a href="#" id="logoutLink" data-toggle="modal"
							data-target="#logoutModal">Logout</a>
					</div>
				</c:if>
				<c:if test="${empty user }">
					<div class="socials">
						<a href="/EcoHelp/Login">Login</a>
					</div>
				</c:if>

			</nav>
		</div>
		<div class="banner-text">
			<h1>
				Explore Beautiful<br>world with us
			</h1>
			<p>The power of many working together is better.</p>
			<button type="submit">Start Now</button>

		</div>




		<section class="events">

			<div class="title">
				<h1>Start With Us</h1>
				<div class="line"></div>
			</div>
			<div class="wrapper">
				<div class="single-card">
					<div class="img-area">
						<img src="img/new2.jpg" alt="">
						<div class="overlay">

							<button class="view-details">View Details</button>
						</div>
					</div>

					<div class="info">
						<h3>Planting</h3>
						<p class="price">Start With Us</p>
						<p>Let's plant the seeds of change and watch them grow into a
							brighter future!</p>
					</div>
				</div>

				<div class="single-card">
					<div class="img-area">
						<img src="img/reha1.jpg" alt="">
						<div class="overlay">

							<button class="view-details">View Details</button>
						</div>
					</div>
					<div class="info">
						<h3>Rehabilitation</h3>
						<p class="price">Start With Us</p>
						<p>Together, we are a community of warriors, fighting for
							brighter tomorrows.</p>
					</div>
				</div>

				<div class="single-card">
					<div class="img-area">
						<img src="img/waste.jpg" alt="">
						<div class="overlay">

							<button class="view-details">View Details</button>
						</div>
					</div>
					<div class="info">
						<h3>Waste Control</h3>
						<p class="price">Start With Us</p>
						<p>Let's support initiatives for waste-to-energy conversion
							into clean energy can power our communities.</p>
					</div>
				</div>



			</div>
		</section>
	</form:form>
	
	
	

      <div class="heading">
    <h1>
        About Us
    </h1>
    <p>At EcoHelp, we are passionate about protecting and preserving our planet for future generations. Our mission is to make a positive impact on the environment through various initiatives, and we invite you to join us in this crucial endeavor.</p>
         <div class="container">
            <section class="about">
                <div class="about-image">
                    <img src="img/about-us.jpg" alt="">
                    
                </div>
                <div class="about-content">
                    <h2>What We Do</h2>
                    <p>Reforestation: We plant trees in deforested areas to combat climate change and restore ecosystems.
					Clean Energy: We support clean and renewable energy projects to reduce greenhouse gas emissions.</p>
                          <a href="" class="read-more">Read More</a>
                </div>
            </section>
         </div>
</div>
<!-- 
	<div class="title">
		<h1>Start With Us</h1>
		<div class="line"></div>
	</div>
	

	<div class="card-row">
		<div class="donation-card">
			<img src="img/donate1.jpg" alt="Donation Progress Image 1">
			<div class="progress-bar">
				<div class="progress-fill" style="width: 75%;">75%</div>
			</div>
			<div class="percentage">75%</div>
			<p>Help us reach our goal!</p>
		</div>

		<div class="donation-card">
			<img src="img/donate1.jpg" alt="Donation Progress Image 2">
			<div class="progress-bar">
				<div class="progress-fill" style="width: 50%;">50%</div>
			</div>
			<div class="percentage">50%</div>
			<p>Support our cause!</p>
		</div>

		<div class="donation-card">
			<img src="img/donate1.jpg" alt="Donation Progress Image 3">
			<div class="progress-bar">
				<div class="progress-fill" style="width: 90%;">90%</div>
			</div>
			<div class="percentage">90%</div>
			<p>Help those in need!</p>
		</div>
	</div>

	<div class="card-row">
		<div class="donation-card">
			<img src="img/donate1.jpg" alt="Donation Progress Image 4">
			<div class="progress-bar">
				<div class="progress-fill" style="width: 60%;">60%</div>
			</div>
			<div class="percentage">60%</div>
			<p>Support our mission!</p>
		</div>

		<div class="donation-card">
			<img src="img/donate1.jpg" alt="Donation Progress Image 5">
			<div class="progress-bar">
				<div class="progress-fill" style="width: 80%;">80%</div>
			</div>
			<div class="percentage">80%</div>
			<p>Donate for a cause!</p>
		</div>

		<div class="donation-card">
			<img src="img/donate1.jpg" alt="Donation Progress Image 6">
			<div class="progress-bar">
				<div class="progress-fill" style="width: 70%;">70%</div>
			</div>
			<div class="percentage">70%</div>
			<p>Help those in need!</p>
		</div>
	</div>
-->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col" id="company">
					<img src="images/logo.png" alt="" class="logo">
					<p>Our organization has planted 10,000 trees, reducing carbon
						emissions in our community. You have the power to create change!
						Your support can make a real difference in the lives of those we
						serve.</p>
					<div class="social">
						<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
							class="fab fa-instagram"></i></a> <a href="#"><i
							class="fab fa-youtube"></i></a> <a href="#"><i
							class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-linkedin"></i></a>
					</div>
				</div>


				<div class="col" id="services">
					<h3>Services</h3>
					<div class="links">
						<a href="#">Making a Positive Impact</a> <a href="#">Service
							donations accepted until December 31, 2030</a>

					</div>
				</div>


				<div class="col" id="contact">
					<h3>Contact</h3>
					<div class="contact-details">
						<i class="fa fa-location"></i>
						<p>
							Yangon <br> Street,Insein
						</p>
					</div>
					<div class="contact-details">
						<i class="fa fa-phone"></i>
						<p>0998019550</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<script>
		window.addEventListener("scroll", function() {
			var navbar = document.querySelector("nav");

			if (window.scrollY > 0) {
				navbar.classList.add("fixed-navbar");
			} else {
				navbar.classList.remove("fixed-navbar");
			}
		});
	</script>
	<script>
		// Close the alert after 5 seconds
		document.addEventListener("DOMContentLoaded", function() {
			var alertDiv = document.getElementById("myAlert");
			if (alertDiv) {
				setTimeout(function() {
					alertDiv.style.display = "none";
				}, 3000);
			}
		});
	</script>
	<!-- Logout Modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Confirm Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure to logout?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="/EcoHelp/logout">Logout</a>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
