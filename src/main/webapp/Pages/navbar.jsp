<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../CSS/navbar.css">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="../User/modal.js" defer></script> <!-- Include modal.js -->
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="../images/NA-removebg-preview.png" alt="Logo">
        </div>

        <div class="menu">
    <a href="#" class="menu-btn">Menu</a>
    <div class="dropdown-content">
        <a href="home.jsp">Home</a>
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
        <a href="#">Contact Us</a>
        <a href="contactUs.jsp">FAQ</a>
        <a href="userProfile.jsp">Profile</a>
    </div>
</div>

        <button class="login-btn" onclick="openLoginModal()">Login</button>
    </div>

    <!-- Include modals -->
    <jsp:include page="../User/loginModal.jsp" />
    <jsp:include page="../User/registerModal.jsp" />

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
