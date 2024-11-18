<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../CSS/navbar.css">

<div class="navbar">
	<!-- Logo on the left -->
	<div class="logo">
		<img src="../images/NA-removebg-preview.png" alt="Logo">
	</div>

	<!-- Menu Dropdown -->
	<div class="menu">
		<a href="#" class="menu-btn">Menu</a>
		<div class="dropdown-content">
			<a href="#">Home</a>
			<div class="dropdown-submenu">
				<a href="#">Type of Services</a>
				<div class="submenu-content">
					<a href="#">Service 1</a> <a href="#">Service 2</a> <a href="#">Service
						3</a>
				</div>
			</div>
			<a href="#">Reviews</a> <a href="#">Contact Us</a> <a href="#">FAQ</a>
			<a href="#">Leave Review</a>
		</div>
	</div>

	<!-- Login Button on the right -->
	<button class="login-btn" onclick="openLoginModal()">Login</button>
</div>
