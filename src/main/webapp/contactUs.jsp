<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="./CSS/contactUs.css">
<script src="./modalScript.js"></script> <!-- Link to external JavaScript file -->

<!-- Link to external CSS -->
</head>
<body>

	<%@ include file="navbar.jsp"%>
	<%@ include file="loginModal.jsp"%>
	<%@ include file="registerModal.jsp"%>

	<div class="social-icons">
		<!-- Instagram Icon -->
		<a href="https://www.instagram.com" target="_blank"> <img
			src="path/to/instagram-icon.png" alt="Instagram" class="icon">
		</a>
		<!-- Gmail Icon -->
		<a href="mailto:your-email@gmail.com"> <img
			src="path/to/gmail-icon.png" alt="Gmail" class="icon">
		</a>
		<!-- Facebook Icon -->
		<a href="https://www.facebook.com" target="_blank"> <img
			src="path/to/facebook-icon.png" alt="Facebook" class="icon">
		</a>
	</div>

	<!-- Contact Form -->
	<div class="contact-form">
		<h2>Contact Us</h2>
		<form action="yourFormProcessingURL" method="post">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required>
			</div>
			<div class="form-group">
				<label for="comments">Comments:</label>
				<textarea id="comments" name="comments" rows="4" required></textarea>
			</div>
			<button type="submit" class="submit-btn">Submit</button>
		</form>
	</div>

</body>
</html>
