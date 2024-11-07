<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="./home.css">
</head>
<body>

	<%@ include file="navbar.jsp"%>


	<!-- Login Modal -->
	<div id="loginModal" class="modal">
		<div class="modal-content">
			<span class="close-btn" onclick="closeModal('loginModal')">&times;</span>
			<h2>Login</h2>
			<form id="loginForm">
				<div class="form-group">
					<input type="text" name="username" placeholder="Username" required>
				</div>
				<div class="form-group">
					<input type="password" name="password" placeholder="Password"
						required>
				</div>
				<button type="submit" class="submit-btn">Login</button>
			</form>
			<p>
				Do not have an account? <a href="#" onclick="switchToRegister()">Click
					here to register</a>
			</p>
		</div>
	</div>

	<!-- Register Modal -->
	<div id="registerModal" class="modal">
		<div class="modal-content">
			<span class="close-btn" onclick="closeModal('registerModal')">&times;</span>
			<h2>Register</h2>
			<form id="registerForm">
				<div class="form-group">
					<input type="text" name="username" placeholder="Username" required>
				</div>
				<div class="form-group">
					<input type="password" name="password" placeholder="Password"
						required>
				</div>
				<div class="form-group">
					<input type="password" name="confirmPassword"
						placeholder="Confirm Password" required>
				</div>
				<button type="submit" class="submit-btn">Register</button>
			</form>
			<p>
				Have an account? <a href="#" onclick="switchToLogin()">Click
					here to login</a>
			</p>
		</div>
	</div>

	<script>
    function openLoginModal() {
        document.getElementById("loginModal").style.display = "block";
        document.getElementById("loginForm").reset();
    }

    function openRegisterModal() {
        document.getElementById("registerModal").style.display = "block";
        document.getElementById("registerForm").reset();
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    function switchToRegister() {
        closeModal('loginModal');
        openRegisterModal();
    }

    function switchToLogin() {
        closeModal('registerModal');
        openLoginModal();
    }

    window.onclick = function(event) {
        var loginModal = document.getElementById("loginModal");
        var registerModal = document.getElementById("registerModal");
        if (event.target == loginModal) {
            closeModal('loginModal');
        } else if (event.target == registerModal) {
            closeModal('registerModal');
        }
    }
</script>


</body>
</html>
