<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
</head>
<body>
<%
    String userId = request.getParameter("user_id"); // Primary key for identifying the user
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (userId == null || userId.isEmpty()) {
        out.println("<p>User ID is required to update user information.</p>");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class name
            // Database connection URL
            String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";

            // Establish connection
            Connection conn = DriverManager.getConnection(connURL);

            // Build dynamic UPDATE query
            StringBuilder sql = new StringBuilder("UPDATE User SET ");
            boolean hasUpdates = false;

            if (username != null && !username.isEmpty()) {
                sql.append("username = ?, ");
                hasUpdates = true;
            }
            if (password != null && !password.isEmpty()) {
                sql.append("password = ?, ");
                hasUpdates = true;
            }

            if (hasUpdates) {
                sql.append("updated_on = NOW() WHERE user_id = ?"); 
                PreparedStatement updateStmt = conn.prepareStatement(sql.toString());

                // Set parameters dynamically
                int paramIndex = 1;
                if (username != null && !username.isEmpty()) {
                    updateStmt.setString(paramIndex++, username);
                }
                if (password != null && !password.isEmpty()) {
                    updateStmt.setString(paramIndex++, password);
                }
                updateStmt.setInt(paramIndex, Integer.parseInt(userId));

                // Execute the update query
                int rowsUpdated = updateStmt.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("<p>User updated successfully!</p>");
                } else {
                    out.println("<p>No changes were made. Please check your inputs.</p>");
                }
            } else {
                out.println("<p>No fields to update. Please provide at least one field to update.</p>");
            }

            // Close connection
            conn.close();

        } catch (Exception e) {
            out.println("<p>Exception occurred during user update.</p>");
            e.printStackTrace(out);
        }
    }
%>
</body>
</html>
