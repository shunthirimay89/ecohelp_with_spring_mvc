<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Thank You Card</title>
</head>
<style>
    body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #26732F;
}

.card {
    background-color: #ffffff;
    border-radius: 50px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    text-align: center;
    padding: 20px;
}

.card img {
    max-width: 100%;
    border-radius: 10px 10px 0 0;
}

.message h1 {
    color: #333;
    font-size: 24px;
    margin-top: 20px;
}

.message p {
    color: #666;
    font-size: 16px;
    margin-top: 10px;
}

/* Add additional styling as desired */
.back-button {
    background-color: #075511;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 20px;
}

.back-button:hover {
    background-color: #0a6b16;
}
</style>
<body>
    <div class="card">
        <img src="img/thank.gif" alt="Your Photo">
        <div class="message">
            <h1>Thank You!</h1>
          <h2 style="color: #075511;">   For donate ${amount}MMK To ${place}!</h2>
            <a href="/EcoHelp/donateplace"><button class="back-button">Back</button></a>
        </div>
    </div>
</body>
</html>
