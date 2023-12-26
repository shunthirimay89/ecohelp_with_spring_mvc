<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Home</h1>
<a href="/EcoHelp/displayplace">Show All Places</a>
<a href="/EcoHelp/createplace">Click me</a>
<a href="/EcoHelp/displaySector">Views All Sector</a>
<a href="/EcoHelp/createSector">Create Sector</a>
<a href="/EcoHelp/donateplace">DonatePLace</a>
<a href="/EcoHelp/userLogin">Click Here to login</a>
<a href="/EcoHelp/userRegister">Click Here to register </a>
<br>
<a href="/EcoHelp/createUser">Click</a>
<a href="/EcoHelp/userDisplay">UserList</a>
<a href="/EcoHelp/displayPayMethod">PaymethodList</a>
<a href="/EcoHelp/createPayMethod">createPayMethod</a>
<a href="/EcoHelp/createPayment">createDonationForm</a>
<a href="/EcoHelp/buttonTest">button</a>
<a href="/EcoHelp/donarList">DonarList</a><hr>
<a href="/EcoHelp/donatedHistory">donatedHistoryByEachUser</a>
<a href="/EcoHelp/adminDisplay">AdminList</a>

<div id="message" style="color:green;">${message}</div>

<hr>

<h1>${user}</h1>

<style>
		setTimeout(function() {
          document.getElementById("message").style.display = "none";
          3000}
      
	
</style>
</body>
</html>