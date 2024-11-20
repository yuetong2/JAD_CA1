<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Integer userId = (Integer) session.getAttribute("user_id");

    if (userId == null) {
        out.println("<p>You must be logged in to view this page.</p>");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String connURL = "jdbc:mysql://localhost/jad_ca1?user=root&password=password1234&serverTimezone=UTC";
        Connection conn = DriverManager.getConnection(connURL);

        String sql = "SELECT username, password FROM User WHERE user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);

        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            String username = rs.getString("username");
            String password = rs.getString("password");

            out.println("<h2>Account Details</h2>");

            // Username field
            out.println("<p>Username: <span id='username-display'>" + username + "</span>");
            out.println("<span id='username-edit' style='display:none;'>");
            out.println("<input type='text' id='username-input' value='" + username + "' />");
            out.println("</span>");
            out.println("<button type='button' id='username-edit-btn' onclick=\"toggleEdit('username')\">Edit</button></p>");

            // Password field
            out.println("<p>Password: <span id='password-display'>" + password + "</span>");
            out.println("<span id='password-edit' style='display:none;'>");
            out.println("<input type='password' id='password-input' value='" + password + "' />");
            out.println("</span>");
            out.println("<button type='button' id='password-edit-btn' onclick=\"toggleEdit('password')\">Edit</button></p>");
        } else {
            out.println("<p>No user found with the given user ID.</p>");
        }

        conn.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error fetching user details.</p>");
    }
%>
