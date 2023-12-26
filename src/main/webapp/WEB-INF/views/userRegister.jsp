<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

html {
  height: 100%;
}

body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  min-height: 100%;
  background: #F1F1F1;
}

/* Animation Keyframes */
@keyframes scale_header {
  0%   {max-height: 0px; margin-bottom: 0px; opacity: 0;}
  100% {max-height: 117px; margin-bottom: 25px; opacity: 1;}
}

@keyframes input_opacity {
  0%   {transform: translateY(-10px); opacity: 0}
  100% {transform: translateY(0px); opacity: 1}
}

@keyframes text_opacity {
  0% {color: transparent;}
}

@keyframes error_before {
  0%   {height: 5px; background: rgba(0, 0, 0, 0.156); color: transparent;}
  10%  {height: 117px; background: #FFFFFF; color: #C62828}
  90%  {height: 117px; background: #FFFFFF; color: #C62828}
  100% {height: 5px; background: rgba(0, 0, 0, 0.156); color: transparent;}
}


/* Login Form */
.login-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  width: 340px;
  height: auto;
  padding: 5px;
  box-sizing: border-box;
}
 

.login-container img {
  width: 200px;
  margin: 0 0 20px 0;
}

.login-container p {
  align-self: flex-start;
  font-family: 'Roboto', sans-serif;
  font-size: 0.8rem;
  color: rgba(0, 0, 0, 0.5);
}

.login-container p a {
  color: rgba(0, 0, 0, 0.4);
}

.login {
  position: relative;
  width: 100%;
  padding: 10px;
  margin: 0 0 10px 0;
  box-sizing: border-box;
  border-radius: 3px;
  background: #FAFAFA;
  overflow: hidden;
  animation: input_opacity 0.2s cubic-bezier(.55, 0, .1, 1);
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14),
              0 1px 5px 0 rgba(0, 0, 0, 0.12),
              0 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.login > header {
  position: relative;
  width: 100%;
  padding: 10px;
  margin: -10px -10px 25px -10px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  background: #009688;
  font-family: 'Roboto', sans-serif;
  font-size: 1.3rem;
  color: #FAFAFA;
  animation: scale_header 0.6s cubic-bezier(.55, 0, .1, 1), text_opacity 1s cubic-bezier(.55, 0, .1, 1);
  box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.14),
              0px 1px 5px 0px rgba(0, 0, 0, 0.12),
              0px 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.login > header:before {
  content: '';
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  width: 100%;
  height: 5px;
  padding: 10px;
  margin: -10px 0 0 -10px;
  box-sizing: border-box;
  background: rgba(0, 0, 0, 0.156);
  font-family: 'Roboto', sans-serif;
  font-size: 0.9rem;
  color: transparent;
  z-index: 5;
}

.login.error_1 > header:before,
.login.error_2 > header:before {
  animation: error_before 3s cubic-bezier(.55, 0, .1, 1);
}

.login.error_1 > header:before {
  content: 'Invalid username or password!';
}

.login.error_2 > header:before {
  content: 'Invalid or expired Token!';
}

.login > header h2 {
  margin: 50px 0 10px 0;
}

.login > header h4 {
  font-size: 0.7em;
  animation: text_opacity 1.5s cubic-bezier(.55, 0, .1, 1);
  color: rgba(255, 255, 255, 0.4);
}

/* Form */
.login-form {
  padding: 15px;
  box-sizing: border-box;
}


/* Inputs */
.login-input {
  position: relative;
  width: 100%;
  padding: 10px 5px;
  margin: 0 0 25px 0;
  border: none;
  border-bottom: 2px solid rgba(0, 0, 0, 0.2);
  box-sizing: border-box;
  background: transparent;
  font-size: 1rem;
  font-family: 'Roboto', sans-serif;
  font-weight: 500;
  opacity: 1;
  animation: input_opacity 0.8s cubic-bezier(.55, 0, .1, 1);
  transition: border-bottom 0.2s cubic-bezier(.55, 0, .1, 1);
}

.login-input:focus {
  outline: none;
  border-bottom: 2px solid #E37F00;
}


/* Submit Button */
.submit-container {
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  position: relative;
  padding: 10px;
  margin: 35px -25px -25px -25px;
  border-top: 1px solid rgba(0, 0, 0, 0.1);
}

.login-button {
  padding: 10px;
  border: none;
  border-radius: 3px;
  background: transparent;
  font-family: 'Roboto', sans-serif;
  font-size: 0.9rem;
  font-weight: 500;
  color: #E37F00;
  cursor: pointer;
  opacity: 1;
  animation: input_opacity 0.8s cubic-bezier(.55, 0, .1, 1);
  transition: background 0.2s ease-in-out;
}

.login-button.raised {
  padding: 5px 10px;
  color: #FAFAFA;
  background: #E37F00;
  box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.137255),
              0px 1px 5px 0px rgba(0, 0, 0, 0.117647),
              0px 3px 1px -2px rgba(0, 0, 0, 0.2);
}

.login-button:hover {
  background: rgba(0, 0, 0, 0.05);
}

.login-button.raised:hover {
  background: #FDAB43;
  
 
}

</style>
<body>
  <div id="userError" style=" color:red;">${userError}</div>
  <div id="nameError" style=" color:red;">${nameError}</div>
  <div id="emailError" style=" color:red;">${emailError}</div>
  <div id="numberError" style=" color:red;">${numberError}</div>
  <div id="email" style=" color:red;">${email}</div>
  
  
  <div class="login-container">
    <section class="login" id="login">
      <header>
        <h2>EcoHelp</h2>
        <h4>UserRegister</h4>
      </header>
      
       <form:form class="login-form" action="/EcoHelp/userRegister" method="post" modelAttribute="user_info" id="registration-form">

        <form:input id="name" type="text" class="login-input" path="name" name="name" placeholder="UserName" required="name"/>
        <span class="error" id="nameError"></span>

        <form:input id="email" type="email" class="login-input" path="email" name="email" placeholder="Email" required="email" />
        <span class="error" id="emailError"></span>

        <form:input id="phone" type="tel" class="login-input" path="phone" name="phone" placeholder="Phone"  required="phone"/>
        <span class="error" id="phoneError"></span>
		
		<form:select id="address" type="text" class="login-input" path="address" name="address" placeholder=" Address" required="password">
		<form:option value="KaChin"></form:option>
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
		
		<form:select  id="gender" path="gender" class="login-input"  placeholder="Gender">
		<form:option value="Male"></form:option>
		<form:option value="Female"></form:option>
		</form:select>
		
        <form:input id="password" type="password" class="login-input" path="password" name="password" placeholder="Enter your password" required="password"/>
        <span class="error" id="passwordError"></span>

        <input id="confirmpassword" type="password" class="login-input" name="confirmpassword" placeholder="Confirm Password" />
        <span class="error" id="confirmpasswordError"></span>
        
        <form:input id="role" type="hidden" class="login-input" path="role" />
        
        <form:input id="locked" type="hidden" class="login-input" path="locked" />
        
       

        <div class="submit-container">
          <button type="submit" class="login-button" onclick="location.href='/EcoHelp/'">SIGN UP</button>
        </div>
		
		<div id="banMessage" style="display: none;">
    	Your Account has been banned by admin.
		</div>
		
		
      </form:form>
      <p>Back To Login?<a href="/EcoHelp/userLogin">Login</a></p>
    </section>
  </div>

  <script>
  document.getElementById("registration-form").addEventListener("submit", function (event) {
	    // Reset error messages
	    resetErrorStyles();

      document.getElementById("nameError").textContent = "";
      document.getElementById("emailError").textContent = "";
      document.getElementById("phoneError").textContent = "";
      document.getElementById("passwordError").textContent = "";
      document.getElementById("confirmpasswordError").textContent = "";

      // Validation checks
      var name = document.getElementById("name").value;
      var email = document.getElementById("email").value;
      var phone = document.getElementById("phone").value;
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirmpassword").value;
      
      
      var isBanned = ${isBanned}; // Get the value from the model
      console.log("isBanned: " + isBanned); // Check the value in the browser console

      if (isBanned) {
          var banMessage = document.getElementById("banMessage");
          banMessage.style.display = "block"; // Display the message
      }
      
      
      
      if (name === "") {
          document.getElementById("nameError").textContent = "Name cannot be empty";
          event.preventDefault();
        } else if (!isNaN(name)) {
          document.getElementById("nameError").textContent = "Name cannot contain numbers";
          event.preventDefault();
        }

      if (email === "") {
          document.getElementById(emailError").textContent = "Email cannot be empty";
          event.preventDefault();
        } else if (!(/[a-zA-Z]/.test(email) && /\d/.test(email))) {
          document.getElementById("emailError").textContent = "Email must contain both letters and numbers";
          event.preventDefault();
        } else if (!email.includes("@")) {
          document.getElementById("emailError").textContent = "Email must contain '@'";
          event.preventDefault();
        }
      
      
      

      if (phone === "") {
        document.getElementById("phoneError").textContent = "Phone cannot be empty";
        event.preventDefault();
      }

      if (password === "") {
        document.getElementById("phoneError").textContent = "Password cannot be empty";
        event.preventDefault();
      }

      if (confirmPassword !== password) {
        document.getElementById("confirmpasswordError").textContent = "Passwords do not match";
        event.preventDefault();
      }
    });
    function showError(errorId, message) {
        var errorElement = document.getElementById(errorId);
        errorElement.textContent = message;
        errorElement.style.color = "red"; // Set the error message color to red
      }

      function resetErrorStyles() {
        var errorElements = document.querySelectorAll(".error");
        errorElements.forEach(function (element) {
          element.textContent = "";
          element.style.color = ""; // Reset the error message color
        });
      }

      function showError(errorId, message) {
        var errorElement = document.getElementById(errorId);
        errorElement.textContent = message;
        errorElement.style.color = "red"; // Set the error message color to red
      }

      function resetErrorStyles() {
        var errorElements = document.querySelectorAll(".error");
        errorElements.forEach(function (element) {
          element.textContent = "";
          element.style.color = "red"; // Reset the error message color to red
        });
      }
      
      setTimeout(function() {
          document.getElementById("userError").style.display = "none"
          document.getElementById("nameError").style.display = "none"
          document.getElementById("emailError").style.display = "none"
       	  document.getElementById("email").style.display = "none"
          document.getElementById("numberError").style.display = "none";
          
          3000}
      
    </script>


</body>

</html>