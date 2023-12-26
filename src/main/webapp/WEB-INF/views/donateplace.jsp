<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous" />

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap')
	;

* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

img {
	width: 100%
}

body {
	font-family: 'Poppins', sans-serif;
	line-height: 1.5;
	 background-color: #6C8E84;
}

/****************/
.main-container {
	width: 90vw;
	margin: 0 auto;
	padding: 40px 0;
}

.main-container>h2 {
	text-align: center;
	padding: 10px 0;
	font-size: 32px;
}

.main-container>p {
	font-weight: 300;
	padding: 10px 0;
	opacity: 0.7;
	text-align: center;
}

.category-head {
	margin: 30px 0;
}

.category-head ul {
	list-style-type: none;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.category-title {
	flex: 0 0 calc(16.6667% - 10px);
	display: flex;
	justify-content: center;
	background:#84F5D3 ;
	padding: 12px;
	color: #fff;
	margin: 5px;
	cursor: pointer;
	transition: all 0.4s ease;
}

.category-title:hover {
	opacity: 0.7;
}

.category-title li {
	padding: 0 10px;
}

.category-title span {
	color: #222;
}

/** single post **/
.posts-main-container {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-gap: 40px;
}

.posts-main-container>div {
	box-shadow: 0px 8px 22px -12px rgba(0, 0, 0, 0.64);
}

.post-img {
	position: relative;
}

.category-name {
	position: absolute;
	top: 20px;
	left: 20px;
	text-transform: uppercase;
	font-size: 13px;
	color: #03402D;
	padding: 4px 10px;
	border-radius: 2px;
}

.business .category-name {
	background: #03402D;
}

.culture .category-name {
	background: #03402D;
}

.politics .category-name {
	background: #f0544f;
}

.finance .category-name {
	background: #2c2a4a;
}

.sports .category-name {
	background: #a1e44d;
}

.post-content {
	padding: 25px;
}

.post-content-top {
	background: #03402D;
	color: #fff;
	opacity: 0.8;
	padding: 5px 0 5px 15px;
}

.post-content-top span {
	padding-right: 20px;
}

.post-content-top .fa-comment, .post-content-top .fa-calendar {
	padding-right: 5px;
}

.post-content h2 {
	font-size: 22px;
	padding: 12px 0;
	font-weight: 400;
}

.post-content p {
	opacity: 0.7;
	font-size: 15px;
	line-height: 1.8;
}

.read-btn {
	border: none;
	padding: 8px 15px;
	display: block;
	margin: 5px auto;
	font-family: 'Poppins', sans-serif;
	font-size: 15px;
	cursor: pointer;
	border: 1px solid #292929;
	background: #C8E4B2;
	margin-bottom: 40px;
}

.read-btn:hover {
	background: #03402D;
}

/***************/
@media ( max-width : 1170px) {
	.posts-main-container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 768px) {
	.posts-main-container {
		grid-template-columns: 1fr;
	}
}

/***********/
.active {
	background: #03402D;
}

/* CSS to manually adjust the placement and add padding to the DonatedList link container */
.donated-list-container {
	border: none;
	padding: 8px 15px;
	display: block;
	margin: 5px auto;
	font-family: 'Poppins', sans-serif;
	font-size: 15px;
	cursor: pointer;
	border: 1px solid #292929;
	background: #03402D;
	margin-bottom: 40px;
    bottom: 40px;
    right: 40px;
     /* Adjust the padding values as needed */
}
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


</style>
<script src="https://kit.fontawesome.com/dbed6b6114.js"
	crossorigin="anonymous"></script>
</head>
<body>

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
				<div class="socials">
					<a href="/EcoHelp/Login">Login</a>
				</div>
			</nav>
		</div>

	<div class="main-container">
		<h2>Donate Sectors</h2>
		<p style="font-size: 25px;color:#0C0D0D ;">Helping, Planting, reuse, and recycle for a sustainable future.</p>
		<div class="filter-container">
			<div class="category-head">
				<ul>
					<div class="category-title active">
						<li><a href="/EcoHelp/donateplace">All</a></li> <span><i
							class="fas fa-border-all"></i></span>
					</div>
					<c:forEach items="${categories}" var="sector">

						<div class="category-title">
							<li><a href="/EcoHelp/category/${sector.id}">${sector.name}</a></li>
							<span><i class="fas fa-theater-masks"></i></span>
						</div>

					</c:forEach>


				</ul>
			</div>

			<div class="posts-collect">
				<div class="posts-main-container">

					<c:forEach items="${placeList}" var="place">
						<!-- single post -->
						<div class="all sports">
							<div class="post-img">
								<img src="${pageContext.request.contextPath}/donateimages/${place.imagePath}"
									alt="post"> <span class="category-name">${place.donatesector_name}</span>
							</div>

							<div class="post-content">
								<div class="post-content-top">
									<span><i class="fas fa-calendar"></i>${place.createDate }</span>
									<span> <i class="fas fa-comment"></i>
									</span>
								</div>
								<h2>${place.name}</h2>
								<p>${place.description}</p>
							</div>
							

							<c:if test="${!empty user}">

								<button class="read-btn"
									onclick="location.href='/EcoHelp/createPayment/${place.id}'">
									<i class="fa fa-hand-holding-dollar"></i> Click to Donate
								</button>
								
							</c:if>



							<c:if test="${empty user}">
								<button class="read-btn" data-toggle="modal"
									data-target="#customModal">
									<i class="fa fa-hand-holding-dollar"></i> Click to Donate
								</button>
								
							</c:if>
									<a href="/EcoHelp/donatedList/${place.id}">
								 <button class="donated-list-container">
								  View DonatedList</button></a>
							
						</div>
						
					
						<!-- end of single post -->
					</c:forEach>

					<!-- Custom Confirmation Modal -->
					<div class="modal fade" id="customModal" tabindex="-1"
						role="dialog" aria-labelledby="customModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="customModalLabel">Let's get
										you in!</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Firstly!You have to create user account. </div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cancel</button>
									<a href="/EcoHelp/pageLogin"><button type="button"
											class="btn btn-primary">Login</button> </a>
								</div>
							</div>
						</div>
					</div>




				</div>
			</div>
		</div>
	</div>



</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</html>