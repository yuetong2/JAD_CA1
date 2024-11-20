<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>
<body>

    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

    <div class="container mt-5">
        <h1 class="text-center">Services in Category</h1>

        <% 
            // Get the category_id from the request
            String categoryId = request.getParameter("category_id");
            if (categoryId != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
                    Connection conn = DriverManager.getConnection(connURL);

                    // Fetch services based on category_id
                    String sql = "SELECT service_name, service_description, image, price FROM services WHERE service_category_id = ?";
                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, Integer.parseInt(categoryId));  // Using category_id as the filter
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                        do {
        %>
                            <div class="service-card mb-4">
                                <h3><%= rs.getString("service_name") %></h3>
                                <p><%= rs.getString("service_description") %></p>
                                <img src="<%= rs.getString("image") %>" alt="<%= rs.getString("service_name") %>" class="img-fluid" width="200">
                                <p><strong>Price:</strong> $<%= rs.getDouble("price") %></p>
                            </div>
        <% 
                        } while (rs.next());
                    } else {
                        out.println("<p>No services found in this category.</p>");
                    }

                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) { 
                    e.printStackTrace(); 
                    out.println("<p>Error loading services.</p>");
                }
            } else {
                out.println("<p>Category ID not specified.</p>");
            }
        %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
