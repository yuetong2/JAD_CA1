<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<%@page import="java.util.*,java.time.*"%>
<%--
  - Author(s): Angie Wu
  - Date: 15/11/2024
  - Description: Practical 5 answers
--%>
<body>
    <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        // Load the database driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Database connection URL
        String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";

        // Establish connection to URL
        Connection conn = DriverManager.getConnection(connURL);

        // Prepare the SQL query
        String sql = "SELECT user_id, role_id FROM User WHERE username = ? AND password = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        // Execute the query
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            // Retrieve user_id and role_id from the result set
            int userId = rs.getInt("user_id");
            int roleId = rs.getInt("role_id");

            // Set session attributes
            session.setAttribute("user_id", userId);
            session.setAttribute("userRole", roleId);

            // Redirect to the home page or dashboard
            response.sendRedirect("home.jsp");
        } else {
            // No matching record found, redirect back to login page with error
            response.sendRedirect("home.jsp?errCode=invalidLogin");
        }

        // Close the connection
        conn.close();

    } catch (Exception e) {
        out.println("<p>Exception occurred while processing the login.</p>");
        e.printStackTrace();
    }
    %>
</body>
</html>
