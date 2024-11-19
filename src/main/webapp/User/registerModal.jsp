<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../CSS/register.css">

<div id="registerModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal('registerModal')">&times;</span>
        <h2>Register</h2>
        <form id="registerForm" action="../User/registerUser.jsp" method="POST" onsubmit="return validatePassword()">
        	<div class="form-group">
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="form-group password-container" >
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <div class="form-group password-container" >
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
            </div>
            <div id="errorContainer" class="error-message"></div>
            <button type="submit" class="submit-btn">Register</button>
        </form>
        <p>Have an account? <a href="#" onclick="switchToLogin()">Click here to login</a></p>
    </div>
</div>

<script>
    function togglePasswordVisibility() {
        const passwordField = document.getElementById("password");
        const eyeIcon = document.getElementById("togglePassword");

        if (passwordField.type === "password") {
            passwordField.type = "text"; // Show password
            eyeIcon.src = "../images/hide.png"; // Change to closed eye icon
        } else {
            passwordField.type = "password"; // Hide password
            eyeIcon.src = "../images/show.png"; // Change to open eye icon
        }
    }

    function toggleConfirmPasswordVisibility() {
        const confirmPasswordField = document.getElementById("confirmPassword");
        const eyeIcon = document.getElementById("toggleConfirmPassword");

        if (confirmPasswordField.type === "password") {
            confirmPasswordField.type = "text"; // Show password
            eyeIcon.src = "../images/hide.png"; // Change to closed eye icon
        } else {
            confirmPasswordField.type = "password"; // Hide password
            eyeIcon.src = "../images/show.png"; // Change to open eye icon
        }
    }
</script>
