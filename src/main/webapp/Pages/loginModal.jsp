<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
