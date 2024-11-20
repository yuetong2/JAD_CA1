<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="../CSS/navbar.css">
</head>
<body>

	<div class="navbar">
		<!-- Logo on the left -->
		<div class="logo">
			<img src="../images/NA-removebg-preview.png" alt="Logo" height="50">
		</div>

		<!-- Menu Button and Dropdown -->
		<div class="menu">
			<!-- "Menu" word that triggers dropdown -->
			<a href="#" class="menu-btn">Menu</a>
			<!-- Dropdown content that shows when hovering "Menu" -->
			<div class="dropdown-content">
				<a href="home.jsp">Home</a>

				<!-- Type of Services Dropdown -->
				<div class="dropdown">
					<a href="#" class="dropdown-btn">Type of Services</a>
					<div class="submenu-content">
						<%
						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
							Connection conn = DriverManager.getConnection(connURL);
							String sql = "SELECT service_category_id, service_category_name FROM servicecategory";
							PreparedStatement pstmt = conn.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							while (rs.next()) {
								int categoryId = rs.getInt("service_category_id");
								String categoryName = rs.getString("service_category_name");
						%>
						<!-- Link to the service page with category ID as a parameter -->
						<a href="servicePage.jsp?category_id=<%=categoryId%>"><%=categoryName%></a>
						<%
						}
						rs.close();
						pstmt.close();
						conn.close();
						} catch (Exception e) {
						e.printStackTrace();
						%>
						<a href="#">Error loading categories</a>
						<%
						}
						%>
					</div>
				</div>

				<a href="../Pages/leaveAReview.jsp">Reviews</a> <a
					href="../Pages/contactUs.jsp">Contact Us</a>

				<!-- Conditionally render Profile link based on login status -->
				<%
				Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
				if (loggedIn != null && loggedIn) {
				%>
				<a href="../Pages/userProfile.jsp">Profile</a>
				<%
				}
				%>
			</div>
		</div>

		<!-- Login Button -->
		<button class="login-btn" onclick="openLoginModal()">Login</button>
	</div>

	<!-- Modal HTML for Login and Register -->
	<div class="modal" id="loginModal" tabindex="-1"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">Login</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="closeModal('loginModal')"></button>
				</div>
				<div class="modal-body">
					<!-- Form now submits to verifyUser.jsp -->
					<form id="loginForm" action="../Server/verifyUser.jsp"
						method="POST">
						<div class="mb-3">
							<label for="loginUsername" class="form-label">Username</label> <input
								type="text" class="form-control" id="loginUsername"
								name="username" required>
						</div>
						<div class="mb-3">
							<label for="loginPassword" class="form-label">Password</label> <input
								type="password" class="form-control" id="loginPassword"
								name="password" required>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
						<p>
							Don't have an account? <a href="javascript:void(0)"
								onclick="switchToRegister()">Click here to register</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="registerModal" tabindex="-1"
		aria-labelledby="registerModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="registerModalLabel">Register</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="closeModal('registerModal')"></button>
				</div>
				<div class="modal-body">
					<!-- Form will now submit directly to registerUser.jsp -->
					<form id="registerForm" action="../Server/registerUser.jsp"
						method="POST">
						<div class="mb-3">
							<label for="registerUsername" class="form-label">Username</label>
							<input type="text" class="form-control" id="registerUsername"
								name="username" required>
						</div>
						<div class="mb-3">
							<label for="registerPassword" class="form-label">Password</label>
							<input type="password" class="form-control" id="registerPassword"
								name="password" required>
						</div>
						<div class="mb-3">
							<label for="registerConfirmPassword" class="form-label">Confirm
								Password</label> <input type="password" class="form-control"
								id="registerConfirmPassword" name="confirmPassword" required>
						</div>
						<button type="submit" class="btn btn-primary">Register</button>
						<p>
							Already have an account? <a href="javascript:void(0)"
								onclick="switchToLogin()">Click here to login</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript Code -->
	<script>
		// Function to open the login modal
		function openLoginModal() {
			const modal = document.getElementById("loginModal");
			if (modal) {
				modal.style.display = "block"; // Show the login modal
			}
		}

		// Function to open the register modal
		function openRegisterModal() {
			const modal = document.getElementById("registerModal");
			if (modal) {
				modal.style.display = "block"; // Show the register modal
			}
		}

		// Function to close a modal by ID
		function closeModal(modalId) {
			const modal = document.getElementById(modalId);
			if (modal) {
				modal.style.display = "none"; // Hide the modal
			}
		}

		// Close the modal if the user clicks outside of it
		window.onclick = function(event) {
			var modal = document.getElementById("loginModal");
			if (event.target == modal) {
				closeModal('loginModal');
			}

			var registerModal = document.getElementById("registerModal");
			if (event.target == registerModal) {
				closeModal('registerModal');
			}
		};

		// Switch to register modal
		function switchToRegister() {
			closeModal('loginModal');
			openRegisterModal();
		}

		// Switch to login modal
		function switchToLogin() {
			closeModal('registerModal');
			openLoginModal();
		}
	</script>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
