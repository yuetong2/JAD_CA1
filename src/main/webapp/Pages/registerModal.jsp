<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../CSS/register.css">

<div id="registerModal" class="modal">
	<div class="modal-content">
		<span class="close-btn" onclick="closeModal('registerModal')">&times;</span>
		<h2>Register</h2>
		<form id="registerForm" action="./registerUser.jsp" method="POST"
			onsubmit="return validatePassword()">
			<div class="form-group">
				<input type="text" name="username" placeholder="Username" required>
			</div>
			<div class="form-group">
				<input type="password" id="password" name="password"
					placeholder="Password" required> <i class="eye-icon"
					id="togglePassword" onclick="togglePasswordVisibility()">👁️</i>
				<!-- Eye icon -->
			</div>
			<div class="form-group">
				<input type="password" id="confirmPassword" name="confirmPassword"
					placeholder="Confirm Password" required> <i
					class="eye-icon" id="toggleConfirmPassword"
					onclick="toggleConfirmPasswordVisibility()">👁️</i>
				<!-- Eye icon -->
			</div>
			<div id="errorContainer" class="error-message"></div>
			<!-- Error message container -->
			<button type="submit" class="submit-btn">Register</button>
		</form>
		<p>
			Have an account? <a href="#" onclick="switchToLogin()">Click here
				to login</a>
		</p>
	</div>
</div>

<script>
    function validatePassword() {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;
        const errorContainer = document.getElementById("errorContainer");

        // Clear previous error messages
        errorContainer.innerHTML = "";

        // Regular expression for secure password
        const passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        if (!passwordRegex.test(password)) {
            errorContainer.innerHTML = "Password must be at least 8 characters long, include at least one uppercase letter, one number, and one special character.";
            return false;
        }

        if (password !== confirmPassword) {
            errorContainer.innerHTML = "Passwords do not match. Please re-enter.";
            return false;
        }

        return true; // Allow form submission if validation passes
    }

    // Toggle password visibility for the password field
    function togglePasswordVisibility() {
        const passwordField = document.getElementById("password");
        const eyeIcon = document.getElementById("togglePassword");

        if (passwordField.type === "password") {
            passwordField.type = "text"; // Show password
            eyeIcon.innerHTML = "🙈"; // Change icon to closed eye
        } else {
            passwordField.type = "password"; // Hide password
            eyeIcon.innerHTML = "👁️"; // Change icon to open eye
        }
    }

    // Toggle password visibility for the confirm password field
    function toggleConfirmPasswordVisibility() {
        const confirmPasswordField = document.getElementById("confirmPassword");
        const eyeIcon = document.getElementById("toggleConfirmPassword");

        if (confirmPasswordField.type === "password") {
            confirmPasswordField.type = "text"; // Show password
            eyeIcon.innerHTML = "🙈"; // Change icon to closed eye
        } else {
            confirmPasswordField.type = "password"; // Hide password
            eyeIcon.innerHTML = "👁️"; // Change icon to open eye
        }
    }
</script>
