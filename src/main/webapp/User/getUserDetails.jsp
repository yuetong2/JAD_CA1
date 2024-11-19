<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>


<%
    // Retrieve user_id from the session
    Integer userId = (Integer) session.getAttribute("user_id");

    if (userId == null) {
        out.println("<p>You must be logged in to view this page.</p>");
        return;
    }

    try {
        // Load the database driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Database connection URL
        String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";

        // Establish connection to URL
        Connection conn = DriverManager.getConnection(connURL);

        // Prepare the SQL query to fetch user details
        String sql = "SELECT username FROM User WHERE user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);

        // Execute the query
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            String username = rs.getString("username");

            out.println("<h2>Account Details</h2>");
            out.println("<p>Username: " + username + "</p>");
        } else {
            out.println("<p>No user found with the given user ID.</p>");
        }

        // Close the connection
        conn.close();

    } catch (Exception e) {
        out.println("<p>Exception occurred while fetching user data.</p>");
        e.printStackTrace();  
    }
%>
