<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
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
                                String sql = "SELECT service_category_name FROM servicecategory";
                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                ResultSet rs = pstmt.executeQuery();
                                while (rs.next()) {
                                    String categoryName = rs.getString("service_category_name");
                        %>
                                    <a href="servicePage.jsp?category=<%= categoryName %>"><%= categoryName %></a>
                        <% 
                                }
                                rs.close();
                                pstmt.close();
                                conn.close();
                            } catch (Exception e) { 
                                e.printStackTrace(); 
                        %>
                            <a href="#">Error loading categories</a>
                        <% } %>
                    </div>
                </div>

                <a href="#">Reviews</a>
                <a href="../Pages/contactUs.jsp">Contact Us</a>
                <a href="../Pages/userProfile.jsp">Profile</a>
            </div>
        </div>

        <!-- Login Button -->
        <button class="login-btn" onclick="openLoginModal()">Login</button>
    </div>

    <!-- Modal HTML for Login and Register -->
    <div id="loginModal" style="display: none;">
        <%@ include file="../Server/loginModal.jsp" %> <!-- Include login modal content -->
    </div>
    
    <div id="registerModal" style="display: none;">
        <%@ include file="../Server/registerModal.jsp" %> <!-- Include register modal content -->
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
    </script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
