<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="../CSS/home.css">
<script src="../User/modal.js"></script> <!-- Link to external JavaScript file -->

</head>
<body>

    <%@ include file="../Pages/navbar.jsp" %> <!-- Include the navbar -->
    <%@ include file="../User/loginModal.jsp" %> <!-- Include the login modal -->
    <%@ include file="../User/registerModal.jsp" %> <!-- Include the register modal -->

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

        // Close modal if clicking outside of it
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
